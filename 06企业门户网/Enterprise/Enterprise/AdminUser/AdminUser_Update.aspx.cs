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
public partial class AdminUser_AdminUser_Update : System.Web.UI.Page
{
    EP ep = new EP();//实例化对象
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            //使用Session判断管理员是否已成功登录
            if (Session["AdminUserName"] == null && Session["AdminPassWord"] == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else
            {
                string SqlStr = "select * from tb_image";//查询头像
                ep.EXECDropDownList(this.ddlPhoto, SqlStr, "ImagePhone");
                if (Request["UserId"] != null)
                {
                    DataSet ds = ep.ReturnDataSet("select * from tb_UserLogin where UserId='" + Request["UserId"] + "'", "tb_UserLogin");
                    DataRowView rv = ds.Tables["tb_UserLogin"].DefaultView[0];
                    this.TxtUserName.Text = rv["UserName"].ToString();
                    this.DdlRole.SelectedItem.Text = rv["role"].ToString();
                    this.TxtTrueName.Text = rv["TrueName"].ToString();
                    this.TxtRetakePwd.Text = rv["RetakePassword"].ToString();
                    this.txtAnswerPassWord.Text = rv["AnswerPassWord"].ToString();
                    this.ddlSex.SelectedValue = rv["sex"].ToString();
                    this.TxtAge.Text = rv["Age"].ToString();
                    this.TxtTel.Text = rv["phone"].ToString();
                    this.TxtEmail.Text = rv["Email"].ToString();
                    this.TxtQQ.Text = rv["QQ"].ToString();
                    this.TxtAddress.Text = rv["Address"].ToString();
                    this.Txthomepage.Text = rv["homepage"].ToString();
                    this.TxtIntro.Text = rv["Intro"].ToString();
                    this.imgPhoto.ImageUrl = rv["Image"].ToString();
                }
            }
        }
    }
    protected void ddlPhoto_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.imgPhoto.ImageUrl = this.ddlPhoto.SelectedValue;
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            String SqlUpdate = "Update tb_UserLogin set UserName='" + this.TxtUserName.Text + "',role='" + this.DdlRole.SelectedItem.Text + "',TrueName='" + this.TxtTrueName.Text + "',RetakePassword='" + this.TxtRetakePwd.Text + "',AnswerPassWord='" + this.txtAnswerPassWord.Text + "',sex='" + this.ddlSex.SelectedItem.Text + "' ,Age='" + this.TxtAge.Text + "',phone='" + this.TxtTel.Text + "',Email='" + this.TxtEmail.Text + "',QQ='" + this.TxtQQ.Text + "', Address='" + this.TxtIntro.Text + "' ,homepage='" + this.Txthomepage.Text + "',Intro='" + this.TxtIntro.Text + "',Image='" + this.ddlPhoto.SelectedItem.Text + "' where UserId='" + Request["UserId"] + "'";
            EP.EXECCommand(SqlUpdate);
            Response.Write("<script lanuage='javaScript'>alert('恭喜您！！用户信息修改成功！');location='AdminUser.aspx'</script>");//弹出对话框显示“恭喜您！！用户信息修改成功！”
        }
        catch
        {
            Response.Write("<script lanuage='javaScript'>alert('很遗憾！！用户信息修改失败！');location='AdminUser.aspx'</script>");//弹出对话框显示“很遗憾！！用户信息修改失败！”
        }
    }
    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminUser.aspx");//跳转到AdminUser.aspx页面当中
    }
}
