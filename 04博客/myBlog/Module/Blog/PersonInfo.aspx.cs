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

public partial class Module_Blog_PersonInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Request["VisitorID"].ToString() != "")
		{

			if (!IsPostBack)
			{
				SqlConnection mycon = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
				mycon.Open();
				SqlDataAdapter mydataadapter = new SqlDataAdapter("select * from tb_Visitor where VisitorID=" + Request["VisitorID"], mycon);
				DataSet mydataset = new DataSet();
				mydataadapter.Fill(mydataset, "tb_Visitor");
				DataRowView rowview = mydataset.Tables["tb_Visitor"].DefaultView[0];
				this.txtName.Text = Convert.ToString(rowview["VisitorName"]);
				this.DropDownList1.SelectedValue = Convert.ToString(rowview["Sex"]);
				this.txtRealName.Text = Convert.ToString(rowview["ReallyName"]);
				this.txtBirthday.Text = Convert.ToString(rowview["Birthday"]);
				this.txtAddress.Text = Convert.ToString(rowview["Address"]);
				this.txtPostCode.Text = Convert.ToString(rowview["PostCode"]);
				this.txtEmail.Text = Convert.ToString(rowview["Email"]);
				this.txtHphone.Text = Convert.ToString(rowview["HomePhone"]);
				this.txtMphone.Text = Convert.ToString(rowview["MobilePhone"]);
				this.txtQQ.Text = Convert.ToString(rowview["QQ"]);
				this.txtICQ.Text = Convert.ToString(rowview["ICQ"]);
				mycon.Close();
			}
		}
    }
	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		Response.Redirect("ReplyManage2.aspx");
	}
}
