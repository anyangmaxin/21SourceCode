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
public partial class AdminNew : System.Web.UI.Page
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
            if (!this.IsPostBack)
            {
                this.Newfillgv();//调用用户自定义空间
            }
        }
    }
    public void Newfillgv()            //用户自定义的方法
    {
        string SqlStr = "select * from tb_New order by PublishTime desc";
        SqlConnection con = new SqlConnection(EP.GetConStr());
        con.Open();//打开数据库连接
        SqlDataAdapter sda = new SqlDataAdapter(SqlStr, con);
        DataSet ds = new DataSet();//声明一个DataSet的对象,并将该对象ds实例化
        sda.Fill(ds, "tb_New");//将tb_GongGao填充到数据库中
        this.GvNew.DataSource = ds;
        this.GvNew.DataBind();//将数据绑定到GridView控件中
        for (int i = 0; i <= this.GvNew.Rows.Count - 1; i++)
        {
            DataRowView mydrv;  //声明一个DataRowView的对象
            string gintro;

            if (this.GvNew.PageIndex == 0)
            {
                EP.GetConStr();
                mydrv = ds.Tables["tb_New"].DefaultView[i];
                gintro = Convert.ToString(mydrv["title"]);
                this.GvNew.Rows[i].Cells[1].Text = ep.SubStr(gintro, 10);
            }
           
        }
        con.Close();//关闭数据库连接
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminNew_Add.aspx");//跳转到AdminNew_Add.aspx页面中
    }
    protected void GvNew_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GvNew.PageIndex = e.NewPageIndex;
        this.Newfillgv();
    }
    protected void GvNew_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToShortDateString();//获取日期并将其转化为短日期格式
        }
    }
}
