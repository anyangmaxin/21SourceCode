using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Data.SqlClient;
using OnLineExam.BusinessClass;
using System.Text.RegularExpressions;


public partial class Web_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)//判断页面是否首次加载
        {                   
            if (!Object.Equals(Request.Cookies["UserID"], null))
            {
                //创建一个Cookie对象，实现记住用户名
                HttpCookie readcookie = Request.Cookies["UserID"];
                this.txtUserID.Text = readcookie.Value;
            }
        }  
    }
    //登录按钮事件
    protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        Usersmr user = new Usersmr();//创建Usersmr对象user
        //调用自定义GetMd5加密方法
        string pwdMd5 = user.GetMd5(txtPwd.Text.ToString());
        //判断验证码是否正确
        if (Session["CheckCode"].ToString() != Validator.Text.Trim())
        {
            //显示错误信息
            lblMessage.Text = "验证码错误！";
        }
        else
        {
            if (user.CheckPassword(txtUserID.Text.Trim()))//根据用户编号查询用户密码
            {
                if (user.UserPwd == pwdMd5)//输入密码与用户密码相同
                {
                    if (object.Equals(Request.Cookies["UserID"], null))
                    {
                        //调用自定义方法 CreateCookie()存储用户名
                        CreateCookie();
                    }
                    else
                    {
                        CreateCookie();
                    }  
                     Session["userID"] = txtUserID.Text.Trim();//存储用户编号
                     Response.Redirect("Default.aspx");//转向管理员操作界面                      
                }
                else//密码错误，给出提示
                {
                    lblMessage.Text = "您输入的密码错误！";
                }
            }
            else//用户不存在，给出提示
            {
                lblMessage.Text = "该用户不存在！";
            }
        }
    }
    protected void ChangeCode_Click(object sender, EventArgs e)
    {

    }
    private void CreateCookie()
    {
        try
        {
            SqlConnection conn = new SqlConnection(@"server=TZH-PC;database=db_22;Integrated Security=true");
            conn.Open();
            conn.Close();
        }
        catch (System.Exception ex)
        {
            throw;
        }
        
        //创建一个Cookie对象
        HttpCookie cookie = new HttpCookie("UserID");
        //判断Checkbox控件是否被选中
        if (this.cbxRemeberUser.Checked)
        {
            //将用户编号存储到创建的Cookie对象中
            cookie.Value = this.txtUserID.Text;
        }
        //获取创建的Cookie对象的过期时间
        cookie.Expires = DateTime.MaxValue;
        //将创建的Cookie对象添加到内部Cookie集合中
        Response.AppendCookie(cookie);
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        this.txtUserID.Text = this.txtPwd.Text = this.Validator.Text= string.Empty;
    }
}

