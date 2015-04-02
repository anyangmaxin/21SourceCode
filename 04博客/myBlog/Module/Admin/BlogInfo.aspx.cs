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

public partial class Module_Admin_BlogInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			SqlConnection mycon = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
			SqlDataAdapter mydataadapter = new SqlDataAdapter("select * from tb_Blog where BlogID=" + Request["id"],mycon);
			DataSet ds = new DataSet();
			mydataadapter.Fill(ds, "tb_Blog");
			DataRowView rowview = ds.Tables["tb_Blog"].DefaultView[0];
			this.txtName.Text = Convert.ToString(rowview["UserName"]);
			this.txtPwd.Text = Convert.ToString(rowview["PassWord"]);
			this.ddlSex.SelectedValue = Convert.ToString(rowview["Sex"]);
			this.txtRealName.Text = Convert.ToString(rowview["ReallyName"]);
			this.txtAddress.Text = Convert.ToString(rowview["Address"]);
			this.txtSubject.Text = Convert.ToString(rowview["Subject"]);
			this.txtPostCode.Text = Convert.ToString(rowview["PostCode"]);
			this.txtQues.Text = Convert.ToString(rowview["Question"]);
			this.txtAns.Text = Convert.ToString(rowview["Answer"]);
			this.txtEmail.Text = Convert.ToString(rowview["Email"]);
			this.txtHphone.Text = Convert.ToString(rowview["HomePhone"]);
			this.txtMphone.Text = Convert.ToString(rowview["MobilePhone"]);
			this.TextBox1.Text = Convert.ToString(rowview["RegTime"]);
			this.txtIP.Text = Convert.ToString(rowview["IP"]);
			mycon.Close();
		}
	}
	protected void btnOK_Click(object sender, EventArgs e)
	{
		SqlData da = new SqlData();
        string P_str_Com = "update tb_Blog set UserName='" + this.txtName.Text + "',PassWord='" + this.txtOKpwd.Text + "',Sex='" + this.ddlSex.SelectedValue + "',ReallyName='" + this.txtRealName.Text + "',Email='" + this.txtEmail.Text + "',HomePhone='" + this.txtHphone.Text + "',MobilePhone='" + this.txtMphone.Text + "',PostCode='" + this.txtPostCode.Text + "',Address='" + this.txtAddress.Text + "',Answer='" + this.txtAns.Text + "',Subject='" + this.txtSubject.Text + "',Question='" + this.txtQues.Text + "' where BlogID='" + Request["id"] + "'";
		bool add = da.ExceSQL(P_str_Com);
		if (add == true)
		{
			Response.Write("<script language=javascript>alert('信息修改成功!');location='BlogManage.aspx'</script>");
		}
		else
		{
			Response.Write("<script language=javascript>alert('信息修改失败！');location='javascript:history.go(-1)'</script>");
		}
	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		Page.Response.Redirect("BlogManage.aspx");
	}
}
