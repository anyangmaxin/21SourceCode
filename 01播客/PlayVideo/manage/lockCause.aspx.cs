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

public partial class manage_lockCause : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.txtCause.Text = "您发布了非法信息，账号被冻结";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string userName = Request["userName"].ToString();
        string sqlUpd = "update userRegister set lockCause='" + txtCause.Text + "' where userName='" + userName + "' ";
        operateData.execSql(sqlUpd);
        Response.Write("<script>window.close();</script>");
                
    }
}
