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
using OnLineExam.DataBaseClass;
using OnLineExam.BusinessClass;
using System.Data.SqlClient;

public partial class Web_PaperLists : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            InitData();
        }
    }
    protected void InitData()
    {
        Papermr paper = new Papermr();
        DataSet ds = paper.QueryAllPaper();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            lblMessage.Text = "没有试卷!";
        }
    }
    //GridView控件RowCanceling事件
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        InitData();
    }
    //GridView控件RowDeleting事件
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Papermr paper = new Papermr();      //创建Papermr对象
        int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
        if (paper.DeleteByStr(ID))
        {
            Response.Write("<script language=javascript>alert('成功删除该试卷！')</script>");          
        }
        else
        {
            Response.Write("<script language=javascript>alert('删除试卷失败！')</script>");
            
        }
        //InitData();
        Response.Redirect("PaperLists.aspx");
       
    }
    //GridView控件RowUpdating事件
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //取出要删除记录的主键值
        int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); 
        //创建Papermr对象
        Papermr paper = new Papermr();
        //应用FindControl查找GridView控件中的DropDownList，并将其列表中的值转换成byte类型赋予公共类Papermr中的PaperState试卷状态变量
        paper.PaperState = byte.Parse(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlPaperState")).SelectedValue);
        //使用Papermr类UpdateByProc方法修改试卷状态
        if (paper.UpdateByStr(ID))
        {
            Response.Write("<script language=javascript>alert('试卷状态修改成功!')</script>");            
        }
        else
        {
            Response.Write("<script language=javascript>alert('试卷状态修改失败!')</script>");
        }
        //取消编辑操作
        GridView1.EditIndex = -1;
        //调用自定义方法InitData()重新绑定GridView控件中信息
        InitData();
    }
    //GridView控件RowEditing事件
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //GridView编辑项索引等于单击行的索引
        GridView1.EditIndex = e.NewEditIndex;  
        InitData();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        InitData();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {           
           if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                ((LinkButton)e.Row.Cells[6].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除吗?')");
           }

        }
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
}
