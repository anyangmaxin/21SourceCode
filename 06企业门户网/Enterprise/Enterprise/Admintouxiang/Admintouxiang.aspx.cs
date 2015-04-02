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
public partial class Admintouxiang : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        //使用Session判断管理员是否已成功登录
        if (!IsPostBack)
        {
            if (Session["AdminUserName"] == null && Session["AdminPassWord"] == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else
            {
                this.bindDataList();//调用用户自定义方法
            }
        }
    }
    public void bindDataList()//用户自定义方法实现分页
    {
        int curpage = Convert.ToInt32(this.labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        SqlConnection con = new SqlConnection(EP.GetConStr());
        con.Open();
        string sqlstr = "select * from tb_image";
        SqlDataAdapter MyAdapter = new SqlDataAdapter(sqlstr, con);
        DataSet ds = new DataSet();
        MyAdapter.Fill(ds, "tb_image");
        ps.DataSource = ds.Tables["tb_image"].DefaultView;
        ps.AllowPaging = true; //是否可以分页
        ps.PageSize = 8; //显示的数量
        ps.CurrentPageIndex = curpage - 1; //取得当前页的页码
        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnBack.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            this.lnkbtnOne.Enabled = false;//不显示第一页按钮
            this.lnkbtnUp.Enabled = false;//不显示上一页按钮
        }
        if (curpage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnBack.Enabled = false;//不显示最后一页
        }
        this.labBackPage.Text = Convert.ToString(ps.PageCount);
        this.dlTouxiang.DataSource = ps;
        this.dlTouxiang.DataKeyField = "ID";
        this.dlTouxiang.DataBind();
        con.Close();
    }
    protected void lnkbtnOne_Click(object sender, EventArgs e)
    {
        this.labPage.Text = "1";//将“1”赋值给labPage控件当中
        this.bindDataList();//调用用户自定义bindDataList方法
    }
    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1);
        this.bindDataList();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);
        this.bindDataList();
    }
    protected void lnkbtnBack_Click(object sender, EventArgs e)
    {
        this.labPage.Text = this.labBackPage.Text;
        this.bindDataList();
    }

    protected void dlTouxiang_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        //获取主键字段的字段值，并且将获取的字段的值赋值给变量ID中
        string ID = this.dlTouxiang.DataKeys[e.Item.ItemIndex].ToString(); 
        string sqlstr = "delete from tb_image where id='" + Convert.ToInt32(ID) + "'";
        EP.EXECCommand(sqlstr);//调用EP类的EXECCommand方法执行删除语句
        this.bindDataList();//调用用户自定义bindDataList方法
    }
    protected void dlTouxiang_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        ((LinkButton)e.Item.Controls[0].FindControl("LinBtnDelete")).Attributes.Add("onclick", "return confirm('确定要删除吗？')");
    }
}
