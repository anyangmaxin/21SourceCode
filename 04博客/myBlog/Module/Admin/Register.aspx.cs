using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;

public partial class Module_Admin_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["UserName"] == null)
		{
			Response.Redirect("../../Index.aspx");
		}
    }
	protected void btnOK_Click(object sender, EventArgs e)
	{
		SqlData da = new SqlData();
		SqlDataReader read = da.ExceRead("select * from tb_Admin where UserName='" + this.txtName.Text + "'");
		read.Read();
		if (read.HasRows)
		{
			if (this.txtName.Text == read["UserName"].ToString())
			{
				Response.Write("<script language=javascript>alert('对不起，该用户已经注册！');location='Register.aspx'</script>");
				return;
			}
		} 
		read.Close();
		string P_str_Com = "insert into tb_Admin(UserName,PassWord,Question,Answer,ReallyName,Birthday,Address"
			+ ",PostCode,Email,HomePhone,MobilePhone,QQ,ICQ,RegTime,Sex,SuperAdmin,IP) values('" + this.txtName.Text + "'"
			+ ",'" + this.txtPwd.Text + "','" + this.txtQues.Text + "','" + this.txtAns.Text + "','" + this.txtRealName.Text + "'"
			+ ",'" + this.txtBirthday.Text + "','" + this.txtAddress.Text + "','" + this.txtPostCode.Text + "','" + this.txtEmail.Text + "'"
			+ ",'" + this.txtHphone.Text + "','" + this.txtMphone.Text + "','" + this.txtQQ.Text + "','" + this.txtICQ.Text + "','" + DateTime.Now.ToString() + "','" + this.DropDownList1.SelectedValue + "','"+this.DropDownList2.SelectedValue+"','"+Request.UserHostAddress+"')";
		bool add = da.ExceSQL(P_str_Com);
		if (add == true)
		{
            Response.Write("<script language=javascript>alert('注册成功!');location='AdminManage.aspx'</script>");
		}
		else
		{
			Response.Write("<script language=javascript>alert('注册失败！');location='javascript:history.go(-1)'</script>");
		}
	}

	protected void Button1_Click(object sender, EventArgs e)
	{
		SqlData da = new SqlData();
		SqlDataReader read = da.ExceRead("select * from tb_Admin where UserName='"+this.txtName.Text+"'");
		read.Read();
		if (read.HasRows)
		{
			if (this.txtName.Text == read["UserName"].ToString())
			{
				Response.Write("<script language=javascript>alert('对不起，该用户已经注册！');location='Register.aspx'</script>");
			}
		}	
		else
		{
			Response.Write("<script language=javascript>alert('恭喜您，该用户可以注册！');</script>");
		}
		read.Close();
	}

	protected void btnBack_Click(object sender, EventArgs e)
	{
        Response.Redirect("AdminManage.aspx");
	}
}
