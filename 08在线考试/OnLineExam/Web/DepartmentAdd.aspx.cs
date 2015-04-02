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
            this.txtDepartmentId.Attributes.Add("nullable", "yes");    //�Ƿ�Ϊ��
            this.txtDepartmentName.Attributes.Add("nullable", "yes");    //�Ƿ�Ϊ��
            this.imgBtnSave.Attributes["onclick"] = "javascript:return verifyAll(window.Form1);";           
        } 
    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsValid)
        {
            Departmentmr department = new Departmentmr();       //����Departmentmr����
            department.DepartmentId = Convert.ToInt32(txtDepartmentId.Text.Trim());
            if (!department.CheckDepartment(department.DepartmentId))//ʹ��CheckDepartment������֤�Ƿ����
            {
                department.DepartmentId = Convert.ToInt32(txtDepartmentId.Text.Trim());
                department.DepartmentName = txtDepartmentName.Text;
                if (department.InsertByStr())
                {
                    lblMessage.Text = "�ɹ�����ò�����Ϣ��";
                    Server.Transfer("DepartmentManage.aspx");
                }
                else
                {
                    lblMessage.Text = "��Ӳ���ʧ�ܣ�";
                }
            }
            else//�û����ڣ�������ʾ
            {
                lblMessage.Text = "���ݿ��д��ھ��иñ�ŵĲ��ţ����������룡";
            }
        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("DepartmentManage.aspx");
    }
}
