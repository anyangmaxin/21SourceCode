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
using System.Data.SqlClient;//引入命名空间
public partial class DefaultNewPage : System.Web.UI.Page
{
    EP ep = new EP();//实例化对象
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null && Session["UserPwd"] == null)
        {
            //弹出对话框显示“对不起！您还没有登录”提示信息，并且将页面跳转到用户登录页面中
            Response.Write("<script lanuage='javaScript'>alert('对不起！您还没有登录！');location='UserLogin.aspx'</script>");
        }
        else
        {
            if (Request["gonggaoid"] != null)
            {
                DataSet ds = ep.ReturnDataSet("select * from tb_gonggao where id='" + Request["gonggaoid"] + "'", "tb_gonggao");
                DataRowView rv = ds.Tables["tb_gonggao"].DefaultView[0];
                LblTitle.Text = rv["title"].ToString();
                lblContent.Text = rv["content"].ToString();
            }
            if (Request["newid"] != null)
            {
                DataSet ds = ep.ReturnDataSet("select * from tb_New where id='" + Request["newid"] + "'", "tb_New");
                DataRowView rv = ds.Tables["tb_New"].DefaultView[0];
                LblTitle.Text = rv["title"].ToString();
                lblContent.Text = rv["content"].ToString();
            }

            DataSet ds1 = ep.ReturnDataSet("select  * from tb_Tools order by UPTime desc", "tb_Tools");
            DataList1.DataSource = ds1;
            DataList1.DataBind();
        }

    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
