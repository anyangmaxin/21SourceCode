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

public partial class Web_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RedirectPage();
    }
    private void RedirectPage()
    {
        if (Session["userID"] == null)
            Response.Redirect("Login.aspx");

        Usersmr user = new Usersmr();
        string userid = Session["userID"].ToString();
        user.LoadData(userid);
        switch (user.RoleName)
        {
            case "����Ա":
                Response.Redirect("PwdModify.aspx");
                break;
            case "��ʦ":
                Response.Redirect("PwdModify.aspx");
                break;
            case "ѧ��":
                Response.Redirect("StudentIndex.aspx");
                break;
            default:
                break;
        }
    }
}
