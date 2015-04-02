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
public partial class yonghuxiugai : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        if (!Page.IsPostBack)
        {
            
            string UserId = Request["UserId"].ToString();
          
            SqlConnection con = DB.createDB();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select * from tb_Users where UserId='" + UserId + "'";
            SqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read(); 
            if (sdr["UserName"].ToString() != Session["UserName"])
            {
            this.txtname.Text = sdr["UserName"].ToString();
          
                this.txtpwd.Text = sdr.GetString(2);
                this.txtywname.Text = sdr.GetString(3);
                this.txtemail.Text = sdr.GetString(4);
                this.imgtouxiang.ImageUrl = sdr.GetString(5);
                con.Close();
                this.touxiangbind();
            }
            else
            {
                Response.Redirect("~/default");
            }
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
        if (Session["UserName"] == null && Session["UserPwd"] == null)
        {
            Response.Redirect("~/denglu/denglu.aspx");
        }
        else
        {
            if (Session["UserName"].ToString() == "Tsoft" && Session["UserPwd"].ToString() == "111")
            {
                string UserId = Request["UserId"].ToString();
                SqlConnection con = DB.createDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
              
                cmd.CommandText = "update tb_Users set UserName='" + this.txtname.Text + "',UserPwd='" + this.txtpwd.Text + "',Ename='" + this.txtywname.Text + "',Email='" + this.txtemail.Text + "',Logo='" + this.ddltouxiang.SelectedItem.Text.ToString() + "' where UserId='" + UserId + "'";

                cmd.ExecuteNonQuery();

                Response.Redirect("~/tisixinxi/chenggong.aspx");
                con.Close();  
            }
            else
            {
                Response.Write("<script>alert('你没有权限修改，必须是管理员才能进行修改操作！');location='javascript:history.go(-1)'</script>");

            }
        }
      
    }
    protected void ddltouxiang_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.imgtouxiang.ImageUrl = this.ddltouxiang.SelectedValue;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/denglu/denglu.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/dangqianxinxi/dqyhxinxixg.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/yonghuxinxi/yonghu.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/yonghuxinxi/yonghuchaxun.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/teizixinxi/addteizi.aspx");
    }
}
