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
            //应用Session记录用户ID号
            string loginName = Session["userID"].ToString();
            //实例化公共类Usersmr
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            //显示登录的用户角色
            labUser.Text = user.UserName;
            //调用自定义方法InitData()进行权限设置
            InitData();
        }
    }
    //自定义方法InitData()进行权限设置
    private void InitData()
    {
        //创建一个DataTable类型的变量存储哈希表中数据
        DataTable dt = Rolemr.Query(new Hashtable());
        //将创建的dt作为数据源
        GV.DataSource = dt;
        //从数据库中绑定GridView控件中数据
        GV.DataBind();
        //循环GridView控件中的CheckBox控件
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //部门管理
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_DepartmentManage") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkDepartmentManage")).Checked = true;
            //用户管理
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_UserManage") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkUserManage")).Checked = true;
            //考试科目管理
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_CourseManage") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkCourseManage")).Checked = true;
            //试卷制定维护
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_PaperSetup") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkPaperSetup")).Checked = true;
            //用户试卷管理
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_UserPaperList") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkUserPaperList")).Checked = true;
            //试题类别管理
            if (OnLineExam.HelperClass.GetSafeData.ValidateDataRow_N(dt.Rows[i], "HasDuty_SingleSelectManage") == 1)
                ((CheckBox)GV.Rows[i].FindControl("chkTypeManage")).Checked = true;
        }
    }
    protected void ImageButtonGiant_Click(object sender, ImageClickEventArgs e)
    {
        //定义一个哈希表ht
        Hashtable ht = new Hashtable();
        string where = "";
        //应用foreach循环GridView控件中的CheckBox控件
        foreach (GridViewRow row in GV.Rows)
        {
            //先清空下哈希表中的数据
            ht.Clear();
            //应用FindControl方法查找GridView控件中CheckBox控件,并判断是否选中了种用户权限
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
            //定义一个查询的条件语句
            where = " Where RoleId=" + row.Cells[0].Text;
            //调用Rolemr公共类中的Update方法修改角色权限信息
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
        //执行循环，保证每条数据都可以更新
        for (i = 0; i < GV.Rows.Count; i++)
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
}
