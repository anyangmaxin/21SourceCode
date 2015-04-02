using System;
using System.ComponentModel;
using System.Collections;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using OnLineExam.HelperClass;
using OnLineExam.CommonClass;

namespace OnLineExam.DataBaseClass

{
  // 数据库接口类
	public class DataBase
	{
		//私有变量，数据库连接
		protected SqlConnection Connection;
        protected string ConnectionString;

		//构造函数
		public DataBase()
		{
            ConnectionString = ConfigurationSettings.AppSettings["strCon"];
        }
		//保护方法，打开数据库连接
		private void Open()
		{
		  //判断数据库连接是否存在
			if (Connection == null)
			{
			  //不存在，新建并打开
				Connection = new SqlConnection(ConnectionString);
				Connection.Open();
			}
			else
			{
			  //存在，判断是否处于关闭状态
			  if (Connection.State.Equals(ConnectionState.Closed))
				  Connection.Open();    //连接处于关闭状态，重新打开
			}
		}

		//公有方法，关闭数据库连接
		public void Close() 
		{
			if (Connection.State.Equals(ConnectionState.Open))
			{
                Connection.Close();     //连接处于打开状态，关闭连接
			}
		}

        /// <summary>
		/// 析构函数，释放非托管资源
		/// </summary>
		~DataBase()
		{
			try
			{
				if (Connection != null)
					Connection.Close();
			}
			catch{}
			try
			{
				Dispose();
			}
			catch{}
		}

		//公有方法，释放资源
		public void Dispose()
		{
			if (Connection != null)		// 确保连接被关闭
			{
				Connection.Dispose();
				Connection = null;
			}
		}		

		//公有方法，根据Sql语句，返回是否查询到记录
		public bool GetRecord(string XSqlString)
		{
            Open();
            SqlDataAdapter adapter = new SqlDataAdapter(XSqlString, Connection);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            Close();

            if (dataset.Tables[0].Rows.Count > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		//公有方法，返回Sql语句获得的数据值
		//SqlString的格式：select count(*) from XXX where ...
		//                 select max(XXX) from YYY where ...
		public int GetRecordCount(string XSqlString)
		{
            string SCount;

			Open();
			SqlCommand Cmd = new SqlCommand(XSqlString,Connection);
            SCount = Cmd.ExecuteScalar().ToString().Trim();
            if (SCount=="")
            SCount="0";
			Close();
			return Convert.ToInt32(SCount);
		}			

		//公有方法，根据XWhere更新数据表XTableName中的某些纪录
		//XTableName--表名
		//XHT--哈希表，键为字段名，值为字段值		
		public DataSet AdvancedSearch(string XTableName, Hashtable XHT)
		{
			int Count = 0;

			string Fields = "";
			foreach(DictionaryEntry Item in XHT)
			{
				if (Count != 0)
				{
					Fields += " and ";
				}
				Fields += Item.Key.ToString();
				Fields += " like '%";
				Fields += Item.Value.ToString();
                Fields += "%'";
				Count++;
			}
			Fields += " ";

			string SqlString = "select * from " + XTableName + " where " + Fields;
            Open();
            SqlDataAdapter Adapter = new SqlDataAdapter(SqlString, Connection);
            DataSet Ds = new DataSet();
            Adapter.Fill(Ds);
            Close();
            return Ds;
			
		}		

        //私有方法，获得一个用来调用存储过程的SqlCommand
        //输入：
        //      ProcName - 存储过程名
        //      Params   - 用来调用存储过程的参数表
        private SqlCommand CreateCommand(string ProcName, SqlParameter[] Prams) 
        {
          Open();
          SqlCommand Cmd = new SqlCommand(ProcName, Connection);
          Cmd.CommandType = CommandType.StoredProcedure;

          if (Prams != null) 
          {
            foreach (SqlParameter Parameter in Prams)
              Cmd.Parameters.Add(Parameter);
          }

          return Cmd;
        }

        //私有方法，执行SQL命令
        //输入：
        //      StrName - 存储过程名
        //      Params   - 用来调用存储过程的参数表
        private SqlCommand CreateStrCommand(string StrName, SqlParameter[] Prams)
        {
            Open();
            SqlCommand Cmd = new SqlCommand(StrName, Connection);
            Cmd.CommandType = CommandType.Text;

            if (Prams != null)
            {
                foreach (SqlParameter Parameter in Prams)
                    Cmd.Parameters.Add(Parameter);
            }

            return Cmd;
        }

        //公有方法，实例化一个用于调用存储过程的参数
        //输入：
        //      ParamName - 参数名称
        //      DbType		- 参数类型
        //      Size			- 参数大小
        //			Direction - 传递方向
        //			Value			- 值
        public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, object Value) 
        {
          SqlParameter Param;

          if(Size > 0)
            Param = new SqlParameter(ParamName, DbType, Size);
          else Param = new SqlParameter(ParamName, DbType);

          Param.Direction = Direction;

          if (Value != null)
            Param.Value = Value;

          return Param;
        }

		//公有方法，实例化一个用于调用存储过程的输入参数
		//输入：
		//      ParamName - 参数名称
		//      DbType		- 参数类型
		//      Size			- 参数大小
		//			Value			- 值
        public SqlParameter MakeInParam(string ParamName, SqlDbType DbType, int Size, object Value) 
        {
          return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);
        }		

