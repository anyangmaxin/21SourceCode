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
public partial class Liuyan_search : System.Web.UI.Page
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
            if (!this.IsPostBack)
            {
                this.LeaveWordfillgv();//调用用户自定义控件，将数据绑定到GridView控件当中
                if (GvLeaveWord.Rows.Count == 0)
                {
                    this.lblMessage.Visible = true;
                }
            }
        }
    }
    public void LeaveWordfillgv()            //用户自定义的方法
    {
        string person = Session["UserName"].ToString();
        string SqlStr = "select * from tb_LeaveWord  where person='" + Session["UserName"].ToString() + "'order by lTime desc";
        SqlConnection con = new SqlConnection(EP.GetConStr());
        con.Open();//打开数据库连接
        SqlDataAdapter sda = new SqlDataAdapter(SqlStr, con);
        DataSet ds = new DataSet();//声明一个DataSet的对象,并将该对象ds实例化
        sda.Fill(ds, "tb_LeaveWord");//将tb_LeaveWord填充到数据库中
         //ds.Tables.Count;
        this.GvLeaveWord.DataSource = ds;
        this.GvLeaveWord.DataBind();//将数据绑定到GridView控件中
        
        for (int i = 0; i <= this.GvLeaveWord.Rows.Count - 1; i++)
        {
            DataRowView mydrv;  //声明一个DataRowView的对象
            string gintro;

            if (this.GvLeaveWord.PageIndex == 0)
            {
                EP.GetConStr();

                mydrv = ds.Tables["tb_LeaveWord"].DefaultView[i];
                gintro = Convert.ToString(mydrv["Title"]);
                this.GvLeaveWord.Rows[i].Cells[1].Text = ep.SubStr(gintro, 10);
            }
        }
        con.Close();
    }
    protected void GvLeaveWord_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GvLeaveWord.PageIndex = e.NewPageIndex;
        this.LeaveWordfillgv();//调用用户自定义的方法
    }
    protected void GvLeaveWord_RowDataBound(object sender, GridViewRowEventArgs e)
    {
   
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='lightBlue'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
            if (e.Row.Cells[3].Text == "暂无回复" )
            {
                e.Row.Cells[3].Text = "<font color=blue>暂无回复</font>";
            }
            else
            {
                e.Row.Cells[3].Text = "<font color=red>已回复</font>";
            }
        }

    }
}
