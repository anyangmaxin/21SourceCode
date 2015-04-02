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

using System.IO;
using System.Collections.Specialized;

public partial class Play_Photo : System.Web.UI.Page
{
    public int categoryID = -1;
    public string categoryName = string.Empty;
    Album am = new Album();
    //Page_PreRender事件，能防止单击两次按钮（这里指的是播放图片的按钮）来激发事件
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Request.Params["CategoryID"] != null)
        {
            categoryID = Int32.Parse(Request.Params["CategoryID"].ToString());
            Session["categoryID"] = Request.Params["CategoryID"].ToString();
            if (Request.Params["CategoryName"] != null)
            {
                categoryName = lb_Cname.Text = Request.Params["CategoryName"].ToString();
            }
        }
        if (categoryID > 0)
        {
            BindListView();
        }
        if (!IsPostBack)
        {
            DataSet ds2 = am.ShowPhoto(categoryID);
            if (ds2.Tables[0].Rows.Count > 0)
            {
                imgBig.Src = "UpSmall/" + ds2.Tables[0].Rows[0]["Url"].ToString();
                sDescription.InnerHtml ="照片描述："+ ds2.Tables[0].Rows[0]["Descript"].ToString();
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    //绑定数据到ListView
    private void BindListView()
    {
        if (Session["categoryID"] != null)
        {
            DataSet ds = am.ShowPhoto(Int32.Parse(Session["categoryID"].ToString()));
            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Redirect("UserLogin.aspx");
            }
            lvPhoto.DataSource = ds;
            lvPhoto.DataBind();
        }
        else
        {
            return;
        }
    }
    //单击小图片显示大图片
    protected void lkbImg_Command(object sender, CommandEventArgs e)
    {
        imgBig.Style.Add("visibility", "visibe");
        imgBig.Src = "UpSmall/" + e.CommandArgument.ToString();
        sDescription.InnerHtml = e.CommandName.ToString();
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
