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
using System.IO;

public partial class Module_Admin_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            this.txtICQ.Enabled = false;
            this.Calendar1.Visible = false;
    }
	protected void btnOK_Click(object sender, EventArgs e)
	{

        //定义一个SqlData的新实例对象
        SqlData da = new SqlData();
        //调用公共类的ExceRead方法，返回SqlDataReader类型的数据
		SqlDataReader read = da.ExceRead("select * from tb_Blog where UserName='" + this.txtName.Text + "'");
        //读取数据库中的数据
		read.Read();
        //判断用户是否已经注册
		if (read.HasRows)
		{
			if (this.txtName.Text == read["UserName"].ToString())
			{
				Response.Write("<script language=javascript>alert('对不起，该用户已经注册！');location='Register.aspx'</script>");
				return;
			}
		} 
		read.Close();
        //定义一个字符串，插入相关的用户注册信息
        string P_str_Com = "insert into tb_Blog(UserName,PassWord,ReallyName,Birthday,Address,PostCode,Subject,Email,HomePhone,MobilePhone,QQ,ICQ, Question,Answer,Sex,RegTime,IP)"
        + " values('" + this.txtName.Text + "','" + this.txtPwd.Text + "','" + this.txtRealName.Text + "','" + this.txtBirthday.Text + "'"
		+ ",'" + this.txtAddress.Text + "','" +this.txtPostCode.Text+ "','" + this.txtSubject.Text + "','" + this.txtEmail.Text + "'"
		+ ",'" +this.txtHphone.Text + "','" + this.txtMphone.Text + "','" +this.txtQQ.Text+ "','" +this.txtICQ.Text + "','" + this.txtQues.Text + "'"
        + ",'" + this.txtAns.Text + "','" + this.ddlSex.SelectedValue + "','" + DateTime.Now.ToString() + "','" + Page.Request.UserHostAddress + "')";
        if (!ValidateDate1(txtBirthday.Text) && !ValidateDate2(txtBirthday.Text) && !ValidateDate3(txtBirthday.Text))
        {
            Response.Write("<script language=javascript>alert('输入的生日日期格式有误！');location='Register.aspx'</script>");
        }
        else
        {
            //调用公共类中的ExceSQL方法，执行insert语句
            bool add = da.ExceSQL(P_str_Com);
            if (add)
            {
                Response.Write("<script language=javascript>alert('恭喜您！注册成功！');location='../../BlogIndex.aspx'</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('对不起！您注册失败！');location='javascript:history.go(-1)'</script>");
            }
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
	protected void btnBack_Click(object sender, EventArgs e)
	{
        Page.Response.Redirect("~/BlogIndex.aspx");
	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		this.Calendar1.Visible = true;
	}

   
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        this.txtICQ.Text = this.Calendar1.SelectedDate.ToShortDateString();
        this.Calendar1.Visible = false;
    }
    protected void btnCheck_Click(object sender, EventArgs e)
    {
        SqlData da = new SqlData();
        SqlDataReader read = da.ExceRead("select * from tb_Blog where UserName='" + this.txtName.Text + "'");
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
            Response.Write("<script language=javascript>alert('恭喜您，该用户可以注册！');location='javascript:history.go(-1)'</script>");
        }
        read.Close();
    }
}
