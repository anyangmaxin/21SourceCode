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
using OnLineExam.BusinessClass;
using System.Data.SqlClient;


public partial class Web_UserAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;           
        } 
    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsValid)
        {
            Usersmr user = new Usersmr();       //创建Usersmr对象
            user.UserID = txtUserID.Text.Trim();
            if (!user.CheckUser(user.UserID))//使用CheckUser方法验证用户是否存在
            {
                user.UserName = txtUserName.Text;
             //原Md5加密很容易破解
            //string PwdMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtUserPwd.Text.Trim(), "MD5").ToString();
                //自定义的GetMd5加密方法可以实现无破解
            string PwdMD5 = user.GetMd5(txtUserPwd.Text.ToString());
                user.UserPwd = PwdMD5;
                user.DepartmentId = Convert.ToInt16(ddlDepartment.SelectedValue);
                user.RoleId = Convert.ToInt16(ddlRole.SelectedValue);

                if (user.InsertByStr())
                    {
                        lblMessage.Text = "成功插入该用户信息！";
                        Server.Transfer("UserManage.aspx");
                    }
              else
               {
                   lblMessage.Text = "添加用户失败！";
               }
            }
            else//用户存在，给出提示
            {
                lblMessage.Text = "数据库中存在具有该编号的用户，请重新输入！";
            }
        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("UserManage.aspx");       
    }
}
