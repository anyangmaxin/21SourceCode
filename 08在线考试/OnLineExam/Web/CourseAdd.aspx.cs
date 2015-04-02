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
            Coursemr course = new Coursemr();               //�������Կ�Ŀ����
            course.Name = txtName.Text;                 //���ÿ��Կ�Ŀ��������
            if (course.InsertByStr())                  //������ӿ��Կ�Ŀ������ӿ��Կ�Ŀ
            {
                lblMessage.Text = "�ɹ���Ӹÿ��Կ�Ŀ��";
                txtName.Text = "";

            }
            else
            {
                lblMessage.Text = "��Ӹÿ��Կ�Ŀʧ�ܣ�";
            }

        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("CourseManage.aspx");
    }
}
