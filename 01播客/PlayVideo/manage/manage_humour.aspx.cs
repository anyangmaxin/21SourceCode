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
using System.Drawing;
using System.IO;

public partial class manage_manage_humour : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //调用自定义方法显示搞笑视频信息
        bindGvVideo();
    }
    protected void bindGvVideo()
    {
        string sqlSel="";
        //判断是否选择“所有视频”
        if (RadioButtonList1.SelectedValue == "0")
        { 
            sqlSel = "select * from videoInfo where videoType='搞笑'";
        }
            //判读是否选择“未审核视频”
        else if(RadioButtonList1.SelectedValue=="1")
        {
            sqlSel = "select * from videoInfo where videoType='搞笑' and Auditing=0 ";
        }
            //判断是否选择“已审核视频”
        else if (RadioButtonList1.SelectedValue == "2")
        {
            sqlSel = "select * from videoInfo where videoType='搞笑' and Auditing=1 ";
        }
        gvVideo.DataSource = operateData.getRows(sqlSel);
        gvVideo.DataKeyNames = new string[] { "id" };
        gvVideo.DataBind();
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindGvVideo();
    }
    protected void gvVideo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[4].Text == "False")                 //判断当前信息的审核状态
            {
                e.Row.Cells[4].Text = "未审核";                 //改变文本值
                e.Row.Cells[4].ForeColor = Color.Red;            //改变显示颜色
            }
            else
            {
                e.Row.Cells[4].Text = "已审核";
                e.Row.Cells[4].ForeColor = Color.Blue;
            }
        }
    }
    //改变视频的审核状态
    protected void gvVideo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //获取视频的键值
        string id = gvVideo.DataKeys[e.NewSelectedIndex].Value.ToString();
        //编写SQL语句查询当前视频的审核砖头
        string sqlSel = "select Auditing from videoInfo where id=" + id;
        //调用公共类中的getTier方法获取视频的审核状态
        string Auditing = operateData.getTier(sqlSel);
        //判读是否未审核
        if (Auditing == "False")
        {
            //将审核状态修改为已审核
            Auditing = "1";
        }
        else {
            //将审核状态修改为未审核
            Auditing = "0";
        }
        string sqlUpd = "update videoInfo set Auditing='" + Auditing + "' where id=" + id;
        operateData.execSql(sqlUpd);
        //调用自定义方法重新显示搞笑视频信息
        bindGvVideo();

    }
    protected void gvVideo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //编写SQL语句查询视频路径
        string sqlVideoPath="select videoPath from videoInfo where id="+ gvVideo.DataKeys[e.RowIndex].Value.ToString();
        //删除指定路径下的视频
        File.Delete(Server.MapPath("../") + operateData.getTier(sqlVideoPath));
        //编写SQL语句查询视频截图路径
        string sqlVideoPicture = "select videoPicture from videoInfo where id=" + gvVideo.DataKeys[e.RowIndex].Value.ToString();
        //删除指定路径下的视频截图
        File.Delete(Server.MapPath("../") + operateData.getTier(sqlVideoPicture));
        //编写SQL语句删除视频的详细信息
        string sqlDel = "delete from videoInfo where id=" + gvVideo.DataKeys[e.RowIndex].Value.ToString();

        if (operateData.execSql(sqlDel))
        {

            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        bindGvVideo();
    }
    protected void gvVideo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVideo.PageIndex = e.NewPageIndex;
        bindGvVideo();
    }
}
