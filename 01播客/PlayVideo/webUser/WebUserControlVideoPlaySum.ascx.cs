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

public partial class WebUserControlVideoPlaySum : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlSel = "select top 8 * from videoInfo where Auditing='1' order by playSum desc ";
        dlplaySum.DataSource = operateData.getRows(sqlSel);
        dlplaySum.DataBind();
    }
}
