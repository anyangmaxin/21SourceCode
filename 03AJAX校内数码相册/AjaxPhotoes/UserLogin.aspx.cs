using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    protected static PagedDataSource pds = new PagedDataSource();//创建一个分页数据源的对象且一定要声明为静态
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.BindDataList(0);
    }
    public void BindDataList(int currentpage)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        pds.AllowPaging = true;//允许分页
        pds.PageSize = 6;//每页显示3条数据
        pds.CurrentPageIndex = currentpage;//当前页为传入的一个int型值
        string strSql = "select A.*,"
                   + "(select count(*) from Photo B where B.CategoryID = A.ID) AS p_num,"
                   + "(select top 1 C.url from Photo C where C.CategoryID = A.ID) AS url "
                   + "from Photo_Category AS A "
                   + "where A.C_Status ='公开' "
                   + "and  A.ID in "
                   + "(select CategoryID from Photo)";
        conn.Open();//打开数据库连接
        SqlDataAdapter sda = new SqlDataAdapter(strSql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);//把执行得到的数据放在数据集中
        pds.DataSource = ds.Tables[0].DefaultView;//把数据集中的数据放入分页数据源中
        dlPictrue.DataSource = pds;//把数据集中的数据放入分页数据源中
        dlPictrue.DataBind();
        conn.Close();
    }
    protected void dlPictrue_ItemCommand(object source, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            //以下5个为 捕获用户点击 上一页 下一页等时发生的事件
            case "first"://第一页
                pds.CurrentPageIndex = 0;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "pre"://上一页
                pds.CurrentPageIndex = pds.CurrentPageIndex - 1;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "next"://下一页
                pds.CurrentPageIndex = pds.CurrentPageIndex + 1;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "last"://最后一页
                pds.CurrentPageIndex = pds.PageCount - 1;
                BindDataList(pds.CurrentPageIndex);
                break;
            case "search"://页面跳转页
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    int PageCount = int.Parse(pds.PageCount.ToString());
                    TextBox txtPage = e.Item.FindControl("txtPage") as TextBox;
                    int MyPageNum = 0;
                    if (!txtPage.Text.Equals(""))
                        MyPageNum = Convert.ToInt32(txtPage.Text.ToString());
                    if (MyPageNum <= 0 || MyPageNum > PageCount)
                        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请输入页数并确定没有超出总页数!');location.href='Default.aspx';", true);
                    else
                        BindDataList(MyPageNum - 1);
                }
                break;
        }
    }
    protected void dlPictrue_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            //以下六个为得到脚模板中的控件,并创建变量.
            Label CurrentPage = e.Item.FindControl("labCurrentPage") as Label;
            Label PageCount = e.Item.FindControl("labPageCount") as Label;
            LinkButton FirstPage = e.Item.FindControl("lnkbtnFirst") as LinkButton;
            LinkButton PrePage = e.Item.FindControl("lnkbtnFront") as LinkButton;
            LinkButton NextPage = e.Item.FindControl("lnkbtnNext") as LinkButton;
            LinkButton LastPage = e.Item.FindControl("lnkbtnLast") as LinkButton;
            CurrentPage.Text = (pds.CurrentPageIndex + 1).ToString();//绑定显示当前页
            PageCount.Text = pds.PageCount.ToString();//绑定显示总页数
            if (pds.IsFirstPage)//如果是第一页,首页和上一页不能用
            {
                FirstPage.Enabled = false;
                PrePage.Enabled = false;
            }
            if (pds.IsLastPage)//如果是最后一页"下一页"和"尾页"按钮不能用
            {
                NextPage.Enabled = false;
                LastPage.Enabled = false;
            }
        }
    }
    protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        string name = txtUserName.Text;
        string pwd = txtPwd.Text;
        //创建LINQ对象
        LqDBDataContext ldc = new LqDBDataContext();
        //创建LINQ查询语句，查询到满足指定登录名和密码的用户
        var result = from v in ldc.tb_userInfo
                     where v.userName == name && v.userPass == pwd
                     select v;
        //判断是否查询到用户
        if (result.Count() > 0)
        {
            Session["User"] = txtUserName.Text;
            //判断选中的单选按钮
            if (rdoBtnIndex.Checked)
                Response.Redirect("UserLogin.aspx");         //浏览相片
            else
                Response.Redirect("ManageDefault.aspx");  //管理图片
        }
        else
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('用户名称或密码不正确!');location.href='UserLogin.aspx';", true);
    }
}
