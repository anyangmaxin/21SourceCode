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
using OnLineExam.AjaxClass;

public partial class Web_PaperSetup2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Ӧ��Session����洢�û���
            string loginName = Session["userID"].ToString();
            //ʵ����������Usersmr
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            //�����Զ��巽��PaperData()��ʼ�����Կ�Ŀ
            PaperData();
            //�������õ����Զ��巽��BindData()�Զ������Ծ�
            BindData();
        }
    }
    //��ʼ�����Կ�Ŀ
    protected void PaperData()
    {
        //ʵ�������Կ�Ŀ����Coursemr
        Coursemr papercs = new Coursemr();
        //����Coursemr��������SqlQueryCourse()����ѯ���Կ�Ŀ��Ϣ�������ڴ���һ��DataSet����ds��
        DataSet ds = papercs.QueryCourse();  
        //���ÿ��Կ�Ŀ�б�������Դ
        MyddlCourse.DataSource = ds;          
        //DataTextField��ʾName�ֶ�ֵ
        MyddlCourse.DataTextField = "Name";   
        //DataValueField��ʾID�ֶ�ֵ
        MyddlCourse.DataValueField = "ID";    
        //������
        MyddlCourse.DataBind();               
    }
    //���������Զ������Ծ�
    protected void BindData()
    {       
        DataBase database = new DataBase();//����DataBase�����
        string GridView1StrSQL = "select * from SingleProblemmr";//���ݲ������ò�ѯ��ѡ��Sql���
        DataSet myds1 = database.GetDataSetSql(GridView1StrSQL);//����DataBase�෽��GetDataSetSql������ѯ����
        GridView1.DataSource = myds1.Tables[0].DefaultView;//Ϊ��ѡ��GridView�ؼ���������Դ
        GridView1.DataBind();//������
        string GridView2StrSQL = "select * from MultiProblemmr";//���ݲ������ò�ѯ��ѡ��Sql���
        DataSet myds2 = database.GetDataSetSql(GridView2StrSQL);//����DataBase�෽��GetDataSetSql������ѯ����
        GridView2.DataSource = myds2.Tables[0].DefaultView;//Ϊ��ѡ��GridView�ؼ���������Դ
        GridView2.DataBind();//������
        string GridView3StrSQL = "select * from JudgeProblemmr";//���ݲ������ò�ѯ�ж���Sql���
        DataSet myds3 = database.GetDataSetSql(GridView3StrSQL);//����DataBase�෽��GetDataSetSql������ѯ����
        GridView3.DataSource = myds3.Tables[0].DefaultView;//Ϊ�ж���GridView�ؼ���������Դ
        GridView3.DataBind();//������
        string GridView4StrSQL = "select * from FillBlankProblemmr";//���ݲ������ò�ѯ�����Sql���
        DataSet myds4 = database.GetDataSetSql(GridView4StrSQL);//����DataBase�෽��GetDataSetSql������ѯ����
        GridView4.DataSource = myds4.Tables[0].DefaultView;//Ϊ�����GridView�ؼ���������Դ
        GridView4.DataBind();//������
        string GridView5StrSQL = "select * from QuestionProblemmr";//���ݲ������ò�ѯ�ʴ���Sql���
        DataSet myds5 = database.GetDataSetSql(GridView5StrSQL);//����DataBase�෽��GetDataSetSql������ѯ����
        GridView5.DataSource = myds5.Tables[0].DefaultView;//Ϊ�ʴ���GridView�ؼ���������Դ
        GridView5.DataBind();//������
    }
    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            ((CheckBox)GridView1.Rows[i].FindControl("chkSelect1")).Checked = this.chkSelectAll.Checked;
        }
        for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
        {
            ((CheckBox)GridView2.Rows[i].FindControl("chkSelect2")).Checked = this.chkSelectAll.Checked;
        }
        for (int i = 0; i <= GridView3.Rows.Count - 1; i++)
        {
            ((CheckBox)GridView3.Rows[i].FindControl("chkSelect3")).Checked = this.chkSelectAll.Checked;
        }
        for (int i = 0; i <= GridView4.Rows.Count - 1; i++)
        {
            ((CheckBox)GridView4.Rows[i].FindControl("chkSelect4")).Checked = this.chkSelectAll.Checked;
        }
        for (int i = 0; i <= GridView5.Rows.Count - 1; i++)
        {
            ((CheckBox)GridView5.Rows[i].FindControl("chkSelect5")).Checked = this.chkSelectAll.Checked;
        }
    }

 
    public int GetIDInsert(string XSqlString)
    {
        string ConnectionString =ConfigurationSettings.AppSettings["strCon"]; 
        SqlConnection Connection = new SqlConnection(ConnectionString);
        Connection.Open();
        SqlCommand cmd = new SqlCommand(XSqlString, Connection);
        int Id = Convert.ToInt32(cmd.ExecuteScalar());
        return Id;
    }

    protected void CheckPagerName_Click(object sender, EventArgs e)
    {
        AjaxCommond ac = new AjaxCommond();
        //���������Ķ���
        SqlDataReader read = ExceRead("select * from Papermr where PaperName='" + this.txtPaperName.Text + "'");
        read.Read();                                                            //�������Ķ���
        if (read.HasRows)                                                       //�ж��Ƿ�������
        {
            if (this.txtPaperName.Text == read["PaperName"].ToString())
            {
                //����AJAX�����еĶԻ���
                ac.OpenDialogForButton((Button)sender, "���ź������Ծ������Ѿ����ڣ�����");
            }
        }
        else
        {
            //����AJAX�����еĶԻ���
            ac.OpenDialogForButton((Button)sender, "��ϲ�������Ծ����ƿ�����ӣ�����");
        }
        read.Close();                                                           //�ر������Ķ���
    }
    public SqlDataReader ExceRead(string strsql)
    {
        string connStr = ConfigurationSettings.AppSettings["strCon"]; 
        SqlConnection con = new SqlConnection(connStr);
        con.Open();
        //����һ��SqlCommand���󣬱�ʾҪִ�е�SqlCom����洢����
        SqlCommand sqlcom = new SqlCommand(strsql, con);
        SqlDataReader read = sqlcom.ExecuteReader();
        return read;
    }
    //�������Ծ��浽���ݿ�
    protected void imgBtnSave_Click(object sender, EventArgs e)
    {
        DataBase database = new DataBase();//ʵ����������DataBase
        AjaxCommond ac = new AjaxCommond();//ʵ����������AjaxCommond
        string insertExamPage = "insert into Papermr(CourseID,PaperName,PaperState) values(" + int.Parse(MyddlCourse.SelectedValue) + ",'" + txtPaperName.Text + "',1) SELECT @@IDENTITY as id";
        int autopageID = GetIDInsert(insertExamPage);//�����Ծ��������Զ����ɵ��Ծ���
        if (autopageID > 0)
        {
            //���ɵ�ѡ����Ϣ�������������ݿ���
            for (int i = 0; i < this.GridView1.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelect1")).Checked;
                if (isChecked)
                {
                    string sqlstr1 = ((Label)GridView1.Rows[i].FindControl("Label3")).Text;
                    string singlepaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'��ѡ��'," + sqlstr1 + "," + int.Parse(txtSingleFen.Text) + ")";
                    database.Insert(singlepaper);
                }
            }
            //���ɶ�ѡ����Ϣ�������������ݿ���
            for (int i = 0; i < this.GridView2.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView2.Rows[i].FindControl("chkSelect2")).Checked;
                if (isChecked)
                {
                    string sqlstr2 = ((Label)GridView2.Rows[i].FindControl("Label6")).Text;
                    string multipaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'��ѡ��'," + sqlstr2 + "," + int.Parse(txtMultiFen.Text) + ")";
                    database.Insert(multipaper);
                }
            }
            //�����ж�����Ϣ�������������ݿ���
            for (int i = 0; i < this.GridView3.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView3.Rows[i].FindControl("chkSelect3")).Checked;
                if (isChecked)
                {
                    string sqlstr3 = ((Label)GridView3.Rows[i].FindControl("Label7")).Text;
                    string judgepaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'�ж���'," + sqlstr3 + "," + int.Parse(txtJudgeFen.Text) + ")";
                    database.Insert(judgepaper);
                }
            }
            //�����������Ϣ�������������ݿ���
            for (int i = 0; i < this.GridView4.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView4.Rows[i].FindControl("chkSelect4")).Checked;
                if (isChecked)
                {
                    string sqlstr4 = ((Label)GridView4.Rows[i].FindControl("Label8")).Text;
                    string fillpaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'�����'," + sqlstr4 + "," + int.Parse(txtFillFen.Text) + ")";
                    database.Insert(fillpaper);
                }
            }
            //�����ʴ�����Ϣ�������������ݿ���
            for (int i = 0; i < this.GridView5.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView5.Rows[i].FindControl("chkSelect5")).Checked;
                if (isChecked)
                {
                    string sqlstr5 = ((Label)GridView5.Rows[i].FindControl("Label23")).Text;
                    string quepaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'�ʴ���'," + sqlstr5 + "," + int.Parse(txtQuestionFen.Text) + ")";
                    database.Insert(quepaper);
                }
            }
        }
        //����ajax�����е���ʾ�Ի���
        ac.OpenDialogForButton((Button)sender, "���ݱ���ɹ���");
        //��ת���Ծ�ά��ҳ
        Response.Redirect("PaperLists.aspx");
    }
}
