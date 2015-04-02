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

public partial class user_ideaFrame : System.Web.UI.Page
{
    public  string Url;
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = Request["type"];
        if (type == "video")
        {
            Url = "amendVideoInfo.aspx";
        }else
            if (type == "idea")
            {
                Url = "revertIdea.aspx";
            }
    }
}
