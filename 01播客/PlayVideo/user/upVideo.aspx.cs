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


public partial class user_upVideo : System.Web.UI.Page
{
    //设置上传文件的格式
    string[] videoExtension = new string[] { "flv", "avi", "wmv", };
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断用户是否登录
        if (Session["userName"] == null)
        {
            //未登录给出提示并返回到首页
            Response.Write("<script>alert('请您先登录！');location='../index.aspx'</script>");
        }  
      
    }

    //上传转换视频，并将相应的信息存到数据库中
    protected void btnUpVideo_Click(object sender, EventArgs e)
    {
        //获取上传文件的名称
        string upFileName =fileupVideo.FileName;
        string a = Session["userName"].ToString();
        //判断是否选择了文件
        if (this.fileupVideo.HasFile)  
        {

            //获取文件的扩展名
            string upExtension = upFileName.Substring(upFileName.LastIndexOf(".") + 1);
            //判断扩展名是否正确
            if (checkExtension(upExtension))
            {              
                //获取上传文件所保存的路径
                string upFilePath = Server.MapPath("../upFile/") + upFileName;
                //将文件保存到指定路径中
                fileupVideo.SaveAs(upFilePath);
                //获取当前时间
                string saveName = DateTime.Now.ToString("yyyyMMddHHmmssffff");  
                //获取视频转换后所保存的路径及文件名
                string playFile = "playFile/" + saveName + ".flv"; 
                //获取图片所保存的路径及名称
                string imgFile = "imgFile/" + saveName + ".jpg";
                
                try
                {
                    //判断上传的文件是否为flv格式
                    if (upExtension == "flv")
                    {
                        //如果为flv格式直接保存到指定路径下
 			File.Copy(fileupVideo.PostedFile.FileName,Server.MapPath("../"+playFile));
                        //调用公共类中的catchImg方法截取视频图片
            operateMethod.catchImg(Server.MapPath("../" + playFile), Server.MapPath("../" + imgFile));
                        //调用自定义insertVideoInfo方法将视频的信息保存到数据库中
                        insertVideoInfo(playFile, imgFile);
                    }
                    else
                    {
                        //调用公共类中的changeVideoType方法转换视频格式
                        if (operateMethod.changeVideoType(upFileName, Server.MapPath("../") + playFile, Server.MapPath("../") + imgFile))
                        {
                            //调用自定义insertVideoInfo方法将视频信息保存到数据库中
                            insertVideoInfo(playFile,imgFile);
                            //删除上传的视频
                            File.Delete(upFilePath);
                        }
                        else
                        {
                            RegisterStartupScript("false", "<script>alert('上传失败！')</script>");
                            //删除上传的视频
                            File.Delete(upFilePath);

                        }

                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message.ToString());
                }
            }
            else {
                RegisterStartupScript("false", "<script>alert('文件格式错误！')</script>");
            }

        }
      
    }
    //将视频信息存储到数据库中
    protected void insertVideoInfo(string playFileh, string imgFile)
    {
        //获取用户名
        string userName =Session["userName"].ToString();
        //获取视频名称
        string videoTitle = txtTitle.Text;
        //获取视频内容
        string videoContent = txtContent.Text;
        //获取当前时间
        string date = DateTime.Now.ToString();
        //获取视频路径
        string videoPath = playFileh;
        //获取图片路径
        string videoPicture = imgFile;
        //获取视频的类型
        string videoType = "";            
        int count = radBtnListType.Items.Count;
        for (int i = 0; i < count; i++)
        {
            if (radBtnListType.Items[i].Selected)
            {
                videoType = radBtnListType.Items[i].Value;
                break;
            }
        }       
        //编写SQL语句将视频的详细信息添加到数据库中
        string sqlInsert = "insert into videoInfo values('" + userName + "','" + videoTitle + "','" + videoContent + "','" + date + "','" + videoPath + "','" + videoPicture + "','" + videoType + "','','','','','')";
        if (operateData.execSql(sqlInsert))
        {
            RegisterStartupScript("true", "<script>alert('上传成功！')</script>");
            //编写SQL语句将当前用户的积分增加
            string sqlUpd=" update userInfo set sumMark=sumMark+100 where userName='"+userName+"'" ;
            operateData.execSql(sqlUpd);

        }else RegisterStartupScript("true", "<script>alert('上传失败！')</script>");

    }

    //自定义方法判断视频格式是否正确
    private bool checkExtension(string extension)
    {       
        bool strReturn =false;
        //遍历数组判断当前上传的视频格式是否正确
        foreach (string var in this.videoExtension)
        {
            if (var == extension)
            {
                strReturn = true; break;
            }
        }
        return strReturn;

    }
}
