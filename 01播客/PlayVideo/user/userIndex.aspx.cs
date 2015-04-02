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
using System.IO;

public partial class user_userIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userName"] == null)
        {
            Response.Write("<script>alert('请您先登录！');location='../index.aspx'</script>");
        }
        else {
         
            bindGV();
        }        
        
        
    }

    protected void bindGV()
    {
        string userName = Session["userName"].ToString();
        string sqlSel = "select * from videoInfo where userName='" + userName + "'";
        gvVideo.DataSource = operateData.getRows(sqlSel);
        gvVideo.DataKeyNames=new string[] {"id"};
        gvVideo.DataBind();

    }


    protected void gvVideo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Session["videoId"] = gvVideo.DataKeys[e.NewSelectedIndex].Value.ToString();


        RegisterStartupScript("true", "<script > showModalDialog('ideaFrame.aspx?type=video',window,'dialogHeight:330px; dialogWidth: 500px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No','alwaysRaised= yes');</script>");
   
    }
    protected void gvVideo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //编写SQL语句查询视频路径
        string sqlVideoPath = "select videoPath from videoInfo where id=" + gvVideo.DataKeys[e.RowIndex].Value.ToString();
        //删除指定路径下的视频
        File.Delete(Server.MapPath("../") + operateData.getTier(sqlVideoPath));
        //编写SQL语句查询视频截图路径
        string sqlVideoPicture = "select videoPicture from videoInfo where id=" + gvVideo.DataKeys[e.RowIndex].Value.ToString(); 
        //删除指定路径下的视频截图
        File.Delete(Server.MapPath("../") + operateData.getTier(sqlVideoPicture));
        string id = gvVideo.DataKeys[e.RowIndex].Value.ToString();
        string sqlDel = "delete videoInfo where id=" + id;
        if (operateData.execSql(sqlDel))
        {

            RegisterStartupScript("true", "<script>alert('成功！')</script>");
            bindGV();
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('失败！')</script>");
        };
    }
    protected void gvVideo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVideo.PageIndex = e.NewPageIndex;
        gvVideo.DataBind();
    }
}
