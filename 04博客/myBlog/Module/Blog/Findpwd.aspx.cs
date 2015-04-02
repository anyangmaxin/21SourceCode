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
        SqlData da = new SqlData();
        SqlDataReader read = da.ExceRead("select * from tb_Blog where UserName='" + Session["Name"].ToString() + "'");
        read.Read();
        if (read.HasRows)
        {
            this.txtQues.Text = read["Question"].ToString();
        }
        else
        {
            Response.Write("<script language=javascript>alert('此用户不存在！');</script>");
        }
        read.Close();      
    }
	protected void Button2_Click(object sender, EventArgs e)
	{
        Page.Response.Redirect("../../BlogIndex.aspx");
	}
	protected void btnOK_Click(object sender, EventArgs e)
	{
		SqlData da = new SqlData();
		SqlDataReader read = da.ExceRead("select * from tb_Blog where UserName='"+Session["Name"].ToString()+"'");
		read.Read();
		if (this.txtQues.Text == read["Question"].ToString() && this.txtAns.Text == read["Answer"].ToString())
		{
			Session["pwd1"] = read["BlogID"].ToString();
			Page.Response.Redirect("ShowPwd.aspx");
		}
		else
		{
			Response.Write("<script language=javascript>alert('您输入的信息不正确，请重新输入！');</script>");
		}
		read.Close();
	}
}
