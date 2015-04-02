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

public partial class Module_Blog_MessageList : System.Web.UI.Page
{
    string ID;
	protected void Page_Load(object sender, EventArgs e)
	{
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/BlogIndex.aspx");
        }
        SqlConnection mycon = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        mycon.Open();
        DataSet mydataset = new DataSet();
        SqlDataAdapter mydataadapter = new SqlDataAdapter("select * from tb_Blog where UserName='" + Session["UserName"] + "'", mycon);
        //SqlDataAdapter mydataadapter = new SqlDataAdapter("select * from tb_Blog", mycon);
        mydataadapter.Fill(mydataset, "tb_Blog");
        DataRowView rowview = mydataset.Tables["tb_Blog"].DefaultView[0];
        ID = rowview["BlogID"].ToString();
		SqlData da = new SqlData();
        this.GridView1.DataSource = da.ExceDS("select * from tb_Message where BlogID='" + ID + "'");
        //this.GridView1.DataSource = da.ExceDS("select * from tb_Message where BlogID='"+ID+"'");
		GridView1.DataKeyNames = new string[] { "MessageID" };
		GridView1.DataBind();
	}

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		SqlData da = new SqlData();
		string search=this.ddlSearch.SelectedValue;
		switch (search)
		{
			case "联系人ID":
                
                da.BindData(this.GridView1, "Select * From tb_Message Where MessageID  Like  '%" + this.txtKey.Text + "%' and BlogID='"+ID+"'");
				break;
			case "姓名":
                
                da.BindData(this.GridView1, "Select * From tb_Message Where FriendName  Like  '%" + this.txtKey.Text + "%' and BlogID='" + ID + "'");
				break;
			case "QQ":
                
                da.BindData(this.GridView1, "Select * From tb_Message Where QQ  Like  '%" + this.txtKey.Text + "%'  and BlogID='" + ID + "'");
				break;
			default:
				Response.Write("<script lanuage=javascript>alert('出错拉！');location='javascript:history.go(-1)'</script>");
				break;
		}
	}
	protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		SqlData da = new SqlData();
		da.ExceSQL("delete from tb_Message where MessageID='" + GridView1.DataKeys[e.RowIndex].Value + "'");
		Page.Response.Redirect("LinkManManage.aspx"); 
	}
	protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		GridView1.PageIndex = e.NewPageIndex;
		GridView1.DataBind();
	}
	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			((LinkButton)(e.Row.Cells[5].Controls[0])).Attributes.Add("onclick", "return confirm('确定删除吗？')");
		}
	}
}
