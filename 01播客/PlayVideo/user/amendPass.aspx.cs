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

public partial class user_amendPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判读用户是否为空
        if (Session["userName"] == null)
        {
            Response.Write("<script>alert('请您先登录！');location='../index.aspx'</script>");
        }  
    }
    protected void btnAmend_Click(object sender, EventArgs e)
    {
        //获取密码
        string oldPass = txtOldPass.Text;
        //编写SQL语句，查询用户的密码
        string sqlSel = "select userPass from userRegister where userName='" + Session["userName"]+"'";
        //判读用户输入的密码是否正确
        if (oldPass == operateData.getTier(sqlSel))
        {
            //获取新密码
            string newPass = txtNewPass.Text;
            //编写SQL语句，修改用户的密码
            string sqlSet = "update userRegister set userPass='" + newPass + "' where userName='" + Session["userName"] + "'";
            //调用公共类中execSql方法执行SQL语句
            operateData.execSql(sqlSet);
            RegisterStartupScript("", "<script>alert('修改成功！')</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('原始密码不正确')</script>");
        }
    }
}
