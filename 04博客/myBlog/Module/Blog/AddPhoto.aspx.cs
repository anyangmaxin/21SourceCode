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
using System.Data.SqlClient;

public partial class Module_Blog_AddPhoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/BlogIndex.aspx");
        }
    }
	protected void btnOK_Click(object sender, EventArgs e)
	{
        string ID;
        SqlConnection mycon = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        mycon.Open();
        DataSet mydataset = new DataSet();
        SqlDataAdapter mydataadapter = new SqlDataAdapter("select * from tb_Blog where UserName='" + Session["UserName"] + "'", mycon);
        mydataadapter.Fill(mydataset, "tb_Blog");
        DataRowView rowview = mydataset.Tables["tb_Blog"].DefaultView[0];
        ID = rowview["BlogID"].ToString();

		string P_str_filePath = "", P_str_fileExtName = "", P_str_mFileName, P_str_mPath;
		System.Text.StringBuilder strMsg = new System.Text.StringBuilder("上传文件信息;<hr color=red>");
		if ("" != fileUp.PostedFile.FileName)
		{
			P_str_filePath = fileUp.PostedFile.FileName;//获取文件路径
			P_str_fileExtName = P_str_filePath.Substring(P_str_filePath.LastIndexOf(".") + 1);//获得扩展名
			try
			{
                string personPhoto = Session["UserName"].ToString();
                P_str_mPath = Server.MapPath("../../Images/Pictures/"+personPhoto+"/");//保存到指定的路径
                P_str_mFileName =P_str_filePath.Substring(P_str_filePath.LastIndexOf("\\") + 1);//获得文件的名称
				fileUp.PostedFile.SaveAs(P_str_mPath + P_str_mFileName);//保存到指定的路径下
                string P_str_Com = "insert into tb_Picture(Subject,ImageUrl,BlogID) values('" + this.txtSubject.Text + "','../../Images/Pictures/" + personPhoto + "/" + P_str_mFileName + "','" + ID + "')";
				SqlData da = new SqlData();
				bool add = da.ExceSQL(P_str_Com);
				if (add == true)
				{
					Response.Write("<script language=javascript>alert('添加成功!');location='PhotoManage.aspx'</script>");
				}
				else
				{
					Response.Write("<script language=javascript>alert('添加失败！');location='javascript:history.go(-1)'</script>");
				}
			}
			catch (Exception err)
			{
				Response.Write(err.ToString());
			}
		}
	}
	protected void btnCancle_Click(object sender, EventArgs e)
	{
		Response.Redirect("PhotoManage.aspx");
	}
}
