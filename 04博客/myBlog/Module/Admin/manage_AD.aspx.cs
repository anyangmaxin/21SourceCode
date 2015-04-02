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

public partial class manage_AD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUp_Click(object sender, EventArgs e)
    {
        if (this.fileupAD.PostedFile.FileName.ToString() == "")
        {
            Response.Write("<script>alert('请选择要上传图片！');location='manage_AD.aspx'</script>");
        }
        else
        {
            if (this.fileupAD.PostedFile.ContentLength < 81920)
            {
                string strExtension = fileupAD.FileName.Substring(fileupAD.FileName.LastIndexOf(".") + 1);
                if (fileupAD.HasFile)
                {
                    string imgPath = Server.MapPath("../../imgFile") + "/" + radListPlace.SelectedValue + ".jpg";
                    fileupAD.SaveAs(imgPath);
                    addUrl();
                    RegisterStartupScript("", "<script>alert('上传文件成功！')</script>");
                }
                else
                {
                    RegisterStartupScript("", "<script>alert('上传文件不能为空')</script>");
                }
            }
            else
            {
                RegisterStartupScript("", "<script>alert('上传文件大小不能超过80KB！')</script>");
            }
        }
    }
    protected void addUrl()
    {
        int intPlace =Convert.ToInt32(radListPlace.SelectedValue);
        //获取保存视频id的txt文件
        string path = Server.MapPath("../../") + "imgFile/LoopId.txt";
        //获取txt文件中的内容
        string loopId = File.ReadAllText(path);
        //将txt内容以“,”分隔的字符串保存到数组中
        string[] loopids = loopId.Split(',');
        //修改指定位置的视频id
        loopids[intPlace - 1] = txtADurl.Text;
        //将数组保存到字符串中
        loopId = loopids[0];
        for (int i = 1; i < loopids.Length; i++)
        {
            loopId += "," + loopids[i];
        }
        //将字符串中的内容保存到txt文件中
        File.WriteAllText(path, loopId);
    }
}
