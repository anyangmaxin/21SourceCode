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
	/// ST_edit 的摘要说明。
	/// </summary>
	public partial class ST_edit : System.Web.UI.Page
	{
		SqlConnection ST_myConn;
		public string ST_n_content;
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
            string ST_dns = ConfigurationSettings.AppSettings["conStr"];
			ST_myConn = new SqlConnection(ST_dns);
			if (Request.QueryString["id"]==null || Request.QueryString["id"]=="")
			{
				Response.Write("<script>alert('参数不能为空');</script>");
				Response.End();
			}

			string ST_action;
			if (Request.QueryString["action"]!=null)
			{
				ST_action = Request.QueryString["action"].ToString();
			}
			else
			{
				ST_action="edit";
			}

			switch (ST_action)
			{	
				case "delmsg":
					this.ST_Del_Msg();
					break;
				case "hfmsg":
					this.ST_Hf_Msg();
					break;
				case "shfmsg":
					this.ST_Shf_Msg();
					break;
			}
			Page.DataBind();
		}
		public void ST_Del_Msg()
		{
			string ST_sql = "delete from ST_message where ST_id in ("+ Request.QueryString["id"] +")";
            SqlData da = new SqlData();
            da.ExceSQL(ST_sql);
			Response.Redirect("ST_admin_message.aspx");
		}
		public void ST_Hf_Msg()
		{
			Response.Write("<form method=post action='ST_edit.aspx?action=shfmsg&id="+Request.QueryString["id"]+"'>");
			Response.Write("<TEXTAREA id=content name=content rows=6 cols=40></TEXTAREA>");
			Response.Write("<input type=submit name=Button1 value=回复 id=Button1 />");
			Response.Write("</form>");
			Response.End();
		}
		public void ST_Shf_Msg()
		{
            string substr = "";
            string ST_sql = "update ST_message set ST_hf='"+Request.Form["content"]+"' where ST_id = "+ Request.QueryString["id"] +"";
            SqlData da = new SqlData();
            da.ExceSQL(ST_sql);
			Response.Redirect("ST_admin_message.aspx");
		}
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN：该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion
	}
}
