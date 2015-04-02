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
public partial class liuyan_delete : System.Web.UI.Page
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
            if (!this.IsPostBack)
            {
                if (Request["id"] != null)
                {
                    DataSet ds = ep.ReturnDataSet("select * from tb_LeaveWord where id='" + Request["id"] + "'", "tb_LeaveWord");
                    DataRowView rv = ds.Tables["tb_LeaveWord"].DefaultView[0];
                    this.LblTitle.Text = rv["title"].ToString();
                    this.LblTime.Text = rv["lTime"].ToString();
                    this.LblPerson.Text = rv["person"].ToString();
                    this.TxtContent.Text = rv["Content"].ToString();
                    this.TxtReply.Text = rv["RevertContent"].ToString();
                }
            }
        }
    }
    protected void LinBtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("liuyan_search.aspx");//跳转到liuyan_search.aspx页面中
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            String SqlDelete = "Delete tb_LeaveWord where id='" + Request["id"] + "'";
            EP.EXECCommand(SqlDelete);
            Response.Write("<script lanuage='javaScript'>alert('恭喜您！！留言信息删除成功！');location='javascript:history.go(-1)'</script>");//弹出对话框显示“恭喜您！！留言信息删除成功！”

        }
        catch
        {
            Response.Write("<script lanuage='javaScript'>alert('很遗憾！！留言信息删除失败！');location='javascript:history.go(-1)'</script>");//弹出对话框显示“很遗憾！！留言信息删除失败！”
        }
    }
}
