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

public partial class search : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtKeys.Text.Trim() != "")
        {
            Session["searchKeys"] = txtKeys.Text;
            Response.Redirect("~/searchList.aspx");
        }
        else
        {
            Page.RegisterStartupScript("", "<script>alert('关键词不可以为空')</script>");
        }
        

    }
}
