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

public partial class Web_CourseAdd : System.Web.UI.Page
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
            Coursemr course = new Coursemr();               //创建考试科目对象
            course.Name = txtName.Text;                 //设置考试科目对象属性
            if (course.InsertByStr())                  //调用添加考试科目方法添加考试科目
            {
                lblMessage.Text = "成功添加该考试科目！";
                txtName.Text = "";

            }
            else
            {
                lblMessage.Text = "添加该考试科目失败！";
            }

        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("CourseManage.aspx");
    }
}
