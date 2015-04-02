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

public partial class userInfo : System.Web.UI.Page
{
    //用来保存用户名
    public string userName;
    //用来保存用户昵称
    public string nickName;
    //用来保存用户性别
    public string sex;
    //用来保存用户QQ
    public string qq;
    //用来保存用户所在城市
    public string city;
    //用来保存用户留言
    public string speak;
    //用来保存用户头像
    public string img;
    //用来保存用户积分
    public string sumMark;
    //用来保存注册日期
    public string registerDate;

    protected void Page_Load(object sender, EventArgs e)
    {
        bindUserInfo();//调用自定义方法显示显示用户信息
        bindDlVideo();//掉用自定义方法显示所发布的视频
    }

    protected void bindUserInfo()
    {
        //编写SQL语句，查询指定用户的详细信息
        string sqlSel = "select  * from userInfo where userName='" + Request["userName"] +"' ";
        //调用公共类中的getRow方法执行SQL语句并接收返回的SqlDataReader对象
        SqlDataReader sdr = operateData.getRow(sqlSel);
        //读取一条记录
        sdr.Read();
        //获取用户名
        userName = sdr["userName"].ToString();
        //获取用户昵称
        nickName = sdr["nickName"].ToString();
        //获取用户性别
        sex = sdr["sex"].ToString();
        //获取QQ
        qq = sdr["qq"].ToString();
        //获取用户所在城市
        city = sdr["city"].ToString();
        //获取用户留言
        speak = sdr["speak"].ToString();
        //获取用户头像
        img = sdr["img"].ToString();
        //获取用户积分
        sumMark = sdr["sumMark"].ToString();
        //获取注册日期
        registerDate = sdr["registerDate"].ToString();
        sdr.Close();
    }

    protected void bindDlVideo()
    {
        int noncePage = Convert.ToInt32(labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        string sqlSel = "select * from videoInfo where userName='" + Request["userName"] + "' order by id desc ";
        ps.DataSource = operateData.getRows(sqlSel).DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 5;
        ps.CurrentPageIndex = noncePage - 1;
        this.lnkbtnFront.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnLast.Enabled = true;
        this.lnkbtnFirst.Enabled = true;
        if (noncePage == 1)
        {
            this.lnkbtnFirst.Enabled = false;//不显示第一页按钮
            this.lnkbtnFront.Enabled = false;//不显示上一页按钮
        } if (noncePage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnLast.Enabled = false;//不显示最后一页
        }
        labBackPage.Text = Convert.ToString(ps.PageCount);
        dlVideo.DataSource = ps;
        dlVideo.DataBind();       

    }

    protected void lnkbtnFirst_Click(object sender, EventArgs e)//首页
    {
        this.labPage.Text = "1";        //设置当前页为１
        bindDlVideo();
    }
    protected void lnkbtnFront_Click(object sender, EventArgs e)//上一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1); //设置当前页减１
        bindDlVideo();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e) //下一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);  //设置当前页加１
        bindDlVideo();
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e) //尾页
    {
        this.labPage.Text = this.labBackPage.Text;          //设置当前页为最后一页
        bindDlVideo();
    }
}
