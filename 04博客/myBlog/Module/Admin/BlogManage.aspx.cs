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
using System.Data.SqlClient;

public partial class Module_Admin_AdminMagage : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
			SqlData da = new SqlData();
			this.gvBlog.DataSource = da.ExceDS("select * from tb_Blog");
			gvBlog.DataKeyNames = new string[] { "BlogID" };
			gvBlog.DataBind();
	}
    
	protected void btnSearch_Click(object sender, EventArgs e)
	{
		SqlData da = new SqlData();
		string search = this.ddlSearch.SelectedValue;
		switch (search)
		{
			case "博客ID":
				da.BindData(this.gvBlog, "Select * From tb_Blog Where BlogID  Like  '%" + this.txtKey.Text + "%'");
				break;
			case "博客姓名":
				da.BindData(this.gvBlog, "Select * From tb_Blog Where UserName  Like  '%" + this.txtKey.Text + "%'");
				break;
			case "QQ":
				da.BindData(this.gvBlog, "Select * From tb_Blog Where QQ  Like  '%" + this.txtKey.Text + "%'");
				break;
			default:
				Response.Write("<script lanuage=javascript>alert('出错拉！');location='javascript:history.go(-1)'</script>");
				break;
		}
	}
	protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		SqlData da = new SqlData();
		da.ExceSQL("delete from tb_Blog where BlogID='" + gvBlog.DataKeys[e.RowIndex].Value + "'");
		Response.Redirect("BlogManage.aspx");
	}
	protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvBlog.PageIndex = e.NewPageIndex;
		gvBlog.DataBind();
	}

	protected void gvBlog_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			((LinkButton)(e.Row.Cells[6].Controls[0])).Attributes.Add("onclick", "return confirm('确定删除吗？')");
		}
	}
}
