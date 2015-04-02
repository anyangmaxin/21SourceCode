using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using OnLineExam.DataBaseClass;
using OnLineExam.HelperClass;

namespace OnLineExam.BusinessClass
{
    //�ʴ���
	public class QuestionProblemmr
	{
        #region ˽�г�Ա
        private int _ID;                                               //��Ŀ���
        private int _CourseID;                                         //������Ŀ        
        private string _Title;                                         //��Ŀ       
        private string _Answer;                                       //��

        #endregion ˽�г�Ա

        #region ����

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
        #endregion ����

         #region ����

        //������ĿID ��ʼ����Ŀ
        //���룺
        //      TID - ��Ŀ��ţ�
        //�����
        //      ���������Ŀ���ڣ�����True��
        //      ���������Ŀ���ڣ�����False��
        public bool LoadData(int TID)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            string strsql = "SELECT * FROM QuestionProblemmr where ID=@ID";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);                  //�û����            

            DataSet ds = DB.GetStrDataSetSql(strsql, Params);
            ds.CaseSensitive = false;
            DataRow DR;
            if (ds.Tables[0].Rows.Count > 0)
            {
                DR = ds.Tables[0].Rows[0];
                this._CourseID = GetSafeData.ValidateDataRow_N(DR, "CourseID");                   //��Ŀ���                
                this._Title = GetSafeData.ValidateDataRow_S(DR, "Title");                         //��Ŀ
                this._Answer = GetSafeData.ValidateDataRow_S(DR, "Answer");                     //��                
                return true;
            }
            else
            {
                return false;
            }
        }


        //��SingleProblemmr���������Ŀ��Ϣ(���ò�������)
        //�����
        //      ����ɹ�������True��
        //      ����ʧ�ܣ�����False��
        public bool InsertByStr()
        {
            SqlParameter[] Params = new SqlParameter[3];

            DataBase DB = new DataBase();
            string strsql = "INSERT INTO QuestionProblemmr (CourseID,Title,Answer) VALUES (@CourseID,@Title,@Answer)";
            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);                 //��Ŀ���
            Params[1] = DB.MakeInParam("@Title", SqlDbType.VarChar, 1000, Title);                //��Ŀ            
            Params[2] = DB.MakeInParam("@Answer", SqlDbType.VarChar,1000, Answer);                      //��A            

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //�����ж������Ϣ
        public bool UpdateByStr(int TID)
        {
            SqlParameter[] Params = new SqlParameter[4];

            DataBase DB = new DataBase();
            string strsql = "UPDATE QuestionProblemmr SET CourseID= @CourseID,Title= @Title,Answer = @Answer WHERE (ID = @ID)";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);                           //��Ŀ���
            Params[1] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);                //��Ŀ���
            Params[2] = DB.MakeInParam("@Title", SqlDbType.VarChar, 1000, Title);               //��Ŀ            
            Params[3] = DB.MakeInParam("@Answer", SqlDbType.VarChar, 1000, Answer);                    //��           

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }


        //ɾ����Ŀ
        //���룺
        //      TID - ��Ŀ��ţ�
        //�����
        //      ɾ���ɹ�������True��
        //      ɾ��ʧ�ܣ�����False��
        public bool DeleteByStr(int TID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "DELETE FROM QuestionProblemmr WHERE (ID= @ID)";
            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);               //��Ŀ���          

            int Count = -1;
            Count = DB.ProcStr(strsql, Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //��ѯ�ʴ���
        //�γ̱��
        public DataSet QueryQuestionProblem(int TCourseID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            string strsql = "SELECT QuestionProblemmr.ID,QuestionProblemmr.Title FROM QuestionProblemmr where CourseID=@CourseID";
            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, TCourseID);               //��Ŀ���           
            return DB.GetStrDataSetSql(strsql, Params);
        }  

        #endregion ����
    }
}
