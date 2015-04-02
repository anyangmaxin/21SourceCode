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
using OnLineExam.BusinessClass;
using System.Data.SqlClient;

public partial class Web_DepartmentManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            GridViewBind();
        } 
    }
    private void GridViewBind()
    {
        Departmentmr department = new Departmentmr();//创建Usersmr类对象user
        DataSet ds = department.QueryDepartment();//使用Usersmr类QueryUsers方法查询所有用户信息
        GridView1.DataSource = ds;//为GridView控件设置数据源
        GridView1.DataBind();//GridView控件绑定数据
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridViewBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }
    //GridView控件RowDeleting事件
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string departmentid = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //取出要删除记录的主键值
        Departmentmr department = new Departmentmr();//创建Departmentmr类对象department
        if (department.DeleteByStr(departmentid))//根据主键使用DeleteByProc方法删除用户
        {
            Response.Write("<script language=javascript>alert('删除成功!')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('删除失败!')</script>");
        }
        GridView1.EditIndex = -1;
        GridViewBind();//重新绑定数据

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  //GridView编辑项索引等于单击行的索引
        GridViewBind();
    }
    //GridView控件RowUpdating事件
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string departmentid = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //取出记录的主键值
        Departmentmr department = new Departmentmr();
        department.DepartmentName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDepartmentName")).Text;
        if (department.UpdateByStr(departmentid))//使用Usersmr类UpdateByProc方法修改用户信息
        {
            GridViewBind();
            Response.Write("<script language=javascript>alert('修改成功!')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('修改成功!')</script>");
        }
        GridView1.EditIndex = -1;
        GridViewBind();
    }
      protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
      {
        int i;
        //执行循环，保证每条数据都可以更新
        for (i = 0; i < GridView1.Rows.Count; i++)
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
      protected void btnAddDepartment_Click(object sender, EventArgs e)
      {
          Response.Redirect("DepartmentAdd.aspx");
      }
}

