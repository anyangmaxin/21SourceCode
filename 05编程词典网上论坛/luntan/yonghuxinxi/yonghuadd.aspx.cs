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
public partial class yonghuxinxi_yonghuadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.touxiangbind();
        }

    }
    public void touxiangbind()
    {
        SqlConnection con = DB.createDB();
        con.Open();
        string sqlstr = "select * from tb_touxiang";
        SqlDataAdapter myda = new SqlDataAdapter(sqlstr, con);
        DataSet myds = new DataSet();
        myda.Fill(myds, "tb_touxiang");
        this.ddltouxiang.DataSource = myds.Tables["tb_touxiang"];
        this.ddltouxiang.DataTextField = "Image";
        this.ddltouxiang.DataBind();
        this.imgtouxiang.ImageUrl = this.ddltouxiang.SelectedValue;
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = DB.createDB();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        con.Open();
        cmd.CommandText = "insert into tb_Users(UserName, UserPwd, Ename, Email, Logo) values('" + this.txtname.Text + "','" + this.txtpwd.Text + "','" + this.txtywname.Text + "','" + this.txtemail.Text + "','" + this.ddltouxiang.SelectedItem.Text.ToString() + "')";
        cmd.ExecuteNonQuery();
        Response.Redirect("~/tisixinxi/chenggong.aspx");
        con.Close();
    }
    protected void ddltouxiang_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.imgtouxiang.ImageUrl = this.ddltouxiang.SelectedValue;
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/dangqianxinxi/dqyhxinxixg.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/yonghuxinxi/yonghuchaxun.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/denglu/denglu.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
