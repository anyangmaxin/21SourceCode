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

public partial class Module_Admin_Append : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
            //if (Session["UserName"] == null)
            //{
            //    Response.Redirect("../../Index.aspx");
            //}
			SqlData da = new SqlData();
			this.gvAdmin.DataSource = da.ExceDS("select * from tb_Admin");
			gvAdmin.DataKeyNames = new string[] { "id" };
			gvAdmin.DataBind();
		}
	}

	protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
        //if ("是" == Session["SuperAdmin"].ToString())
        //{
			SqlData da = new SqlData();
			da.ExceSQL("delete from tb_Admin where ID='" + gvAdmin.DataKeys[e.RowIndex].Value + "'");
			Page.Response.Redirect("AdminManage.aspx");
        //}
        //else
        //{
        //    Response.Write("<script language=javascript>alert('非超级管理员不能进行删除操作！')</script>");
        //}
	}
	protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvAdmin.PageIndex = e.NewPageIndex;
		gvAdmin.DataBind();
	}

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		SqlData da = new SqlData();
		string search=this.ddlSearch.SelectedValue;
		switch (search)
		{
			case "管理员ID":
				da.BindData(this.gvAdmin, "Select * From tb_Admin Where ID  Like  '%" + this.txtKey.Text + "%'");
				break;
			case "用户名":
				da.BindData(this.gvAdmin, "Select * From tb_Admin Where UserName  Like  '%" + this.txtKey.Text + "%'");
				break;
			case "QQ":
				da.BindData(this.gvAdmin, "Select * From tb_Admin Where QQ  Like  '%" + this.txtKey.Text + "%'");
				break;
			default:
				Response.Write("<script lanuage=javascript>alert('出错拉！');location='javascript:history.go(-1)'</script>");
				break;
     	}
	}
	protected void gvAdmin_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			((LinkButton)(e.Row.Cells[6].Controls[0])).Attributes.Add("onclick", "return confirm('确定删除吗？')");
		}
	}
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("../../Images/Pictures/Dialog.aspx?rif=Images/Pictures&cif=Images/Pictures\\"), true);
    }
}
