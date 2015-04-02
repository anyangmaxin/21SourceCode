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
            InitData();//��ʼ����Ŀ�б��
            ScoreInitData();  //��ʼ���ɼ�
            labUser.Text = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            string userid = Session["userID"].ToString();
            user.LoadData(userid);
            lblName.Text = user.UserName;
        }
    }
    //��ʼ�����Կ�Ŀ�����б��
    protected void InitData()
    {
        Papermr paper = new Papermr();              //����Papermr����
        DataSet ds = paper.QueryPaper();        //��ѯ���п����Ծ�
        if (ds.Tables[0].Rows.Count >= 1)
        {
            ddlPaper.DataSource = ds;           //ָ�����Կ�Ŀ�б������Դ
            ddlPaper.DataTextField = "PaperName";   //DataTextField��ʾName�ֶ�ֵ
            ddlPaper.DataValueField = "PaperID";    //DataValueField��ʾID�ֶ�ֵ
            ddlPaper.DataBind();                //������
           
        }
        else
        {
            ddlPaper.Enabled = false;
            ImgStartExam.Enabled = false;
            lblMessage.Text = "û���Ծ�";
        }
    }
    protected void ScoreInitData()//��ʼ���ɼ�
    {
        Scoresmr score = new Scoresmr();        //����Scoresmr����       
        DataSet ds = score.QueryUserScore(Session["userID"].ToString());
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;          //ΪGridView�ؼ�ָ������Դ        
            GridView1.DataBind();               //������
        }
        else
        {
            lblScore.Text="û�гɼ�!";
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
    protected void exit_Click(object sender, EventArgs e)
    {
        Session["userID"] = Session["PaperID"]= Session["PaperName"]= "";
        Session.Clear();
        Session.Abandon();
        Response.Write("<script language=javascript>location='Login.aspx'</script>");
    }
    protected void imgBtnModifyPwd_Click1(object sender, ImageClickEventArgs e)
    {
        Usersmr user = new Usersmr();//����Usersmr����user
        user.LoadData(Session["userID"].ToString());
        //string txtOldPwdMd5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtOldPwd.Text.Trim(), "MD5").ToString();
        string txtOldPwdMd5 = user.GetMd5(txtOldPwd.Text.Trim());
        if (user.UserPwd==txtOldPwdMd5)//��֤�û�����ԭ�����Ƿ���ȷ
        {
            //string txtNewPwdMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewPwd.Text.Trim(), "MD5").ToString();
            string txtNewPwdMD5 = user.GetMd5(txtNewPwd.Text.Trim());
            user.UserPwd = txtNewPwdMD5;
            if (user.ModifyPassword(this.Session["userID"].ToString()))//�����û�����
            {
                lblPwd.Text = "�ɹ��޸�����!";
            }
            else//�޸�����ʧ��
            {
                lblPwd.Text = "�޸�����ʧ��!";
            }
        }
        else//ԭ�������
        {
            lblPwd.Text = "����ԭ�������,����������!";
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
            lblMessage.Text = "���Ѿ����Թ���,�����ٿ��ԣ�";
        }
        else
        {
            Session["PaperID"] = ddlPaper.SelectedValue;
            Session["PaperName"] = ddlPaper.SelectedItem.Text;
            Response.Redirect("UserTest.aspx");    //ת���Խ���       
        }
    }
}
