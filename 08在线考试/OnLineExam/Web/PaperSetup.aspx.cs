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
            //应用Session对象存储用户名
            string loginName = Session["userID"].ToString();
            //实例化公共类Usersmr
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            //调用自定义方法PaperData()初始化考试科目
            PaperData();
            //根据设置调用自定义方法BindData()自动生成试卷
            BindData();
        }
    }
    //初始化考试科目
    protected void PaperData()
    {
        //实例化考试科目对象Coursemr
        Coursemr papercs = new Coursemr();
        //调用Coursemr公共类中SqlQueryCourse()来查询考试科目信息并保存在创建一个DataSet对象ds中
        DataSet ds = papercs.QueryCourse();  
        //设置考试科目列表框的数据源
        MyddlCourse.DataSource = ds;          
        //DataTextField显示Name字段值
        MyddlCourse.DataTextField = "Name";   
        //DataValueField显示ID字段值
        MyddlCourse.DataValueField = "ID";    
        //绑定数据
        MyddlCourse.DataBind();               
    }
    //根据设置自动生成试卷
    protected void BindData()
    {       
        DataBase database = new DataBase();//创建DataBase类对象
        string GridView1StrSQL = "select * from SingleProblemmr";//根据参数设置查询单选题Sql语句
        DataSet myds1 = database.GetDataSetSql(GridView1StrSQL);//调用DataBase类方法GetDataSetSql方法查询数据
        GridView1.DataSource = myds1.Tables[0].DefaultView;//为单选题GridView控件设置数据源
        GridView1.DataBind();//绑定数据
        string GridView2StrSQL = "select * from MultiProblemmr";//根据参数设置查询多选题Sql语句
        DataSet myds2 = database.GetDataSetSql(GridView2StrSQL);//调用DataBase类方法GetDataSetSql方法查询数据
        GridView2.DataSource = myds2.Tables[0].DefaultView;//为多选题GridView控件设置数据源
        GridView2.DataBind();//绑定数据
        string GridView3StrSQL = "select * from JudgeProblemmr";//根据参数设置查询判断题Sql语句
        DataSet myds3 = database.GetDataSetSql(GridView3StrSQL);//调用DataBase类方法GetDataSetSql方法查询数据
        GridView3.DataSource = myds3.Tables[0].DefaultView;//为判断题GridView控件设置数据源
        GridView3.DataBind();//绑定数据
        string GridView4StrSQL = "select * from FillBlankProblemmr";//根据参数设置查询填空题Sql语句
        DataSet myds4 = database.GetDataSetSql(GridView4StrSQL);//调用DataBase类方法GetDataSetSql方法查询数据
        GridView4.DataSource = myds4.Tables[0].DefaultView;//为填空题GridView控件设置数据源
        GridView4.DataBind();//绑定数据
        string GridView5StrSQL = "select * from QuestionProblemmr";//根据参数设置查询问答题Sql语句
        DataSet myds5 = database.GetDataSetSql(GridView5StrSQL);//调用DataBase类方法GetDataSetSql方法查询数据
        GridView5.DataSource = myds5.Tables[0].DefaultView;//为问答题GridView控件设置数据源
        GridView5.DataBind();//绑定数据
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
        //创建数据阅读器
        SqlDataReader read = ExceRead("select * from Papermr where PaperName='" + this.txtPaperName.Text + "'");
        read.Read();                                                            //打开数据阅读器
        if (read.HasRows)                                                       //判断是否有数据
        {
            if (this.txtPaperName.Text == read["PaperName"].ToString())
            {
                //弹出AJAX环境中的对话框
                ac.OpenDialogForButton((Button)sender, "很遗憾！该试卷名称已经存在！！！");
            }
        }
        else
        {
            //弹出AJAX环境中的对话框
            ac.OpenDialogForButton((Button)sender, "恭喜您！该试卷名称可以添加！！！");
        }
        read.Close();                                                           //关闭数据阅读器
    }
    public SqlDataReader ExceRead(string strsql)
    {
        string connStr = ConfigurationSettings.AppSettings["strCon"]; 
        SqlConnection con = new SqlConnection(connStr);
        con.Open();
        //创建一个SqlCommand对象，表示要执行的SqlCom语句或存储过程
        SqlCommand sqlcom = new SqlCommand(strsql, con);
        SqlDataReader read = sqlcom.ExecuteReader();
        return read;
    }
    //将生成试卷保存到数据库
    protected void imgBtnSave_Click(object sender, EventArgs e)
    {
        DataBase database = new DataBase();//实例化公共类DataBase
        AjaxCommond ac = new AjaxCommond();//实例化公共类AjaxCommond
        string insertExamPage = "insert into Papermr(CourseID,PaperName,PaperState) values(" + int.Parse(MyddlCourse.SelectedValue) + ",'" + txtPaperName.Text + "',1) SELECT @@IDENTITY as id";
        int autopageID = GetIDInsert(insertExamPage);//保存试卷，并返回自动生成的试卷编号
        if (autopageID > 0)
        {
            //生成单选题信息，并保存在数据库中
            for (int i = 0; i < this.GridView1.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelect1")).Checked;
                if (isChecked)
                {
                    string sqlstr1 = ((Label)GridView1.Rows[i].FindControl("Label3")).Text;
                    string singlepaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'单选题'," + sqlstr1 + "," + int.Parse(txtSingleFen.Text) + ")";
                    database.Insert(singlepaper);
                }
            }
            //生成多选题信息，并保存在数据库中
            for (int i = 0; i < this.GridView2.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView2.Rows[i].FindControl("chkSelect2")).Checked;
                if (isChecked)
                {
                    string sqlstr2 = ((Label)GridView2.Rows[i].FindControl("Label6")).Text;
                    string multipaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'多选题'," + sqlstr2 + "," + int.Parse(txtMultiFen.Text) + ")";
                    database.Insert(multipaper);
                }
            }
            //生成判断题信息，并保存在数据库中
            for (int i = 0; i < this.GridView3.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView3.Rows[i].FindControl("chkSelect3")).Checked;
                if (isChecked)
                {
                    string sqlstr3 = ((Label)GridView3.Rows[i].FindControl("Label7")).Text;
                    string judgepaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'判断题'," + sqlstr3 + "," + int.Parse(txtJudgeFen.Text) + ")";
                    database.Insert(judgepaper);
                }
            }
            //生成填空题信息，并保存在数据库中
            for (int i = 0; i < this.GridView4.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView4.Rows[i].FindControl("chkSelect4")).Checked;
                if (isChecked)
                {
                    string sqlstr4 = ((Label)GridView4.Rows[i].FindControl("Label8")).Text;
                    string fillpaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'填空题'," + sqlstr4 + "," + int.Parse(txtFillFen.Text) + ")";
                    database.Insert(fillpaper);
                }
            }
            //生成问答题信息，并保存在数据库中
            for (int i = 0; i < this.GridView5.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView5.Rows[i].FindControl("chkSelect5")).Checked;
                if (isChecked)
                {
                    string sqlstr5 = ((Label)GridView5.Rows[i].FindControl("Label23")).Text;
                    string quepaper = "insert into PaperDetailmr(PaperID,Type,TitleID,Mark) values(" + autopageID + ",'问答题'," + sqlstr5 + "," + int.Parse(txtQuestionFen.Text) + ")";
                    database.Insert(quepaper);
                }
            }
        }
        //弹出ajax环境中的提示对话框
        ac.OpenDialogForButton((Button)sender, "数据保存成功！");
        //跳转到试卷维护页
        Response.Redirect("PaperLists.aspx");
    }
}
