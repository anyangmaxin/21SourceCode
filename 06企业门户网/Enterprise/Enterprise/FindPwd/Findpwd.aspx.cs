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
using System.Data.SqlClient;//引入命名空间

public partial class Module_Admin_Findpwd : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
           string SqlStr="select * from tb_UserLogin where UserName='" + Session["UserName"].ToString() + "'";
           SqlDataReader Sdr = ep.ExceRead(SqlStr);
           Sdr.Read();
           if (Sdr.HasRows)
           {
            //从数据表中读取字段为“RetakePassword”的数据信息显示到文本框中
            this.txtQues.Text = Sdr["RetakePassword"].ToString();
           }
           else
           {
               Response.Write("<script language=javascript>alert('此用户不存在！');location='javascript:history.go(-1)'</script>");
           }
           Sdr.Close();   //关闭阅读器   
       
    }
	protected void Button2_Click(object sender, EventArgs e)
	{
        Page.Response.Redirect("../Default.aspx");//跳转到网站首页中
	}
	protected void btnOK_Click(object sender, EventArgs e)
	{
        string SqlStr = "select * from tb_UserLogin where UserName='" + Session["UserName"].ToString() + "'";
        SqlDataReader Sdr = ep.ExceRead(SqlStr);
        Sdr.Read();
        if (this.txtQues.Text == Sdr["RetakePassword"].ToString() && this.txtAns.Text == Sdr["AnswerPassWord"].ToString())
		{
            Session["ID"] = Sdr["UserId"].ToString();
			Response.Redirect("ShowPwd.aspx");
		}
		else
		{
            Response.Write("<script language=javascript>alert('您输入的信息不正确，请重新输入！');location='javascript:history.go(-1)'</script>");
		}
		Sdr.Close(); //关闭阅读器
	}
}
