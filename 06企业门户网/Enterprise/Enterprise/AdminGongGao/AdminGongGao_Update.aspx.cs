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
public partial class AdminOpration_AdminGongGao_Update : System.Web.UI.Page
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
                    DataSet ds = ep.ReturnDataSet("select * from tb_GongGao where id='" + Request["id"] + "'", "tb_gonggao");
                    DataRowView rv = ds.Tables["tb_GongGao"].DefaultView[0];
                    this.Txtid.Text = rv["id"].ToString();
                    this.TextBox1.Text = rv["title"].ToString();
                    this.TextBox2.Text = rv["content"].ToString();
                    this.TextBox3.Text = Convert.ToDateTime(rv["GTime"].ToString()).ToShortDateString();
                }
            }
        }
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
 　　　try
        {
            String SqlUpdate = "Update tb_GongGao set title='" + this.TextBox1.Text + "',content='" + this.TextBox2.Text + "'where id='" + this.Txtid.Text + "'";
            EP.EXECCommand(SqlUpdate);
            Response.Write("<script lanuage='javaScript'>alert('恭喜您！！公告信息修改成功！');location='AdminGongGao.aspx'</script>");//弹出对话框显示“恭喜您！！公告信息修改成功！”
        }
        catch
        {
            Response.Write("<script lanuage='javaScript'>alert('很遗憾！！公告信息修改失败！');location='AdminGongGao.aspx'</script>");//弹出对话框显示“很遗憾！！公告信息修改失败！”
        }
    }
    protected void BtnCheck_Click(object sender, EventArgs e)
    {
        if (this.Txtid.Text == "")
        {
            Response.Write("<script lanuage='javaScript'>alert('公告编号不能为空！');location='AdminGongGao_Add.aspx'</script>");
        }
        else
        {
            string SqlStr = "select count(*) from tb_GongGao where id='" + this.Txtid.Text + "'";
            int a = ep.EXECuteScalar(SqlStr);
            if (a >= 1)
            {
                //弹出对话框显示“公告编号已存在，请在添加一个！”
                Response.Write("<script lanuage='javaScript'>alert('公告编号已存在，请在添加一个！');location='AdminGongGao_Add.aspx'</script>");
            }
            else
            {
                //弹出对话框显示“公告编号不存在，你可以继续添加其他信息！”
                Response.Write("<script lanuage='javaScript'>alert('公告编号不存在，你可以继续添加其他信息！');location='AdminGongGao_Add.aspx'</script>");
            }
        }

    }
    protected void LinBtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminGongGao.aspx");
    }
}
