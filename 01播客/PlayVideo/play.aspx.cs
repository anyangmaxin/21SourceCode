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

public partial class play : System.Web.UI.Page
{
    public string playSum; //保存视频点击率
    public string flower;  //保存视频被顶的次数
    public string tile;    //保存视频被踩的次数
    public string videoDate;    //保存视频发布时间
    public string Name;   //发布人
    public string videoTitle; //视频名称
    public string videoContent; //视频内容
    public string videoType;    //视频类型

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //判断用户是否登录
            if (Session["userName"] == null)
            {
                //未登录显示登录panel
                PanelLogin.Visible = true;
                //隐藏欢迎panel
                PanelHello.Visible = false;
            }
            else
            {
                //已登录隐藏登录panel
                PanelLogin.Visible = false;
                //显示欢迎panel
                PanelHello.Visible = true;
                //显示登录名
                lbeUserName.Text = Session["userName"].ToString();
            }
            //调用自定义方法增加视频的点击率
            addPlaySum();
        }
        //播放视频并显示视频详细信息
        videoInfo();
        //显示评论
        bidList();

    }
    //发表留言
    protected void btnIdea_Click(object sender, EventArgs e)
    {
        //留言内容不可以为空
        if (txtContent.Text != "")
        {
            //获取留言人，如登录保存登录名，未登录保存为游客
            string userName;
            if (Session["userName"] != null)
            {
                userName = Session["userName"].ToString();
            }
            else
            {
                userName = "游客";
            }
            //获取视频id
            string videoId = Request["id"];
            //获取留言内容
            string content = operateMethod.filtrateHtml(txtContent.Text);
            //获取留言时间
            string date = DateTime.Now.ToString();
            //编写SQL语句将留言信息保存到数据库中
            string sqlInsert = "insert into videoIdea values('" + userName + "','" + content + "','" + videoId + "','" + date + "')";
            if (operateData.execSql(sqlInsert))
            {
                RegisterStartupScript("true", "<script>alert('评论成功！')</script>");
                txtContent.Text = "";
                bidList();//显示留言
            }
            else
            {
                RegisterStartupScript("false", "<script>alert('评论失败！')</script>");
            }
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('评论内容不须为空')</script>");
        }



    }
    /// <summary>
    /// 播放视频并显示视频详细信息
    /// </summary>
    protected void videoInfo()
    {
        //编写SQL语句查询视频的详细信息
        string sql = "select * from videoInfo where id=" + Request["id"];
        SqlDataReader sdr = operateData.getRow(sql);
        sdr.Read();
        //获取视频的路径
        string link = sdr["videoPath"].ToString();
        //获取视频的点击率
        playSum = sdr["playSum"].ToString();
        //获取顶人数
        flower = sdr["flower"].ToString();
        //获取踩人数
        tile = sdr["tile"].ToString();
        //获取视频发布日期
        videoDate = sdr["videoDate"].ToString();
        //获取发布人名称
        Name = sdr["userName"].ToString();
        //获取视频标题
        videoTitle = sdr["videoTitle"].ToString();
        //获取视频内容
        videoContent = sdr["videoContent"].ToString();
        //获取视频类型
        videoType = sdr["videoType"].ToString();
        //判断视频路径开头字符串是否为http://
        if (!link.StartsWith("http://"))
        {
            //获取当前的绝对路径
            string sss = Request.Url.AbsoluteUri;
            //查询play.aspx在字符串中的位置
            int idx = sss.IndexOf("play.aspx");
            //获取指定字符串
            sss = sss.Substring(0, idx);
            link = sss + link;
        }
        //显示播放器并可以播放视频
        this.Literal1.Text = operateMethod.GetFlashText(link);
    }
    //增加点击率和用户积分
    public void addPlaySum()
    {
        //创建SQL语句，增加视频的点击率
        string sql = "update videoInfo set playSum=playSum+1,monthSum=monthSum+1 where id=" + Request["id"];
        operateData.execSql(sql);
        //创建SQL语句，查询出发布视频会员名
        string sqlSel = "select userName from videoInfo where id=" + Request["id"];
        //获取会员名
        string userName = operateData.getTier(sqlSel);
        //创建SQL语句，增加用户的积分
        string sqlUpd = " update userInfo set sumMark=sumMark+1 where userName='" + userName + "'";
        //执行SQL语句
        operateData.execSql(sqlUpd);

    }
    //查看留言
    protected void bidList()
    {
        //创建SQL语句，查询出当前视频的所有评论
        string sqlSel = "select * from videoIdea where videoId=" + Request["id"] + " order by issuanceDate desc ";
        //调用数据库操作类中的getRows方法并接收返回值
        DataTable dt = operateData.getRows(sqlSel);
        //判读DataTable中的数据是否小于5行
        if (dt.Rows.Count < 5)
        {
            //隐藏Panel控件的滚动条
            PanelIdea.ScrollBars = ScrollBars.None;
        }
        //设置DataList控件的数据源
        dlIdea.DataSource = dt;
        //设置主键
        dlIdea.DataKeyField = "id";
        //绑定显示
        dlIdea.DataBind();

    }

    //返回发布的时间
    public string getIsDate(string date)
    {
        //转换时间
        DateTime isDate = Convert.ToDateTime(date);
        //获取当前时间
        DateTime nowDate = DateTime.Now;
        //获取两个时间的差
        TimeSpan ts = nowDate - isDate;
        //将时间差转换为分
        int second = Convert.ToInt32(ts.TotalSeconds) / 60;

        if (second == 0)
        {
            return "60秒内";
        }
        else
            if (second < 60)
            {
                return second.ToString() + "分钟前";
            }
            else if (second > 60 && second < 1440)
            {
                return Convert.ToString(second / 60) + "小时前";
            }
            else
                return date;
    }




    //将视频id和用户ip保存到数据库中防止重复投票
    protected void addPoll(string sqlUpd, string videoId)
    {
        //获取当前用户的ip
        string userIP = Request.UserHostAddress.ToString();
        //编写SQL查询用户ip是否已对该视频投票
        string sqlSel = "select * from videoPoll where ip='" + userIP + "' and videoId='" + videoId + "'";
        if (!(operateData.getCount(sqlSel) > 0))
        {
            //如果未投票执行SQL语句进行投票
            operateData.execSql(sqlUpd);
            //编写SQL语句记录用户的ip和视频id
            string sqlIns = "insert videoPoll values('" + userIP + "'," + videoId + ")";
            operateData.execSql(sqlIns);
            RegisterStartupScript("", "<script>alert('成功！')</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('一个视频只可以投一次')</script>");
        }
    }
    //顶该视频
    protected void imgbtnD_Click(object sender, ImageClickEventArgs e)
    {
        //编写SQL语句更新顶视频投票
        string sqlUpd = "update videoInfo set flower=flower+1 where id=" + Request["id"];
        //调用自定义方法防止重复ip投票
        addPoll(sqlUpd, Request["id"].ToString());
        //重新显示视频详细信息
        videoInfo();
    }
    //踩该视频
    protected void imgbtnC_Click(object sender, ImageClickEventArgs e)
    {

        string sqlUpd = "update videoInfo set tile=tile+1 where id=" + Request["id"];
        addPoll(sqlUpd, Request["id"].ToString());
        videoInfo();
    }
}
