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
            Usersmr user = new Usersmr();       //����Usersmr����
            user.UserID = txtUserID.Text.Trim();
            if (!user.CheckUser(user.UserID))//ʹ��CheckUser������֤�û��Ƿ����
            {
                user.UserName = txtUserName.Text;
             //ԭMd5���ܺ������ƽ�
            //string PwdMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtUserPwd.Text.Trim(), "MD5").ToString();
                //�Զ����GetMd5���ܷ�������ʵ�����ƽ�
            string PwdMD5 = user.GetMd5(txtUserPwd.Text.ToString());
                user.UserPwd = PwdMD5;
                user.DepartmentId = Convert.ToInt16(ddlDepartment.SelectedValue);
                user.RoleId = Convert.ToInt16(ddlRole.SelectedValue);

                if (user.InsertByStr())
                    {
                        lblMessage.Text = "�ɹ�������û���Ϣ��";
                        Server.Transfer("UserManage.aspx");
                    }
              else
               {
                   lblMessage.Text = "����û�ʧ�ܣ�";
               }
            }
            else//�û����ڣ�������ʾ
            {
                lblMessage.Text = "���ݿ��д��ھ��иñ�ŵ��û������������룡";
            }
        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("UserManage.aspx");       
    }
}
