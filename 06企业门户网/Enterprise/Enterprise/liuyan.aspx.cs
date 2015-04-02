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
public partial class liuyan : System.Web.UI.Page
{
        EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断用户是否登录，如果没登录跳转到登录页面中
        if (Session["UserName"] == null && Session["UserPwd"] == null)
        {
            //弹出对话框显示“对不起！您还没有登录”提示信息，并且将页面跳转到用户登录页面中
            Response.Write("<script lanuage='javaScript'>alert('对不起！您还没有登录！');location='UserLogin.aspx'</script>");

        }
        else
        {
            this.TxtPerson.Text = Session["UserName"].ToString();
        }
    }
    protected void BtnLiuYan_Click(object sender, EventArgs e)
    {
        if (this.TxtTitle.Text == "" && this.TxtContent.Text == "" && this.TxtPerson.Text == "" && this.TxtTime.Text == "")
        {
            Response.Write("<script lanuage='javaScript'>alert('文本框不能为空！');location='liuyan.aspx'</script>");
        }
        else
        {
            try
            {
                String SqlInsert = "insert into tb_LeaveWord(Title,lTime,person,Content) values('" + this.TxtTitle.Text + "','" + this.TxtTime.Text + "','" + this.TxtPerson.Text + "','" + this.TxtContent.Text + "')";
                EP.EXECCommand(SqlInsert);
                Response.Write("<script lanuage='javaScript'>alert('恭喜您！！留言信息添加成功！');location='Default.aspx'</script>");//弹出对话框显示“恭喜您！！留言信息添加成功！”

            }
            catch 
            {
                Response.Write("<script lanuage='javaScript'>alert('很遗憾！！留言信息添加失败！');location='Default.aspx'</script>");//弹出对话框显示“很遗憾！！留言信息添加失败！”
            }

        }
           
    }

    protected void linBtnSee_Click(object sender, EventArgs e)
    {
        Response.Redirect("Liuyan_search.aspx");//跳转到留言查看界面
    }
}
