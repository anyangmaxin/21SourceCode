using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;


public partial class BlogIndex : System.Web.UI.Page
{

    protected System.Web.UI.HtmlControls.HtmlForm Form1;
    public string ST_bgcolor;
    protected System.Web.UI.WebControls.Calendar Calendar1;
    public string ST_tcolor;
    public string loopId;
    public string str;
    SqlData myobj = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
			string ST_cmd_sql = "select top 10 * from ST_news where ST_n_iscmd=1 order by ST_n_date desc";
            string ST_top_sql = "select top 10 * from ST_news order by ST_n_hit desc";
            string personindex = "select top 10* from ST_news order by ST_n_id desc";
            string TitleClass = "select ST_c_id, ST_c_name from ST_class order by ST_date desc";
            DataSet ST_classds = myobj.GetDataSet(TitleClass,"ST_class");
            DataSet ST_cmdds = myobj.GetDataSet(ST_cmd_sql, "ST_news");
            DataSet ST_topds = myobj.GetDataSet(ST_top_sql, "ST_news");
            DataSet mypersonds = myobj.GetDataSet(personindex, "ST_class");
            //绑定博客文章类型列表
			ClassList.DataSource = new DataView(ST_classds.Tables[0]);
			ClassList.DataBind();
            
            //绑定推荐文章列表
			CmdList.DataSource = new DataView(ST_cmdds.Tables[0]);
			CmdList.DataBind();

            //绑定热点文章列表
            TopList.DataSource = new DataView(ST_topds.Tables[0]);
            TopList.DataBind();
            
            
            //绑定最新个人最新发表的博客文章
            ClassList0.DataSource = new DataView(mypersonds.Tables[0]);
            ClassList0.DataBind();
            if (Request.QueryString["c_id"] == null)
            {
                person_BindData();
            }
            else
            {
                NewsBlogList_Bind();
            }
            

			if (Request.Cookies["colors"]!=null)
			{
				string ST_test = Request.Cookies["colors"].Value;
				String[] ST_colorList = ST_test.Split(new char[] { ',' });
				ST_bgcolor = ST_colorList[0];
				ST_tcolor = ST_colorList[1];
			}
			else
			{
				ST_bgcolor = "#FFFFFF";
				ST_tcolor = "#cccccc";
			}
			Page.DataBind();
            string rd = DateTime.Now.Ticks.ToString();
            str = "imgFile/1.jpg?rd=" + rd + "|imgFile/2.jpg?rd=" + rd + "|imgFile/3.jpg?rd=" + rd + "|imgFile/4.jpg?rd=" + rd + "";
            string path = Server.MapPath("./") + "imgFile/LoopId.txt";
            loopId = File.ReadAllText(path);
            loopId = loopId.Replace(',', '|');
		}
		public void ST_get_Replay()
		{
			Response.Write ("<table width=100% border=0 cellspacing=0 cellpadding=0>");
            string ST_dns = ConfigurationSettings.AppSettings["conStr"];
            SqlConnection ST_myConn = new SqlConnection(ST_dns);
            SqlCommand ST_myCmd = new SqlCommand("select top 6 * from ST_replay order by ST_r_date desc", ST_myConn);
            ST_myConn.Open();
            SqlDataReader ST_read = ST_myCmd.ExecuteReader();
			while (ST_read.Read())
			{
				Response.Write ("<tr ><td height=25 bgColor=#f8f8f8><div align=center><font style='FONT-SIZE: 12px' color=red><a href="+ ST_read[5].ToString() +".aspx title="+ ST_read[3].ToString() +">"+ ST_read[2].ToString() +"</a></font></div></td></tr><tr><td><div align=right><em><font style='FONT-SIZE: 12px'>"+ ST_read[1].ToString() +"评论于"+ ST_read[4].ToString() +"</font></em></div></td></tr>");

			}
			Response.Write ("</table>");
			ST_myConn.Close();
		}

		public void get_Link()
		{
			Response.Write ("<table width=100% border=0 cellspacing=0 cellpadding=0>");
            string ST_dns = ConfigurationSettings.AppSettings["conStr"];
            SqlConnection ST_myConn = new SqlConnection(ST_dns);
            SqlCommand ST_myCmd = new SqlCommand("select  * from ST_link", ST_myConn);
            ST_myConn.Open();
            SqlDataReader ST_read = ST_myCmd.ExecuteReader();
			while (ST_read.Read())
			{
				Response.Write ("<tr><td height=20><div align=center><font size=-1 color=red><a href="+ ST_read[2].ToString() +" target=_blank>"+ ST_read[1].ToString() +"</a></font></div></td></tr>");

			}
			Response.Write ("</table>");
			ST_myConn.Close();

		}
    public void NewsBlogList_Bind()
    {
        
        string ST_sql;
        if (Request.QueryString["c_id"] == null)
        {
            ST_sql = "select  * from ST_news order by ST_n_date desc";
            Session["class_id"] = Request.QueryString["c_id"];
        }
        else
        {
            if (IsSafe(Request.QueryString["c_id"], 2) == true)
            {
                ST_sql = "select  * from ST_news where ST_c_id=" + Request.QueryString["c_id"] + " order by ST_n_date desc";
            }
            else
            {
                ST_sql = "";
                Response.Write("非法参数");
                Response.End();
            }
        }
        string ST_dns = ConfigurationSettings.AppSettings["conStr"];
        SqlConnection ST_myConn = new SqlConnection(ST_dns);
        SqlDataAdapter ST_myCmd = new SqlDataAdapter(ST_sql, ST_myConn);
        DataSet ST_ds = new DataSet();
        ST_myCmd.Fill(ST_ds, "ST_news");
        NewsList.DataSource = new DataView(ST_ds.Tables[0]);
        NewsList.DataBind();
    }
    public void person_BindData()
    {
        string personindex;
        if (Request.QueryString["name"] == null)
        {
            personindex = "select * from ST_news";
        }
        else
        {
            if (Request.QueryString["name"] != null)
            {
                personindex = "select * from ST_news where ST_n_author= '" + Request.QueryString["name"] + "'";
            }
            else
            {
                personindex = "";
                Response.Write("<div align=center><li>该用户暂时还没有文章！</li><li><a href=javascript:history.back()>点此返回</a>");
                Response.End();
            }
        }
        DataSet personds = myobj.GetDataSet(personindex, "ST_news");
        NewsList.DataSource = new DataView(personds.Tables[0]);
        NewsList.DataBind();
    }
		public bool IsSafe (string str, int prama)
		{
			if (prama==1)
			{
				if (Regex.IsMatch(str,"[0-9]"))
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				if (str.IndexOf("and")>0 || str.IndexOf("or")>0 || str.IndexOf("'")>0)
				{
					return false;
				}
				else
				{
					return true;
				}
			}
		}
    protected void NewsList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        NewsList.PageIndex = e.NewPageIndex;
        NewsBlogList_Bind();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Module/Blog/picture.aspx");
    }
    protected void vvbvv(object sender, EventArgs e)
    {

    }
}


