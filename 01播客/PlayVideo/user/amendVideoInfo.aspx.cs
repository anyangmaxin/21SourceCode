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
using System.Data.SqlClient;

public partial class user_revertVideoInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindVideoInfo();    //调用自定义方法显示视频详细信息
        }
        
    }
    protected void btnAmend_Click(object sender, EventArgs e)
    {
        //获取视频的标题
        string videoTitle = txtTitle.Text;
        //获取视频内容
        string videoContent = txtContent.Text;
        //获取视频类型
        string videoType = "";
        int count = RadioButtonList1.Items.Count;
        for (int i = 0; i < count; i++)
        {
            if (RadioButtonList1.Items[i].Selected)
            {
                videoType = RadioButtonList1.Items[i].Value;
                break;
            }            
        }
        //编写SQL语句，更新视频的信息
        string sqlUpd = "update videoInfo set videoTitle='" + videoTitle + "',videoContent='" + videoContent + "',videoType='" + videoType + "' where id="+Session["videoId"]+" ";
        //判读更新是否成功
        if (operateData.execSql(sqlUpd))
        {
            RegisterStartupScript("true", "<script>alert('修改成功！');window.dialogArguments.document.location.href=window.dialogArguments.document.location='userIndex.aspx';window.close();</script>");
        }
        else {
            RegisterStartupScript("true", "<script>alert('修改失败！')</script>");
        }

       
    }

    protected void bindVideoInfo()
    {
        //编写SQL语句，查询指定视频的详细信息
        string sqlSel = "select * from videoInfo where id=" + Session["videoId"] + "";
        //调用公共类中的getRow方法执行SQL语句并接收该方法返回的SqlDataReader对象
        SqlDataReader sdr = operateData.getRow(sqlSel);
        //读取一条记录
        sdr.Read();
        //获取视频名称
        txtTitle.Text = sdr["videoTitle"].ToString();
        //获取视频内容
        txtContent.Text = sdr["videoContent"].ToString();
        //显示视频类型
        int count = RadioButtonList1.Items.Count;
        for (int i = 0; i < count; i++)
        {
            if (RadioButtonList1.Items[i].Value == sdr["videoType"].ToString().Trim())
            {
                RadioButtonList1.Items[i].Selected = true;
                break;
               
            }            
        }        
        sdr.Close();
    }
}
