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
public partial class xiangxixinxi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UserName"] == null && Session["UserPwd"] == null)
            {
                Response.Redirect("denglu.aspx");
            }
            else
            {
                string UserId = Request["UserId"].ToString();
                SqlConnection con = DB.createDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                cmd.CommandText = "select * from tb_Users where UserId='"+UserId+"'";
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                
                this.lblyhname.Text = sdr.GetString(1);
               
                this.lblyhpwd.Text = "* * *";
               
                this.lblywname.Text = sdr.GetString(3);
              
                this.lblyhyx.Text = sdr.GetString(4);
                this.imgtouxiang.ImageUrl = sdr.GetString(5);
                con.Close();
                //this.touxiangbind();
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
    protected void lbtnsy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/dangqianxinxi/dqyhxinxixg.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/yonghuxinxi/yonghuchaxun.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/teizixinxi/addteizi.aspx");
    }
}
