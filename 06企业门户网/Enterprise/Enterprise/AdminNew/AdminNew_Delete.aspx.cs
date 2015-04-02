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
public partial class AdminNew_Delete : System.Web.UI.Page
{
    EP ep = new EP();//实例化对象
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
                    DataSet ds = ep.ReturnDataSet("select * from tb_New where id='" + Request["id"] + "'", "tb_New");
                    DataRowView rv = ds.Tables["tb_New"].DefaultView[0];
                    this.TextBox1.Text = rv["id"].ToString();
                    this.TextBox2.Text = rv["title"].ToString();
                    this.TxtContent.Text = rv["content"].ToString();
                    this.TxtTime.Text = Convert.ToDateTime(rv["PublishTime"].ToString()).ToShortDateString();
                    this.TxtPerson.Text = rv["PublishPerson"].ToString();
                    this.TxtComeFrom.Text = rv["ComeFrom"].ToString();
                }
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            String SqlDelete = "Delete from tb_New where id='" + this.TextBox1.Text + "'";
            EP.EXECCommand(SqlDelete);
            Response.Write("<script lanuage='javaScript'>alert('恭喜您！！新闻信息删除成功！');location='AdminNew.aspx'</script>");//弹出对话框显示“恭喜您！！新闻信息修改成功！”

        }
        catch
        {
            Response.Write("<script lanuage='javaScript'>alert('很遗憾！！新闻信息删除失败！');location='AdminNew.aspx'</script>");//弹出对话框显示“很遗憾！！新闻信息修改失败！”
        }
    }
    protected void LinBtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminNew.aspx");
    }
}
