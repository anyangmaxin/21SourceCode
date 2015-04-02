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

public partial class manage_manage_bulletin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnd_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string content = txtContent.Text;
        DateTime date = DateTime.Now;
        string sqlUpd = "update bulletin set title='" + title + "',content='" + content + "',issuanceDate='" + date + "' where id=1";
        if (operateData.execSql(sqlUpd))
        {
            RegisterStartupScript("true", "<script>alert('修改成功！')</script>");
        }
        else {
            RegisterStartupScript("false", "<script>alert('修改失败！')</script>");
        }
       
    }
}
