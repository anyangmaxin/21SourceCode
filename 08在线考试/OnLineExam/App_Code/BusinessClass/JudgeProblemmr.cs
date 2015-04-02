using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using OnLineExam.DataBaseClass;
using OnLineExam.HelperClass;


namespace OnLineExam.BusinessClass
{
    //判断题类
    public class JudgeProblemmr
    {
        #region 私有成员
        private int _ID;                                               //题目编号
        private int _CourseID;                                         //所属科目        
        private string _Title;                                         //题目       
        private bool _Answer;                                       //答案

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
        public int CourseID
        {
            set
            {
                this._CourseID = value;
            }
            get
            {
                return this._CourseID;
            }
        }
        public string Title
        {
            set
            {
                this._Title = value;
            }
            get
            {
                return this._Title;
            }
        }        
        public Boolean Answer
        {
            set
            {
                this._Answer = value;
            }
            get
            {
                return this._Answer;
            }
        }
        #endregion 属性

        #region 方法

        //根据题目ID 初始化题目
        //输入：
        //      TID - 题目编号；
        //输出：
        //      如果考试题目存在：返回True；
        //      如果考试题目不在：返回False；
        public bool LoadData(int TID)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            string strsql = "SELECT * FROM JudgeProblemmr where ID=@ID";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);                  //用户编号            

            DataSet ds = DB.GetStrDataSetSql(strsql, Params);
            ds.CaseSensitive = false;
            DataRow DR;
            if (ds.Tables[0].Rows.Count > 0)
            {
                DR = ds.Tables[0].Rows[0];
                this._CourseID = GetSafeData.ValidateDataRow_N(DR, "CourseID");                   //科目编号                
                this._Title = GetSafeData.ValidateDataRow_S(DR, "Title");                         //题目
                this._Answer = GetSafeData.ValidateDataRow_B(DR, "Answer");                     //答案                
                return true;
            }
            else
            {
                return false;
            }
        }


        //向SingleProblemmr表中添加题目信息
        //输出：
        //      如果插入成功：返回True；
        //      如果插入失败：返回False；
        public bool InsertByStr()
        {
            SqlParameter[] Params = new SqlParameter[3];

            DataBase DB = new DataBase();
            string strsql = "INSERT INTO JudgeProblemmr (CourseID,Title,Answer) VALUES (@CourseID,@Title,@Answer)";
            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);                 //科目编号
            Params[1] = DB.MakeInParam("@Title", SqlDbType.VarChar, 1000, Title);                //题目            
            Params[2] = DB.MakeInParam("@Answer", SqlDbType.Bit,1, Answer);                      //答案A            

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //更新判断题的信息
        public bool UpdateByStr(int TID)
        {
            SqlParameter[] Params = new SqlParameter[4];

            DataBase DB = new DataBase();
            string strsql = "UPDATE JudgeProblemmr SET CourseID= @CourseID,Title= @Title,Answer= @Answer WHERE (ID = @ID)";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);                           //题目编号
            Params[1] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);                //科目编号
            Params[2] = DB.MakeInParam("@Title", SqlDbType.VarChar, 1000, Title);               //题目            
            Params[3] = DB.MakeInParam("@Answer", SqlDbType.Bit, 1, Answer);                    //答案           

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }


        //删除题目
        //输入：
        //      TID - 题目编号；
        //输出：
        //      如果删除成功：返回True；
        //      如果删除失败：返回False；
        public bool DeleteByStr(int TID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "DELETE FROM JudgeProblemmr WHERE (ID= @ID)";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);               //题目编号          

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //查询判断题
        //课程编号
        public DataSet QueryJudgeProblem(int TCourseID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "SELECT JudgeProblemmr.ID, JudgeProblemmr.Title FROM JudgeProblemmr where [CourseID]=@CourseID";
            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, TCourseID);               //题目编号           
            return DB.GetStrDataSetSql(strsql, Params);
        }  

        #endregion 方法
    }
}