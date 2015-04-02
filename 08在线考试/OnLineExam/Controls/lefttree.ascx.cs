using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using OnLineExam.DataBaseClass;
using OnLineExam.HelperClass;
using OnLineExam.BusinessClass;
using OnLineExam.CommonClass;

public partial class Controls_lefttree : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            InitData();
        }
    }
    private void InitData()
    {
       CheckUser();

       string loginName = Session["userID"].ToString();

       Usersmr user = new Usersmr();
        user.LoadData(loginName);

        string sql = "Select * from [TreeMenu] Where [Duty] in (";
        foreach (string duty in user.Duties)
        {
            sql += SQLString.GetQuotedString(duty) + ",";
        }
        sql += "'#')";

        DataBase db = new DataBase();
        DataTable dt = db.GetDataTable(sql);

        Tree tree = new Tree();
        LabelTree.Text += tree.CreateTree(dt);
    }

   
  private void CheckUser()
  {
       if (Session["userID"]==null)
           Response.Redirect("Login.aspx");
  }
}
