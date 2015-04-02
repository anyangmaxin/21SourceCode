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
using System.Data.SqlClient;

public partial class Module_Admin_Findpwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Random ran = new Random();
            this.labVial.Text = ran.Next(1000, 9999).ToString();
        }
    }
	protected void Button2_Click(object sender, EventArgs e)
	{
        this.txtName.Text = "";
        this.txtVali.Text = "";
	}
	protected void btnOK_Click(object sender, EventArgs e)
	{
		if (this.txtVali.Text == this.labVial.Text )
		{
            Session["UserName"] = this.txtName.Text;
			Page.Response.Redirect("Findpwd.aspx");
		}
		else
		{
            Response.Write("<script language=javascript>alert('您输入的信息不正确，请重新输入！');location='javascript:history.go(-1)'</script>");
		}
	}
}
