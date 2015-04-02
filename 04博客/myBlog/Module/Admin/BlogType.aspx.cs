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

public partial class Module_Admin_BlogType : System.Web.UI.Page
{
    SqlData My_sqldata = new SqlData();
    SqlConnection ST_myConn;
    protected void Page_Load(object sender, EventArgs e)
    {
        //建立数据库连接
        string ST_dns = ConfigurationSettings.AppSettings["conStr"];
        ST_myConn = new SqlConnection(ST_dns);
        if (!IsPostBack)
        {
          //调用自定义方法ST_Type_List_Bind()进行数据绑定
          ST_Type_List_Bind();
          /*判断是否登录*/
          ST_check_Login();
        }
    }
    public void ST_check_Login()
    {

        if ((Session["UserName"] == null))
        {
            Response.Write("<script>alert('对不起！您还不是会员，请先注册再登录！');location='../../BlogIndex.aspx'</script>");
            Response.End();
        }
    }
    //加载文章类型的信息
    public void ST_Type_List_Bind()
    {
        string sqlstr = "select * from ST_class order by ST_date desc ";
        //调用公共类中的ExceDS()方法，用来返回一个DataSet类型
        My_sqldata.ExceDS(sqlstr);
        //获取数据表中的主键字段
        ClassList.DataKeyNames = new string[] { "ST_c_id" };
        ClassList.DataSource = My_sqldata.ExceDS(sqlstr);
        ClassList.DataBind();
    }
   
    protected void btmAdd_Click(object sender, EventArgs e)
    {
        ST_myConn.Open();
        if (this.typename.Text != "")
        {
            string sqlstr1 = "select count(*) from ST_class where ST_c_name='" + typename.Text.ToString() + "'";
            SqlCommand mycom = new SqlCommand(sqlstr1, ST_myConn);
            int intcount = Convert.ToInt32(mycom.ExecuteScalar());
            if (intcount > 0)
            {
                Response.Write("<script>alert('对不起！不允许添加相同记录！');location='BlogType.aspx'</script>");
            }
            else
            {
                string ST_sql = "insert into ST_class (ST_c_name,ST_date) values ('" + typename.Text.ToString() + "','" + DateTime.Now.ToString() + "')";
                My_sqldata.ExceSQL(ST_sql);
                Response.Write("<script>alert('添加成功!');location='BlogType.aspx'</script>");
            }
        }
    }
    protected void ClassList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sqlstr = "delete from ST_class where ST_c_id='" + ClassList.DataKeys[e.RowIndex].Value.ToString() + "'";
        //调用公共类中的ExceSQL方法执行SQL语句
        My_sqldata.ExceSQL(sqlstr);
        ST_Type_List_Bind();
    }
    protected void ClassList_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ClassList.EditIndex = e.NewEditIndex;
        ST_Type_List_Bind();
    }
    protected void ClassList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string sqlstr0 = "update ST_class set ST_c_name='" + ((TextBox)(ClassList.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim() + "'where ST_c_id='" + ClassList.DataKeys[e.RowIndex].Value.ToString() + "'";
        //调用公共类中的ExceSQL方法执行SQL语句
        My_sqldata.ExceSQL(sqlstr0);
        ClassList.EditIndex = -1;
        
        ST_Type_List_Bind();
    }

    protected void ClassList_RowCancetingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ClassList.EditIndex = -1;
        ST_Type_List_Bind();

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlData da = new SqlData();
        string search = this.ddlSelect.SelectedValue;
        switch (search)
        {
            case "类型编号":
                da.BindData(this.ClassList, "Select * From ST_class Where ST_c_id  Like  '%" + this.txtKey.Text + "%'");
                break;
            case "文章类型":
                da.BindData(this.ClassList, "Select * From ST_class Where ST_c_name  Like  '%" + this.txtKey.Text + "%'");
                break;
            default:
                Response.Write("<script lanuage=javascript>alert('出错啦！');location='javascript:history.go(-1)'</script>");
                break;
        }
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= ClassList.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)ClassList.Rows[i].FindControl("CheckBox1");
            if (CheckBox2.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
         CheckBox2.Checked = false;
         for (int i = 0; i <= ClassList.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)ClassList.Rows[i].FindControl("CheckBox1");
            cbox.Checked = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //ST_myConn.Open();
        for (int i = 0; i <= ClassList.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)ClassList.Rows[i].FindControl("CheckBox1");
            if (cbox.Checked == true)
            {
                string sqlstr = "delete from ST_class where ST_c_id='" + ClassList.DataKeys[i].Value + "'";
                My_sqldata.ExceSQL(sqlstr);
                Response.Write("<script language=javascript>alert('批量删除成功！');location='BlogType.aspx'</script>");
            }
        } 
    }
    protected void ClassList_PageIndexChangging(object sender, GridViewPageEventArgs e)
    {
        ClassList.PageIndex = e.NewPageIndex;
        ST_Type_List_Bind();

    }

    protected void ClassList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int i;
        //执行循环，保证每条数据都可以更新
        for (i = 0; i < ClassList.Rows.Count; i++)
        {
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            }
        }
    }
}