        //公有方法，调用存储过程(不带参数)
		    //输入：
		    //			ProcName存储过程名
        //输出：
		    //      对Update、Insert、Delete操作返回影响到的行数，其他情况为-1
        public int RunProc(string ProcName) 
        {
		    int Count = -1;
            SqlCommand Cmd = CreateCommand(ProcName, null);
            Count = Cmd.ExecuteNonQuery();
            Close();
			return Count;
        }

        //公有方法，调用存储过程(不带参数)
        //输入：
        //			ProcName存储过程名
        //输出：
        //      对Update、Insert、Delete操作返回影响到的行数，其他情况为-1
        public int RunStr(string StrName)
        {
            int Count = -1;
            SqlCommand Cmd = CreateStrCommand(StrName, null);
            Count = Cmd.ExecuteNonQuery();
            Close();
            return Count;
        }


        //公有方法，调用存储过程(带参数)
        //输入：
        //      ProcName - 存储过程名
        //      Params   - 用来调用存储过程的参数表
        //输出：
        //      对Update、Insert、Delete操作返回影响到的行数，其他情况为-1
        public int RunProc(string ProcName, SqlParameter[] Params)
        {
            int Count = -1;
            SqlCommand Cmd = CreateCommand(ProcName, Params);
            Count = Cmd.ExecuteNonQuery();
            Close();
            return Count;
        }

        //公有方法，执行指定SQL语句
        //输入：
        //      ProcStr - SQL语句
        //输出：
        //      对Update、Insert、Delete操作返回影响到的行数，其他情况为-1
        public int ProcStr(string StrName,SqlParameter[] Params) 
        {
            int Count = -1;
            SqlCommand Cmd = CreateStrCommand(StrName, Params);
            Count = Cmd.ExecuteNonQuery();
            Close();
            return Count;
        }



