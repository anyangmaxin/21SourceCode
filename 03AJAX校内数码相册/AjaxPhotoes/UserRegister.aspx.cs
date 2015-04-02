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
using System.Xml.Linq;

public partial class UserRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void imgbtnRegister_Click(object sender, ImageClickEventArgs e)
    {
        string sex = "";
        //获取用户选择的性别
        if (radlistSex.SelectedValue.Trim() == "男")
        {
            sex = "男";
        }
        else
        {
            sex = "女";
        }
        if (isName(tbUserName.Text))
        {
            //使用Label控件显示提示信息
            labIsName.Text = "用户名已存在！";
            //设置Label控件的颜色
            labIsName.ForeColor = System.Drawing.Color.Red;
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('请正确填写信息！');", true);
        }
        else
        {
            LqDBDataContext lqdb = new LqDBDataContext();
            tb_userInfo t = new tb_userInfo();
            t.userName = tbUserName.Text.Trim();
            t.nickName = txtNickName.Text.Trim();
            t.userPass = tbPassword.Text.Trim();
            t.sex = sex;
            t.emaile = tbEmail.Text.Trim();
            t.city = txtCity.Text.Trim();
            lqdb.tb_userInfo.InsertOnSubmit(t);
            lqdb.SubmitChanges();
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('注册成功！');", true);
            tbUserName.Text = txtNickName.Text = tbEmail.Text = txtCity.Text = "";
        }
    }
    protected void imgbtnCheck_Click(object sender, ImageClickEventArgs e)
    {
        //判断用户名是否为空
        if (tbUserName.Text == "")
        {
            //使用Label控件给出提示
            labIsName.Text = "用户名不能为空";
            //设置Label控件的颜色
            labIsName.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            //调用isName自定义方法判断用户名是否已注册
            if (isName(tbUserName.Text))
            {
                labIsName.Text = "用户名已存在！";
                labIsName.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                labIsName.Text = "可以注册！";
                labIsName.ForeColor = System.Drawing.Color.Blue;
            }
        }
    }
    public bool isName(string name)
    {
        LqDBDataContext lqdb = new LqDBDataContext();
        var result = from v in lqdb.tb_userInfo
                     where v.userName == name
                     select v;
        if (result.Count() > 0)
        {
            return true;
        }

        else
        {
            return false;
        }
    }
}
