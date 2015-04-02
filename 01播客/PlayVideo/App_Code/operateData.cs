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
/// operateData 的摘要说明
/// </summary>
public class operateData
{
	public operateData()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 创建数据库连接
    /// </summary>
    /// <returns>返回SqlConnection对象</returns>
    public static SqlConnection createCon()
    {
       //创建数据库连接
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["con"]);
        return con;
    }
    /// <summary>
    /// 返回一行数据
    /// </summary>
    /// <param name="sql">SQL语句用来查询一行数据</param>
    /// <returns>返回SqlDataReader对象</returns>
    public static SqlDataReader getRow(string sql)
    {
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader sdr = com.ExecuteReader();      
        return sdr;
    }
    /// <summary>
    /// 执行添加、删除和更新数据操作
    /// </summary>
    /// <param name="sql">SQL语句添加数据、删除数据和更新数据</param>
    /// <returns>返回一个布尔值，表示操作是否成功！</returns>
    public static bool execSql(string sql)
    {
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        int Ex=com.ExecuteNonQuery();
        con.Close();
        if (Ex>0)
        {
            return true;
        }else{
            return false;
        }
       
    }
    /// <summary>
    /// 返回多行数据
    /// </summary>
    /// <param name="sql">SQL语句查询出多行语句</param>
    /// <returns>返回多行数据</returns>
    public static  DataTable getRows(string sql)
    {
        DataSet ds;
        SqlConnection con = createCon();
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
        ds = new DataSet();
        sda.Fill(ds);
        con.Close();
   
        return ds.Tables[0];
    }
    /// <summary>
    /// 查询数据是否在表中存在
    /// </summary>
    /// <param name="sql">SQL语句查询一行数据</param>
    /// <returns>返回int类型大于1表示存在</returns>
    public static int getCount(string sql)
    {
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        
        int Ex =Convert.ToInt32( com.ExecuteScalar());
        con.Close();
        return Ex;
    }
    
    /// <summary>
    /// 返回某一个列的值
    /// </summary>
    /// <param name="sql">SQL语句用来查询某一列的值</param>
    /// <returns>返回列值，该值为字符串类型</returns>
    public  static  string getTier(string sql)
    {
        
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader sdr = com.ExecuteReader();
        sdr.Read();
        string tier=sdr[0].ToString();
        con.Close();
        return tier;
    }
    /// <summary>
    /// 该方法用来实现登录查询
    /// </summary>
    /// <param name="sql">需要执行的SQL语句</param>
    /// <param name="name">登录名</param>
    /// <param name="pass">密码</param>
    /// <returns>返回一个布尔值，true表示登录成功false表示失败</returns>
    public static bool login(string sql, string name, string pass)
    {
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        com.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 20));
        com.Parameters["@name"].Value = name;
        com.Parameters.Add(new SqlParameter("@pass", SqlDbType.VarChar, 20));
        com.Parameters["@pass"].Value = pass;
        int Ex=Convert.ToInt32(com.ExecuteScalar());
        con.Close();
        if ( Ex> 0)
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }
}
