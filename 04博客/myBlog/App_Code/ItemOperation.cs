using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Text;

/// <summary>
///ItemOperation 的摘要说明
/// </summary>
public class ItemOperation
{
    private const string PARM_ITEM_NAME = "@ItemName";
    private const string PARM_ITEM_ID = "@ItemID";
    private const string SQL_INSERT_VOTE = "INSERT INTO VoteItem  values(@ItemName,0)";
    private const string SQL_DELETE_VOTE = "DELETE FROM VoteItem WHERE ItemID=@ItemID";
    private const string SQL_UPDATE_VOTE = "UPDATE VoteItem  set itemcount=itemcount +1 WHERE ItemID=@ItemID";
    private const string SQL_SELECT_COUNT = "SELECT SUM(itemcount) FROM VoteItem";
    public SqlConnection conn;  //申明一个SqlConnection对象
    public ItemOperation()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 添加投票项目
    /// </summary>
    /// <param name="votename">投票项目的名称</param>
    public void AddVote(string votename)
    {
        conn = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        SqlParameter parm = new SqlParameter(PARM_ITEM_NAME, SqlDbType.NVarChar, 30);
        parm.Value = votename;
        cmd.Parameters.Add(parm);
        strSQL.Append(SQL_INSERT_VOTE);
        conn.Open();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strSQL.ToString();
        cmd.ExecuteNonQuery();
        cmd.Parameters.Clear();
    }
 /// <summary>
    /// 删除投票项目
    /// </summary>
    /// <param name="voteID">投票项目的ID</param>
    public void DelVote(int voteID)
    {
        conn = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter parm = new SqlParameter(PARM_ITEM_ID, SqlDbType.Int);
        // 设置参数的值
        parm.Value = voteID;
        //将参数添加到SQL命令中
        cmd.Parameters.Add(parm);
            // 添加SQL语句
            strSQL.Append(SQL_DELETE_VOTE);
            conn.Open();
            //设置SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加语句
            cmd.ExecuteNonQuery();
            //清空参数列表
            cmd.Parameters.Clear();
        }
    /// <summary>
    /// 更新项目被投次数
    /// </summary>
    /// <param name="voteID">投票项目的ID</param>
    public void UpdateVote(int voteID)
    {
        conn = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter parm = new SqlParameter(PARM_ITEM_ID, SqlDbType.Int);
        // 设置参数的值
        parm.Value = voteID;
        //将参数添加到SQL命令中
        cmd.Parameters.Add(parm);
            // 添加SQL语句
            strSQL.Append(SQL_UPDATE_VOTE);
            conn.Open();
            //设置SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加语句
            cmd.ExecuteNonQuery();
            //清空参数列表
            cmd.Parameters.Clear();
    }
    /// <summary>
    /// 获取总投票数量
    /// </summary>
    /// <returns>总投票数</returns>
    public int GetVoteCount()
    {
        SqlCommand myCmd = GetCommandStr(SQL_SELECT_COUNT);
        try
        {
            //判断数据库是否为连连状态
            if (conn.State == System.Data.ConnectionState.Closed)
            { conn.Open(); }
            return int.Parse(myCmd.ExecuteScalar().ToString());
        }
        finally
        {
            conn.Close();
        }
    }
    /// <summary>
    /// 执行查询，并返回查询所返回的结果集中第一行的第一列。所有其他的列和行将被忽略。 
    /// </summary>
    /// <param name="myCmd"></param>
    /// <returns>执行SQL语句命令的SqlCommand对象</returns>
    public string ExecScalar(SqlCommand myCmd)
    {
        string strSql;
        try
        {
            if (myCmd.Connection.State != ConnectionState.Open)
            {
                myCmd.Connection.Open(); //打开与数据库的连接
            }
            //使用SqlCommand对象的ExecuteScalar方法执行查询，并返回查询所返回的结果集中第一行的第一列。所有其他的列和行将被忽略。 

            strSql = Convert.ToString(myCmd.ExecuteScalar());
            return strSql;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            if (myCmd.Connection.State == ConnectionState.Open)
            {
                myCmd.Connection.Close();//关闭与数据库的连接
            }
        }
    }
    /// <summary>
    /// 执行查询语句，返回sqlCommand类对象
    /// </summary>
    /// <param name="strSql">查询语句</param>
    /// <returns>返回sqlCommand类对象</returns>
    public SqlCommand GetCommandStr(string strSql)
    {
        conn = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        SqlCommand myCmd = new SqlCommand();
        myCmd.Connection = conn;
        myCmd.CommandText = strSql;
        myCmd.CommandType = CommandType.Text;
        return myCmd;
    }
}
  