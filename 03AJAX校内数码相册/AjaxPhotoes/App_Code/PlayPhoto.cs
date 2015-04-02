using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
//引入命名空间
using System.Data;
using AjaxControlToolkit;

/// <summary>
///PlayPhoto 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。 
[System.Web.Script.Services.ScriptService]
public class PlayPhoto : System.Web.Services.WebService
{
    [WebMethod]  
    [System.Web.Script.Services.ScriptMethod()]
    public AjaxControlToolkit.Slide[] GetPhotos(string contextKey)
    {
        //判断参数是否为空
        if (string.IsNullOrEmpty(contextKey)) return null;
        int categoryID = -1;
        //将获取到的分类ID赋予变量
        if (!Int32.TryParse(contextKey, out categoryID)) return null;
        //获取分类包含的照片
        Album am = new Album();
        DataSet ds = am.ShowPhoto(categoryID);
        if (ds == null || ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0) return null;
        //创建图片数组
        Slide[] photos = new Slide[ds.Tables[0].Rows.Count];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            Slide photo = new Slide();
            photo.Name = ds.Tables[0].Rows[i]["Title"].ToString();
            photo.Description = ds.Tables[0].Rows[i]["Descript"].ToString();
            photo.ImagePath = "UpSmall/" + ds.Tables[0].Rows[i]["Url"].ToString();
            photos[i] = photo;
        }
        return photos;
    }
}

