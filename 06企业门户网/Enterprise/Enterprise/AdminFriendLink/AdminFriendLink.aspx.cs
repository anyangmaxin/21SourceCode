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
using System.Data.SqlClient;//引入命名空间
public partial class AdminFriendLink : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
            //使用Session判断管理员是否已成功登录
            if (Session["AdminUserName"] == null && Session["AdminPassWord"] == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else
            {
                this.bindGridView();//调用用户自定义方法
            }
        }
    }
    public void bindGridView()
    {
        string SqlStr = "select * from tb_FriendLink";
        ep.EXECGridView(this.GridView1, SqlStr);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GridView1.PageIndex = e.NewPageIndex;
        this.bindGridView();//调用自定义方法

    }
    protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        this.GridView1.PageIndex = e.NewPageIndex;
        this.bindGridView();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminFriendLink_Add.aspx");
    }
}
