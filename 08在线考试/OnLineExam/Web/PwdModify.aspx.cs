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
using OnLineExam.BusinessClass;

public partial class Web_PwdModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["userID"]) == null)
        {
            Response.Write("<script language=javascript>location='Login.aspx'</script>");
        }
        if (!Page.IsPostBack)
        {            
            this.txtOldPwd.Focus();
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
           
        } 
    }
  
    protected void imgBtnReset_Click(object sender, ImageClickEventArgs e)
    {
        txtOldPwd.Text = txtNewPwd.Text = txtConfirmPwd.Text = "";
    }
    protected void imgBtnModifyPwd_Click1(object sender, ImageClickEventArgs e)
    {
        Usersmr user = new Usersmr();//创建Usersmr对象user
        user.LoadData(Session["userID"].ToString());
       // string txtOldPwdMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtOldPwd.Text.Trim(), "MD5").ToString();
        string txtOldPwdMD5 = user.GetMd5(txtOldPwd.Text.Trim());
        if (user.UserPwd == txtOldPwdMD5)//验证用户输入原密码是否正确
        {
           // string txtNewPwdMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewPwd.Text.Trim(), "MD5").ToString();
            string txtNewPwdMD5 = user.GetMd5(txtNewPwd.Text.Trim());
            user.UserPwd = txtNewPwdMD5.ToString().Trim();
            if (user.ModifyPassword(this.Session["userID"].ToString()))//更改用户密码
            {
                  lblMessage.Text = "成功修改密码!";
            }
            else//修改密码失败
            {
                lblMessage.Text = "修改密码失败!";
            }
        }
        else//原密码错误
        {
            lblMessage.Text = "输入原密码错误,请重新输入!";
        }
    }  
}
