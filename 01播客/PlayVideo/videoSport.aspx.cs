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

public partial class videoSport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindSport();  //调用自定义方法显示最新视频
    }

    protected void bindSport()
    {
        //获取当前页码
        int noncePage = Convert.ToInt32(labPage.Text);
        //创建PagedDataSource对象用来实现分页
        PagedDataSource ps = new PagedDataSource();
        string sqlSel = "select * from videoInfo where videoType='体育' and Auditing='1' order by videoDate desc";
        //调用公共类中的getRows方法并将所返回的所有数据绑定到PagedDataSource数据源中
        ps.DataSource = operateData.getRows(sqlSel).DefaultView;
        //设置启动分页
        ps.AllowPaging = true;
        //设置每页显示的项数
        ps.PageSize = 8;
        //设置当前页的索引
        ps.CurrentPageIndex = noncePage - 1;
        this.lnkbtnFront.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnLast.Enabled = true;
        this.lnkbtnFirst.Enabled = true;
        //如果当前为第一页将不显示第一页按钮和上一页按钮
        if (noncePage == 1)
        {
            this.lnkbtnFirst.Enabled = false;//不显示第一页按钮
            this.lnkbtnFront.Enabled = false;//不显示上一页按钮
        }
        //如果当前为最后一页将不显示最后一页按钮和下一页按钮
        if (noncePage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnLast.Enabled = false;//不显示最后一页
        }
        labBackPage.Text = Convert.ToString(ps.PageCount);
        dlSport.DataSource = ps;
        dlSport.DataBind();
    }

    protected void lnkbtnFirst_Click(object sender, EventArgs e)//首页
    {
        this.labPage.Text = "1";        //设置当前页为１
        bindSport(); 
    }
    protected void lnkbtnFront_Click(object sender, EventArgs e)//上一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1); //设置当前页减１
        bindSport(); 
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e) //下一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);  //设置当前页加１
        bindSport(); 
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e) //尾页
    {
        this.labPage.Text = this.labBackPage.Text;          //设置当前页为最后一页
        bindSport(); 
    }
}
