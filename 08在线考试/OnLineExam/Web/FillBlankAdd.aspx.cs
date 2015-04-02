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
            InitDDLData();          //初始化考试科目下拉列表框          
            if (Request["ID"] != null)//如果是修改题目，初始化数据
            {
                InitData();
            }
        }
    }
    //初始化考试科目
    protected void InitDDLData()
    {
        Coursemr course = new Coursemr();       //创建考试科目对象
        DataSet ds = course.QueryCourse();  //查询考试科目信息
        ddlCourse.DataSource = ds;          //指名考试科目列表框数据源
        ddlCourse.DataTextField = "Name";   //DataTextField显示Name字段值
        ddlCourse.DataValueField = "ID";    //DataValueField显示ID字段值
        ddlCourse.DataBind();               //绑定数据
    }
    //初始化数据
    protected void InitData()
    {
        int fillblankProblemID = int.Parse(Request["ID"].ToString());  //取出传递过来的试题编号
        FillBlankProblemmr fillblankproblem = new FillBlankProblemmr();    //创建填空题对象
        if (fillblankproblem.LoadData(fillblankProblemID))                //如果取出题目信息，分别放在相应控件显示
        {
            ddlCourse.SelectedValue = fillblankproblem.CourseID.ToString();
            txtFrontTitle.Text = fillblankproblem.FrontTitle;
            txtBackTitle.Text = fillblankproblem.BackTitle;
            txtAnswer.Text = fillblankproblem.Answer;
        }
        else                //查询出错，给出提示
        {
            lblMessage.Text = "加载数据出错！";
        }
    }
    //添加或修改事件
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsValid)
        {
            FillBlankProblemmr fillblankproblem = new FillBlankProblemmr();        //创建填空题对象
            fillblankproblem.CourseID = int.Parse(ddlCourse.SelectedValue);//为填空题对象各属性赋值
            fillblankproblem.FrontTitle = txtFrontTitle.Text;
            fillblankproblem.BackTitle = txtBackTitle.Text;
            fillblankproblem.Answer = txtAnswer.Text;
            if (Request["ID"] != null)                                  //如果是修改题目信息
            {
                fillblankproblem.ID = int.Parse(Request["ID"].ToString()); //取出试题主键
                if (fillblankproblem.UpdateByStr(int.Parse(Request["ID"].ToString())))//调用修改试题方法修改试题
                {
                    lblMessage.Text = "成功修改该填空题！";
                }
                else
                {
                    lblMessage.Text = "修改该填空题失败！";
                }
            }
            else                                                        //如果是添加试题
            {
                if (fillblankproblem.InsertByStr())                       //调用添加试题方法添加试题
                {
                    lblMessage.Text = "成功添加该填空题！";
                }
                else
                {
                    lblMessage.Text = "添加该填空题失败！";
                }
            }
        }
    }
    protected void imgBtnReturn_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("FillBlankManage.aspx");
    }
}
