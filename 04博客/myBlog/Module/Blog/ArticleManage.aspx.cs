using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;

public partial class Module_Blog_ArticleManage : System.Web.UI.Page
{
    SqlData da = new SqlData();
    private static string ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            /*判断是否登录*/
            ST_check_Login();
        }
        //定义一个查询用户信息的SQL语句
        string sqlstr = "select * from tb_Blog where UserName='" + Session["UserName"] + "'";
        //调用公共类中的GetDataSet方法执行SQL语句，并返回DataSet类型的数据集
        DataSet mydataset = da.GetDataSet(sqlstr, "tb_Blog");
        //创建数据表的视图
        DataRowView rowview1 = mydataset.Tables["tb_Blog"].DefaultView[0];
        //获取注册博客的编号
        ID = rowview1["BlogID"].ToString();
        //调用自定义绑定方法绑定数据
        ST_Article_Bind();
    }
    public void ST_check_Login()
    {
        //判断存储在Session对象中
        if ((Session["UserName"] == null))
        {
            Response.Write("<script>alert('对不起！请先注册再登录！');location='../../BlogIndex.aspx'</script>");
            Response.End();
        }
    }
    public void ST_Article_Bind()
    {
        //根据获取的用户ID查询其所有文章
        string sqlstr = "select * from ST_news where BlogID='" + ID + "'";
        //调用公共类中的ExceDS方法，返回一个DataSet类型的数据集，并作为GridView控件的数据源
        GridView1.DataSource = da.ExceDS(sqlstr);
        //获取GridView控件中的主键字段
        GridView1.DataKeyNames = new string[] { "ST_n_id" };
        //从数据库中绑定数据到列表控件中
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //调用公共类中的ExceSQL执行删除操作的SQL语句，并将返回的值保存在定义的布尔类型的变量 delete中
        bool delete = da.ExceSQL("delete from ST_news where ST_n_id='" + GridView1.DataKeys[e.RowIndex].Value + "'");
        //判断是否删除成功
        if (delete)
        {
            //删除成功，弹出成功对话框
            Response.Write("<script language=javascript>alert('删除成功！');location='ArticleManage.aspx'</script>");
        }
        else
        {
            //删除失败，弹出失败提示框
            Response.Write("<script language=javascript>alert('删除失败！');location='ArticleManage.aspx'</script>");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //定义一个字符变量search来存储下拉列表框中条件值
        string search = this.ddlSearch.SelectedValue;
        //根据选择的条件不同显示不同结果
        switch (search)
        {
            //根据文章编号进行模糊查询
            case "文章ID":
                da.BindData(this.GridView1, "Select * From ST_news Where ST_n_id  Like  '%" + this.txtKey.Text + "%' and BlogID='" + ID + "'"); 
                break;
            //根据文章主题进行模糊查询
            case "文章主题":
                da.BindData(this.GridView1, "Select * From ST_news Where ST_n_title  Like  '%" + this.txtKey.Text + "%' and BlogID='" + ID + "'");
                break;
            default:
                //查询如果失败，弹出失败对话框
                Response.Write("<script lanuage=javascript>alert('查询失败！');location='javascript:history.go(-1)'</script>");
                break;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        ST_Article_Bind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //if ((e.Row.Cells[1].Text).Length > 5)
            //{
            //    e.Row.Cells[1].Text = (e.Row.Cells[1].Text).Substring(0, 5) + "…";
            //}
            e.Row.Cells[1].Text = GetFirstString(e.Row.Cells[1].Text, 1);
            ((LinkButton)e.Row.Cells[5].Controls[0]).Attributes.Add("onclick", "return confirm('确定要删除吗?')");
        }
      
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        //应用for循环语句遍历GridView控件中所有行
        for(int i=0; i<=GridView1.Rows.Count-1;i++)
        {
            //查找GridView控件中的CheckBox1控件
            CheckBox cbox=(CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if(checkAll.Checked==true)
            {
                //全选中
                cbox.Checked=true;
            }
            else
            {
                //全取消
                cbox.Checked=false;
            }
    }
}
    protected void Button1_Click(object sender, EventArgs e)
    {
        //全选按钮被取消
        checkAll.Checked = false;
        //应用for循环语句遍历GridView控件中所有行
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            //查找GridView控件中的CheckBox1控件
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            //取消选择
            cbox.Checked = false;
        }
    }
    protected void btnAllDelete_Click(object sender, EventArgs e)
    { 
        //为btnAllDelete控件添加一个onClick属性
        btnAllDelete.Attributes.Add("onClick","javascript:return confirm('确定删除吗？');");
        //应用for循环语句遍历GridView控件中所有行
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            //应用FindControl方法查找GridView控件中CheckBox控件
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            //判断是否选中GridView控件中CheckBox控件
            if (cbox.Checked == true)
            {
                //定义删除选中行数据的字符串
                string sqlstr = "delete from ST_news where ST_n_id='" + GridView1.DataKeys[i].Value + "'";
                //调用公共类中的ExceSQL方法执行删除操作的SQL语句
                da.ExceSQL(sqlstr);
                //执行成功，弹出提示框信息
                Response.Write("<script language=javascript>alert('批量删除成功！');location='ArticleManage.aspx'</script>");
            }
        }
        //重新绑定数据
        ST_Article_Bind();
    }
    /// <summary>
    /// 截取字符串优化版
    /// </summary>
    /// <param name="stringToSub">所要截取的字符串</param>
    /// <param name="length">截取字符串的长度</param>
    /// <returns></returns>
    public static string GetFirstString(string stringToSub, int length)
    {
        #region
        Regex regex = new Regex("[\u4e00-\u9fa5]+", RegexOptions.Compiled);
        char[] stringChar = stringToSub.ToCharArray();
        StringBuilder sb = new StringBuilder();
        int nLength = 0;
        bool isCut = false;
        for (int i = 0; i < stringChar.Length; i++)
        {
            if (regex.IsMatch((stringChar[i]).ToString()))
            {
                sb.Append(stringChar[i]);
                nLength += 2;
            }
            else
            {
                sb.Append(stringChar[i]);
                nLength = nLength + 1;
            }

            if (nLength > length)
            {
                isCut = true;
                break;
            }
        }
        if (isCut)
            return sb.ToString() + "..";
        else
            return sb.ToString();
        #endregion
    } 

}
