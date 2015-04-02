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
using System.IO;

public partial class WebUserControlLoopAD : System.Web.UI.UserControl
{
    public string loopId;
    public string str;
    protected void Page_Load(object sender, EventArgs e)
    {
        string rd=DateTime.Now.Ticks.ToString();
        str = "img/1.jpg?rd=" + rd + "|img/2.jpg?rd=" + rd + "|img/3.jpg?rd=" + rd + "|img/4.jpg?rd=" + rd + "";



        string path = Server.MapPath("./") + "tool/LoopId.txt";
        loopId = File.ReadAllText(path);
        loopId = loopId.Replace(',', '|');
      
    }
}
