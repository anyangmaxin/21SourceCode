using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using OnLineExam.DataBaseClass;
using OnLineExam.HelperClass;

namespace OnLineExam.BusinessClass
{
    /// <summary>
    /// Rolemr 的摘要说明。
    /// </summary>
    public class Rolemr
    {
        #region 私有成员

        private int _roleId;			//角色（职务）ID
        private string _roleName;		//角色（职务）名
        private int _HasDuty_DepartmentManage;
        private int _HasDuty_UserManage;
        private int _HasDuty_RoleManage;
        private int _HasDuty_Role;
        private int _HasDuty_CourseManage;
        private int _HasDuty_PaperSetup;
        private int _HasDuty_PaperLists;
        private int _HasDuty_UserPaperList;
        private int _HasDuty_UserScore;   
        private int _HasDuty_SingleSelectManage;
        private int _HasDuty_MultiSelectManage;
        private int _HasDuty_FillBlankManage;
        private int _HasDuty_JudgeManage;
        private int _HasDuty_QuestionManage;
        private bool _exist;				//是否存在标志

        #endregion 私有成员

        #region 属性

        public int RoleId
        {
            set
            {
                this._roleId = value;
            }
            get
            {
                return this._roleId;
            }
        }
        public string RoleName
        {
            set
            {
                this._roleName = value;
            }
            get
            {
                return this._roleName;
            }
        }
        public int HasDuty_DepartmentManage
        {
            set
            {
                this._HasDuty_DepartmentManage = value;
            }
            get
            {
                return this._HasDuty_DepartmentManage;
            }
        }
        public int HasDuty_UserManage
        {
            set
            {
                this._HasDuty_UserManage = value;
            }
            get
            {
                return this._HasDuty_UserManage;
            }
        }
        public int HasDuty_RoleManage
        {
            set
            {
                this._HasDuty_RoleManage = value;
            }
            get
            {
                return this._HasDuty_RoleManage;
            }
        }
        public int HasDuty_Role
        {
            set
            {
                this._HasDuty_Role = value;
            }
            get
            {
                return this._HasDuty_Role;
            }
        }
        public int HasDuty_UserScore
        {
            set
            {
                this._HasDuty_UserScore = value;
            }
            get
            {
                return this._HasDuty_UserScore;
            }
        }
        public int HasDuty_CourseManage
        {
            set
            {
                this._HasDuty_CourseManage = value;
            }
            get
            {
                return this._HasDuty_CourseManage;
            }
        }
        public int HasDuty_PaperSetup
        {
            set
            {
                this._HasDuty_PaperSetup = value;
            }
            get
            {
                return this._HasDuty_PaperSetup;
            }
        }
        public int HasDuty_PaperLists
        {
            set
            {
                this._HasDuty_PaperLists = value;
            }
            get
            {
                return this._HasDuty_PaperLists;
            }
        }
        public int HasDuty_UserPaperList
        {
            set
            {
                this._HasDuty_UserPaperList = value;
            }
            get
            {
                return this._HasDuty_UserPaperList;
            }
        }
        public int HasDuty_SingleSelectManage
        {
            set
            {
                this._HasDuty_SingleSelectManage = value;
            }
            get
            {
                return this._HasDuty_SingleSelectManage;
            }
        }
        public int HasDuty_MultiSelectManage
        {
            set
            {
                this._HasDuty_MultiSelectManage = value;
            }
            get
            {
                return this._HasDuty_MultiSelectManage;
            }
        }
        public int HasDuty_FillBlankManage
        {
            set
            {
                this._HasDuty_FillBlankManage = value;
            }
            get
            {
                return this._HasDuty_FillBlankManage;
            }
        }
        public int HasDuty_JudgeManage
        {
            set
            {
                this._HasDuty_JudgeManage = value;
            }
            get
            {
                return this._HasDuty_JudgeManage;
            }
        }
        public int HasDuty_QuestionManage
        {
            set
            {
                this._HasDuty_QuestionManage = value;
            }
            get
            {
                return this._HasDuty_QuestionManage;
            }
        }
       
        public bool Exist
        {
            get
            {
                return this._exist;
            }
        }

        #endregion 属性

        #region 方法

