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
using OnLineExam.DataBaseClass;
using System.Data.SqlClient;
using System.Threading;
using OnLineExam.AjaxClass;

public partial class Web_UserManage : System.Web.UI.Page
{
    AjaxCommond ajaxDialog = new AjaxCommond();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            GridViewBind();
        }
        ImageButtonResetPassword.Attributes.Add("onClick", "javascript:return confirm('ȷ����������?');");
        ImageButtonDelete.Attributes.Add("onclick", "javascript:return confirm('ȷ��ɾ��?');");
    }
    private void GridViewBind()
    {
        Usersmr user = new Usersmr();//����Usersmr�����user
        DataSet myds = user.QueryUsers();//ʹ��Usersmr��QueryUsers������ѯ�����û���Ϣ
        GridView1.DataSource = myds;//ΪGridView�ؼ�ָ������Դ
        GridView1.DataBind();//GridView�ؼ�������
        LabelPageInfo.Text = "�����ڵ�λ�ã���ǰ����" + (GridView1.PageIndex + 1).ToString() + "ҳ ��" + GridView1.PageCount.ToString() + "ҳ��";
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (((DropDownList)e.Row.FindControl("ddlRole")) != null)
        {
            DropDownList myddlrole = (DropDownList)e.Row.FindControl("ddlRole");

              //���� DropDownList ��ֵ��������
            string connStr = ConfigurationSettings.AppSettings["strCon"]; 
            DataSet myds = new DataSet();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State.ToString() == "Closed") conn.Open();
            string strsql = "SELECT Rolemr.RoleId,Rolemr.RoleName FROM Rolemr";
            SqlDataAdapter da = new SqlDataAdapter(strsql, conn);
            da.Fill(myds);
            if (conn.State.ToString() == "Open") conn.Close();

            myddlrole.DataSource = myds.Tables[0].DefaultView;
            myddlrole.DataTextField = "RoleName";
            myddlrole.DataValueField = "RoleId";
            myddlrole.DataBind();
        }
        if (((DropDownList)e.Row.FindControl("ddlDepartment")) != null)
        {
            DropDownList ddldepartment = (DropDownList)e.Row.FindControl("ddlDepartment");

            //  ���� DropDownList ��ֵ��������
            string connStr = ConfigurationSettings.AppSettings["strCon"];
            DataSet myds = new DataSet();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State.ToString() == "Closed") conn.Open();
            string sqlstr = "SELECT DepartmentId,DepartmentName FROM Departmentmr";
            SqlDataAdapter da = new SqlDataAdapter(sqlstr, conn);
            da.Fill(myds);
            if (conn.State.ToString() == "Open") conn.Close();

            ddldepartment.DataSource = myds.Tables[0].DefaultView;
            ddldepartment.DataTextField = "DepartmentName";
            ddldepartment.DataValueField = "DepartmentId";
            ddldepartment.DataBind();
        }
        int i;
        //ִ��ѭ������֤ÿ�����ݶ����Ը���
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            //�����ж��Ƿ���������
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //�����ͣ��ʱ���ı���ɫ
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                //������ƿ�ʱ��ԭ����ɫ
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            }
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridViewBind();
    }
    //GridView�ؼ�RowDeleting�¼�
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //ȡ��Ҫɾ����¼������ֵ
        Usersmr user = new Usersmr();//����Usersmr�����user
        if (user.DeleteByProc(userID))//��������ʹ��DeleteByProc����ɾ���û�
        {
            ajaxDialog.OpenDialogForPage(Page, "ɾ���ɹ�!");
        }
        else
        {
            ajaxDialog.OpenDialogForPage(Page, "ɾ��ʧ��!");
        }
        GridView1.EditIndex = -1;
        GridViewBind();//���°�����

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  //GridView�༭���������ڵ����е�����
        GridViewBind();
    }

    //GridView�ؼ�RowUpdating�¼�
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //ȡ����¼������ֵ
        Usersmr user = new Usersmr();
        user.UserName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("tbxName")).Text;
        user.RoleId = Convert.ToInt32(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlRole")).SelectedValue);   //ȡ���޸ĺ��ֵ
        user.DepartmentId = Convert.ToInt32(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlDepartment")).SelectedValue);   //ȡ���޸ĺ��ֵ
        if (user.UpdateByProc(userID))//ʹ��Usersmr��UpdateByProc�����޸��û���Ϣ
        {
            GridViewBind();
            ajaxDialog.OpenDialogForPage(Page, "�޸ĳɹ�!");
        }
        else
        {
            ajaxDialog.OpenDialogForPage(Page, "�޸�ʧ��!");
        }
        GridView1.EditIndex = -1;
        GridViewBind();
    }
    protected void ImageButtonQuery_Click(object sender, ImageClickEventArgs e)
    {
        //AjaxCommond ajaxDialog=new AjaxCommond();
        //Thread.Sleep(5000);// �ӳ�5���ӡ�
        Hashtable myqueryItems  = new Hashtable();
        myqueryItems .Add("UserID", tbxUserID.Text.Trim());
        myqueryItems .Add("UserName", tbxUserName.Text.Trim());
        DataTable dt = OnLineExam.BusinessClass.Usersmr.QueryUsers(myqueryItems );
        if (dt.Rows.Count >= 1)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            ajaxDialog.OpenDialogForPage(Page,"û������û�!");
        }
    }
   
    protected void ImageButtonDelete_Click(object sender, ImageClickEventArgs e)
    {
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
            if (isChecked)
            {
                string userID = ((Label)GridView1.Rows[i].FindControl("Label1")).Text;
                Usersmr user = new Usersmr();//����Usersmr�����user
                if (user.DeleteByProc(userID))//��������ʹ��DeleteByProc����ɾ���û�
                {
                    Response.Write("<script language=javascript>alert('ɾ���ɹ�!');location='UserManage.aspx';</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('" + userID + "ɾ��ʧ��!');location='UserManage.aspx';</script>");
                }

            }
        }
        GridViewBind();
    }
    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked = this.chkSelectAll.Checked;
        }
    }
    protected void ImageButtonResetPassword_Click(object sender, ImageClickEventArgs e)
    {
        int numOfChecked = 0;
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
            if (isChecked)
            {
                numOfChecked++;
            }     
        }               
      if (numOfChecked == 1)
      {
          for (int i = 0; i < this.GridView1.Rows.Count; i++)
          {
               bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
               if (isChecked)
               {
                   string UserID = ((Label)GridView1.Rows[i].FindControl("Label1")).Text;

                   Random ran = new Random();
                   string newPassword = (ran.Next(999999).ToString().PadLeft(6, '8'));	//�������һ������

                   Usersmr user = new Usersmr();//����Usersmr����user
                   string pwdMd5 = user.GetMd5(newPassword);
                   user.UserPwd = pwdMd5.ToString().Trim();
                   if (user.ModifyPassword(UserID))//�����û�����
                   {
                       Response.Write("<Script language=JavaScript>alert('" + UserID + "�������Ѿ����ã�������Ϊ��" + newPassword + "����');location='UserManage.aspx';</Script>");
                   }
                   else//�޸�����ʧ��
                   {
                       Response.Write("<Script language=JavaScript>alert('" + UserID + "��������ʧ��!');location='UserManage.aspx';</Script>");
                   }
               }
               else
               {
                   isChecked = false;//ȡ��ѡ��
               }
          }   
              
       }
        else 
            {
                Response.Write("<Script language=JavaScript>alert('��ֻ��ѡ��һ���û�!');;location='UserManage.aspx';</Script>");
                return;
            }
        }
    protected void ImageButtonBack_Click(object sender, ImageClickEventArgs e)
    {       
        GridViewBind();
    }
}
       
  

