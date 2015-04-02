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
public partial class chakan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblhtyhm.Visible = false;
        if (!Page.IsPostBack)
        {
           this.aa();//调用绑定方法
           this.pagebind();//调用分页方法
           string ContId = Request["ContId"];
           SqlConnection con = DB.createDB();
           con.Open();
           SqlCommand cmd1 = new SqlCommand("update  tb_Content set HitCount=HitCount+1 where  ContId='" + ContId + "'", con);
           cmd1.ExecuteNonQuery();
           con.Close();
          
        }  
        this.hfbind();//调用绑定方法
    }
    public void aa()
    {
        string ContId = Request["ContId"];
        SqlConnection con = DB.createDB();
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter("select top 1 a.*,b.* from tb_Users as a join tb_Content as b on a.UserName=b.UserName where b.ContId='" + ContId + "'", con);
        DataSet ds = new DataSet();
        sda.Fill(ds, "tb_Content");
        this.dlxx.DataSource = ds;
        this.dlxx.DataBind();
        con.Close();//关闭数据库连接
    }
    public void hfbind()
    {
        string ContId = Request["ContId"];
        SqlConnection con = DB.createDB();
        con.Open();
        SqlDataAdapter sda1 = new SqlDataAdapter("select a.*,b.* from tb_Users as a join tb_hf as b on a.UserName=b.hfname where b.ContId='" + ContId + "'", con);
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1,"tb_hf");
        this.DataList2.DataSource = ds1;
        this.DataList2.DataKeyField = "hfId";
        this.DataList2.DataBind();
        con.Close();
    } 
    public void pagebind()
    {
        string ContId = Request["ContId"];
        int curpage = Convert.ToInt32(this.lblPage.Text);
        PagedDataSource ps = new PagedDataSource();
        SqlConnection con = DB.createDB();
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter("select a.*,b.* from tb_Users as a join tb_hf as b on a.UserName=b.hfname where b.ContId='" + ContId + "'", con);
        DataSet ds = new DataSet();
        sda.Fill(ds, "tb_hf");
        ps.DataSource = ds.Tables["tb_hf"].DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 2;
        ps.CurrentPageIndex = curpage - 1;
        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnLast.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            this.lnkbtnOne.Enabled = false;//不显示第一页按钮
            this.lnkbtnUp.Enabled = false;//不显示上一页按钮
        }
        if (curpage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnLast.Enabled = false;//不显示最后一页
        }
        this.lblBackPage.Text = Convert.ToString(ps.PageCount);
        this.DataList2.DataSource = ps;
        this.DataList2.DataKeyField = "hfId";
        this.DataList2.DataBind();
        con.Close();

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "hfsc")
        {
            if (Session["UserName"] == null && Session["UserPwd"] == null)
            {
                Response.Redirect("~/denglu/denglu.aspx");
            }
            else
            {
                if (Session["UserName"].ToString() == "Tsoft" && Session["UserPwd"].ToString() == "111")
                {
                string hfId = this.DataList2.DataKeys[e.Item.ItemIndex].ToString();
                SqlConnection con = DB.createDB();
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from tb_hf where hfId='" + hfId + "'", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("~/tisixinxi/chenggong.aspx");
                this.hfbind();
                con.Close();
            }
            else
            {
                Response.Write("<script>alert('很遗憾，你没有权限删除！');location='javascript:history.go(-1)'</script>");

            }
            }
        }
       
       
        if (e.CommandName == "hf")
        {
            if (Session["UserName"] == null && Session["UserPwd"] == null)
            {
                Response.Redirect("~/denglu/denglu.aspx");
            }
            else
            {
               
                    lblhtyhm.Visible = true;
                    this.lblhtyhm.Text = Session["UserName"].ToString();
                    string ContId = Request["ContId"];
                    SqlConnection con = DB.createDB();
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select a.*,b.* from tb_Users as a join tb_Content as b on a.UserName=b.UserName where b.ContId='" + ContId + "'", con);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        while (sdr.Read())
                        {
                            this.txthtbt.Text = sdr["Subject"].ToString();
                            this.txthtbh.Text = sdr["ContId"].ToString();
                        }
                        sdr.Close();
                    }
            }
        }
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {

        string ContId = Request["ContId"].ToString();
        this.txthtbh.Text = ContId;
        SqlConnection con = DB.createDB();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        con.Open();
        cmd.CommandText = "insert into tb_hf(ContId,hfSubject,hfnr,hfname,hftime) values(" + ContId + ",'" + this.txthtbt.Text + "','" + this.txthtnr.Text + "','" + this.lblhtyhm.Text + "','" + System.DateTime.Now.ToString() + "')";
        cmd.ExecuteNonQuery();
        Response.Redirect("~/tisixinxi/chenggong.aspx");
        con.Close();
        this.aa();
    }
    protected void lnkbtnOne_Click(object sender, EventArgs e)
   {
        this.lblPage.Text = "1";
        this.pagebind();
    }
   protected void lnkbtnLast_Click(object sender, EventArgs e)
   {
       this.lblPage.Text = this.lblBackPage.Text;
       this.pagebind();
   }
   protected void lnkbtnUp_Click(object sender, EventArgs e)
   {
       this.lblPage.Text = Convert.ToString(Convert.ToInt32(this.lblPage.Text) - 1);
       this.pagebind();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
   {
       this.lblPage.Text = Convert.ToString(Convert.ToInt32(this.lblPage.Text) + 1);
       this.pagebind();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");//跳转到网站主页中
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/yonghuxinxi/yonghu.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        this.txthtnr.Text = "";
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/denglu/denglu.aspx");
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
