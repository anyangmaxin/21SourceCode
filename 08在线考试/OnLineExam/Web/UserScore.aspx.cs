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
using OnLineExam.BusinessClass;
using System.IO;
using System.Data.OleDb;

public partial class Web_UserScore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string loginName = Session["userID"].ToString();
            Usersmr user = new Usersmr();
            user.LoadData(loginName);
            labUser.Text = user.UserName;           
            InitData();  
        }
    }
    //初始化成绩表格
    protected void InitData()
    {
        Scoresmr score = new Scoresmr();        //创建Scoresmr对象       
        DataSet ds = score.QueryScore();     //调用QueryScore方法查询成绩并将查询结果放到DataSet数据集中
        GridView1.DataSource = ds;          //为GridView控件指名数据源        
        GridView1.DataBind();               //绑定数据
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        InitData();  
    }

    //GridView控件RowDeleting事件
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Scoresmr score = new Scoresmr();          //创建Scoresmr对象
        int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
        if (score.DeleteByStr(ID))
        {
            Response.Write("<script language=javascript>alert('成功删除！')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('删除失败！')</script>");
        }
        GridView1.EditIndex = -1;
        InitData();
    }
  
    //到出到Excel事件
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Scoresmr score = new Scoresmr();        //创建Scoresmr对象       
        DataSet ds = score.QueryScore();     //调用QueryScore方法查询成绩并将查询结果放到DataSet数据集中
        DataTable DT = ds.Tables[0];
        //生成将要存放结果的Excel文件的名称
        string NewFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";
        //转换为物理路径
        NewFileName = Server.MapPath("Temp/" + NewFileName);
        //根据模板正式生成该Excel文件
        File.Copy(Server.MapPath("../Modulemr.xls"), NewFileName, true);
        //建立指向该Excel文件的数据库连接
        string strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + NewFileName + ";Extended Properties='Excel 8.0;'";
        OleDbConnection Conn = new OleDbConnection(strConn);
        //打开连接，为操作该文件做准备
        Conn.Open();
        OleDbCommand Cmd = new OleDbCommand("", Conn);

        foreach (DataRow DR in DT.Rows)
        {
            string XSqlString = "insert into [Sheet1$]";
            XSqlString += "([用户姓名],[试卷],[成绩],[考试时间]) values(";
            XSqlString += "'" + DR["UserName"] + "',";
            XSqlString += "'" + DR["PaperName"] + "',";
            XSqlString += "'" + DR["Score"] + "',";
            XSqlString += "'" + DR["ExamTime"] + "')";
            Cmd.CommandText = XSqlString;
            Cmd.ExecuteNonQuery();
        }

        //操作结束，关闭连接
        Conn.Close();
        //打开要下载的文件，并把该文件存放在FileStream中
        System.IO.FileStream Reader = System.IO.File.OpenRead(NewFileName);
        //文件传送的剩余字节数：初始值为文件的总大小
        long Length = Reader.Length;

        Response.Buffer = false;
        Response.AddHeader("Connection", "Keep-Alive");
        Response.ContentType = "application/octet-stream";
        Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode("学生成绩.xls"));
        Response.AddHeader("Content-Length", Length.ToString());

        byte[] Buffer = new Byte[10000];		//存放欲发送数据的缓冲区
        int ByteToRead;											//每次实际读取的字节数

        while (Length > 0)
        {
            //剩余字节数不为零，继续传送
            if (Response.IsClientConnected)
            {
                //客户端浏览器还打开着，继续传送
                ByteToRead = Reader.Read(Buffer, 0, 10000);					//往缓冲区读入数据
                Response.OutputStream.Write(Buffer, 0, ByteToRead);	//把缓冲区的数据写入客户端浏览器
                Response.Flush();																		//立即写入客户端
                Length -= ByteToRead;																//剩余字节数减少
            }
            else
            {
                //客户端浏览器已经断开，阻止继续循环
                Length = -1;
            }
        }

        //关闭该文件
        Reader.Close();
        //删除该Excel文件
        File.Delete(NewFileName);
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                ((LinkButton)e.Row.Cells[7].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除成绩吗?')");
            }

        }    
        int i;
        //执行循环，保证每条数据都可以更新
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            }
        }
    }
}
