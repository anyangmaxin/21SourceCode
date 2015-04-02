using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using OnLineExam.DataBaseClass;
using OnLineExam.HelperClass;


namespace OnLineExam.BusinessClass
{
    //用户类
    public class Scoresmr
    {
        #region 私有成员
        private int _ID;                                              
        private string _userID;                                       
        private int _paperID;                                       
        private int _score;
        private DateTime _examtime;//考试时间
        private DateTime _judgetime;  //评阅时间   
        private string _pingyu;  //评阅时间    
       
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
        public int PaperID
        {
            set
            {
                this._paperID = value;
            }
            get
            {
                return this._paperID;
            }
        }
        public int Score
        {
            set
            {
                this._score = value;
            }
            get
            {
                return this._score;
            }
        }
        public DateTime ExamTime
        {
            set
            {
                this._examtime = value;
            }
            get
            {
                return this._examtime;
            }
        }
        public DateTime JudgeTime
        {
            set
            {
                this._judgetime = value;
            }
            get
            {
                return this._judgetime;
            }
        }
        public string PingYu
        {
            set
            {
                this._pingyu = value;
            }
            get
            {
                return this._pingyu;
            }
        }       
        
        #endregion 属性

        #region 方法

        //向Scoremr表中添加成绩
        //输出：
        //      插入成功：返回True；
        //      插入失败：返回False；
        public bool InsertByProc()
        {
            SqlParameter[] Params = new SqlParameter[6];

            DataBase DB = new DataBase();
            string strsql = "INSERT INTO Scoremr (UserID, PaperID,Score,ExamTime,JudgeTime,PingYu) VALUES ( @UserID,@PaperID,@Score,@ExamTime,@JudgeTime,@PingYu)";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 20, UserID);              
            Params[1] = DB.MakeInParam("@PaperID", SqlDbType.Int,4, PaperID);                   
            Params[2] = DB.MakeInParam("@Score", SqlDbType.Int,4, Score);                      
            Params[3] = DB.MakeInParam("@ExamTime", SqlDbType.DateTime, 8,ExamTime);
            Params[4] = DB.MakeInParam("@JudgeTime", SqlDbType.DateTime, 8, DateTime.Now);
            Params[5] = DB.MakeInParam("@PingYu", SqlDbType.VarChar, 1000, PingYu);    

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        public bool CheckScore(string XUserID,int XPaperID)
        {
            SqlParameter[] Params = new SqlParameter[2];
            DataBase DB = new DataBase();
            string strsql = " SELECT * FROM Scoremr WHERE UserID =@UserID and PaperID= @PaperID";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 20, XUserID);
            Params[1] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, XPaperID);

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

        //删除成绩
        //输入：
        //      XUserID - 用户编号；
        //输出：
        //      删除成功：返回True；
        //      删除失败：返回False；
        public bool DeleteByStr(int SID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "DELETE FROM Scoremr WHERE ID = @ID";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, SID);               //成绩编号          

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }
        
        //查询所用成绩
        //不需要参数
        public DataSet QueryScore()
        {
            DataBase DB = new DataBase();
            string strsql = "SELECT Usersmr.UserID,	Usersmr.UserName,Scoremr.ID,Scoremr.Score,Scoremr.ExamTime,Scoremr.JudgeTime, Papermr.PaperID,Papermr.PaperName FROM Usersmr,Scoremr,Papermr where Usersmr.UserID=Scoremr.UserID and Scoremr.PaperID=Papermr.PaperID";
            //return DB.GetDataSet("Proc_ScoreList");
            return DB.GetStrDataSet(strsql);
        }

        //查询某个用户成绩       
        public DataSet QueryUserScore(string XUserID)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            string strsql = "SELECT Usersmr.UserID,Usersmr.UserName,Scoremr.ID,Scoremr.Score,Scoremr.ExamTime,Scoremr.JudgeTime,Scoremr.PingYu,Papermr.PaperID,Papermr.PaperName FROM Usersmr,Scoremr,Papermr WHERE Usersmr.UserID=Scoremr.UserID and Scoremr.PaperID=Papermr.PaperID and Usersmr.UserID=@UserID order by Scoremr.ExamTime";
            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 20,XUserID);    
            return DB.GetStrDataSetSql(strsql, Params);
        }

        

        #endregion 方法
    }
}