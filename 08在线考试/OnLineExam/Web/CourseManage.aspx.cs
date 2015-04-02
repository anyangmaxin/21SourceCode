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

public partial class Web_CourseManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            InitData();  //��ʼ�����Կ�Ŀ          
        }
    }
    //��ʼ�����Կ�Ŀ
    protected void InitData()
    {
        Coursemr course = new Coursemr();       //�������Կ�Ŀ����
        DataSet ds = course.QueryCourse();  //��ѯ���Կ�Ŀ��Ϣ
        GridView1.DataSource = ds;          //ΪGridView�ؼ���������Դ        
        GridView1.DataBind();               //������
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        InitData();
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
    //ɾ�����Կ�Ŀ�¼�
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Coursemr course = new Coursemr();           //����Coursemr����
        int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //ȡ��Ҫɾ����¼������ֵ
        if (course.DeleteByStr(ID))
        {
            Response.Write("<script language=javascript>alert('�ɹ�ɾ�����Կ�Ŀ��')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('ɾ�����Կ�Ŀʧ�ܣ�')</script>");
        }
        GridView1.EditIndex = -1;
        InitData();
    }
    //GridView�ؼ�RowUpdating�¼�
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //ȡ��Ҫɾ����¼������ֵ
        Coursemr course = new Coursemr();           //����Coursemr����
        course.Name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
        if (course.UpdateByStr(ID))//ʹ��Usersmr��UpdateByProc�����޸��û���Ϣ
        {
            Response.Write("<script language=javascript>alert('�޸ĳɹ�!')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('�޸�ʧ��!')</script>");
        }
        GridView1.EditIndex = -1;
        InitData();
    }
    //GridView�ؼ�RowCanceling�¼�
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        InitData();
    }
    //GridView�ؼ�RowEditing�¼�
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  //GridView�༭���������ڵ����е�����
        InitData();
    }


    protected void btnAddCource_Click(object sender, EventArgs e)
    {
        Response.Redirect("CourseAdd.aspx");
    }
}
