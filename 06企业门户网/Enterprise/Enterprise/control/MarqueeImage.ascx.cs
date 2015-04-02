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

public partial class GameImage : System.Web.UI.UserControl
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = null;
        ds = ep.ReturnDataSet("select  * from tb_Tools order by UPTime desc", "tb_Tools");
        DataList1.DataSource = ds;
        DataList1.DataBind();
    }
   
}
