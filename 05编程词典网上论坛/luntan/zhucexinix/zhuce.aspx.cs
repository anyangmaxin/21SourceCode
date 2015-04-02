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

public partial class zhuce : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlConnection con = DB.createDB();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
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
    }
 
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.txtname.Text != "Tsoft")
        {
            SqlConnection con = DB.createDB();
            con.Open();
            SqlTransaction st = con.BeginTransaction();//通过SqlConnection的BeginTransaction方法创建名为st的对象Transaction
            SqlCommand cmd = con.CreateCommand();
            cmd.Transaction = st;////将SqlTransaction对象分配给SqlCommand对象的Transaction属性
            try
            {
                //向用户表中插入注册信息
                cmd.CommandText = "insert into tb_Users(UserName, UserPwd, Ename, Email, Logo) values('" + this.txtname.Text + "','" + this.txtpwd.Text + "','" + this.txtywname.Text + "','" + this.txtemail.Text + "','" + this.ddltouxiang.SelectedItem.Text.ToString() + "')";
                cmd.ExecuteNonQuery();
                st.Commit();//提交事物
                Response.Redirect("~/tisixinxi/chenggong.aspx");
            }
            catch (Exception error)
            {
                Response.Redirect("~/tisixinxi/shibai.aspx");
                st.Rollback();//回滚事物
            }
        }
        else
        {
            Response.Write("<script>alert('很遗憾，请你输入其它的用户姓名！');location='javascript:history.go(-1)'</script>");
        }
        //con.Close();

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       this.imgtouxiang.ImageUrl =this.ddltouxiang.SelectedValue;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }


    protected void lyhgl_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/yonghuxinxi/yonghu.aspx");
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
        Response.Redirect("~/denglu/denglu.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/teizixinxi/addteizi.aspx");
    }
    protected void lbtnsy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
