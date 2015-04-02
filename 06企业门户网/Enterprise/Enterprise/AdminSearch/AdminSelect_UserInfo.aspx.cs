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

public partial class AdminSelect_UserInfo : System.Web.UI.Page
{
    EP ep = new EP();//实例化对象
    protected void Page_Load(object sender, EventArgs e)
    {
        //使用Session判断管理员是否已成功登录
        if (Session["AdminUserName"] == null && Session["AdminPassWord"] == null)
        {
            Response.Redirect("~/AdminLogin.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                if (Request["UserId"] != null)
                {
                    DataSet ds = ep.ReturnDataSet("select * from tb_UserLogin where UserId='" + Request["UserId"] + "'", "tb_UserLogin");
                    DataRowView rv = ds.Tables["tb_UserLogin"].DefaultView[0];
                    this.LblUserId.Text = rv["UserId"].ToString();
                    this.lblUserName.Text = rv["UserName"].ToString();
                    this.Lblrole.Text = rv["role"].ToString();
                    this.lblSex.Text = rv["Sex"].ToString();
                    this.LblAge.Text = rv["Age"].ToString();
                    this.lblphone.Text = rv["phone"].ToString();
                    this.lblEmail.Text = rv["Email"].ToString();
                    this.lblQQ.Text = rv["QQ"].ToString();
                    this.lblAddress.Text = rv["Address"].ToString();
                    this.lblhomepage.Text = rv["homepage"].ToString();
                    this.LblIntro.Text = rv["Intro"].ToString();
                    this.Img.ImageUrl = rv["Image"].ToString();
                }
            }
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminSearch_User.aspx");//跳转到AdminSearch_User.aspx页面中
    }
}
