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
		Page.Response.Redirect("Register.aspx");
	}
	protected void Button2_Click(object sender, EventArgs e)
	{
        Page.Response.Redirect("~/BlogIndex.aspx");
	}
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('这个是一个对话框！')</script>");
    }
}
