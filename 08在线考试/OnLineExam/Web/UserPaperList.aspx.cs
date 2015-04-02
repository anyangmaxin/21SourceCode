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

public partial class Web_UserPaperList : System.Web.UI.Page
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
    //初始化试卷表格
    protected void InitData()
    {
        Papermr paper = new Papermr();
        DataSet ds = paper.QueryUserPaperList();    
        GridView1.DataSource = ds;         
        GridView1.DataBind();
        LabelPageInfo.Text = "当前（第" + (GridView1.PageIndex + 1).ToString() + "页 共" + GridView1.PageCount.ToString() + "页）";
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        InitData();
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string UserID = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //取出要删除记录的主键值1
        int PaperID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[1].ToString().Trim());//取出要删除记录的主键值2
        Papermr paper = new Papermr();
        if (paper.DeleteByProc(UserID, PaperID))
        {
            Response.Write("<script language=javascript>alert('成功删除！')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('删除失败！')</script>");
        }
        InitData();
    }
}
