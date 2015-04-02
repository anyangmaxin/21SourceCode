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
public partial class AdminNew_Update : System.Web.UI.Page
{
    EP ep = new EP();//引入命名空间
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
                    this.Txtid.Text = rv["id"].ToString();
                    this.TextBox2.Text = rv["title"].ToString();
                    this.TxtContent.Text = rv["content"].ToString();
                    this.TxtTime.Text = Convert.ToDateTime(rv["PublishTime"].ToString()).ToShortDateString();
                    this.TxtPerson.Text = rv["PublishPerson"].ToString();
                    this.TxtComeFrom.Text = rv["ComeFrom"].ToString();
                }
            }
        }
    }
    protected void linBtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminNew.aspx");//跳转到“AdminNew.aspx”页面中
    }
    protected void BtnCheck_Click(object sender, EventArgs e)
    {
        if (this.Txtid.Text == "")
        {
            Response.Write("<script lanuage='javaScript'>alert('新闻编号不能为空！');location='AdminNew_Add.aspx'</script>");
        }
        else
        {
            string SqlStr = "select count(*) from tb_New where id='" + this.Txtid.Text + "'";
            int a = ep.EXECuteScalar(SqlStr);
            if (a >= 1)
            {
                //弹出对话框显示“新闻编号已存在，请在添加一个！”
                Response.Write("<script lanuage='javaScript'>alert('新闻编号已存在，请在添加一个！');location='AdminNew_Add.aspx'</script>");
            }
            else
            {
                //弹出对话框显示“新闻编号不存在，你可以继续添加其他信息！”
                Response.Write("<script lanuage='javaScript'>alert('新闻编号不存在，你可以继续添加其他信息！');location='AdminNew_Add.aspx'</script>");
            }
        }
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            String SqlUpdate = "Update tb_New set title='" + this.TextBox2.Text + "',content='" + this.TxtContent.Text + "',PublishTime='" + this.TxtTime.Text + "',PublishPerson='" + this.TxtPerson.Text + "',ComeFrom='" + this.TxtComeFrom.Text + "' where id='" + this.Txtid.Text + "'";
            EP.EXECCommand(SqlUpdate);
            Response.Write("<script lanuage='javaScript'>alert('恭喜您！！新闻信息修改成功！');location='AdminNew.aspx'</script>");//弹出对话框显示“恭喜您！！新闻信息修改成功！”

        }
        catch
        {
            Response.Write("<script lanuage='javaScript'>alert('很遗憾！！新闻信息修改失败！');location='AdminNew.aspx'</script>");//弹出对话框显示“很遗憾！！新闻信息修改失败！”
        }
    }
}
