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

public partial class Register : System.Web.UI.Page
{
    public static string Name;
    public static string img="";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //注册新用户
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        //调用自定义方法判断用户名是否存在
        if (selectName())
        {
            RegisterStartupScript("true", "<script>alert('该用户名已存在！')</script>");
        }
        else { 
            //获取用户名
            Name = txtName.Text;
            //获取密码
            string Pass = txtPass.Text;
            //获取密码提示问题
            string PassQuestion = txtPassQuestion.Text;
            //获取密码提示答案 
            string PassAnswer = txtPassAnswer.Text;
            //获取Email
            string Email = txtEmail.Text;
            //编写SQL语句插入用户的详细信息
            string Sql = "insert into userRegister values('" + Name + "','" + Pass + "','" + PassQuestion + "','" + PassAnswer + "','" + Email + "','','')";
                //判读用户是否注册成功
                if (operateData.execSql(Sql))
                {
                    //清空TextBox控件    
                    txtName.Text = txtPassAnswer.Text = txtPassQuestion.Text = txtEmail.Text = "";
                    //隐藏注册信息
                    PanelRegister.Visible = false;
                    //显示详细信息
                    PanelInfo.Visible = true;
                }
                else
                {
                    RegisterStartupScript("false", "<script>alert('注册失败！')</script>");
                }
         }
    }
    //查询用户名是否存在
    protected void btnSelectName_Click(object sender, EventArgs e)
    {
        //判断用户输入的用户名是否为空
        if (txtName.Text != "")
        {   //调用自定义方法判读用户名是否已经注册
            if (selectName())
            {
                RegisterStartupScript("false", "<script>alert('用户名已存在！！')</script>");
            }
            else {
                RegisterStartupScript("false", "<script>alert('可以注册！！')</script>");
            }
        }
        else {
            RegisterStartupScript("false", "<script>alert('用户名不能为空！')</script>");
        }
    }
    //判断用户名是否存在
    protected bool selectName()
    {
        //获取用户输入的注册名
        string userName = txtName.Text;
        //编写SQL 语句查询注册名是否存在
        string sqlSel = "select * from userRegister where userName='" + userName + "'";
        if (operateData.getCount(sqlSel) > 0)
        {
            return true;
          
        }
        else {
            return false;
          
        }
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }

    //添加用户详细信息
    protected void btnEnd_Click(object sender, EventArgs e)
    {
        //获取昵称
        string nickname = txtNickname.Text;
        //获取性别
        string sex = "";
        if (rbtnlsSex.SelectedValue == "男")
        {
            sex = "男";
        }
        else
            if (rbtnlsSex.SelectedValue == "女")
            {
                sex = "女";
            }
        //判读用户是否上传头像未上传使用默认头像
        if(img=="")
        {
            img="imgHead/default.gif";
        }        
        //获取所在城市
        string city = txtCity.Text;
        //获取qq
        string qq = txtQQ.Text;
        //获取留言
        string speak = txtSpeak.Text;
        //编写SQL语句更新用户的详细信息
        string sqlUp = "update userInfo set nickname='" + nickname + "',sex='" + sex + "',img='" + img + "',city='" + city + "',qq='" + qq + "',speak='" + speak + "' where userName='" + Name + "'";
        if (operateData.execSql(sqlUp))
        {
            RegisterStartupScript("true", "<script>alert('添加成功!');location='index.aspx'</script>");
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('添加失败！')</script>");
        }
    }
    protected void btnUp_Click(object sender, EventArgs e)
    {
        //获取上传头像的名称
        img = fupImg.FileName;
        //更该头像名称
        img = img.Replace(img.Substring(0, img.LastIndexOf(".")), Name);
        //设置保存路径
        img = "imgHead/" + img;
        //保存上传的头像
        fupImg.SaveAs(Server.MapPath("~/") + img);
        //显示头像
        ImageHead.ImageUrl = "~/" + img;
       
    }
}
