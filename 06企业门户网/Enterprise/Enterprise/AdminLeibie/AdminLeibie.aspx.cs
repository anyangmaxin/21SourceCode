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
using System.Data.SqlClient;//引入命名空间
public partial class AdminLeibie_AdminLeibie : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        //使用Session判断管理员是否已成功登录
        if (Session["AdminUserName"] == null && Session["AdminPassWord"] == null)
        {
            Response.Redirect("~/AdminLogin.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                this.bindGridView();
            }
        }

    }
    public void bindGridView()
    {
        string SqlStr = "select * from tb_Leibie";
        ep.EXECGridView(this.GridView1, SqlStr);
    }
    protected void LinBtnADD_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminLeibie_ADD.aspx");//跳转到AdminLeibie_ADD.aspx页面中
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GridView1.PageIndex = e.NewPageIndex;
        this.bindGridView();//重新绑定一下GridView 控件
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToShortDateString();//获取日期并将其转化为短日期格式
        }
    }
}
