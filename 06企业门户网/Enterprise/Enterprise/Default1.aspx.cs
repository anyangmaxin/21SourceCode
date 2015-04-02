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

public partial class Default1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断管理员是否已经登录过
        if (Session["AdminUserName"] != null || Session["AdminPassWord"] != null)
        {
            Session["AdminUserName"] = null;
            Session["AdminPassWord"] = null;
        }
        //判断用户是否已经登录过
        if (Session["UserName"] != null || Session["PassWord"] != null)
        {
            Session["UserName"]=null;
            Session["UserPwd"]=null; 
        }
    }
    protected void LinbtnSy_Click(object sender, EventArgs e)
    {
  
        Response.Write("<script lanuage='javaScript'>;location='Default.aspx'</script>");
    }
    protected void LinBtnHT_Click(object sender, EventArgs e)
    {
        Response.Write("<script lanuage='javaScript'>;location='AdminLogin.aspx'</script>");
    }
}
