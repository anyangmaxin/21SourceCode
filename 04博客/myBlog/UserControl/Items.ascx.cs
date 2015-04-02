using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class UserControl_Items : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
        this.lblMessage.Visible = false;
    }
    public void BindData()
    {
        string sqlstr = "select * from VoteItem";
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        SqlDataAdapter myda = new SqlDataAdapter(sqlstr, conn);
        DataSet myds = new DataSet();
        conn.Open();
        myda.Fill(myds, "VoteItem");
        GridView1.DataSource = myds;
        GridView1.DataBind();
    }

    protected void Btntp_Click(object sender, EventArgs e)
    {
   //初始化投票项目操作类
        ItemOperation io = new ItemOperation();
        //遍历网格控件中的每一行
        foreach (GridViewRow rowview in GridView1.Rows)
        {
            //搜索模板列中的CheckBox控件
            CheckBox check = (CheckBox)rowview.Cells[2].FindControl("CheckBox1");
            //如果被选中
            if (check.Checked)
            {
                //更新数据库中的被投次数
                io.UpdateVote(int.Parse(rowview.Cells[0].Text));
                this.lblMessage.Visible = true;
                lblMessage.Text = "谢谢您的投票";
                check.Checked = false;
            }
        }
       BindData();
    }
}
