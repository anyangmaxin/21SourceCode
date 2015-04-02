using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ST_GROUP.Blog
{
	/// <summary>
	/// ST_message 的摘要说明。
	/// </summary>
	public partial class ST_message : System.Web.UI.Page
	{
		public string ST_tcolor;
		protected System.Web.UI.HtmlControls.HtmlForm show;
		public string ST_bgcolor;
		SqlConnection ST_myConn;
        SqlData dataoperate = new SqlData();
		protected void Page_Load(object sender, System.EventArgs e)
		{
            FreeTextBox1.FontFacesMenuList = dataoperate.strFont();
            // 在此处放置用户代码以初始化页面
			if (Request.Cookies["colors"]!=null)
			{
				string ST_test = Request.Cookies["colors"].Value;
				String[] ST_colorList = ST_test.Split(new char[] { ',' });
				ST_bgcolor = ST_colorList[0];
				ST_tcolor = ST_colorList[1];
			}
			else
			{
				ST_bgcolor = "#FFDE94";
				ST_tcolor = "#efe3ce";
			}

			ST_msg_Bind();
			Page.DataBind();
		}

		public void ST_msg_Bind()
		{
			string ST_dns = ConfigurationSettings.AppSettings["conStr"];
			string ST_msg_sql = "select  * from ST_message order by ST_mdate desc";

			ST_myConn = new SqlConnection(ST_dns);
			SqlDataAdapter ST_msgCmd = new SqlDataAdapter(ST_msg_sql,ST_myConn);

			DataSet ST_ds = new DataSet();
			ST_msgCmd.Fill(ST_ds,"留言列表");

			messagelist.DataSource = new DataView(ST_ds.Tables[0]);
			messagelist.DataBind();
		}     
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (nickname.Text.Trim() == "" || title.Text.ToString().Trim() == "" || FreeTextBox1.Text.Trim() == "")
                {
                    Response.Write("<div align=center><li>昵称,标题,内容不能为空!</li><li><a href=javascript:history.back()>点此返回留言</a>");
                    Response.End();
                }
                else
                {
                    string ST_sql = "insert into ST_message (ST_nickname,ST_title,ST_homepage,ST_content) values ('" + nickname.Text + "','" + title.Text + "','" + homepage.Text + "','" + FreeTextBox1.Text.ToString() + "')";
                    SqlCommand ST_myCmd = new SqlCommand(ST_sql, ST_myConn);
                    ST_myConn.Open();
                    ST_myCmd.ExecuteNonQuery();
                    ST_myConn.Close();
                    Response.Redirect("ST_message.aspx");
                }
            }
        }
}
}
