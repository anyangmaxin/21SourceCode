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

public partial class UserControl_Login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLoad_Click(object sender, ImageClickEventArgs e)
    {
        HttpCookie cookie = Request.Cookies["CheckCode"];
        if (String.Compare(cookie.Value, txtVali.Text, true) != 0)
        {
            Response.Write("<script lanuage=javascript>alert('验证码错误');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            int i = this.checkLogin(txtUid.Text, txtPwd.Text);
            if (i > 0)
            {
                Session["UserName"] = this.txtUid.Text;
                Session["PassWord"] = this.txtPwd.Text;
                Page.Response.Redirect("~/Module/Blog/ST_BlogIndex.aspx");
            }
            else
            {
                Response.Write("<script lanuage=javascript>alert('用户名称或密码错误！');location='javascript:history.go(-1)'</script>");
            }
        }
    }
    protected void btnRegister_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~/Module/Blog/RegPro.aspx");
    }
    public int checkLogin(string loginName, string loginPwd)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        SqlCommand myCommand = new SqlCommand("select count(*) from tb_Blog where UserName=@loginName and PassWord=@loginPwd", con);
        myCommand.Parameters.Add(new SqlParameter("@loginName", SqlDbType.NVarChar, 50));
        myCommand.Parameters["@loginName"].Value = loginName;
        myCommand.Parameters.Add(new SqlParameter("@loginPwd", SqlDbType.NVarChar, 50));
        myCommand.Parameters["@loginPwd"].Value = loginPwd;
        myCommand.Connection.Open();
        int i = (int)myCommand.ExecuteScalar();
        myCommand.Connection.Close();
        return i;
    }
    protected void lnkbtnAdmin_Click(object sender, EventArgs e)
    {

    }
}
