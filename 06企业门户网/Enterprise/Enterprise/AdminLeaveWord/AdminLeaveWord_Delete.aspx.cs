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
public partial class AdminLeaveWord_Delete : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        //使用Session判断管理员是否已成功登录
        if (Session["AdminUserName"] == null && Session["AdminPassWord"] == null)
        {
            Response.Redirect("~/AdminLogin.aspx");
        }
        else
        { 
                if (!this.IsPostBack)
               {
                 if (Request["id"] != null)
                {
                   DataSet ds = ep.ReturnDataSet("select * from tb_LeaveWord where id='" + Request["id"] + "'", "tb_LeaveWord");
                   DataRowView rv = ds.Tables["tb_LeaveWord"].DefaultView[0];
                   this.LblTitle.Text = rv["Title"].ToString();
                   this.LblTime.Text = Convert.ToDateTime(rv["lTime"].ToString()).ToShortDateString();
                   this.LblPerson.Text = rv["person"].ToString();
                   this.LblContent.Text = rv["Content"].ToString();
                   this.TxtReply.Text = rv["RevertContent"].ToString();
                }
             }
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            String SqlDelete = "Delete tb_LeaveWord where id='" + Request["id"] + "'";
            EP.EXECCommand(SqlDelete);
            Response.Write("<script lanuage='javaScript'>alert('恭喜您！！留言信息删除成功！');location='AdminLeaveWord.aspx'</script>");//弹出对话框显示“恭喜您！！留言信息删除成功！”

        }
        catch 
        {
            Response.Write("<script lanuage='javaScript'>alert('很遗憾！！留言信息删除失败！');location='AdminLeaveWord.aspx'</script>");//弹出对话框显示“很遗憾！！留言信息删除失败！”
        }
    }
    protected void LinBtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminLeaveWord.aspx");
    }
}