        //公有方法，调用存储过程(不带参数)
        //输入：
        //			ProcName存储过程名
		    //输出：
        //			将执行结果以SqlDataReader返回
		    //注意：使用后主意调用SqlDataReader.Close()方法
        public SqlDataReader RunProcGetReader(string ProcName) 
        {
          SqlCommand Cmd = CreateCommand(ProcName, null);
          return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

		//公有方法，调用存储过程(带参数)
		//输入：
		//			ProcName - 存储过程名
		//      Params	 - 存储过程需要的参数
		//输出：
		//			将执行结果以SqlDataReader返回
		//注意：使用后主意调用SqlDataReader.Close()方法
        public SqlDataReader RunProcGetReader(string ProcName, SqlParameter[] Params) 
        {
          SqlCommand Cmd = CreateCommand(ProcName, Params);
          return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }


        //公有方法，执行SQL命令
        //输入：
        //			StrName - 存储过程名
        //      Params	 - 执行SQL命令需要的参数
        //输出：
        //			将执行结果以SqlDataReader返回
        //注意：使用后主意调用SqlDataReader.Close()方法
        public SqlDataReader RunStrGetReader(string StrName, SqlParameter[] Params)
        {
            SqlCommand Cmd = CreateStrCommand(StrName, Params);
            return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

        //公有方法，调用存储过程(带参数)
        //输入：
        //		ProcName - 存储过程名
        //      Params	 - 存储过程需要的参数
        //输出：
        //			将执行结果以SqlDataReader返回
        //注意：使用后主意调用SqlDataReader.Close()方法
        public int RunProcGetCount(string ProcName, SqlParameter[] Params)
        {
            SqlCommand Cmd = CreateCommand(ProcName, Params);            
            string SCount;            
            SCount = Cmd.ExecuteScalar().ToString().Trim();
            if (SCount == "")
                SCount = "0";
            Close();
            return Convert.ToInt32(SCount);
        }

        //公有方法，调用存储过程(不带参数)
        //输入：
        //			ProcName存储过程名
        //输出：
        //			将执行结果以DataSet返回    
        public DataSet GetDataSet(string ProcName)
        {
            Open();
            SqlDataAdapter adapter = new SqlDataAdapter(ProcName, Connection);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            Close();
            return dataset;
        }

        //公有方法，执行SQL命令
        //输入：
        //			StrName存储过程名
        //输出：
        //			将执行结果以DataSet返回    
        public DataSet GetStrDataSet(string StrName)
        {
            Open();
            SqlDataAdapter adapter = new SqlDataAdapter(StrName, Connection);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            Close();
            return dataset;
        }

        //公有方法，调用存储过程(不带参数)
        //输入：
        //			ProcName存储过程名
        //输出：
        //			将执行结果以DataSet返回    
        public DataSet GetDataSet(string ProcName, SqlParameter[] Params)
        {
            Open();
            SqlCommand Cmd = CreateCommand(ProcName, Params);
            SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            Close();
            return dataset;
        }
        //公有方法，调用存储过程(不带参数)
        //输入：
        //			ProcName存储过程名
        //输出：
        //			将执行结果以DataSet返回    
        public DataSet GetStrDataSetSql(string StrName, SqlParameter[] Params)
        {
            Open();
            SqlCommand Cmd = CreateStrCommand(StrName, Params);
            SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            Close();
            return dataset;
        }

        //公有方法，根据Sql语句，返回一个结果数据集
        public DataSet GetDataSetSql(string XSqlString)
        {
            Open();
            SqlDataAdapter Adapter = new SqlDataAdapter(XSqlString, Connection);
            DataSet Ds = new DataSet();
            Adapter.Fill(Ds);
            Close();
            return Ds;
        }
        //公有方法，根据Sql语句，插入记录
        public int Insert(string XSqlString)
        {
            int Count = -1;
            Open();
            SqlCommand cmd = new SqlCommand(XSqlString, Connection);
            Count = cmd.ExecuteNonQuery();
            Close();
            return Count;            
        }
        //公有方法，根据Sql语句，插入记录并返回生成的ID号
        public int GetIDInsert(string XSqlString)
        {
            int Count = -1;
            Open();
            SqlCommand cmd = new SqlCommand(XSqlString, Connection);
            Count = Convert.ToInt32(cmd.ExecuteScalar().ToString().Trim());
            Close();
            return Count;
        }       
        /// 公有方法，获取数据，返回一个DataRow。
        public DataRow GetDataRow(String SqlString)
        {
            DataSet dataset = GetDataSet(SqlString);
            dataset.CaseSensitive = false;
            if (dataset.Tables[0].Rows.Count > 0)
            {
                return dataset.Tables[0].Rows[0];
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 公有方法，更新一个数据表。
        /// </summary>
        /// <param name="TableName">表名</param>
        /// <param name="Cols">哈西表，键值为字段名，值为字段值</param>
        /// <param name="Where">Where子句</param>
        /// <returns>是否成功</returns>
        public bool Update(String TableName, Hashtable Cols, String Where)
        {
            int Count = 0;
            if (Cols.Count <= 0)
            {
                return true;
            }
            String Fields = " ";
            foreach (DictionaryEntry item in Cols)
            {
                if (Count != 0)
                {
                    Fields += ",";
                }
                Fields += "[" + item.Key.ToString() + "]";
                Fields += "=";
                Fields += item.Value.ToString();
                Count++;
            }
            Fields += " ";

            String SqlString = "Update " + TableName + " Set " + Fields + Where;

            String[] Sqls = { SqlString };
            return ExecuteSQL(Sqls);
        }
        public bool ExecuteSQL(String[] SqlStrings)
        {
            bool success = true;
            Open();
            SqlCommand cmd = new SqlCommand();
            SqlTransaction trans = Connection.BeginTransaction();
            cmd.Connection = Connection;
            cmd.Transaction = trans;

            int i = 0;
            try
            {
                foreach (String str in SqlStrings)
                {
                    cmd.CommandText = str;
                    cmd.ExecuteNonQuery();
                    i++;
                }
                trans.Commit();
            }
            catch
            {                
                success = false;
                trans.Rollback();
                Close();
            }
            finally
            {
                Close();
            }
            return success;
        }
        /// <summary>
        /// 公有方法，获取数据，返回一个DataTable。
        /// </summary>
        /// <param name="SqlString">Sql语句</param>
        /// <returns>DataTable</returns>
        public DataTable GetDataTable(String SqlString)
        {
            DataSet dataset = GetDataSet(SqlString);
            dataset.CaseSensitive = false;
            return dataset.Tables[0];
        }
	}
}
