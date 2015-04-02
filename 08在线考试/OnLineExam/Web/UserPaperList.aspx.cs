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

public partial class Web_UserPaperList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            InitData();         
        }
    }
    //��ʼ���Ծ���
    protected void InitData()
    {
        Papermr paper = new Papermr();
        DataSet ds = paper.QueryUserPaperList();    
        GridView1.DataSource = ds;         
        GridView1.DataBind();
        LabelPageInfo.Text = "��ǰ����" + (GridView1.PageIndex + 1).ToString() + "ҳ ��" + GridView1.PageCount.ToString() + "ҳ��";
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string UserID = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //ȡ��Ҫɾ����¼������ֵ1
        int PaperID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[1].ToString().Trim());//ȡ��Ҫɾ����¼������ֵ2
        Papermr paper = new Papermr();
        if (paper.DeleteByProc(UserID, PaperID))
        {
            Response.Write("<script language=javascript>alert('�ɹ�ɾ����')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('ɾ��ʧ�ܣ�')</script>");
        }
        InitData();
    }
}