        /// <summary>
        /// 根据参数roleId，获取角色（职务）详细信息
        /// </summary>
        /// <param name="topicID">角色（职务）ID</param>
        public void LoadData(int roleId)
        {
            DataBase db = new DataBase();		//实例化一个Database类

            string sql = "";
            sql = "Select * from [Rolemr] where RoleId = " + roleId;

            DataRow dr = db.GetDataRow(sql);	//利用Database类的GetDataRow方法查询数据

            //根据查询得到的数据，对成员赋值
            if (dr != null)
            {
                this._roleId = GetSafeData.ValidateDataRow_N(dr, "RoleId");
                this._roleName = GetSafeData.ValidateDataRow_S(dr, "RoleName");

                this._exist = true;
            }
            else
            {
                this._exist = false;
            }
        }
        public bool CheckRolemr(string XRoleName)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            string strsql = "SELECT * FROM Rolemr WHERE RoleName =@RoleName";
            Params[0] = DB.MakeInParam("@RoleName", SqlDbType.VarChar, 20, XRoleName);

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
        public bool InsertByStr()
        {
            SqlParameter[] Params = new SqlParameter[15];

            DataBase DB = new DataBase();
            string strsql = "INSERT INTO Rolemr (RoleName ,HasDuty_DepartmentManage ,HasDuty_UserManage,HasDuty_RoleManage,HasDuty_Role,HasDuty_UserScore,HasDuty_CourseManage,HasDuty_PaperLists,HasDuty_PaperSetup,HasDuty_UserPaperList,HasDuty_SingleSelectManage,HasDuty_MultiSelectManage,HasDuty_FillBlankManage,HasDuty_JudgeManage,HasDuty_QuestionManage)VALUES (@RoleName,@HasDuty_DepartmentManage,@HasDuty_UserManage,@HasDuty_RoleManage,@HasDuty_Role,@HasDuty_UserScore,@HasDuty_CourseManage,@HasDutyPaperLists,@HasDuty_PaperSetup,@HasDuty_UserPaperList,@HasDuty_SingleSelectManage,@HasDuty_MultiSelectManage,@HasDuty_FillBlankManage,@HasDuty_JudgeManage,@HasDuty_QuestionManage)";
            Params[0] = DB.MakeInParam("@RoleName", SqlDbType.VarChar, 20, RoleName);
            Params[1] = DB.MakeInParam("@HasDuty_DepartmentManage", SqlDbType.Int, 4, HasDuty_DepartmentManage);
            Params[2] = DB.MakeInParam("@HasDuty_UserManage", SqlDbType.Int, 4, HasDuty_UserManage);
            Params[3] = DB.MakeInParam("@HasDuty_RoleManage", SqlDbType.Int, 4,HasDuty_RoleManage);
            Params[4] = DB.MakeInParam("@HasDuty_Role", SqlDbType.Int, 4, HasDuty_Role);
            Params[5] = DB.MakeInParam("@HasDuty_UserScore", SqlDbType.Int, 4, HasDuty_UserScore);
            Params[6] = DB.MakeInParam("@HasDuty_CourseManage", SqlDbType.Int, 4, HasDuty_CourseManage);
            Params[7] = DB.MakeInParam("@HasDuty_PaperSetup", SqlDbType.Int, 4, HasDuty_PaperSetup);
            Params[8] = DB.MakeInParam("@HasDuty_PaperLists", SqlDbType.Int, 4, HasDuty_PaperLists);
            Params[9] = DB.MakeInParam("@HasDuty_SingleSelectManage", SqlDbType.Int, 4, HasDuty_SingleSelectManage);
            Params[10] = DB.MakeInParam("@HasDuty_MultiSelectManage", SqlDbType.Int, 4, HasDuty_MultiSelectManage);
            Params[11] = DB.MakeInParam("@HasDuty_FillBlankManage", SqlDbType.Int, 4, HasDuty_FillBlankManage);
            Params[12] = DB.MakeInParam("@HasDuty_JudgeManage", SqlDbType.Int, 4, HasDuty_JudgeManage);
            Params[13] = DB.MakeInParam("@HasDuty_QuestionManage", SqlDbType.Int, 4, HasDuty_QuestionManage);
            Params[14] = DB.MakeInParam("@HasDuty_UserPaperList", SqlDbType.Int, 4, HasDuty_UserPaperList);
      
            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        /// <summary>
        /// 根据查询条件哈希表,查询数据
        /// </summary>
        /// <param name="queryItems">查询条件哈希表</param>
        /// <returns>查询结果数据DataTable</returns>
        public static DataTable Query(Hashtable queryItems)
        {
            string where = SQLString.GetConditionClause(queryItems);
            string sql = "Select top 2 * From [Rolemr] order by RoleId" + where;
            DataBase db = new DataBase();
            return db.GetDataTable(sql);
        }

        /// <summary>
        /// 修改角色权限信息
        /// </summary>
        /// <param name="roleInfo">角色权限信息哈希表</param>
        public static void Update(Hashtable roleInfo, string where)
        {
            DataBase db = new DataBase();			//实例化一个Database类
            db.Update("[Rolemr]", roleInfo, where);	//利用Database类的Update方法修改数据
        }
        public bool UpdateByStr(int XRoleId)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();
            string strsql = "UPDATE Rolemr SET RoleName = @RoleName WHERE (RoleId = @RoleId";
            Params[0] = DB.MakeInParam("@RoleId", SqlDbType.Int, 4, XRoleId);                     
            Params[1] = DB.MakeInParam("@RoleName", SqlDbType.VarChar, 50, RoleName);               

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        public bool DeleteByStr(int XRoleId)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "DELETE FROM Rolemr WHERE (RoleId = @RoleId)";
            Params[0] = DB.MakeInParam("@RoleId", SqlDbType.Int, 4,XRoleId);               //科目编号          

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        //查询所有角色
        //不需要参数
        public DataSet QueryRole()
        {
            DataBase DB = new DataBase();
            string sqlstr = "SELECT Rolemr.RoleId,Rolemr.RoleName FROM Rolemr";
            return DB.GetStrDataSet(sqlstr);
        }
        #endregion 方法
    }
}
