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

public partial class searchList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDataList();
    }

    protected void bindDataList()
    {   
        
        int noncePage = Convert.ToInt32(labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        string sqlSel = "select * from videoInfo link where videoTitle like '%" + Session["searchKeys"] + "%'";
        ps.DataSource = operateData.getRows(sqlSel).DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 8;
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
        DataList1.DataSource = ps;
        DataList1.DataBind();       
        
    }
    protected void lnkbtnFirst_Click(object sender, EventArgs e)//首页
    {
        this.labPage.Text = "1";        //设置当前页为１
        bindDataList();
    }
    protected void lnkbtnFront_Click(object sender, EventArgs e)//上一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1); //设置当前页减１
        bindDataList();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e) //下一页
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);  //设置当前页加１
        bindDataList();
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e) //尾页
    {
        this.labPage.Text = this.labBackPage.Text;          //设置当前页为最后一页
        bindDataList();
    }

}
