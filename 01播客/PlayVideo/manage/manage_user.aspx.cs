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

public partial class manage_manage_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //调用自定义方法显示用户信息  
         bindGvUser();
        
       
    }
    //自定义方法将用户信息绑定到GridView控件上
    protected void bindGvUser()
    {
        //编写SQL语句，查询用户的详细信息
        string sqlSel = "select a.userName,a.lock,b.nickname,b.sumMark,b.registerDate from userRegister as a join userInfo as b on a.userName=b.userName";
        //设置GridView控件的数据源
        gvUser.DataSource = operateData.getRows(sqlSel);
        //设置GridView控件的主键
        gvUser.DataKeyNames = new string[] { "userName" };
        gvUser.DataBind();
    }
    protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //设置当前显示页的索引
        gvUser.PageIndex = e.NewPageIndex;
        gvUser.DataBind();
    }
    protected void gvUser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //判读当前用户是否已背锁定
            if (e.Row.Cells[4].Text=="False")
            {
                //显示锁定文字
                e.Row.Cells[4].Text = "未锁定";
            }
            else {
                e.Row.Cells[4].Text = "已锁定";
                //设置当前行的背景颜色
                e.Row.BackColor = System.Drawing.Color.CadetBlue;
            }
        }
    }
    protected void gvUser_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //获取当前行用户的编号
        string userName = gvUser.DataKeys[e.NewSelectedIndex].Value.ToString();
        //编写SQL语句，查询当前行的用户锁定状态
        string sqlSel = "select lock from userRegister where userName='" + userName+"'";
        //获取锁定状态
        string userLock = operateData.getTier(sqlSel);
        //判读是否已被锁定
        if (userLock == "False")
        {
            //打开锁定原因窗口
            RegisterStartupScript("false", "<script>window.open('lockCause.aspx?userName=" +userName + "','','width=310,height=190')</script>");
            //设置为锁定
            userLock = "1";
        }
        else
        {
            //设置为未锁定
            userLock = "0";
        }
        //编写SQL语句，更新当前用户的锁定状态
        string sqlUpd = "update userRegister set lock='" + userLock + "' where userName='" + userName + "'";
        operateData.execSql(sqlUpd);
        //调用自定义方法显示用户信息
        bindGvUser();
    }
    protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //获取当前行用户的编号
        string userName = gvUser.DataKeys[e.RowIndex].Value.ToString();
        //编写SQL语句，删除指定编号的用户信息 
        string sqlDel = "delete from userRegister where userName='" + userName + "'";
        if (operateData.execSql(sqlDel))
        {
            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        //调用自定义方法显示用户信息
        bindGvUser();        
    }
}
