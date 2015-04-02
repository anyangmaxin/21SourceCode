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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        //获取用户名
        string userName = txtName.Text;
        //获取密码
        string pass = txtPass.Text;
        //编写SQL语句，查询用户名和密码是否正确
        string sqlSel = "select * from userRegister where username=@name and userPass=@pass";
        //掉用自定义方法执行SQL语句
        if (operateData.login(sqlSel, userName, pass))
        {
            //保存用户名
            Session["userName"] = txtName.Text;
            //编写SQL语句，查询指定用户的信息
            string sql = "select * from userRegister where userName='" + Session["userName"] + "'";
            //调用公共类中的getRow方法，并接收该方法返回的SqlDataReader对象
            SqlDataReader sdr = operateData.getRow(sql);
            //读取一条记录
            sdr.Read();
            //判断当前用户是否被锁定
            if (Convert.ToBoolean(sdr["lock"]))
            {
                Session["userName"] = null;
                RegisterStartupScript("true", "<script>alert('" + sdr["lockCause"].ToString() + "');location='index.aspx'</script>");

            }
            else
                RegisterStartupScript("true", "<script>alert('登录成功！单击返回首页');location='user/upVideo.aspx'</script>");
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('用户名或密码错误！')</script>");
        }
        
    }
}
