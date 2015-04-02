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
public partial class AdminSearch : System.Web.UI.Page
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        //使用Session判断管理员是否已成功登录
        if (Session["AdminUserName"] == null && Session["AdminPassWord"] == null)
        {
            Response.Redirect("~/AdminLogin.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                this.bindGridView();//调用字定义绑定GridView控件方法  
            }
        }
    }
    public void bindGridView()
    {
        string SqlStr = "select * from tb_UserLogin";
        gvUserInfo.DataKeyNames = new string[] { "UserId" };
        ep.EXECGridView(this.gvUserInfo, SqlStr);
    }
    protected void gvUserInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUserInfo.PageIndex = e.NewPageIndex;
        string sqlstr = "select * from tb_UserLogin where " + ddlCondition.SelectedValue + " like '%" + txtKey.Text.Trim() + "%'";
        ep.EXECGridView(this.gvUserInfo, sqlstr);
    }


    protected void btnSel_Click(object sender, EventArgs e)
    {
        if (txtKey.Text == "")
        {
            string sqlstr = "select * from tb_UserLogin";
            ep.EXECGridView(this.gvUserInfo, sqlstr);
        }
        else
        {
            string sqlstr = "select * from tb_UserLogin where " + ddlCondition.SelectedValue + " like '%" + txtKey.Text.Trim() + "%'";
            ep.EXECGridView(this.gvUserInfo, sqlstr);
        }
    }

}
