using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;

using OnLineExam.DataBaseClass;
using OnLineExam.HelperClass;

namespace OnLineExam.BusinessClass
{    
    public class Departmentmr
    {
        #region 私有成员

        private int _departmentId;			//部门ID
        private string _departmentName;		//部门名       

        #endregion 私有成员

        #region 属性

        public int DepartmentId
        {
            set
            {
                this._departmentId = value;
            }
            get
            {
                return this._departmentId;
            }
        }
        public string DepartmentName
        {
            set
            {
                this._departmentName = value;
            }
            get
            {
                return this._departmentName;
            }
        }
   
        #endregion 属性

        #region 方法

        /// <summary>
        /// 根据参数departmentId，获取教师系别详细信息
        /// </summary>
        /// <param name="topicID">系别ID</param>
        public bool LoadData(int DepartmentId)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            string sqlstr = " SELECT *	FROM Departmentmr WHERE DepartmentId =@DepartmentId";
            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);                  //用户编号            

            DataSet ds = DB.GetStrDataSetSql(sqlstr, Params);
            ds.CaseSensitive = false;
            DataRow DR;
            if (ds.Tables[0].Rows.Count > 0)
            {
                DR = ds.Tables[0].Rows[0];
                this._departmentId = GetSafeData.ValidateDataRow_N(DR, "DepartmentId");
                this._departmentName = GetSafeData.ValidateDataRow_S(DR, "DepartmentName");

                return true;
            }
            else
            {
                return false;
            }
        }
        public bool CheckDepartment(int XDepartmentId)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            string strsql = "SELECT * FROM Departmentmr WHERE DepartmentId =@DepartmentId";
            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, XDepartmentId);

            SqlDataReader DR = DB.RunStrGetReader(strsql, Params);
            if (!DR.Read())
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        //插入教师系别信息
        public bool InsertByStr()
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();
            string strsql = " INSERT INTO Departmentmr(DepartmentId,DepartmentName) VALUES ( @DepartmentId,@DepartmentName)";
            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);
            Params[1] = DB.MakeInParam("@DepartmentName", SqlDbType.VarChar, 50, DepartmentName);

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        //更新教师系别信息
        public bool UpdateByStr(string DepartmentId)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();
            string strsql = " UPDATE Departmentmr SET DepartmentId = @DepartmentId,DepartmentName  = @DepartmentName WHERE DepartmentId = @DepartmentId";
            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);
            Params[1] = DB.MakeInParam("@DepartmentName", SqlDbType.VarChar, 50, DepartmentName);            
           

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        //删除教师系别信息
        public bool DeleteByStr(string DepartmentId)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "DELETE FROM Departmentmr WHERE (DepartmentId = @DepartmentId)";
            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);               //用户编号          

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        public DataSet QueryDepartment()
        {
            DataBase DB = new DataBase();
            string sqlstr = "SELECT DepartmentId,DepartmentName FROM Departmentmr";
            return DB.GetStrDataSet(sqlstr);
        }
       
        public static DataTable Query(Hashtable queryItems)
        {
            string where = SQLString.GetConditionClause(queryItems);
            string sql = "Select * From [Departmentmr]" + where;
            DataBase db = new DataBase();
            return db.GetDataTable(sql);
        }
       
        #endregion 方法
    }
}
