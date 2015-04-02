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

public partial class manage_asveTaxis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        saveMonthPlaySum();
    }


   
    protected void saveMonthPlaySum()
    {       

	string sqlDel = "delete from videoTaxis where videoType='" + ddlType.SelectedValue + "'";
        operateData.execSql(sqlDel);
        string sqlInsert = "insert into videoTaxis(videoId,videoType,videoTitle,playSum,taxisMonth) select top 10 id,videoType,videoTitle,monthSum,'" + DateTime.Now.Month + "' from videoInfo where videoType='" + ddlType.SelectedValue + "' order by monthSum desc";
        if(operateData.execSql(sqlInsert))
        {
            string sqlUpd = "update videoInfo set MonthSum=0 where videoType='" + ddlType.SelectedValue + "'";
            operateData.execSql(sqlUpd);
            RegisterStartupScript("true","<script>alert('保存成功！')</script>");
        }else{
            RegisterStartupScript("false","<script>alert('保存失败！')</script>");
        }
      
    }
}
