using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using OnLineExam.DataBaseClass;
using OnLineExam.HelperClass;


namespace OnLineExam.BusinessClass
{
    //填空题类
    public class FillBlankProblemmr
    {
        #region 私有成员
        private int _ID;                                               //题目编号
        private int _CourseID;                                         //所属科目        
        private string _FrontTitle;                                    //题目前部分    
        private string _BackTitle;                                     //题目后部分
        private string _Answer;                                        //答案
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
        public string FrontTitle
        {
            set
            {
                this._FrontTitle = value;
            }
            get
            {
                return this._FrontTitle;
            }
        }
        public string BackTitle
        {
            set
            {
                this._BackTitle = value;
            }
            get
            {
                return this._BackTitle;
            }
        }
        public string Answer
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
            string strsql = "SELECT * FROM FillBlankProblemmr where ID=@ID";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);                  //用户编号            

            DataSet ds = DB.GetStrDataSetSql(strsql, Params);
            ds.CaseSensitive = false;
            DataRow DR;
            if (ds.Tables[0].Rows.Count > 0)
            {
                DR = ds.Tables[0].Rows[0];
                this._CourseID = GetSafeData.ValidateDataRow_N(DR, "CourseID");                   //科目编号                
                this._FrontTitle = GetSafeData.ValidateDataRow_S(DR, "FrontTitle");               //题目前部分
                this._BackTitle = GetSafeData.ValidateDataRow_S(DR, "BackTitle");                 //题目后部分                
                this._Answer = GetSafeData.ValidateDataRow_S(DR, "Answer");                       //答案
                return true;
            }
            else
            {
                return false;
            }
        }


        //向FillBlankProblemmr表中添加题目信息
        //输出：
        //      如果插入成功：返回True；
        //      如果插入失败：返回False；
        public bool InsertByStr()
        {
            SqlParameter[] Params = new SqlParameter[4];
            DataBase DB = new DataBase();
            string strsql = "INSERT INTO FillBlankProblemmr (CourseID,FrontTitle,BackTitle,Answer) VALUES (@CourseID,@FrontTitle,@BackTitle,@Answer)";
            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);                //科目编号
            Params[1] = DB.MakeInParam("@FrontTitle", SqlDbType.VarChar, 500, FrontTitle);      //题目前部分      
            Params[2] = DB.MakeInParam("@BackTitle", SqlDbType.VarChar, 500, BackTitle);        //题名后部分            
            Params[3] = DB.MakeInParam("@Answer", SqlDbType.VarChar, 200, Answer);              //答案
            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //更新填空题的信息
        public bool UpdateByStr(int TID)
        {
            SqlParameter[] Params = new SqlParameter[5];
            DataBase DB = new DataBase();
            string strsql = "UPDATE FillBlankProblemmr SET CourseID= @CourseID,FrontTitle= @FrontTitle,BackTitle= @BackTitle,Answer= @Answer WHERE (ID= @ID)";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);                           //题目编号
            Params[1] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);                //科目编号
            Params[2] = DB.MakeInParam("@FrontTitle", SqlDbType.VarChar, 500, FrontTitle);      //题目前部分      
            Params[3] = DB.MakeInParam("@BackTitle", SqlDbType.VarChar, 500, BackTitle);        //题名后部分            
            Params[4] = DB.MakeInParam("@Answer", SqlDbType.VarChar, 200, Answer);              //答案
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
            string strsql = "DELETE FROM FillBlankProblemmr WHERE (ID= @ID)";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);               //题目编号          
            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //查询填空题
        //课程编号
        public DataSet QueryFillBlankProblem(int TCourseID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "SELECT FillBlankProblemmr.ID, FillBlankProblemmr.FrontTitle,FillBlankProblemmr.BackTitle FROM FillBlankProblemmr where CourseID=@CourseID";
            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, TCourseID);               //题目编号           
            return DB.GetStrDataSetSql(strsql, Params);
        }

        #endregion 方法
    }
}