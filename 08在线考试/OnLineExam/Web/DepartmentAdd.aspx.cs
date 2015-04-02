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

public partial class Web_DepartmentAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;  
            this.txtDepartmentId.Attributes.Add("nullable", "yes");    //是否为空
            this.txtDepartmentName.Attributes.Add("nullable", "yes");    //是否为空
            this.imgBtnSave.Attributes["onclick"] = "javascript:return verifyAll(window.Form1);";           
        } 
    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsValid)
        {
            Departmentmr department = new Departmentmr();       //创建Departmentmr对象
            department.DepartmentId = Convert.ToInt32(txtDepartmentId.Text.Trim());
            if (!department.CheckDepartment(department.DepartmentId))//使用CheckDepartment方法验证是否存在
            {
                department.DepartmentId = Convert.ToInt32(txtDepartmentId.Text.Trim());
                department.DepartmentName = txtDepartmentName.Text;
                if (department.InsertByStr())
                {
                    lblMessage.Text = "成功插入该部门信息！";
                    Server.Transfer("DepartmentManage.aspx");
                }
                else
                {
                    lblMessage.Text = "添加部门失败！";
                }
            }
            else//用户存在，给出提示
            {
                lblMessage.Text = "数据库中存在具有该编号的部门，请重新输入！";
            }
        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("DepartmentManage.aspx");
    }
}
