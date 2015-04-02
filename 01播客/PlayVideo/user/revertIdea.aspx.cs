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

public partial class user_revertIdea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtContent.Text = Session["content"].ToString();    
        }
        
    }
    protected void btnRevert_Click(object sender, EventArgs e)
    {
        if (Session["content"] !=null)
        {
            string content = Session["content"].ToString();
            content = txtContent.Text;
            string userName=Session["userName"].ToString();
            string videoId = Session["ideaId"].ToString();
            DateTime date=DateTime.Now;
            string sqlInsert = "insert into videoIdea values('" + userName + "','" + content + "'," + videoId + ",'" + date + "')";
            if (operateData.execSql(sqlInsert))
            {
                RegisterStartupScript("true", "<script>alert('回复成功！');window.dialogArguments.document.location.href=window.dialogArguments.document.location='userIdea.aspx';window.close();</script>");
            }
            else
            {
                RegisterStartupScript("false", "<script>alert('回复失败！')</script>");
            }           
            
        }
    }
}
