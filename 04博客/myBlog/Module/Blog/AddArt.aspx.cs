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

public partial class Module_Blog_AddArt : System.Web.UI.Page
{
    SqlData mydata = new SqlData();
    int cbox;
    string ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/BlogIndex.aspx");
        } 
        string sql = "select * from tb_Blog where UserName='" + Session["UserName"] + "'";
        DataSet mydataset = mydata.GetDataSet(sql, "tb_Blog");
        DataRowView rowview = mydataset.Tables["tb_Blog"].DefaultView[0];
        ID = rowview["BlogID"].ToString();
        this.TextBox2.Text = Session["UserName"].ToString();
        string sqlstr = "select * from ST_Class";
        SqlConnection mycon = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        SqlCommand mycom = new SqlCommand(sqlstr, mycon);
        mycon.Open();
        SqlDataReader dr = mycom.ExecuteReader();
        //判断是否有数据
        while (dr.Read())
        {
            DropDownList1.Items.Add(new ListItem(dr["ST_c_name"].ToString(),dr["ST_c_id"].ToString()));
        }
        mycon.Close();
    }
	protected void btnAdd_Click(object sender, EventArgs e)
	{

        string ID;
        string sqlstr = "select * from tb_Blog where UserName='" + Session["UserName"] + "'";
        DataSet mydataset = mydata.GetDataSet(sqlstr, "tb_Blog");
        DataRowView rowview = mydataset.Tables["tb_Blog"].DefaultView[0];
        ID = rowview["BlogID"].ToString();
        //创建插入新文章信息的Sql语句
        string com = "Insert into ST_news(ST_n_title,ST_n_author,ST_n_key,ST_n_content,ST_n_iscmd,ST_c_id,BlogID) values('" + this.txtSubject.Text + "','" + this.Session["UserName"].ToString() + "','" + this.TextBox1.Text + "','" + this.article_context.Text.ToString() + "','" + cbox + "','" + this.DropDownList1.SelectedValue + "','" + ID + "')"; 
        //调用公共类中的ExceSQL方法，返回一个布尔值
        bool add =mydata.ExceSQL(com);
		if (add)
		{
			Response.Write("<script language=javascript>alert('文章添加成功!');location='ArticleManage.aspx'</script>");
		}
		else
		{
			Response.Write("<script language=javascript>alert('文章添加失败！');location='javascript:history.go(-1)'</script>");
		}
	}
	protected void btnCancle_Click(object sender, EventArgs e)
	{
		Response.Redirect("ArticleManage.aspx");
	}

    protected void Button1_Click(object sender, EventArgs e)
    {
        this.txtSubject.Text = "";
        this.TextBox1.Text = "";
        this.article_context.Text = "";
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

        if (CheckBox1.Checked = true)
        {
            cbox = 1;
        }
        else
        {
            cbox = 0;
        }
    }
}
