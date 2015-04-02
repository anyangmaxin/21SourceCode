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
using System.Text.RegularExpressions;

namespace ST_GROUP.Blog
{
	/// <summary>
	/// ST_save 的摘要说明。
	/// </summary>
	public partial class ST_save : System.Web.UI.Page
	{
		SqlConnection ST_myConn;
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			string ST_dns = ConfigurationSettings.AppSettings["conStr"];
			ST_myConn = new SqlConnection(ST_dns);

			ST_Save_Add();
		}

		public void ST_Save_Add()
		{
			string ST_n_title = HtmlEncode(Request.Form["n_title"]);
			string ST_n_author = HtmlEncode(Request.Form["n_author"]);
			string ST_n_key = HtmlEncode(Request.Form["n_key"]);
			string ST_n_content = Request.Form["n_content"].Replace("'","''");
			int ST_cmd;
			if (Request.Form["n_iscmd"]!=null)
			{
				ST_cmd=1;

			}
			else
			{
				ST_cmd=0;
			}
			//string[] n_type = new String[2];
			//n_type = Request.Form["listype"].ToCharArray;
			//string c_name = Request.Form["listype"]); 
			//string c_name = n_type[1];
			/*
			string n_iscmd = Request.Form["n_iscmd"];
			if (n_iscmd != "1")
			{
				n_iscmd = "0";
			}
			*/
			string ST_sql = "insert into ST_news (ST_n_author,ST_n_title,ST_n_key,ST_n_content,ST_c_id,ST_n_iscmd) values ('"+ ST_n_author +"','"+ ST_n_title +"','"+ ST_n_key +"','"+ ST_n_content +"',"+Request.Form["listtype"]+","+ ST_cmd +")";
			SqlCommand ST_myCmd = new SqlCommand(ST_sql,ST_myConn);
			ST_myConn.Open();
			ST_myCmd.ExecuteNonQuery();
			ST_myConn.Close();
			Response.Redirect("ST_main.aspx");
		}

		
		private string HtmlEncode(string str)
		{
			str = str.Replace(">","&gt;");
			str = str.Replace("<","&lt;");
			char ch;
			ch = (char)32;
			str = str.Replace(ch.ToString(),"&nbsp;");
			ch = (char)34;
			str = str.Replace(ch.ToString(),"&quot;");
			ch = (char)39;
			str = str.Replace(ch.ToString(),"&#39;");
			ch = (char)13;
			str = str.Replace(ch.ToString()," ");
		    ch = (char)10;
			str = str.Replace(ch.ToString(),"<br>");
			return str;
		}
		
		/*
		 * 安全检测字符。bool值
		 * str :被检测字符 参数prama =1 代表str为数字 
		 */
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

	}
}
