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

public partial class Web_DepartmentManage : System.Web.UI.Page
{
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
    }
    private void GridViewBind()
    {
        Departmentmr department = new Departmentmr();//����Usersmr�����user
        DataSet ds = department.QueryDepartment();//ʹ��Usersmr��QueryUsers������ѯ�����û���Ϣ
        GridView1.DataSource = ds;//ΪGridView�ؼ���������Դ
        GridView1.DataBind();//GridView�ؼ�������
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridViewBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }
    //GridView�ؼ�RowDeleting�¼�
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string departmentid = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //ȡ��Ҫɾ����¼������ֵ
        Departmentmr department = new Departmentmr();//����Departmentmr�����department
        if (department.DeleteByStr(departmentid))//��������ʹ��DeleteByProc����ɾ���û�
        {
            Response.Write("<script language=javascript>alert('ɾ���ɹ�!')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('ɾ��ʧ��!')</script>");
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
        string departmentid = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //ȡ����¼������ֵ
        Departmentmr department = new Departmentmr();
        department.DepartmentName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDepartmentName")).Text;
        if (department.UpdateByStr(departmentid))//ʹ��Usersmr��UpdateByProc�����޸��û���Ϣ
        {
            GridViewBind();
            Response.Write("<script language=javascript>alert('�޸ĳɹ�!')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('�޸ĳɹ�!')</script>");
        }
        GridView1.EditIndex = -1;
        GridViewBind();
    }
      protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
      {
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
      protected void btnAddDepartment_Click(object sender, EventArgs e)
      {
          Response.Redirect("DepartmentAdd.aspx");
      }
}

