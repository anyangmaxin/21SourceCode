using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;

public partial class Manage : System.Web.UI.Page
{
    //通过调用Album类的方法读取相册分类信息
    Album am = new Album();
    public LqDBDataContext lqc = new LqDBDataContext();
    //设置每页显示4行记录
    int pageSize = 4;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //设置当前页面
            ViewState["pageIndex"] = 0;
            BindGV();
        }
    }
    /// <summary>
    /// 绑定数据
    /// </summary>
    private void BindGV()
    {
        int pageIndex = Convert.ToInt32(ViewState["pageIndex"]);
        labCurrentPage.Text = pageIndex.ToString();
        DataSet ds1 = am.GetDataSet("select  * from Photo_Category", "PhotoCategory");
        DataSet ds2 = am.GetDataSet("select * from Photo", "Photo");
        var query = (from pc in ds1.Tables["PhotoCategory"].AsEnumerable()
                     select new
                     {
                         ID = pc.Field<int>("ID"),
                         pNum = ds2.Tables["Photo"].AsEnumerable().Count(itm => itm.Field<int>("CategoryID") == pc.Field<int>("ID")),
                         C_Name = pc["C_Name"].ToString(),
                         C_Status = pc["C_Status"].ToString()
                     }).Skip(pageSize * pageIndex).Take(pageSize);//使用LINQ分页
        //绑定数据到GridView
        gvCategory.DataSource = query.ToList();
        gvCategory.DataBind();
        lnkbtnBottom.Enabled = true;
        lnkbtnFirst.Enabled = true;
        lnkbtnUp.Enabled = true;
        lnkbtnDown.Enabled = true;
        //判断是否为第一页，如果为第一页隐藏首页和上一页按钮
        if (Convert.ToInt32(ViewState["pageIndex"]) == 0)
        {
            lnkbtnFirst.Enabled = false;
            lnkbtnUp.Enabled = false;
        }
        //判断是否为最后一页，如果为最后一页隐藏尾页和下一页按钮
        if (Convert.ToInt32(ViewState["pageIndex"]) == getCount() - 1)
        {
            lnkbtnBottom.Enabled = false;
            lnkbtnDown.Enabled = false;
        }
    }
    protected void lnkbtnFirst_Click(object sender, EventArgs e)
    {
        //设置当前页面为首页
        ViewState["pageIndex"] = 0;
        //调用自定义bindGrid方法绑定GridView控件
        BindGV();
    }
    /// <summary>
    /// 触发RowEditing事件，以确定编辑列
    /// </summary>
    protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCategory.EditIndex = e.NewEditIndex;
        BindGV();
    }
    /// <summary>
    /// 触发RowUpdating事件，以达到编辑的功能
    /// </summary>
    protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //获取更新数据
        TextBox tbName = (TextBox)gvCategory.Rows[e.RowIndex].FindControl("tbName");
        DropDownList ddlStatus = (DropDownList)gvCategory.Rows[e.RowIndex].FindControl("ddlStatus");
        //执行插入数据的操作
        int DataKey = Int32.Parse(gvCategory.DataKeys[e.RowIndex].Value.ToString());
        int result = am.EditCategory(DataKey, tbName.Text.Trim(), ddlStatus.SelectedValue.ToString());
        if (result == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('已有此分类，请重新填写！');", true);
        }
        else if (result > 0)
        {
            gvCategory.EditIndex = -1;
        }
        else
        {
            return;
        }
        BindGV();
    }
    /// <summary>
    /// 取消编辑
    /// </summary>
    protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvCategory.EditIndex = -1;
        BindGV();
    }
    /// <summary>
    /// 删除行数据
    /// </summary>
    protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int DataKey = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Value.ToString());
        //定义查询操作的SQL语句
        string sqlstr = "select * from Photo where CategoryID=" + DataKey;
        DataSet ds = am.GetDataSet(sqlstr, "PhotoCategory");
        if (ds.Tables["PhotoCategory"].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('此相册中由于存在照片不可删除！');", true);
        }
        else
        {
            Photo_Category pc = lqc.Photo_Category.SingleOrDefault(itm => itm.ID == DataKey);
            lqc.Photo_Category.DeleteOnSubmit(pc);//执行删除操作
            lqc.SubmitChanges();//提交删除操作
        }
        BindGV();
    }
    /// <summary>
    /// 为删除按钮添加“确定”对话框
    /// </summary>
    protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ImageButton imgbtn = (ImageButton)e.Row.FindControl("del");
        if (imgbtn != null)
        {
            imgbtn.Attributes.Add("onclick", "return confirm('确定要删除吗？')");
        }
    }
    protected int getCount()
    {
        //设置总数据行.
        int sum = lqc.Photo_Category.Count();
        labPageCount.Text = sum.ToString();
        //获取可以分的页面
        int s1 = sum / pageSize;
        //当总行数对页数求余后是否大于0，如果大于获取1否则获取0
        int s2 = sum % pageSize > 0 ? 1 : 0;
        //计算出总页数
        int count = s1 + s2;
        return count;
    }
    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        //设置当前页数为当前页数减一
        ViewState["pageIndex"] = Convert.ToInt32(ViewState["pageIndex"]) - 1;
        //调用自定义bindGrid方法绑定GridView控件
        BindGV();
    }
    protected void lnkbtnDown_Click(object sender, EventArgs e)
    {
        //设置当前页数为当前页数加一
        ViewState["pageIndex"] = Convert.ToInt32(ViewState["pageIndex"]) + 1;
        //调用自定义bindGrid方法绑定GridView控件
        BindGV();
    }
    protected void lnkbtnBottom_Click(object sender, EventArgs e)
    {
        //设置当前页数为总页面减一
        ViewState["pageIndex"] = getCount() - 1;
        //调用自定义bindGrid方法绑定GridView控件
        BindGV();
    }
}
