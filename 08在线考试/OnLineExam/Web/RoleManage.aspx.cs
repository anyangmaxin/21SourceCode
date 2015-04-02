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

public partial class Web_RoleManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Ӧ��Session��¼�û�ID��
            string loginName = Session["userID"].ToString();
            //ʵ����������Usersmr
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            //��ʾ��¼���û���ɫ
            labUser.Text = user.UserName;
            //�����Զ��巽��InitData()����Ȩ������
            InitData();
        }
    }
    //�Զ��巽��InitData()����Ȩ������
    private void InitData()
    {
        //����һ��DataTable���͵ı����洢��ϣ��������
        DataTable dt = Rolemr.Query(new Hashtable());
        //��������dt��Ϊ����Դ
        GV.DataSource = dt;
        //�����ݿ��а�GridView�ؼ�������
        GV.DataBind();
        //ѭ��GridView�ؼ��е�CheckBox�ؼ�
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //���Ź���
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_DepartmentManage") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkDepartmentManage")).Checked = true;
            //�û�����
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_UserManage") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkUserManage")).Checked = true;
            //���Կ�Ŀ����
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_CourseManage") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkCourseManage")).Checked = true;
            //�Ծ��ƶ�ά��
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_PaperSetup") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkPaperSetup")).Checked = true;
            //�û��Ծ����
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_UserPaperList") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkUserPaperList")).Checked = true;
            //����������
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_SingleSelectManage") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkTypeManage")).Checked = true;
        }
    }
    protected void ImageButtonGiant_Click(object sender, ImageClickEventArgs e)
    {
        //����һ����ϣ��ht
        Hashtable ht = new Hashtable();
        string where = "";
        //Ӧ��foreachѭ��GridView�ؼ��е�CheckBox�ؼ�
        foreach (GridViewRow row in GV.Rows)
        {
            //������¹�ϣ���е�����
            ht.Clear();
            //Ӧ��FindControl��������GridView�ؼ���CheckBox�ؼ�,���ж��Ƿ�ѡ�������û�Ȩ��
            ht.Add("HasDuty_DepartmentManage", ((CheckBox)row.FindControl("chkDepartmentManage")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_UserManage", ((CheckBox)row.FindControl("chkUserManage")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_RoleManage", ((CheckBox)row.FindControl("chkUserManage")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_Role", ((CheckBox)row.FindControl("chkUserManage")).Checked == true ? 1 : 0); 
            ht.Add("HasDuty_CourseManage", ((CheckBox)row.FindControl("chkCourseManage")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_PaperSetup", ((CheckBox)row.FindControl("chkPaperSetup")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_PaperLists", ((CheckBox)row.FindControl("chkPaperSetup")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_UserPaperList", ((CheckBox)row.FindControl("chkUserPaperList")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_UserScore", ((CheckBox)row.FindControl("chkUserPaperList")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_SingleSelectManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_MultiSelectManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_FillBlankManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_JudgeManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
            ht.Add("HasDuty_QuestionManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
            //����һ����ѯ���������
            where = " Where RoleId=" + row.Cells[0].Text;
            //����Rolemr�������е�Update�����޸Ľ�ɫȨ����Ϣ
            Rolemr.Update(ht, where);
        }
    }
    protected void GV_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GV.PageIndex = e.NewPageIndex;
        InitData();
    }
    protected void GV_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int i;
        //ִ��ѭ������֤ÿ�����ݶ����Ը���
        for (i = 0; i < GV.Rows.Count; i++)
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
