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
using System.Text.RegularExpressions;

public partial class Module_Blog_LinkManInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserName"] == null)
        //{
        //    Response.Redirect("../../Index.aspx");
        //}
        if (!IsPostBack)
        {
			SqlConnection mycon = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
			SqlDataAdapter mydataadapter = new SqlDataAdapter("select * from tb_Message where MessageID=" + Request["id"], mycon);
			DataSet mydataset = new DataSet();
			mydataadapter.Fill(mydataset, "tb_Message");
			DataRowView rowview = mydataset.Tables["tb_Message"].DefaultView[0];
			this.txtName.Text = Convert.ToString(rowview["FriendName"]);
			this.DropDownList1.SelectedValue = Convert.ToString(rowview["Sex"]);
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
	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		SqlData da = new SqlData();
		string P_str_Com = "update tb_Message set FriendName='" + this.txtName.Text + "'"
		+ ",Sex='" + this.DropDownList1.SelectedValue + "',MobilePhone='" + this.txtMphone.Text + "',PostCode='" + this.txtPostCode.Text + "'"
		+ ",Birthday='" + this.txtBirthday.Text + "',Email='" + this.txtEmail.Text + "',HomePhone='" + this.txtHphone.Text + "'"
		+ ",ICQ='" + this.txtICQ.Text + "',Address='" + this.txtAddress.Text + "',QQ='" + this.txtQQ.Text + "'"
		+ " where MessageID='" + Request["ID"] + "'";
        if (!ValidateDate1(txtBirthday.Text) && !ValidateDate2(txtBirthday.Text) && !ValidateDate3(txtBirthday.Text))
        {
            Response.Write("<script language=javascript>alert('输入的日期格式有误！');location='javascript:history.go(-1)'</script>");
        }
		bool add = da.ExceSQL(P_str_Com);
		if (add == true)
		{
			Response.Write("<script language=javascript>alert('修改成功!');location='LinkManManage.aspx'</script>");
		}
		else
		{
			Response.Write("<script language=javascript>alert('修改失败！');location='javascript:history.go(-1)'</script>");
		}
	}
    public bool ValidateDate1(string input)
    {
        return Regex.IsMatch(input, "\\b(?<year>\\d{2,4})/(?<month>\\d{1,2})/(?<day>\\d{1,2})\\b");
    }
    public bool ValidateDate2(string input)
    {
        return Regex.IsMatch(input, "\\b(?<year>\\d{2,4})-(?<month>\\d{1,2})-(?<day>\\d{1,2})\\b");
    }
    public bool ValidateDate3(string input)
    {
        return Regex.IsMatch(input, "\\b(?<year>\\d{2,4})年(?<month>\\d{1,2})月(?<day>\\d{1,2})日\\b");
    }
    protected void btnCancle_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("LinkManManage.aspx");
    }
}
