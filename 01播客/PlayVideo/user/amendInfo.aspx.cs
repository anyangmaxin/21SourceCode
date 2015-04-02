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

public partial class user_amendInfo : System.Web.UI.Page
{
    public static  string imgpath ="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {   
            //判断用户是否登录
            if (Session["userName"] == null)
            {
                Response.Write("<script>alert('请您先登录！');location='../index.aspx'</script>");
            }else
            //调用自定义方法显示用户的详细信息
           bindUserInfo();
        }
        
    }
    //保存上传图片并显示
    protected void btnUp_Click(object sender, EventArgs e)
    {
        //获取上传图片的路径
        string imgName = fupImg.FileName;
        //更改上传图片的名称
        imgName = imgName.Replace(imgName.Substring(0, imgName.LastIndexOf(".")), Session["userName"].ToString());
        //设置上传图片的保存路径
        imgpath = "imgHead/" + imgName;
        //保存上传图片
        fupImg.SaveAs(Server.MapPath("../") + imgpath);
        //设置一个参数，使ie重新读取页面显示头像
        string rd = DateTime.Now.Ticks.ToString();
        //显示上传的图片        
        ImageHead.ImageUrl = "../" + imgpath+"?rd="+rd;   
       
    }
    //显示用户的详细信息
    protected void bindUserInfo()
    {
        //编写SQL语句查询当前登录用户的详细信息
        string sqlSel = "select * from userInfo where userName='" + Session["userName"].ToString() + "'";
        //调用公共类中的getRow方法并接收返回的SqlDataReader对象
        SqlDataReader sdr = operateData.getRow(sqlSel);
        //读取一条数据
        sdr.Read();
        //显示用户的昵称
        txtNickname.Text = sdr["nickName"].ToString();     
        //显示用户性别
        if (sdr["sex"].ToString().Trim() == "男")
        {
            rbtnlsSex.Items[0].Selected=true;
        }
        else
        {
             rbtnlsSex.Items[1].Selected=true;
        }
        //获取图片路径
        imgpath=sdr["img"].ToString();
        //显示用户的图片
        ImageHead.ImageUrl = "../" + imgpath;
        //显示用户所在城市
        txtCity.Text = sdr["city"].ToString();
        //显示用户的QQ
        txtQQ.Text = sdr["qq"].ToString();
        //显示用户的留言
        txtSpeak.Text = sdr["speak"].ToString();        
        sdr.Close();
    }
    //获取用户修改后的详细信息并保存到数据库中
    protected void btnAmend_Click(object sender, EventArgs e)
    {
        //获取当前用户名
        string userName = Session["userName"].ToString();
        //获取昵称
        string nickname = txtNickname.Text;
        //获取性别
        string sex="";
        if (rbtnlsSex.SelectedValue =="男")
        {
            sex = "男";
        }else
            if (rbtnlsSex.SelectedValue=="女")
            {
                sex = "女";
            }     
        //获取所在城市
        string city = txtCity.Text;
        //获取QQ
        string qq = txtQQ.Text;
        //获取留言
        string speak = txtSpeak.Text;
        //编写SQL语句更新用户的详细信息
        string sqlUp = "update userInfo set nickname='"+nickname+"',sex='"+sex+"',img='"+imgpath+"',city='"+city+"',qq='"+qq+"',speak='"+speak+"' where userName='"+userName+"'";
        if (operateData.execSql(sqlUp))
        {
            RegisterStartupScript("true", "<script>alert('修改成功!')</script>");
            //调用自定义方法重新显示用户信息
            bindUserInfo();
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('修改失败！')</script>");
        }
    }
}
