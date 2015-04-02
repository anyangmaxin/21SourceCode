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

public partial class UserMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
