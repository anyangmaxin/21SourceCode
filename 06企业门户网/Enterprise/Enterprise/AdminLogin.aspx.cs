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
public partial class AdminLogin : System.Web.UI.Page
{
    EP ep = new EP();
    protected void Page_Load(object sender, EventArgs e)
    {
        //使用Session判断管理员是否已经登录过，如果已经登录过不用再重新登录，直接跳转到网站后台首页
        if (Session["AdminUserName"] != null && Session["AdminPassWord"] != null)
        {
            Response.Redirect("~/AdminIndex.aspx");//跳转到后台首页
        }
    }
    #region
    /// <summary>
    /// 调用用户自定义的checkLogin方法判断管理员是否成功登录
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ImgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
       //调用用户自定义的checkLogin方法，并且将该方法中传递３个参数，将返回的结果赋值给整型变量int
       　int i = this.checkLogin(this.TxtAdminName.Text, this.TxtAdminPwd.Text, this.DDlRole.SelectedItem.Text);
        //判断i是否大于0，如果大于0说明调用方法调用成功，并将用户名和用户密码分别赋给Session变量中
        if (i > 0)
        {
            Session["AdminUserName"] = this.TxtAdminName.Text;//由用户输入的管理员的用户名赋值给Session["AdminUsername"]中
            Session["AdminPassWord"] = this.TxtAdminPwd.Text;//有管理员输入的的密码赋值给Session["AdminPassWord"]中
            Page.Response.Redirect("~/AdminIndex.aspx");//跳转到管理员首页
        }
        else//调用方法调用失败，弹出提示对话框
        {
            Response.Write("<script language=javascript>alert('很遗憾，管理员的用户名称或密码错误！');location='AdminLogin.aspx'</script>");
        }
    }
    #endregion
    #region
    /// <summary>
    /// 该方法用于判断管理员输入的文本框的内容是否和数据库中的数据一致
    /// </summary>
    /// <param name="loginName">传递用户名</param>
    /// <param name="loginPwd">传递用户密码</param>
    /// <param name="loginrole">传递用户权限</param>
    /// <returns></returns>
    public int checkLogin(string loginName, string loginPwd ,string loginrole)
     {
        SqlConnection con=new SqlConnection(EP.GetConStr());
        SqlCommand myCommand = new SqlCommand("select count(*) from tb_UserLogin where UserName=@loginName and UserPwd=@loginPwd and role=@loginrole", con);
        myCommand.Parameters.Add(new SqlParameter("@loginName", SqlDbType.VarChar, 50));
        myCommand.Parameters["@loginName"].Value = loginName;
        myCommand.Parameters.Add(new SqlParameter("@loginPwd", SqlDbType.VarChar, 50));
        myCommand.Parameters["@loginPwd"].Value = loginPwd;
        myCommand.Parameters.Add(new SqlParameter("@loginrole", SqlDbType.VarChar, 20));
        myCommand.Parameters["@loginrole"].Value = loginrole;
        myCommand.Connection.Open();//打开数据库连接
        int i = (int)myCommand.ExecuteScalar();//执行SQL语句
        myCommand.Connection.Close();//关闭数据库连接
        return i;
    }
    #endregion

    #region
    /// <summary>
    /// 该方法用于清空用户名和用户密码文本框
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ImgCZ_Click(object sender, ImageClickEventArgs e)
    {
        this.TxtAdminName.Text = "";//清空用户名
        this.TxtAdminPwd.Text = "";//清空用户密码
    }
    #endregion

}
