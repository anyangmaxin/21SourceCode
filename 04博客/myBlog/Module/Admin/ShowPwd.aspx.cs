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

public partial class Module_Admin_Pwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			SqlData da = new SqlData();
			SqlDataReader read = da.ExceRead("select * from tb_Admin where ID='" + Session["pwd"].ToString() + "'");
			while (read.Read())
			{
				this.txtPwd.Text = read["PassWord"].ToString();
			}
			read.Close();
		}
    }
	protected void btnBack_Click(object sender, EventArgs e)
	{
		Page.Response.Redirect("Index.aspx");
	}
	protected void btnChange_Click(object sender, EventArgs e)
	{
		string P_str_Com = "update tb_Admin set PassWord='" + this.txtOKpwd.Text + "' where ID='" + Session["pwd"].ToString() + "'";
		SqlData da = new SqlData();
		bool add = da.ExceSQL(P_str_Com);
		if (add == true)
		{
			Response.Write("<script language=javascript>alert('修改成功!');location='Index.aspx'</script>");
		}
		else
		{
			Response.Write("<script language=javascript>alert('修改失败！');location='javascript:history.go(-1)'</script>");
		}
	}
}
