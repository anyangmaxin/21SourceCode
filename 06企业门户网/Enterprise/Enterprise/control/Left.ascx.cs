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
using System.Data.SqlClient;//引入命名空间
public partial class control_WebUserControl : System.Web.UI.UserControl
{
    EP ep = new EP();//实例化一个对象
    protected void Page_Load(object sender, EventArgs e)
    {
        ep.EXECDataList(DLGongGao, "select top 5 * from tb_gonggao order by gtime desc", "id");//显示网站公告
        ep.EXECDataList(DlToolsDownLoad, "select top 5 * from tb_tools where Type='软件' order by point desc", "Id");//显示软件下载排行
        ep.EXECDataList(DataList2, "select top 3 * from tb_tools where Type='补丁' order by point desc", "Id");//显示补丁下载排行
    }
    protected void DLGongGao_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        string idGongGao = DLGongGao.DataKeys[e.Item.ItemIndex].ToString();
        Response.Redirect("DefaultNewPage.aspx?gonggaoid=" + idGongGao + "");
    }
    protected void DlToolsDownLoad_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        string IdToolsDownLoad = DlToolsDownLoad.DataKeys[e.Item.ItemIndex].ToString();
        Response.Redirect("list_softdownload.aspx?downloadid=" + IdToolsDownLoad + "");
    }
    protected void DataList2_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        string IdToolsMend = this.DataList2.DataKeys[e.Item.ItemIndex].ToString().Trim();
        Response.Redirect("list_softdownload.aspx?IdToolsMend=" + IdToolsMend + "");
    }
}
