using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// SqlData 的摘要说明
/// </summary>
public class SqlData
{
	#region  类中的全局变量

	public SqlConnection sqlcon;  //申明一个SqlConnection对象
	private SqlCommand sqlcom;   //申明一个SqlCommand对象
	private SqlDataAdapter sqldata;   //申明一个SqlDataAdapter对象

	#endregion

	#region  构造函数

	/// <summary>
	/// 构造函数，初始化时连接数据库
	/// </summary>
	public SqlData()
	{
	    sqlcon = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
	}

	#endregion

	#region  绑定用户页面中的GridView控件
	/// <summary>
	/// 此方法实现数据绑定到GridView中
	/// </summary>
	/// <param name="dl">要绑定的控件</param>
	/// <param name="SqlCom">要执行的SQL语句</param>
	/// <returns></returns>
	public bool BindData(GridView dl, string SqlCom)
	{
		dl.DataSource = this.ExceDS(SqlCom);
		try
		{
			dl.DataBind();
			return true;
		}
		catch
		{
			return false;
		}
		finally
		{
			sqlcon.Close();
		}
	}
	#endregion
    #region  返回DataSet类型数据
    /// <summary>
    /// 此方法返回一个DataSet类型
    /// </summary>
    /// <param name="SqlCom">要执行的SQL语句</param>
    /// <returns></returns>
    public DataSet ExceDS(string SqlCom)
    {
        try
        {
            sqlcon.Open();   //打开链接
            SqlCommand sqlcom = new SqlCommand(SqlCom, sqlcon);
            SqlDataAdapter sqldata = new SqlDataAdapter();
            sqldata.SelectCommand = sqlcom;
            DataSet ds = new DataSet();
            sqldata.Fill(ds);
            return ds;
        }
        finally
        {
            sqlcon.Close();
        }
    }
    public DataSet GetDataSet(string SqlCom,string tablename)
    {
        try
        {
            sqlcon.Open();   //打开链接
            SqlCommand sqlcom = new SqlCommand(SqlCom, sqlcon);
            SqlDataAdapter sqldata = new SqlDataAdapter();
            sqldata.SelectCommand = sqlcom;
            DataSet ds = new DataSet();
            sqldata.Fill(ds,tablename);
            return ds;
        }
        finally
        {
            sqlcon.Close();
        }
    }
    #endregion

	#region  执行SQL语句
	/// <summary>
	/// 此方法用来执行SQL语句
	/// </summary>
	/// <param name="SqlCom">要执行的SQL语句</param>
	/// <returns></returns>
	public bool ExceSQL(string strSqlCom)
	{
       
        SqlCommand sqlcom = new SqlCommand(strSqlCom, sqlcon);
		try
		{
            //判断数据库是否为连连状态
            if (sqlcon.State == System.Data.ConnectionState.Closed)
            {  sqlcon.Open();}
            //执行SQL语句
            sqlcom.ExecuteNonQuery();
            //SQL语句执行成功，返回true值
			return true;
		}
		catch
		{
			//SQL语句执行失败，返回false值
            return false;
		}
		finally
		{
			//关闭数据库连接
            sqlcon.Close();
		}
	}
	#endregion	
    #region  返回SqlDataReader类型的数据
    /// <summary>
    /// 创建时间:2007-11-28
	/// 此方法返回一个SqlDataReader类型的参数
	/// </summary>
	/// <param name="SqlCom"></param>
	/// <returns></returns>
	public SqlDataReader ExceRead(string SqlCom)
	{
        sqlcon.Open();   //打开链接
        //创建一个SqlCommand对象，表示要执行的SqlCom语句或存储过程
        sqlcom = new SqlCommand(SqlCom, sqlcon);
		SqlDataReader read = sqlcom.ExecuteReader();
            return read; 
    
	}
	#endregion
    #region FreeTextBox控件的字体
    /// <summary>
    /// FreeTextBox控件的字体
    /// </summary>
    /// <returns></returns>
    public string[] strFont()
    {
        string[] str = null;
        str = new string[] { "宋体", "楷体_GB2312", "隶书", "华文行楷", "华文中宋", "新宋体", "黑体", 
            "方正舒体", "方正姚体", "仿宋_GB2312", "华文彩云", "华文细黑", "华文新魏", "华文中宋"};
        return str;
    }
    #endregion
}
