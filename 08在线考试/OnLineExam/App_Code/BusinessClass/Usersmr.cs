
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient;
using OnLineExam.DataBaseClass;
using OnLineExam.HelperClass;
using System.Text.RegularExpressions;
using System.Text;
using System.Security.Cryptography;

namespace OnLineExam.BusinessClass
{
    //用户类
    public class Usersmr
    {
        #region 私有成员
        private string _userID;                                               //用户编号
        private string _userPwd;                                         //用户密码
        private string _userName;                                             //用户姓名        
        private int _department;	                    //用户部门
        private int _roleid;		                     //用户角色
        private string _rolename;
        private ArrayList _duties = new ArrayList();	//用户所有的权限

        #endregion 私有成员

        #region 属性

        public string UserID
        {
            set
            {
                this._userID = value;
            }
            get
            {
                return this._userID;
            }
        }
        public string UserPwd
        {
            set
            {
                this._userPwd = value;
            }
            get
            {
                return this._userPwd;
            }
        }
      
        public string UserName
        {
            set
            {
                this._userName = value;
            }
            get
            {
                return this._userName;
            }
        }
        public int DepartmentId
        {
            set
            {
                this._department = value;
            }
            get
            {
                return this._department;
            }
        }
        public int RoleId
        {
            set
            {
                this._roleid = value;
            }
            get
            {
                return this._roleid;
            }
        }
        public string RoleName
        {
            set
            {
                this._rolename = value;
            }
            get
            {
                return this._rolename;
            }
        }
        public ArrayList Duties
        {
            set
            {
                this._duties = value;
            }
            get
            {
                return this._duties;
            }
        }
        #endregion 属性

        #region 方法

