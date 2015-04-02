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

public partial class videoTaxis : System.Web.UI.Page
{
    string upMonth = DateTime.Now.AddMonths(-1).Month.ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        bindHumour();
        bindFilm();
        bindSport();
        bindCartoon();
    }

    protected void bindHumour()
    {
        string sqlSel = "select top 10 b.videoId, a.userName,a.videoDate,b.videoTitle,b.playSum from videoInfo as a join videotaxis as b on a.id=b.videoId where b.taxisMonth='"+upMonth+"' and b.videoType='搞笑' order by b.playSum desc";
        gvHumourTaxis.DataSource = operateData.getRows(sqlSel);    
        gvHumourTaxis.DataBind();
    }
    protected void bindFilm()
    {
        string sqlSel = "select top 10 b.videoId, a.userName,a.videoDate,b.videoTitle,b.playSum from videoInfo as a join videotaxis as b on a.id=b.videoId where b.taxisMonth='" + upMonth + "' and b.videoType='电影' order by b.playSum desc";
        gvFilmTaxis.DataSource = operateData.getRows(sqlSel);
        gvFilmTaxis.DataBind();
    }
    protected void bindSport()
    {
        string sqlSel = "select top 10 b.videoId, a.userName,a.videoDate,b.videoTitle,b.playSum from videoInfo as a join videotaxis as b on a.id=b.videoId where b.taxisMonth='" + upMonth + "' and b.videoType='体育' order by b.playSum desc";
        gvSportTaxis.DataSource = operateData.getRows(sqlSel);
        gvSportTaxis.DataBind();

    }
    protected void bindCartoon()
    {
        string sqlSel = "select top 10 b.videoId, a.userName,a.videoDate,b.videoTitle,b.playSum from videoInfo as a join videotaxis as b on a.id=b.videoId where b.taxisMonth='" + upMonth + "' and b.videoType='动漫' order by b.playSum desc";
        gvCartoonTaxis.DataSource = operateData.getRows(sqlSel);
        gvCartoonTaxis.DataBind();

    }
}
  
