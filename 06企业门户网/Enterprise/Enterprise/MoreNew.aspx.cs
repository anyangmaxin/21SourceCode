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
using System.Data.SqlClient;//引入命名控件
public partial class MoreNew : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断用户是否登录，如果没登录跳转到登录页面中
        if (Session["UserName"] == null && Session["UserPwd"] == null)
        {
            //弹出对话框显示“对不起！您还没有登录”提示信息，并且将页面跳转到用户登录页面中
            Response.Write("<script lanuage='javaScript'>alert('对不起！您还没有登录！');location='UserLogin.aspx'</script>");

        }
        else
        { 
          this.Newfillgv();//调用用户自定义的方法
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
        con.Close();
    }
    protected void GvNew_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GvNew.PageIndex = e.NewPageIndex;
        this.Newfillgv();//调用用户自定义方法
    }
    protected void GvNew_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToShortDateString();//获取日期并将其转化为短日期格式
        }
    }
}
