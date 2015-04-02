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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_PreRender(object sender, EventArgs e)
    { 
        BindDataList();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    private void BindDataList()
    {
        Album am = new Album();
        string sqlstr = "select A.*,"
                    + "(select count(*) from Photo B where B.CategoryID = A.ID) AS p_num,"
                    + "(select top 1 C.url from Photo C where C.CategoryID = A.ID) AS url "
                    + "from Photo_Category AS A "
                    + "where A.C_Status ='公开' "
                    + "and  A.ID in "
                    + "(select CategoryID from Photo)";
        DataSet ds = am.GetDataSet(sqlstr, "P_Category");
        if (ds.Tables[0].Rows.Count == 0)
        {
            divFlag.Style.Add("display", "block");
            hlk_Flag01.Text = "单击这里创建相册";
            hlk_Flag01.NavigateUrl = "Category.aspx";
            hlk_Flag02.Text = "单击这里上传照片";
            hlk_Flag02.NavigateUrl = "Photo_load.aspx";
        }
        else
        {
            lvCategory.DataSource = ds;
            lvCategory.DataBind();
        }
    }
}
