using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Photo_slide : System.Web.UI.Page
{
    public int categoryID = -1;
    public string categoryName = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["CategoryID"] != null)
        {
            categoryID = Int32.Parse(Request.Params["CategoryID"].ToString());
            if (Request.Params["CategoryName"] != null)
            {
                categoryName = Request.Params["CategoryName"].ToString();
                hlk_cname.Text = categoryName;
                hlk_cname.NavigateUrl = "~/Photo_list.aspx?CategoryID=" + categoryID.ToString() + "&CategoryName=" + categoryName; 
            }
        }
        if (categoryID > 0)
        {
            ssePhoto.AutoPlay = true;
            ssePhoto.UseContextKey = true;
            ssePhoto.ContextKey = categoryID.ToString();
            return;
        }
    }
}
