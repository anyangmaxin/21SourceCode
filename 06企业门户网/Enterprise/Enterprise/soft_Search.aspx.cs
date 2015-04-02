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
public partial class softLeibie_Search : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //判断用户是否登录，如果没登录跳转到登录页面中
            if (Session["UserName"] == null && Session["UserPwd"] == null)
            {
                //弹出对话框显示“对不起！您还没有登录”提示信息，并且将页面跳转到用户登录页面中
                Response.Write("<script lanuage='javaScript'>alert('对不起！您还没有登录！');location='UserLogin.aspx'</script>");
            }
            else
            {
                string SqlStr = "select * from tb_leibie";//查询信息表
                ep.EXECDropDownList(this.ddlLeibie, SqlStr, "name");
                this.bindGridView();//调用用户自定义方法
            }
        }
    }
    public void bindGridView()
    {
        string SqlStr = "select * from tb_Tools";
        this.gvUserInfo.DataKeyNames = new string[] { "ID" };
        ep.EXECGridView(this.gvUserInfo, SqlStr);
    }
    protected void btnSel_Click(object sender, EventArgs e)
    {
        if (txtKey.Text == "")//判断文本框内容是否为空
        {  
            //弹出提示对话框，并且将页面跳转到soft_Search.aspx页面中
            Response.Write("<script language=javascript>alert('文本框不能为空！');location='soft_Search.aspx'</script>");
        }
        else
        {   
            string sqlstr = "select * from tb_Tools where " + ddlCondition.SelectedValue + " like '%" + txtKey.Text.Trim() + "%' and LeiBie='" + this.ddlLeibie.SelectedItem.Text + "'";
            ep.EXECGridView(this.gvUserInfo, sqlstr);//调用EP类的EXECGridView方法
        }
    }
    protected void gvUserInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.gvUserInfo.PageIndex = e.NewPageIndex;
        this.bindGridView();//调用用户自定义方法
    }
    protected void BtnShow_Click(object sender, EventArgs e)
    {
        this.bindGridView();//调用用户自定义方法
    }
}
