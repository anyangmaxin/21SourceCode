using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    //获取公告标题
    public string title;
    //获取公告内容
    public string content;
    //获取公告发布时间
    public string issuanceDate;
    protected void Page_Load(object sender, EventArgs e)
    {

        bindNew();          //调用自定义方法显示最新视频!
        bindHumour();       //调用自定义方法显示搞笑视频!
        bindCartoon();      //调用自定义方法显示动漫视频!
        bindFilm();         //调用自定义方法显示电影视频!
        bindSport();        //调用自定义方法显示体育视频!
        bindBulletin();     //调用自定义方法显示公告信息!

    }
    //绑定公告内容！！
    protected void bindBulletin()
    {
        //设置SQL语句查询公告信息
        string sqlSel = "select * from bulletin where id=1";
        //调用公共类中方法getRow并接收返回的SqlDataReader对象
        SqlDataReader sdr = operateData.getRow(sqlSel);
        sdr.Read();
        //获取公告标题
        title = sdr["title"].ToString();
        //获取公告内容
        content = sdr["content"].ToString();
        //获取公告发布日期
        issuanceDate = Convert.ToDateTime(sdr["issuanceDate"]).ToShortDateString();
        sdr.Close();
    }
    //绑定今日视频！！
    protected void bindNew()
    {
        string sqlSel = "select top 6 * from videoInfo where Auditing=1 ORDER BY videoDate desc";
        dlNewVideo.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlNewVideo.DataBind();

    }

    //绑定搞笑视频！！
    protected void bindHumour()
    {
        string sqlSel = "select top 10 * from videoInfo where videoType='搞笑' and Auditing=1 order by videoDate desc";
        dlHumour.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlHumour.DataBind();
    }
    //绑定动漫视频！！
    protected void bindCartoon()
    {
        string sqlSel = "select top 10 * from videoInfo where videoType='动漫' and Auditing=1 order by videoDate desc";
        dlCartoon.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlCartoon.DataBind();
    }
    //绑定体育视频！！
    protected void bindSport()
    {
        string sqlSel = "select top 10 * from videoInfo where videoType='体育' and Auditing=1 order by videoDate desc";
        dlSport.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlSport.DataBind();
    }
    //绑定电影视频！！
    protected void bindFilm()
    {
        string sqlSel = "select top 10 * from videoInfo where videoType='电影' and Auditing=1 order by videoDate desc";
        dlFilm.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlFilm.DataBind();
    }
 
    protected void imgBtnEntry_Click(object sender, ImageClickEventArgs e)
    {
        //判断用户是否登录
        if (Session["userName"] != "")
        {
            Session["userName"] = null;
        }
        //获取登录名
        string userName = txtUserName.Text;
        //获取密码
        string pass = txtUserPass.Text;
        //编写SQL语句，查询用户名和密码是否正确
        string sqlSel = "select * from userRegister where username=@name and userPass=@pass";
        //调用自定义方法执行SQL语句
        if (operateData.login(sqlSel, userName, pass))
        {
            //保存用户名
            Session["userName"] = userName;
            //编写SQL语句，指定用户的信息
            string sql = "select * from userRegister where userName='" + Session["userName"] + "'";
            //调用公共类中的getRow方法执行SQL语句，并接收SqlDataReader对象
            SqlDataReader sdr = operateData.getRow(sql);
            //读取一条记录
            sdr.Read();
            //判断当前用户是否锁定
            if (Convert.ToBoolean(sdr["lock"]))
            {
                //如锁定Session设置为空，并给出提示
                Session["userName"] = null;
                RegisterStartupScript("true", "<script>alert('" + sdr["lockCause"].ToString() + "');location='index.aspx'</script>");

            }
            else
                RegisterStartupScript("true", "<script>alert('登录成功！');location='index.aspx'</script>");
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('用户名或密码错误！')</script>");
        }

        txtUserName.Text = txtUserPass.Text = "";
    }
}
