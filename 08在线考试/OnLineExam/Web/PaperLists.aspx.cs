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
using OnLineExam.DataBaseClass;
using OnLineExam.BusinessClass;
using System.Data.SqlClient;

public partial class Web_PaperLists : System.Web.UI.Page
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
    protected void InitData()
    {
        Papermr paper = new Papermr();
        DataSet ds = paper.QueryAllPaper();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            lblMessage.Text = "û���Ծ�!";
        }
    }
    //GridView�ؼ�RowCanceling�¼�
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        InitData();
    }
    //GridView�ؼ�RowDeleting�¼�
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Papermr paper = new Papermr();      //����Papermr����
        int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //ȡ��Ҫɾ����¼������ֵ
        if (paper.DeleteByStr(ID))
        {
            Response.Write("<script language=javascript>alert('�ɹ�ɾ�����Ծ�')</script>");          
        }
        else
        {
            Response.Write("<script language=javascript>alert('ɾ���Ծ�ʧ�ܣ�')</script>");
            
        }
        //InitData();
        Response.Redirect("PaperLists.aspx");
       
    }
    //GridView�ؼ�RowUpdating�¼�
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //ȡ��Ҫɾ����¼������ֵ
        int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); 
        //����Papermr����
        Papermr paper = new Papermr();
        //Ӧ��FindControl����GridView�ؼ��е�DropDownList���������б��е�ֵת����byte���͸��蹫����Papermr�е�PaperState�Ծ�״̬����
        paper.PaperState = byte.Parse(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlPaperState")).SelectedValue);
        //ʹ��Papermr��UpdateByProc�����޸��Ծ�״̬
        if (paper.UpdateByStr(ID))
        {
            Response.Write("<script language=javascript>alert('�Ծ�״̬�޸ĳɹ�!')</script>");            
        }
        else
        {
            Response.Write("<script language=javascript>alert('�Ծ�״̬�޸�ʧ��!')</script>");
        }
        //ȡ���༭����
        GridView1.EditIndex = -1;
        //�����Զ��巽��InitData()���°�GridView�ؼ�����Ϣ
        InitData();
    }
    //GridView�ؼ�RowEditing�¼�
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //GridView�༭���������ڵ����е�����
        GridView1.EditIndex = e.NewEditIndex;  
        InitData();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        InitData();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {           
           if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                ((LinkButton)e.Row.Cells[6].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('��ȷ��Ҫɾ����?')");
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
}
