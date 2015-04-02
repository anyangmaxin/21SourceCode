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

public partial class Module_Admin_AdminInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserName"] == null)
        //{
        //    Response.Redirect("../../Index.aspx");
        //}

		if (!IsPostBack)
		{
			try
			{
				SqlConnection mycon = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
				mycon.Open();
				DataSet mydataset = new DataSet();
				SqlDataAdapter mydataadapter = new SqlDataAdapter("select * from tb_Admin where id=" + Request["id"],mycon);
				mydataadapter.Fill(mydataset, "tb_Admin");
				DataRowView rowview = mydataset.Tables["tb_Admin"].DefaultView[0];
				this.txtName.Text = Convert.ToString(rowview["UserName"]);
				this.txtPwd.Text = Convert.ToString(rowview["PassWord"]);
				this.ddlSex.SelectedValue = Convert.ToString(rowview["Sex"]);
				this.txtRealName.Text = Convert.ToString(rowview["ReallyName"]);
				this.txtBirthday.Text = Convert.ToString(rowview["Birthday"]);
				this.txtAddress.Text = Convert.ToString(rowview["Address"]);
				this.txtPostCode.Text = Convert.ToString(rowview["PostCode"]);
				this.txtQues.Text = Convert.ToString(rowview["Question"]);
				this.txtAns.Text = Convert.ToString(rowview["Answer"]);
				this.txtEmail.Text = Convert.ToString(rowview["Email"]);
				this.txtHphone.Text = Convert.ToString(rowview["HomePhone"]);
				this.txtMphone.Text = Convert.ToString(rowview["MobilePhone"]);
				this.txtQQ.Text = Convert.ToString(rowview["QQ"]);
				this.txtICQ.Text = Convert.ToString(rowview["ICQ"]);
				this.TextBox1.Text = Convert.ToString(rowview["RegTime"]);
				this.DropDownList1.SelectedValue = Convert.ToString(rowview["SuperAdmin"]);
				this.txtIP.Text = Convert.ToString(rowview["IP"]);
				mycon.Close();
			}
			catch (Exception ex)
			{
				Response.Write(ex.Message);
			}
		}
    }

	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		try
		{
			SqlData da = new SqlData();
			string P_str_Com = "update tb_Admin set UserName='" + this.txtName.Text + "',PassWord='" + this.txtOKpwd.Text + "'"
			+ ",Sex='" + this.ddlSex.SelectedValue + "',ReallyName='" + this.txtRealName.Text + "'"
			+ ",Birthday='" + this.txtBirthday.Text + "',Email='" + this.txtEmail.Text + "',HomePhone='" + this.txtHphone.Text + "'"
			+ ",MobilePhone='" + this.txtMphone.Text + "',PostCode='" + this.txtPostCode.Text + "',QQ='" + this.txtQQ.Text + "'"
			+ ",ICQ='" + this.txtICQ.Text + "',Address='" + this.txtAddress.Text + "',Answer='" + this.txtAns.Text + "',Question='" + this.txtQues.Text + "',SuperAdmin='" + this.DropDownList1.SelectedValue + "'"
			+ " where ID='" + Request["ID"] + "'";
			bool add = da.ExceSQL(P_str_Com);
			if (add == true)
			{
				Response.Write("<script language=javascript>alert('修改信息成功!');location='AdminManage.aspx'</script>");
			}
			else
			{
				Response.Write("<script language=javascript>alert('修改信息失败！');location='javascript:history.go(-1)'</script>");
			}
		}
		catch (Exception ex)
		{
			Response.Write(ex.Message);
		}
	}


	protected void txtBack_Click(object sender, EventArgs e)
	{
		Page.Response.Redirect("AdminManage.aspx");
	}
}
