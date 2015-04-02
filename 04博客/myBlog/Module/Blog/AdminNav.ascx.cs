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

public partial class UseControls_MainControls_Navigation : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void lnkbtnCancle_Click(object sender, EventArgs e)
	{
		FormsAuthentication.SignOut();  //清除验证信息
		Session.Clear();　　　//清除Session的内存
		Session.Abandon();    //取消会话状态
        Response.Redirect("../../BlogIndex.aspx");
	}
}
