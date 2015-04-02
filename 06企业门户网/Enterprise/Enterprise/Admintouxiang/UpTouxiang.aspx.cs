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
public partial class Admintouxiang_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)//首次执行页面
        {
            SFUPC();
        }
    }
    private void UpFile()// 该方法用于执行文件上传操作
    {

        //获取文件夹路径
        string FilePath = Server.MapPath("../") + "phone";

        // 获取客户端上载文件的集合
        HttpFileCollection HFC = Request.Files;
        for (int i = 0; i < HFC.Count; i++)
        {
            //访问指定的文件
            HttpPostedFile UserHPF = HFC[i];
            try
            {
                //判断文件是否为空
                if (UserHPF.ContentLength > 0)
                {
                    //将上传的文件存储在指定目录下
                    UserHPF.SaveAs(FilePath + "\\" + System.IO.Path.GetFileName(UserHPF.FileName));
                    this.LblImage.Text = System.IO.Path.GetFileName(UserHPF.FileName).ToString();
                }
            }
            catch
            {
                LblMessage.Text = "上传失败！";
            }
        }
        if (Session["FilesControls"] != null)
        {
            Session.Remove("FilesControls");
        }
        LblMessage.Text = "上传成功！";

    }




    private void SFUPC()//该方法用于将当前页面上传文件控件集保存到Session中
    {
        ArrayList AL = new ArrayList();//动态增加数组
        foreach (Control C in Tab_UpDownFile.Controls)
        {
            //在表格中查找出FileUpload控件添加到ArrayList中
            if (C.GetType().ToString() == "System.Web.UI.HtmlControls.HtmlTableRow")
            {
                HtmlTableCell HTC = (HtmlTableCell)C.Controls[0];
                foreach (Control FUC in HTC.Controls)
                {
                    if (FUC.GetType().ToString() == "System.Web.UI.WebControls.FileUpload")
                    {
                        FileUpload FU = (FileUpload)FUC;
                        //添加FileUpload控件
                        AL.Add(FU);
                    }
                }
            }
        }

        //把ArrayList添加到Session中
        Session.Add("FilesControls", AL);
    }


    private void InsertC()
    {
        //实例化ArrayList
        ArrayList AL = new ArrayList();
        this.Tab_UpDownFile.Rows.Clear(); //清除id为F表格里的所有行
        //表示 HtmlTable 控件中的 <tr> HTML 元素
        HtmlTableRow HTR = new HtmlTableRow();
        //表示 HtmlTableRow 对象中的 <td> 和 <th> HTML 元素
        HtmlTableCell HTC = new HtmlTableCell();
        //在单元格中添加一个FileUpload控件
        HTC.Controls.Add(new FileUpload());
        //在行中添加单元格
        HTR.Controls.Add(HTC);
        //在表中添加行
        Tab_UpDownFile.Rows.Add(HTR);
        SFUPC();
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string FullFileName = this.FileUpload1.PostedFile.FileName;

        string fileName = FullFileName.Substring(FullFileName.LastIndexOf("\\") + 1);

        string type = fileName.Substring(fileName.LastIndexOf(".") + 1);
        if (type == "bmp" || type == "BMP" || type == "jpg" || type == "JPG" || type == "gif" || type == "GIF")
        {
            if (this.FileUpload1.PostedFile.FileName != "")
            //if(FileUpload1.HasFile)//判断是否选择上传文件
            {
                UpFile();//执行上传文件
                SFUPC();
            }
            else
            {
                Response.Write("<script language='javascript'>alert('不可以为空');location='javascript:history.go(-1)'</script>");
            }
            try
            {
                this.LblImage.Text = "~/phone/" + this.LblImage.Text;
                String SqlInsert = "Insert tb_image values ('" + this.LblImage.Text + "','"+ System.DateTime.Now.ToString() +"')";
                EP.EXECCommand(SqlInsert);
                Response.Write("<script lanuage='javaScript'>alert('恭喜您！！添加成功！');location='javascript:history.go(-1)'</script>");//弹出对话框显示“恭喜您！！修改成功！”
            }
            catch
            {
                Response.Write("<script lanuage='javaScript'>alert('很遗憾！！添加失败！');location='javascript:history.go(-1)'</script>");//弹出对话框显示“很遗憾！！修改失败！”
            }
        }
        else
        {
            Response.Write("<script lanuage='javaScript'>alert('你上传的格式有误!');location='javascript:history.go(-1)'</script>");
        }
    }
}
