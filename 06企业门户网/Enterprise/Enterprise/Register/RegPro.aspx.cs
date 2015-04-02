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
public partial class Module_Admin_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void Button1_Click(object sender, EventArgs e)
	{
		Page.Response.Redirect("User_Reg.aspx");//跳转到登录页面
	}
	protected void Button2_Click(object sender, EventArgs e)
	{
        Page.Response.Redirect("../Default.aspx");//跳转到网站首页中
	}
}
