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
public partial class AdminTools : System.Web.UI.Page
{
    EP ep = new EP();
    protected void Page_Load(object sender, EventArgs e)
    {
        //使用Session判断管理员是否已成功登录
        if (Session["AdminUserName"] == null && Session["AdminPassWord"] == null)
        {
            Response.Redirect("~/AdminLogin.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                string SqlStr = "select * from tb_uptools";//查询下载工具
                ep.EXECDropDownList(DDLTools, SqlStr, "tools");
                string Sql = "select * from tb_toolsimage";//查询头像信息表
                ep.EXECDropDownList(DDlToolsImage, Sql, "image");
                this.ImgSoft.ImageUrl = DDlToolsImage.SelectedValue;
                if (Request["id"] != null)
                {
                    DataSet ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["id"] + "'", "tb_tools");
                    DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
                    this.TxtName.Text = rv["Name"].ToString();
                    this.TxtEdition.Text = rv["Edition"].ToString();
                    this.TxtCondition.Text = rv["Condition"].ToString();
                    this.TxtPrice.Text = rv["Price"].ToString();
                    this.TxtIntroEdition.Text = rv["EditionIntro"].ToString();
                    this.Txtleibie.Text = rv["LeiBie"].ToString();
                    this.ddlType.SelectedItem.Text = rv["Type"].ToString();
                    this.TxtSize.Text = rv["ToolSize"].ToString();
                    this.TxtPoint.Text = rv["point"].ToString();
                    this.TxtTime.Text = Convert.ToDateTime(rv["UpTime"].ToString()).ToShortDateString();
                    this.TxtIntro.Text = rv["Intro"].ToString();
                    this.DDLTools.SelectedItem.Text = rv["download"].ToString();
                    this.ImgSoft.ImageUrl = rv["Image"].ToString();
                }
            }
        }
    }
    protected void DDLTools_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ImgSoft.ImageUrl = DDlToolsImage.SelectedValue;
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            String SqlUpdate = "Update tb_tools set Name='" + this.TxtName.Text + "',Edition='" + this.TxtEdition.Text + "',Condition='" + this.TxtCondition.Text + "',Price='" + this.TxtPrice.Text + "',EditionIntro='" + this.TxtIntroEdition.Text + "',LeiBie='" + this.Txtleibie.Text + "' ,type='" + this.ddlType.SelectedItem.Text + "',Point='" + this.TxtPoint.Text + "',ToolSize='" + this.TxtSize.Text + "',UpTime='" + this.TxtTime.Text + "', Intro='" + this.TxtIntro.Text + "' ,Image='" + this.DDlToolsImage.SelectedItem.Text + "',download='" + this.DDLTools.SelectedItem.Text + "' where id='" + Request["id"] + "'";
            EP.EXECCommand(SqlUpdate);
            Response.Write("<script lanuage='javaScript'>alert('恭喜您！！工具软件修改成功！');location='AdminTools.aspx'</script>");//弹出对话框显示“恭喜您！！工具软件修改成功！”
        }
        catch
        {
            Response.Write("<script lanuage='javaScript'>alert('很遗憾！！工具软件修改失败！');location='AdminTools.aspx'</script>");//弹出对话框显示“很遗憾！！工具软件修改失败！”
        }
    }

}
