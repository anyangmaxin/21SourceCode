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
using System.Threading;
using OnLineExam.AjaxClass;

public partial class Web_UserManage : System.Web.UI.Page
{
    AjaxCommond ajaxDialog = new AjaxCommond();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;
            GridViewBind();
        }
        ImageButtonResetPassword.Attributes.Add("onClick", "javascript:return confirm('确定重置密码?');");
        ImageButtonDelete.Attributes.Add("onclick", "javascript:return confirm('确定删除?');");
    }
    private void GridViewBind()
    {
        Usersmr user = new Usersmr();//创建Usersmr类对象user
        DataSet myds = user.QueryUsers();//使用Usersmr类QueryUsers方法查询所有用户信息
        GridView1.DataSource = myds;//为GridView控件指名数据源
        GridView1.DataBind();//GridView控件绑定数据
        LabelPageInfo.Text = "你所在的位置：当前（第" + (GridView1.PageIndex + 1).ToString() + "页 共" + GridView1.PageCount.ToString() + "页）";
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (((DropDownList)e.Row.FindControl("ddlRole")) != null)
        {
            DropDownList myddlrole = (DropDownList)e.Row.FindControl("ddlRole");

              //生成 DropDownList 的值，绑定数据
            string connStr = ConfigurationSettings.AppSettings["strCon"]; 
            DataSet myds = new DataSet();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State.ToString() == "Closed") conn.Open();
            string strsql = "SELECT Rolemr.RoleId,Rolemr.RoleName FROM Rolemr";
            SqlDataAdapter da = new SqlDataAdapter(strsql, conn);
            da.Fill(myds);
            if (conn.State.ToString() == "Open") conn.Close();

            myddlrole.DataSource = myds.Tables[0].DefaultView;
            myddlrole.DataTextField = "RoleName";
            myddlrole.DataValueField = "RoleId";
            myddlrole.DataBind();
        }
        if (((DropDownList)e.Row.FindControl("ddlDepartment")) != null)
        {
            DropDownList ddldepartment = (DropDownList)e.Row.FindControl("ddlDepartment");

            //  生成 DropDownList 的值，绑定数据
            string connStr = ConfigurationSettings.AppSettings["strCon"];
            DataSet myds = new DataSet();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State.ToString() == "Closed") conn.Open();
            string sqlstr = "SELECT DepartmentId,DepartmentName FROM Departmentmr";
            SqlDataAdapter da = new SqlDataAdapter(sqlstr, conn);
            da.Fill(myds);
            if (conn.State.ToString() == "Open") conn.Close();

            ddldepartment.DataSource = myds.Tables[0].DefaultView;
            ddldepartment.DataTextField = "DepartmentName";
            ddldepartment.DataValueField = "DepartmentId";
            ddldepartment.DataBind();
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
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridViewBind();
    }
    //GridView控件RowDeleting事件
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //取出要删除记录的主键值
        Usersmr user = new Usersmr();//创建Usersmr类对象user
        if (user.DeleteByProc(userID))//根据主键使用DeleteByProc方法删除用户
        {
            ajaxDialog.OpenDialogForPage(Page, "删除成功!");
        }
        else
        {
            ajaxDialog.OpenDialogForPage(Page, "删除失败!");
        }
        GridView1.EditIndex = -1;
        GridViewBind();//重新绑定数据

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  //GridView编辑项索引等于单击行的索引
        GridViewBind();
    }

    //GridView控件RowUpdating事件
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //取出记录的主键值
        Usersmr user = new Usersmr();
        user.UserName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("tbxName")).Text;
        user.RoleId = Convert.ToInt32(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlRole")).SelectedValue);   //取出修改后的值
        user.DepartmentId = Convert.ToInt32(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlDepartment")).SelectedValue);   //取出修改后的值
        if (user.UpdateByProc(userID))//使用Usersmr类UpdateByProc方法修改用户信息
        {
            GridViewBind();
            ajaxDialog.OpenDialogForPage(Page, "修改成功!");
        }
        else
        {
            ajaxDialog.OpenDialogForPage(Page, "修改失败!");
        }
        GridView1.EditIndex = -1;
        GridViewBind();
    }
    protected void ImageButtonQuery_Click(object sender, ImageClickEventArgs e)
    {
        //AjaxCommond ajaxDialog=new AjaxCommond();
        //Thread.Sleep(5000);// 延迟5秒钟。
        Hashtable myqueryItems  = new Hashtable();
        myqueryItems .Add("UserID", tbxUserID.Text.Trim());
        myqueryItems .Add("UserName", tbxUserName.Text.Trim());
        DataTable dt = OnLineExam.BusinessClass.Usersmr.QueryUsers(myqueryItems );
        if (dt.Rows.Count >= 1)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            ajaxDialog.OpenDialogForPage(Page,"没有这个用户!");
        }
    }
   
    protected void ImageButtonDelete_Click(object sender, ImageClickEventArgs e)
    {
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
            if (isChecked)
            {
                string userID = ((Label)GridView1.Rows[i].FindControl("Label1")).Text;
                Usersmr user = new Usersmr();//创建Usersmr类对象user
                if (user.DeleteByProc(userID))//根据主键使用DeleteByProc方法删除用户
                {
                    Response.Write("<script language=javascript>alert('删除成功!');location='UserManage.aspx';</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('" + userID + "删除失败!');location='UserManage.aspx';</script>");
                }

            }
        }
        GridViewBind();
    }
    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked = this.chkSelectAll.Checked;
        }
    }
    protected void ImageButtonResetPassword_Click(object sender, ImageClickEventArgs e)
    {
        int numOfChecked = 0;
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
            if (isChecked)
            {
                numOfChecked++;
            }     
        }               
      if (numOfChecked == 1)
      {
          for (int i = 0; i < this.GridView1.Rows.Count; i++)
          {
               bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
               if (isChecked)
               {
                   string UserID = ((Label)GridView1.Rows[i].FindControl("Label1")).Text;

                   Random ran = new Random();
                   string newPassword = (ran.Next(999999).ToString().PadLeft(6, '8'));	//随机生成一个密码

                   Usersmr user = new Usersmr();//创建Usersmr对象user
                   string pwdMd5 = user.GetMd5(newPassword);
                   user.UserPwd = pwdMd5.ToString().Trim();
                   if (user.ModifyPassword(UserID))//更改用户密码
                   {
                       Response.Write("<Script language=JavaScript>alert('" + UserID + "的密码已经重置，新密码为【" + newPassword + "】。');location='UserManage.aspx';</Script>");
                   }
                   else//修改密码失败
                   {
                       Response.Write("<Script language=JavaScript>alert('" + UserID + "重置密码失败!');location='UserManage.aspx';</Script>");
                   }
               }
               else
               {
                   isChecked = false;//取消选中
               }
          }   
              
       }
        else 
            {
                Response.Write("<Script language=JavaScript>alert('您只能选择一个用户!');;location='UserManage.aspx';</Script>");
                return;
            }
        }
    protected void ImageButtonBack_Click(object sender, ImageClickEventArgs e)
    {       
        GridViewBind();
    }
}
       
  

