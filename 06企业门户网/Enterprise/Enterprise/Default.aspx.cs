using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Data.SqlClient;//引入命名空间

public partial class _Default : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null || Session["UserPwd"] != null)
        {
            this.LblInfo.Text = "您好！ " + Session["UserName"].ToString() + " 欢迎您登录本网站！";
            Panel2.Visible = true;
            Panel1.Visible = false;
        }
        else
        {
            
            Panel2.Visible = false;
            Panel1.Visible = true;
        }
        ep.EXECDataList(dlSoftIntro, "select top 4 * from tb_Tools order by UPTime desc", "Id");
    }

    protected void ImgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {

        if (this.TxtUserName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空！');location='Default.aspx'</script>");
            return;
        }
        else
        {
            if (this.TxtCode.Text == Request.Cookies["CheckCode"].Value)
            {

                string SqlStr = "select count(*) from tb_UserLogin where UserName='" + this.TxtUserName.Text + "'and UserPwd='" + this.TxtUserPwd.Text + "'";
                int a = ep.EXECuteScalar(SqlStr);
                if (a >= 1)
                {
                    Session["UserName"] = this.TxtUserName.Text;
                    Session["UserPwd"] = this.TxtUserPwd.Text;
                    Response.Write("<script lanuage='javaScript'>alert('恭喜您！！登录成功！');location='Default.aspx'</script>");//弹出对话框显示“恭喜您！！登录成功！”
                    Panel2.Visible = true;
                    Panel1.Visible = false;
                }
                else
                {
                    Response.Write("<script lanuage='javaScript'>alert('很遗憾！！登录失败！');location='Default.aspx'</script>");//弹出对话框显示“很遗憾！！登录失败！”
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('输入的验证码不正确！');location='Default.aspx'</script>");
            }
        }
    }
    protected void LinBtnReg_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Register/RegPro.aspx");//跳转到注册协议页面
    }
    protected void LinBtnforgetPwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/FindPwd/Findpwd1.aspx");//跳转到找回密码第一步的页面中
    }

    protected void LinBtnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminLogin.aspx");//跳转到管理员登录页面
    }
    protected void dlSoftIntro_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Xiangxi")
        {
            Response.Redirect("list_softdownload.aspx");//将页面跳转到list_softdownload.aspx页面中
        }
    }
    protected void LinBtnMoreSoft_Click(object sender, EventArgs e)
    {
        Response.Redirect("More_Soft.aspx");//跳转到More_Soft.aspx页面中
    }

    protected void ImgBtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        /*清空文本框*/
        this.TxtUserName.Text = "";
        this.TxtUserPwd.Text = "";
        this.TxtCode.Text = "";
    }
    protected void LinBtnExit_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Session["UserPwd"] = null;
        this.Panel1.Visible = true;
        this.Panel2.Visible = false;
    }
}
