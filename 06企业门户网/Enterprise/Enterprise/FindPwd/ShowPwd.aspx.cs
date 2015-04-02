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

public partial class Module_Admin_Pwd : System.Web.UI.Page
{
    EP ep = new EP();//实例化对象
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
            this.LblUserName.Text = Session["UserName"].ToString();//将用户名显示在Label控件当中
            string SqlStr = "select * from tb_UserLogin where UserId='" + Session["ID"].ToString() + "'";
            SqlDataReader Sdr = ep.ExceRead(SqlStr);
			 while (Sdr.Read())
			{
                this.txtPwd.Text = Sdr["UserPwd"].ToString();
			}
			Sdr.Close();//关闭阅读器
		}
    }
	protected void btnBack_Click(object sender, EventArgs e)
	{
        Response.Redirect("~/default.aspx");//跳转到网站首页
	}
	protected void btnChange_Click(object sender, EventArgs e)
	{
        if (Session["ID"] != null)
        {
            string Sql= "update tb_UserLogin set UserPwd='" + this.txtOKpwd.Text + "' where UserName='" + Session["UserName"].ToString() + "'";
            int i = EP.EXECCommand(Sql);
            if (i>0)
            {
                Response.Write("<script language=javascript>alert('恭喜您，修改成功！');location='../default.aspx'</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('很遗憾，修改失败！');location='javascript:history.go(-1)'</script>");
            }
        }
	}
}
