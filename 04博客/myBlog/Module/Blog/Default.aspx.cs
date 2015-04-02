using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    public string loopId;
    public string str;
    protected void Page_Load(object sender, EventArgs e)
    {

        string rd = DateTime.Now.Ticks.ToString();
        str = "imgFile/1.jpg?rd=" + rd + "|imgFile/2.jpg?rd=" + rd + "|imgFile/3.jpg?rd=" + rd + "|imgFile/4.jpg?rd=" + rd + "";
        string path = Server.MapPath("./") + "imgFile/LoopId.txt";
        loopId = File.ReadAllText(path);
        loopId = loopId.Replace(',', '|');

    }
}
