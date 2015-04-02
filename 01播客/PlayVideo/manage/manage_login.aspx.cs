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

public partial class manage_manage_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
 
    protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        string userName = txtName.Text;
        string pass = txtPass.Text;
        string sqlSel = "select * from manageUser where name=@name and pass=@pass";
        if (operateData.login(sqlSel, userName, pass))
        {
            Response.Redirect("manage_index.aspx");

        }
        else
        {
            RegisterStartupScript("false", "<script>alert('登录失败！')</script>");
        }
    }
}
