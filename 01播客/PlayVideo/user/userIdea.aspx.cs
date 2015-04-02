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

public partial class user_userIdea : System.Web.UI.Page
{
    public static   string  videoId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            Response.Write("<script>alert('请您先登录！');location='../index.aspx'</script>");
        }  
        bindGvName();
    }

    protected void bindGvName()
    {
        string sqlSel = "select * from view_IdeaVideoInfo where userName='"+Session["userName"]+"'";
        gridViewName.DataSource = operateData.getRows(sqlSel);
        gridViewName.DataKeyNames =new string [] {"id"};        
        gridViewName.DataBind();
    }

    //查看视频的评论
    protected void gridViewName_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        videoId = gridViewName.DataKeys[e.NewSelectedIndex].Value.ToString();
        Panel1.Visible = false;
        Panel2.Visible = true;
        BinddataList(videoId);
        
      
    }
    //绑定DataList显示评论
    protected void BinddataList(string id)
    {
        string sqlSel = "select * from videoIdea where videoId=" + id +" order by id desc";
        DataList1.DataSource = operateData.getRows(sqlSel);
        DataList1.DataKeyField = "id";
        DataList1.DataBind();
    }

    //显示每个视频的评论个数
    protected void gridViewName_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string id = gridViewName.DataKeys[e.Row.RowIndex].Value.ToString();
            string sqlCount = "select count(*) from videoIdea where videoId=" + id;

            e.Row.Cells[2].Text = operateData.getCount(sqlCount).ToString();
        }       
    }

    //设置显示页的索引
    protected void gridViewName_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridViewName.PageIndex = e.NewPageIndex;
        gridViewName.DataBind();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;

    }
    //回复评论
    protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        string id=DataList1.DataKeys[e.Item.ItemIndex].ToString();
        string sqlSel="select * from videoIdea where id="+id;
        SqlDataReader sdr = operateData.getRow(sqlSel);
        sdr.Read();

        Session["content"] = "对" + sdr["userName"] + "的“" + operateMethod.interceptStr(sdr["content"].ToString(),10) + "”评论，给以如下回复：";
        Session["ideaId"]=videoId;
        RegisterStartupScript("true", "<script > showModalDialog('ideaFrame.aspx?type=idea',window,'width=340,height=200','alwaysRaised= yes');</script>");
              
    }
  

    //删除评论
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string id = DataList1.DataKeys[e.Item.ItemIndex].ToString();
        string sqlDel = "delete videoIdea where id=" + id; ;
        if (operateData.execSql(sqlDel))
        {

            RegisterStartupScript("false", "<script>alert(' 成功！')</script>");
            BinddataList(videoId);

        }
        else {
            RegisterStartupScript("true", "<script>alert('失败！')</script>");
        }
    }


}
