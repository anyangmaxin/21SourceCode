using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using OnLineExam.DataBaseClass;
using OnLineExam.HelperClass;


namespace OnLineExam.BusinessClass
{
    //考试科目类
    public class Coursemr
    {
        #region 私有成员
        private int _ID;                                               //题目编号            
        private string _Name;                                         //题目        

        #endregion 私有成员

        #region 属性

        public int ID
        {
            set
            {
                this._ID = value;
            }
            get
            {
                return this._ID;
            }
        }
        public string Name
        {
            set
            {
                this._Name = value;
            }
            get
            {
                return this._Name;
            }
        }
        
        #endregion 属性

        #region 方法

        //向Coursemr表中添加考试科目信息
        //输出：
        //      如果插入成功：返回True；
        //      如果插入失败：返回False；
        public bool InsertByStr()
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            string strsql = "INSERT INTO Coursemr(Name) VALUES (@Name)";
            
            Params[0] = DB.MakeInParam("@Name", SqlDbType.VarChar, 50, Name);               //考试科目名称           

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //更新考试科目的信息
        public bool UpdateByStr(int CID)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();
            string strsql = "UPDATE Coursemr SET Name = @Name WHERE ID = @ID";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, CID);               //用户编号            
            Params[1] = DB.MakeInParam("@Name", SqlDbType.VarChar, 200, Name);      //用户权限           

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        
        //删除考试科目
        //输入：
        //      CID - 科目编号；
        //输出：
        //      如果删除成功：返回True；
        //      如果删除失败：返回False；
        public bool DeleteByStr(int CID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "DELETE FROM Coursemr WHERE ID = @ID";

            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int,4, CID);               //科目编号          
            
            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        
        //查询所用考试科目
        //不需要带参数
        public DataSet QueryCourse()
        {
            DataBase DB = new DataBase();
            string strsql = "select * from Coursemr";
            return DB.GetStrDataSet(strsql);
        }
        
        #endregion 方法
    }
}