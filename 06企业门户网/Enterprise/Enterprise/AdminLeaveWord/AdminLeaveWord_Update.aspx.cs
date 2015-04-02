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
public partial class AdminLeaveWord : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request["id"] != null)
            {
                DataSet ds = ep.ReturnDataSet("select * from tb_LeaveWord where id='" + Request["id"] + "'", "tb_LeaveWord");
                DataRowView rv = ds.Tables["tb_LeaveWord"].DefaultView[0];
                this.TexTitle.Text = rv["Title"].ToString();
                this.TexTime.Text = Convert.ToDateTime(rv["lTime"].ToString()).ToShortDateString();
                this.TexPerson.Text = rv["person"].ToString();
                this.TexContent.Text = rv["Content"].ToString();
                this.TxtReply.Text = rv["RevertContent"].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            String SqlUpdate = "Update tb_LeaveWord set Title='" + this.TexTitle.Text + "',lTime='" + this.TexTime.Text + "',person='" + this.TexPerson.Text + "',Content='" + this.TexContent.Text + "',RevertContent='"+this.TxtReply.Text+"' where id='" + Request["id"] + "'";
            EP.EXECCommand(SqlUpdate);
            Response.Write("<script lanuage='javaScript'>alert('恭喜您！！留言信息修改成功！');location='AdminLeaveWord.aspx'</script>");//弹出对话框显示“恭喜您！！留言信息修改成功！”

        }
        catch 
        {
            Response.Write("<script lanuage='javaScript'>alert('很遗憾！！留言信息修改失败！');location='AdminLeaveWord.aspx'</script>");//弹出对话框显示“很遗憾！！留言信息修改失败！”
        }
    }
    protected void LinBtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminLeaveWord.aspx");
    }
}
