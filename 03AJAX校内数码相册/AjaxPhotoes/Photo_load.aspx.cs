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

public partial class Photo_load : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDDL();
        }
    }
    private void BindDDL()
    {
        //调用类方法读取相册分类
        Album am = new Album();
        DataSet ds = am.DDLCategory();
        if (ds.Tables[0].Rows.Count == 0)
        {
            hlkMessage.Text = "单击这里创建相册";
            hlkMessage.NavigateUrl = "Category.aspx";
            pShow.Visible = false;//隐藏表单
        }
        else
        {
            //绑定数据到DropDownList
            ddlCategory.DataSource = ds.Tables[0].DefaultView;
            ddlCategory.DataValueField = ds.Tables[0].Columns[0].ToString();
            ddlCategory.DataTextField = ds.Tables[0].Columns[1].ToString();
            ddlCategory.DataBind();
        }
        
    }
    /// <summary>
    /// 上传图片
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>  
    protected void imgBtnLoad_Click(object sender, ImageClickEventArgs e)
    {
        if (!fulPhoto.HasFile)
        {
            lbMessage.Text = "请选择上传图片！";
            return;
        }
        else
        {
            try
            {
                //获取上传文件路径
                string filePath = fulPhoto.PostedFile.FileName;
                //获取上传文件后缀
                string fileExt = filePath.Substring(filePath.LastIndexOf(".") + 1);
                //限定上传格式
                if (fileExt.ToLower() == "gif" || fileExt.ToLower() == "jpg" || fileExt.ToLower() == "bmp" || fileExt.ToLower() == "png")
                {
                    if (fulPhoto.PostedFile.ContentLength > 5120000)
                    {
                        lbMessage.Text = "限定上传图片的大小不能超出5M！";
                        return;
                    }
                    else
                    {
                        //根据时间生成文件名
                        string nowTime = Album.CreateDateTimeString();
                        string fileName = nowTime + "." + fileExt;
                        //源文件保存路径
                        string savePath = Server.MapPath("UpFile/");
                        //缩略图保存路径
                        string imgPath = Server.MapPath("UpSmall/");
                        //上传图片
                        fulPhoto.PostedFile.SaveAs(savePath + fileName);
                        
                        //创建自定义Album类对象实例
                        Album am = new Album();
                        //根据图片的s宽、高比例生成缩略图
                        System.Drawing.Image img = System.Drawing.Image.FromFile(savePath + fileName);
                        if (img.Width >= img.Height)
                        {                            
                            am.GetThumbnail(savePath + fileName,imgPath + fileName,400,300,"Cut");
                           
                        }
                        else
                        {
                            am.GetThumbnail(savePath + fileName, imgPath + fileName, 320, 350,"Cut");
                        }                        

                        
                        //文件类型
                        string p_type = fulPhoto.PostedFile.ContentType;
                        //文件大小
                        int p_size = fulPhoto.PostedFile.ContentLength;
                        int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
                        //调用类方法将数据插入到数据库
                        int result = am.AddPhoto(tbName.Text.Trim(), tbDescript.Text.Trim(), fileName, p_type, p_size, categoryId);
                        Page.ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('图片上传成功！');location.href='Photo_load.aspx';</script>");
                    }
                }
                else
                {
                    lbMessage.Text = "只允许上传gif，jpg，bmp，png格式的图片文件!";
                    return;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
    }
    /// <summary>
    /// 重置表单内容
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void imgBtnReset_Click(object sender, ImageClickEventArgs e)
    {
        tbName.Text = tbDescript.Text = string.Empty;
    }
}
