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
			SqlDataReader read = da.ExceRead("select * from tb_Blog where BlogID='" + Session["pwd1"].ToString() + "'");
			while (read.Read())
			{
				this.txtPwd.Text = read["PassWord"].ToString();
			}
			read.Close();
		}
    }
	protected void btnBack_Click(object sender, EventArgs e)
	{
        Page.Response.Redirect("../../BlogIndex.aspx");
	}
	protected void btnChange_Click(object sender, EventArgs e)
	{
		if (Session["pwd1"] != null)
		{
			string com = "update tb_Blog set PassWord='" + this.txtOKpwd.Text + "' where BlogID='" + Session["pwd1"].ToString() + "'";
			SqlData da = new SqlData();
			bool add = da.ExceSQL(com);
			if (add)
			{
                Response.Write("<script language=javascript>alert('修改成功!');location='../../BlogIndex.aspx'</script>");
			}
			else
			{
				Response.Write("<script language=javascript>alert('修改失败！');location='javascript:history.go(-1)'</script>");
			}
		}
	}
}
