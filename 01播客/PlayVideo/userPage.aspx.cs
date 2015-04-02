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

public partial class userPage : System.Web.UI.Page
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
        bindGvUserTop();    //调用自定方法显示积分前10用户
        bindDlUserHaving(); //调用自定义方法显示所有用户信息
        bindUserInfo();     //调用自定义方法显示积分第一的用户信息
    }

    protected void bindGvUserTop()
    {
        string sqlSel = "select top 10 * from userInfo order by sumMark desc ";
        gvUserTop.DataSource = operateData.getRows(sqlSel);
        gvUserTop.DataBind();
    }
    protected void bindUserInfo()
    {
        string sqlSel = "select top 1 * from userInfo order by sumMark desc";
        SqlDataReader sdr = operateData.getRow(sqlSel);
        sdr.Read();
        userName = sdr["userName"].ToString();
        nickName = sdr["nickName"].ToString();
        sex = sdr["sex"].ToString();
        qq = sdr["qq"].ToString();
        city = sdr["city"].ToString();
        speak = sdr["speak"].ToString();
        img = sdr["img"].ToString();
        registerDate = sdr["registerDate"].ToString();
        sumMark = sdr["sumMark"].ToString();
        sdr.Close();
    }

    protected void bindDlUserHaving()
    {
      
        int noncePage = Convert.ToInt32(labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        string sqlSel = "select * from userInfo order by id desc";
        ps.DataSource = operateData.getRows(sqlSel).DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 9;
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
        dlUserHaving.DataSource = ps;
        dlUserHaving.DataBind();
    }

    protected void lnkbtnFirst_Click(object sender, EventArgs e)//首页
    {
        this.labPage.Text = "1";        //设置当前页为１
        bindDlUserHaving();
    }
    protected void lnkbtnFront_Click(object sender, EventArgs e)//上一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1); //设置当前页减１
        bindDlUserHaving();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e) //下一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);  //设置当前页加１
        bindDlUserHaving();
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e) //尾页
    {
        this.labPage.Text = this.labBackPage.Text;          //设置当前页为最后一页
        bindDlUserHaving();
    }

}
