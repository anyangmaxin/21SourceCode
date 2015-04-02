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

public partial class manage_amendLoopAd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //调用自定义方法显示所有截图信息
            bindGvImg();    
        }
        
    }
    protected void bindGvImg()
    {
        //编写SQL语句查询出所有视频信息
        string sqlSel = "select * from videoInfo order by id desc ";
        //调用公共类中的getRows方法并设置GridView控件的数据源
        gvImg.DataSource = operateData.getRows(sqlSel);
        //设置主键
        gvImg.DataKeyNames = new string[] { "id" };
        gvImg.DataBind();
    }
    protected void gvImg_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvImg.PageIndex = e.NewPageIndex;
        bindGvImg();
       
    }
    protected void gvImg_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //编写SQL语句查询当前视频的图片路径
        string sqlSel = "select videoPicture from videoInfo where id=" + gvImg.DataKeys[e.NewSelectedIndex].Value.ToString();
        //获取当前图片的绝对路径
        string imgPath =Server.MapPath("../")+operateData.getTier(sqlSel);
        //获取当前行中DropDownList对象
        DropDownList ddl = (DropDownList)gvImg.Rows[e.NewSelectedIndex].FindControl("DropDownList1");
        //设置图片的保存路径及名称
        string imgNewPath = Server.MapPath("../")+"img/"+ddl.Text + ".jpg";
        //创建FileInfo对象
        FileInfo fi = new FileInfo(imgPath);
        //判读图片是否存在
        if (fi.Exists)
        {
            //将文件拷贝到指定路径下

            //File.Delete(imgNewPath);
            //File.Copy(imgPath, imgNewPath);
           // File.Copy(imgNewPath, imgPath);
            
            File.Copy(imgPath, imgNewPath, true);
            
            //调用自定义方法将视频的id保存到指定文件中
            addLoopId(gvImg.DataKeys[e.NewSelectedIndex].Value.ToString(), Convert.ToInt32(ddl.Text));


          
            RegisterStartupScript("true", "<script>alert('保存成功！')</script>");
        }
        else
        {
            RegisterStartupScript("true", "<script>alert('图片不存在！')</script>");
        }
    }

    protected void addLoopId(string  videoId,int adId)
    {
        //获取保存视频id的txt文件
        string path = Server.MapPath("../") + "tool/LoopId.txt";
        //获取txt文件中的内容
        string loopId = File.ReadAllText(path);
        //将txt内容以“,”分隔的字符串保存到数组中
        string[] loopids = loopId.Split(',');
        //修改指定位置的视频id
        loopids[adId - 1] = "play.aspx?id="+videoId;
        //将数组保存到字符串中
        loopId = loopids[0];
        for (int i = 1; i < loopids.Length;i++ )
        {
            loopId += "," + loopids[i];
        }
        //将字符串中的内容保存到txt文件中
        File.WriteAllText(path,loopId);
        
    }
}
