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

public partial class Web_FillBlankAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            InitDDLData();          //��ʼ�����Կ�Ŀ�����б��          
            if (Request["ID"] != null)//������޸���Ŀ����ʼ������
            {
                InitData();
            }
        }
    }
    //��ʼ�����Կ�Ŀ
    protected void InitDDLData()
    {
        Coursemr course = new Coursemr();       //�������Կ�Ŀ����
        DataSet ds = course.QueryCourse();  //��ѯ���Կ�Ŀ��Ϣ
        ddlCourse.DataSource = ds;          //ָ�����Կ�Ŀ�б������Դ
        ddlCourse.DataTextField = "Name";   //DataTextField��ʾName�ֶ�ֵ
        ddlCourse.DataValueField = "ID";    //DataValueField��ʾID�ֶ�ֵ
        ddlCourse.DataBind();               //������
    }
    //��ʼ������
    protected void InitData()
    {
        int fillblankProblemID = int.Parse(Request["ID"].ToString());  //ȡ�����ݹ�����������
        FillBlankProblemmr fillblankproblem = new FillBlankProblemmr();    //������������
        if (fillblankproblem.LoadData(fillblankProblemID))                //���ȡ����Ŀ��Ϣ���ֱ������Ӧ�ؼ���ʾ
        {
            ddlCourse.SelectedValue = fillblankproblem.CourseID.ToString();
            txtFrontTitle.Text = fillblankproblem.FrontTitle;
            txtBackTitle.Text = fillblankproblem.BackTitle;
            txtAnswer.Text = fillblankproblem.Answer;
        }
        else                //��ѯ����������ʾ
        {
            lblMessage.Text = "�������ݳ���";
        }
    }
    //��ӻ��޸��¼�
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsValid)
        {
            FillBlankProblemmr fillblankproblem = new FillBlankProblemmr();        //������������
            fillblankproblem.CourseID = int.Parse(ddlCourse.SelectedValue);//Ϊ������������Ը�ֵ
            fillblankproblem.FrontTitle = txtFrontTitle.Text;
            fillblankproblem.BackTitle = txtBackTitle.Text;
            fillblankproblem.Answer = txtAnswer.Text;
            if (Request["ID"] != null)                                  //������޸���Ŀ��Ϣ
            {
                fillblankproblem.ID = int.Parse(Request["ID"].ToString()); //ȡ����������
                if (fillblankproblem.UpdateByStr(int.Parse(Request["ID"].ToString())))//�����޸����ⷽ���޸�����
                {
                    lblMessage.Text = "�ɹ��޸ĸ�����⣡";
                }
                else
                {
                    lblMessage.Text = "�޸ĸ������ʧ�ܣ�";
                }
            }
            else                                                        //������������
            {
                if (fillblankproblem.InsertByStr())                       //����������ⷽ���������
                {
                    lblMessage.Text = "�ɹ���Ӹ�����⣡";
                }
                else
                {
                    lblMessage.Text = "��Ӹ������ʧ�ܣ�";
                }
            }
        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("FillBlankManage.aspx");
    }
}