        //根据用户 UserID 初始化该用户
        //输入：
        //      XUserID - 用户编号；
        //输出：
        //      用户存在：返回True；
        //      用户不在：返回False；
        public bool LoadData(string XUserID)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, XUserID);                  //用户编号            
            string strsql = "SELECT * FROM Usersmr,Departmentmr,Rolemr WHERE UserID=@UserID AND Usersmr.DepartmentId = Departmentmr.DepartmentId And Usersmr.RoleId = Rolemr.RoleId";
            DataSet ds = DB.GetStrDataSetSql(strsql, Params);            
            ds.CaseSensitive = false;
            DataRow DR;
            if (ds.Tables[0].Rows.Count > 0)
            {
                DR= ds.Tables[0].Rows[0];
                this._userID = GetSafeData.ValidateDataRow_S(DR, "UserID");                         //用户编号              
                this._userName = GetSafeData.ValidateDataRow_S(DR, "UserName");                     //用户姓名 
                this._userPwd = GetSafeData.ValidateDataRow_S(DR, "UserPwd");                   //用户密码
                this._department = GetSafeData.ValidateDataRow_N(DR, "DepartmentId");           //所在部门  
                this._roleid = GetSafeData.ValidateDataRow_N(DR, "RoleId");                     //用户权限 
                this._rolename = GetSafeData.ValidateDataRow_S(DR, "RoleName");                     //用户权限 

                //获取权限集合
                string colName = "";
                for (int i = 0; i < DR.ItemArray.Length; i++)
                {
                    colName = DR.Table.Columns[i].ColumnName;
                    if (colName.StartsWith("HasDuty_") && GetSafeData.ValidateDataRow_N(DR, colName) == 1)
                    {
                        this._duties.Add(DR.Table.Columns[i].ColumnName.Substring(8));	//去掉前缀“HasDuty_”
                    }
                }
                return true;
            }
            else
            {
                return false;
            }           
        }

        //根据UserID判断该用户是否存在
        //输入：
        //      XUserID - 用户编号；        
        //输出：
        //      用户存在：返回True；
        //      用户不在：返回False；
        public bool CheckUser(string XUserID)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            string strsql = "SELECT * FROM Usersmr,Departmentmr,Rolemr WHERE UserID=@UserID AND Usersmr.DepartmentId = Departmentmr.DepartmentId And Usersmr.RoleId = Rolemr.RoleId";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, XUserID);                  //教工姓名            

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
      

        //根据UserID和UserPassword判断密码是否正确
        //输入：
        //      XUserID - 用户编号；        
        //输出：
        //      用户存在：返回True；
        //      用户不在：返回False；
        public bool CheckPassword(string XUserID)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            string strsql = "SELECT * FROM Usersmr,Departmentmr,Rolemr WHERE UserID=@UserID AND Usersmr.DepartmentId = Departmentmr.DepartmentId And Usersmr.RoleId = Rolemr.RoleId";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, XUserID);                  //编号            

            SqlDataReader DR = DB.RunStrGetReader(strsql, Params);
            if (!DR.Read())
            {
                return false;
            }
            else
            {
                this._userPwd = DR["UserPwd"].ToString();                
                return true;
            }
        }
        //判断是否已经考试
        public bool IsTest(string UserID, int PaperID)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();
            string strsql = "SELECT * FROM UserAnswermr WHERE UserID=@UserID AND PaperID=@PaperID";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 20, UserID);              
            Params[1] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, PaperID);

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
        
        //修改用户的密码
        //输入：
        //      XUserID - 用户编号；
        //输出：
        //      修改成功：返回True；
        //      修改失败：返回False；
        public bool ModifyPassword(string XUserID)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();
            string strsql = "UPDATE Usersmr SET UserPwd = @UserPwd WHERE (UserID = @UserID)";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 20, XUserID);               //用户编号 
            Params[1] = DB.MakeInParam("@UserPwd", SqlDbType.VarChar, 64, UserPwd);    //用户密码 

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //向Usersmr表中添加用户信息(采用存储过程)
        //输出：
        //      插入成功：返回True；
        //      插入失败：返回False；
        public bool InsertByStr()
        {
            SqlParameter[] Params = new SqlParameter[5];

            DataBase DB = new DataBase();
            string strsql = "INSERT INTO Usersmr (UserID,UserName,UserPwd,DepartmentId,RoleId) VALUES ( @UserID,@UserName,@UserPwd,@DepartmentId, @RoleId)";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, UserID);               //用户编号
            Params[1] = DB.MakeInParam("@UserName", SqlDbType.VarChar, 50, UserName);           //用户姓名
            Params[2] = DB.MakeInParam("@UserPwd", SqlDbType.VarChar,64, UserPwd);    //用户密码
            Params[3] = DB.MakeInParam("@RoleId", SqlDbType.Int, 4,RoleId);    //角色
            Params[4] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);    //部门
           
            int Count = -1;
            //Count = DB.RunProc("Proc_UsersAdd", Params);
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        //更新用户的信息
        public bool UpdateByProc(string XUserID)
        {
            SqlParameter[] Params = new SqlParameter[4];

            DataBase DB = new DataBase();
            string strsql = "UPDATE Usersmr SET UserName= @UserName,DepartmentId= @DepartmentId,RoleId = @RoleId WHERE UserID = @UserID";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, XUserID);               //用户编号           
            Params[1] = DB.MakeInParam("@UserName", SqlDbType.VarChar, 50, UserName);           //用户姓名           
            Params[2] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);        //部门           
            Params[3] = DB.MakeInParam("@RoleId", SqlDbType.Int, 4, RoleId);           //角色
         

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //删除用户
        //输入：
        //      XUserID - 用户编号；
        //输出：
        //      删除成功：返回True；
        //      删除失败：返回False；
        public bool DeleteByProc(string XUserID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "DELETE FROM Usersmr WHERE UserID = @UserID";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, XUserID);               //用户编号          
            
            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //查询用户
        //查询所用用户
        //不需要参数
        public DataSet QueryUsers()
        {
            DataBase DB = new DataBase();
            string strsql = "SELECT Usersmr.UserID,	Usersmr.UserName,Departmentmr.DepartmentName,Rolemr.RoleName FROM Usersmr,Departmentmr,Rolemr WHERE Usersmr.DepartmentId=Departmentmr.DepartmentId AND Usersmr.RoleId=Rolemr.RoleId";
            //return DB.GetDataSet("Proc_UsersList");
            return DB.GetStrDataSet(strsql);
        }
      
        /// 查询用户        
        public static DataTable QueryUsers(Hashtable queryItems)
        {
            string where = SQLString.GetConditionClause(queryItems);
            string sql = "Select * From [Usersmr],[Departmentmr],[Rolemr] " + where;

            if (where == "")
                sql += " Where";
            else
                sql += " And";

            sql += " [Usersmr].DepartmentId=[Departmentmr].DepartmentId"
                + " And [Usersmr].RoleId=[Rolemr].RoleId";

            DataBase DB = new DataBase();
            return DB.GetDataTable(sql);
        }
        // 自定义MD5加密方法
        public string GetMd5(string str)//MD5 32位加密
        {
            string cl = str;//将要加密的字符串加上前缀与后缀后再加密；
            string pwd = "";
            MD5 md5 = MD5.Create();//实例化一个md5对像
            // 加密后是一个字节类型的数组，这里要注意编码UTF8/Unicode等的选择
            byte[] s = md5.ComputeHash(Encoding.UTF8.GetBytes(cl));
            s.Reverse();    //翻转生成的MD5码
            // 通过使用循环，将字节类型的数组转换为字符串，此字符串是常规字符格式化所得
            for (int i = 3; i < s.Length - 1; i++) //只取MD5码的一部分；恶意访问者无法知道取的是哪几位。
            {
                // 将得到的字符串使用十六进制类型格式。格式后的字符是小写的字母，如果使用大写（X）则格式后的字符是大写字符
                pwd = pwd + (s[i] < 198 ? s[i] + 28 : s[i]).ToString("X"); // 进一步对生成的MD5码做一些改造。
            }
            return pwd;
        }

        #endregion 方法
        
    }
}