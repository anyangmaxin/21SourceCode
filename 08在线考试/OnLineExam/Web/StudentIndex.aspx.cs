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
public partial class Web_StudentIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitData();//初始化科目列表框
            ScoreInitData();  //初始化成绩
            labUser.Text = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            string userid = Session["userID"].ToString();
            user.LoadData(userid);
            lblName.Text = user.UserName;
        }
    }
    //初始化考试科目下拉列表框
    protected void InitData()
    {
        Papermr paper = new Papermr();              //创建Papermr对象
        DataSet ds = paper.QueryPaper();        //查询所有可用试卷
        if (ds.Tables[0].Rows.Count >= 1)
        {
            ddlPaper.DataSource = ds;           //指名考试科目列表框数据源
            ddlPaper.DataTextField = "PaperName";   //DataTextField显示Name字段值
            ddlPaper.DataValueField = "PaperID";    //DataValueField显示ID字段值
            ddlPaper.DataBind();                //绑定数据
           
        }
        else
        {
            ddlPaper.Enabled = false;
            ImgStartExam.Enabled = false;
            lblMessage.Text = "没有试卷！";
        }
    }
    protected void ScoreInitData()//初始化成绩
    {
        Scoresmr score = new Scoresmr();        //创建Scoresmr对象       
        DataSet ds = score.QueryUserScore(Session["userID"].ToString());
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;          //为GridView控件指名数据源        
            GridView1.DataBind();               //绑定数据
        }
        else
        {
            lblScore.Text="没有成绩!";
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        ScoreInitData();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[6].ToolTip = e.Row.Cells[6].Text;
            if ((e.Row.Cells[6].Text).Length > 20)
            {
                e.Row.Cells[6].Text = (e.Row.Cells[6].Text).Substring(0, 20) + "...";
            }
        }
        int i;
        //执行循环，保证每条数据都可以更新
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            }
        }
    }
    protected void exit_Click(object sender, EventArgs e)
    {
        Session["userID"] = Session["PaperID"]= Session["PaperName"]= "";
        Session.Clear();
        Session.Abandon();
        Response.Write("<script language=javascript>location='Login.aspx'</script>");
    }
    protected void imgBtnModifyPwd_Click1(object sender, ImageClickEventArgs e)
    {
        Usersmr user = new Usersmr();//创建Usersmr对象user
        user.LoadData(Session["userID"].ToString());
        //string txtOldPwdMd5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtOldPwd.Text.Trim(), "MD5").ToString();
        string txtOldPwdMd5 = user.GetMd5(txtOldPwd.Text.Trim());
        if (user.UserPwd==txtOldPwdMd5)//验证用户输入原密码是否正确
        {
            //string txtNewPwdMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewPwd.Text.Trim(), "MD5").ToString();
            string txtNewPwdMD5 = user.GetMd5(txtNewPwd.Text.Trim());
            user.UserPwd = txtNewPwdMD5;
            if (user.ModifyPassword(this.Session["userID"].ToString()))//更改用户密码
            {
                lblPwd.Text = "成功修改密码!";
            }
            else//修改密码失败
            {
                lblPwd.Text = "修改密码失败!";
            }
        }
        else//原密码错误
        {
            lblPwd.Text = "输入原密码错误,请重新输入!";
        }
    }
    protected void imgBtnReset_Click(object sender, ImageClickEventArgs e)
    {
        txtOldPwd.Text = txtNewPwd.Text = txtConfirmPwd.Text = "";
    }
    protected void ImgStartExam_Click(object sender, ImageClickEventArgs e)
    {
        Usersmr user = new Usersmr();
        if (user.IsTest(Session["userID"].ToString().Trim(), Convert.ToInt32(ddlPaper.SelectedValue)))
        {
            lblMessage.Text = "您已经考试过了,不能再考试！";
        }
        else
        {
            Session["PaperID"] = ddlPaper.SelectedValue;
            Session["PaperName"] = ddlPaper.SelectedItem.Text;
            Response.Redirect("UserTest.aspx");    //转向考试界面       
        }
    }
}
