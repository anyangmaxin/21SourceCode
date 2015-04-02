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
using System.Data.SqlClient;

public partial class GetPass : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        //编写SQL语句查询输入的用户名是否存在
        string sqlSel = "select * from userRegister where userName='" + txtName.Text + "'";
        //调用公共类中的getRow方法并接收返回的SqlDataReader对象
        SqlDataReader  sdr = operateData.getRow(sqlSel);
        //判读用户是否存在
        if (sdr.Read())
        {
            //隐藏输入用户名的panel
            PanelInputName.Visible = false;
            //显示输入密码提示问题的panel
            PanelGetPass.Visible = true;
            //显示密码提示问题
            txtQuestion.Text = sdr["passQuestion"].ToString();
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('用户名不存在！！')</script>");
        }

    }

    protected void btnGet_Click(object sender, EventArgs e)
    {
        //编写SQL语句查询用户注册信息
        string sqlSel = "select * from userRegister where userName='" + txtName.Text + "'";
        SqlDataReader sdr = operateData.getRow(sqlSel);
        if (sdr.Read())
        {
            //判断用户输入的密码提示答案是否正确
            if (txtAnswer.Text == sdr["passAnswer"].ToString())
            {
                //显示用户的密码
                txtPass.Text = sdr["userPass"].ToString();
                RegisterStartupScript("true", "<script>alert('恭喜你密码已找回！！')</script>");
            }
        }
    }
    
}
