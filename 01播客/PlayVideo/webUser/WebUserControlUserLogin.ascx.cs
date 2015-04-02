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

public partial class WebUserControlUserLogin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            Label1.Text = Session["userName"].ToString();
            PanelHello.Visible = true;
            PanelLogin.Visible = false;
        }
        else
        {
            PanelLogin.Visible = true;
            PanelHello.Visible = false;
        }
    }
    protected void LinkBtnLogout_Click(object sender, EventArgs e)
    {
        Session["userName"]=null;
        Response.Redirect("~/index.aspx");
    }
}
