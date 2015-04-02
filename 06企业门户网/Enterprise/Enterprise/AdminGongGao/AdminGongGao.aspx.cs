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
public partial class AdminOpration_AdminGongGao : System.Web.UI.Page
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
           
                this.GongGaofillgv();
            }
        }
    }
    public void GongGaofillgv()            //用户自定义的方法
    {
        string SqlStr = "select * from tb_GongGao order by GTime desc";
        SqlConnection con = new SqlConnection(EP.GetConStr());
        con.Open();//打开数据库连接
        SqlDataAdapter sda = new SqlDataAdapter(SqlStr, con);
        DataSet ds = new DataSet();//声明一个DataSet的对象,并将该对象ds实例化
        sda.Fill(ds, "tb_GongGao");//将tb_GongGao填充到数据库中
        this.GvGongGao.DataSource = ds;
        this.GvGongGao.DataBind();//将数据绑定到GridView控件中
        for (int i = 0; i <= this.GvGongGao.Rows.Count - 1; i++)
        {
            DataRowView mydrv;  //声明一个DataRowView的对象
            string gintro;//声明一个字符串变量
            if (this.GvGongGao.PageIndex == 0)
            {
                EP.GetConStr();//调用EP类中的GetConStr()方法
                mydrv = ds.Tables["tb_GongGao"].DefaultView[i];
                gintro = Convert.ToString(mydrv["content"]);
                this.GvGongGao.Rows[i].Cells[1].Text = ep.SubStr(gintro, 10);
            }
        }
        con.Close();//关闭数据库链接
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminGongGao_Add.aspx");//跳转到"AdminGongGao_Add.aspx"页面当中
    }
    protected void GvGongGao_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GvGongGao.PageIndex = e.NewPageIndex;
        //this.bindGridView();//调用自定义方法
        this.GongGaofillgv();
    }
    protected void GvGongGao_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToShortDateString();//获取日期并将其转化为短日期格式
        }
    }
}
