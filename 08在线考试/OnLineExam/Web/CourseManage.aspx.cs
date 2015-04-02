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
using OnLineExam.BusinessClass;

public partial class Web_CourseManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            InitData();  //初始化考试科目          
        }
    }
    //初始化考试科目
    protected void InitData()
    {
        Coursemr course = new Coursemr();       //创建考试科目对象
        DataSet ds = course.QueryCourse();  //查询考试科目信息
        GridView1.DataSource = ds;          //为GridView控件设置数据源        
        GridView1.DataBind();               //绑定数据
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        InitData();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {       
        int i;
        //执行循环，保证每条数据都可以更新
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            }
        }
    }
    //删除考试科目事件
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Coursemr course = new Coursemr();           //创建Coursemr对象
        int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
        if (course.DeleteByStr(ID))
        {
            Response.Write("<script language=javascript>alert('成功删除考试科目！')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('删除考试科目失败！')</script>");
        }
        GridView1.EditIndex = -1;
        InitData();
    }
    //GridView控件RowUpdating事件
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
        Coursemr course = new Coursemr();           //创建Coursemr对象
        course.Name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
        if (course.UpdateByStr(ID))//使用Usersmr类UpdateByProc方法修改用户信息
        {
            Response.Write("<script language=javascript>alert('修改成功!')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('修改失败!')</script>");
        }
        GridView1.EditIndex = -1;
        InitData();
    }
    //GridView控件RowCanceling事件
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        InitData();
    }
    //GridView控件RowEditing事件
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  //GridView编辑项索引等于单击行的索引
        InitData();
    }


    protected void btnAddCource_Click(object sender, EventArgs e)
    {
        Response.Redirect("CourseAdd.aspx");
    }
}
