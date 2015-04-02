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
using System.IO;//引入命名空间
public partial class list_softdownload : System.Web.UI.Page
{
    EP ep = new EP();//实例化对象
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断用户是否登录，如果没登录跳转到登录页面中
        if (Session["UserName"] == null && Session["UserPwd"] == null)
        {
            //弹出对话框显示“对不起！您还没有登录”提示信息，并且将页面跳转到用户登录页面中
            Response.Write("<script lanuage='javaScript'>alert('对不起！您还没有登录！');location='UserLogin.aspx'</script>");
        }
        else
        {
            string SqlStr = "select * from tb_leibie";//查询类别信息表
            ep.EXECDropDownList(this.DDlLeibie, SqlStr, "name");
            ep.EXECDataList(this.DlLeibie, "select top 10 * from tb_leibie order by ADDTime desc", "id");//显示类别信息
            if (Request["IdToolsDownLoad"] != null)
            {
                DataSet ds = null;
                ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["IdToolsDownLoad"] + "'", "tb_tools");
                DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
                this.lblName.Text = rv["name"].ToString();//显示产品名称
                this.lblEdition.Text = rv["Edition"].ToString();//显示产品版本
                this.lblCondition.Text = rv["condition"].ToString();//显示运行环境
                this.lblPrice.Text = rv["Price"].ToString();//显示产品价格
                this.lblIntroEdition.Text = rv["EditionIntro"].ToString();//显示版本说明信息
                this.DDlLeibie.SelectedItem.Text = rv["LeiBie"].ToString();//显示产品类别
                this.LblType.Text = rv["Type"].ToString();//显示产品类型
                this.lblSize.Text = rv["ToolSize"].ToString();//显示文件大小
                this.lblpoint.Text = rv["Point"].ToString();//显示下载次数
                this.ImgSoft.ImageUrl = rv["Image"].ToString();//显示产品图片
                this.LblIntro.Text = rv["UpTime"].ToString();//显示上传时间
                this.LblID.Text = rv["id"].ToString();//显示产品编号 
                this.LblIntro.Text = rv["Intro"].ToString();//显示产品说明
                this.LblProduct.Text = Request["IdToolsDownLoad"];
            }
            if (Request["downloadid"] != null)
            {
                DataSet ds = null;
                ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["downloadid"] + "'", "tb_tools");
                DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
                this.lblName.Text = rv["name"].ToString();//显示产品名称
                this.lblEdition.Text = rv["Edition"].ToString();//显示产品版本
                this.lblCondition.Text = rv["condition"].ToString();//显示运行环境
                this.lblPrice.Text = rv["Price"].ToString();//显示产品价格
                this.lblIntroEdition.Text = rv["EditionIntro"].ToString();//显示版本说明信息
                this.DDlLeibie.SelectedItem.Text = rv["LeiBie"].ToString();//显示产品类别
                this.LblType.Text = rv["Type"].ToString();//显示产品类型
                this.lblSize.Text = rv["ToolSize"].ToString();//显示文件大小
                this.lblpoint.Text = rv["Point"].ToString();//显示下载次数
                this.ImgSoft.ImageUrl = rv["Image"].ToString();//显示产品图片
                this.LblIntro.Text = rv["UpTime"].ToString();//显示上传时间
                this.LblID.Text = rv["id"].ToString();//显示产品编号 
                this.LblIntro.Text = rv["Intro"].ToString();//显示产品说明
                this.LblProduct.Text = Request["downloadid"];
            }
            if (Request["Mendid"] != null)
            {
                DataSet ds = null;
                ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["Mendid"] + "'", "tb_tools");
                DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
                this.lblName.Text = rv["name"].ToString();//显示产品名称
                this.lblEdition.Text = rv["Edition"].ToString();//显示产品版本
                this.lblCondition.Text = rv["condition"].ToString();//显示运行环境
                this.lblPrice.Text = rv["Price"].ToString();//显示产品价格
                this.lblIntroEdition.Text = rv["EditionIntro"].ToString();//显示版本说明信息
                this.DDlLeibie.SelectedItem.Text = rv["LeiBie"].ToString();//显示产品类别
                this.LblType.Text = rv["Type"].ToString();//显示产品类型
                this.lblSize.Text = rv["ToolSize"].ToString();//显示文件大小
                this.lblpoint.Text = rv["Point"].ToString();//显示下载次数
                this.ImgSoft.ImageUrl = rv["Image"].ToString();//显示产品图片
                this.LblIntro.Text = rv["UpTime"].ToString();//显示上传时间
                this.LblID.Text = rv["id"].ToString();//显示产品编号 
                this.LblIntro.Text = rv["Intro"].ToString();//显示产品说明
                this.LblProduct.Text = Request["Mendid"];
            }
            if (Request["IdToolsMend"] != null)
            {
                DataSet ds = null;
                ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["IdToolsMend"] + "'", "tb_tools");
                DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
                this.lblName.Text = rv["name"].ToString();//显示产品名称
                this.lblEdition.Text = rv["Edition"].ToString();//显示产品版本
                this.lblCondition.Text = rv["condition"].ToString();//显示运行环境
                this.lblPrice.Text = rv["Price"].ToString();//显示产品价格
                this.lblIntroEdition.Text = rv["EditionIntro"].ToString();//显示版本说明信息
                this.DDlLeibie.SelectedItem.Text = rv["LeiBie"].ToString();//显示产品类别
                this.LblType.Text = rv["Type"].ToString();//显示产品类型
                this.lblSize.Text = rv["ToolSize"].ToString();//显示文件大小
                this.lblpoint.Text = rv["Point"].ToString();//显示下载次数
                this.ImgSoft.ImageUrl = rv["Image"].ToString();//显示产品图片
                this.LblIntro.Text = rv["UpTime"].ToString();//显示上传时间
                this.LblID.Text = rv["id"].ToString();//显示产品编号 
                this.LblIntro.Text = rv["Intro"].ToString();//显示产品说明
                this.LblProduct.Text = Request["IdToolsMend"];
            }
            if (Request["ID"] != null)
            {
                DataSet ds = null;
                ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["ID"] + "'", "tb_tools");
                DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
                this.lblName.Text = rv["name"].ToString();//显示产品名称
                this.lblEdition.Text = rv["Edition"].ToString();//显示产品版本
                this.lblCondition.Text = rv["condition"].ToString();//显示运行环境
                this.lblPrice.Text = rv["Price"].ToString();//显示产品价格
                this.lblIntroEdition.Text = rv["EditionIntro"].ToString();//显示版本说明信息
                this.DDlLeibie.SelectedItem.Text = rv["LeiBie"].ToString();//显示产品类别
                this.LblType.Text = rv["Type"].ToString();//显示产品类型
                this.lblSize.Text = rv["ToolSize"].ToString();//显示文件大小
                this.lblpoint.Text = rv["Point"].ToString();//显示下载次数
                this.ImgSoft.ImageUrl = rv["Image"].ToString();//显示产品图片
                this.LblIntro.Text = rv["UpTime"].ToString();//显示上传时间
                this.LblID.Text = rv["id"].ToString();//显示产品编号 
                this.LblIntro.Text = rv["Intro"].ToString();//显示产品说明
                this.LblProduct.Text = Request["ID"];
            }
        }
    }
    protected void LinBtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");//跳转到网站首页中
    }
    protected void DlLeibie_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        //声明一个string类型的变量id，并且将主键的值赋值给id
        string id = this.DlLeibie.DataKeys[e.Item.ItemIndex].ToString();
        //跳转到softleibie.aspx页面中，并将id的值传递到softleibie.aspx页面中去
        Response.Redirect("softleibie.aspx?id=" + id + "");
    }
    protected void LinBtnShowBigImage_Click(object sender, EventArgs e)
    {
        //跳转到ShowBigImage.aspx页面中，并且将编号id字段的值传递到ShowBigImage.aspx页面中
        Response.Redirect("ShowBigImage.aspx?id=" + this.LblID.Text);
    }
    protected void ImgBtndownLoad_Click(object sender, ImageClickEventArgs e)
    {
        string id = Request["IdToolsDownLoad"];
        DataSet ds = null;
        if (Request["ID"] != null)
        {
            ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["ID"] + "'", "tb_tools");
            DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
            this.lblName.Text = rv["downLoad"].ToString();
        }
        if (Request["Mendid"] != null)
        {
            ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["Mendid"] + "'", "tb_tools");
            DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
            this.lblName.Text = rv["downLoad"].ToString();
        }
        if (Request["downloadid"] != null)
        {
            ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["downloadid"] + "'", "tb_tools");
            DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
            this.lblName.Text = rv["downLoad"].ToString();
        }
        if (Request["IdToolsDownLoad"] != null)
        {
            ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["IdToolsDownLoad"] + "'", "tb_tools");
            DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
            this.lblName.Text = rv["downLoad"].ToString();
        }
        if (Request["IdToolsMend"] != null)
        {
            ds = ep.ReturnDataSet("select * from tb_tools where id='" + Request["IdToolsMend"] + "'", "tb_tools");
            DataRowView rv = ds.Tables["tb_tools"].DefaultView[0];
            this.lblName.Text = rv["downLoad"].ToString();
        }
        string strPath = Server.MapPath( "./Mend/") + this.lblName.Text;//获得产品的路径，并存储在一个字符串中
        if (strPath != "")//判断产品路径是否存在
        {
            FileInfo FInfo = new FileInfo(strPath);//使用获得的路径实例化FileInfo对象
            if (FInfo.Exists)//判断产品是否存在
            {
                Response.Clear();//清空缓冲区
                Response.ClearHeaders();//清空缓冲区头
                Response.Buffer = false;//设置Response对象不可以缓冲输出
                Response.ContentType = "application/octet-stream";//设置输出流的HTTP MIME类型
                //将HTTP头添加到输出流
                Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FInfo.FullName, System.Text.Encoding.UTF8));
                //将要下载的产品的大小添加到输出流
                Response.AppendHeader("Content-Length", FInfo.Length.ToString());

                Response.WriteFile(FInfo.FullName);//将指定的要下载的信息产品写入输出流
                Response.Flush();//向客户端发送当前所有缓冲的输出
                //修改产品下载次数信息，即每单击一次“下载”按钮，将下载次数增加一次
                string str = "update tb_tools set Point=Point+1 where id='" + this.LblID.Text + "'";
                EP.EXECCommand(str);//调用EP类中的EXECCommand方法，执行Update语句
            }
            else
                Response.Write("<script>alert('很遗憾，该文件暂时不存在！');location='../Default.aspx'</script>");
        }

    }
}
