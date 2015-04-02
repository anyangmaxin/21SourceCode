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

using System.IO;
using System.Collections.Specialized;


public partial class Photo_list : System.Web.UI.Page
{
    public int categoryID = -1;
    public string categoryName = string.Empty;
    Album am = new Album();
    public LqDBDataContext lqc = new LqDBDataContext();
    //Page_PreRender事件，能防止单击两次按钮（这里指的是播放图片的按钮）来激发事件
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Request.Params["CategoryID"] != null)
        {
            categoryID = Int32.Parse(Request.Params["CategoryID"].ToString());
            Session["categoryID"] = Request.Params["CategoryID"].ToString();
            if (Request.Params["CategoryName"] != null)
            {
                categoryName = lb_Cname.Text = Request.Params["CategoryName"].ToString();
            }
        }
        if (categoryID > 0)
        {
            BindListView();
        }
        if (!IsPostBack)
        {
            DataSet ds2 = am.ShowPhoto(categoryID);
            if (ds2.Tables[0].Rows.Count > 0)
            {
                imgBig.Src = "UpSmall/" + ds2.Tables[0].Rows[0]["Url"].ToString();
                sDescription.InnerHtml = ds2.Tables[0].Rows[0]["Descript"].ToString();
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //绑定数据到ListView
    private void BindListView()
    {
        if (Session["categoryID"] != null)
        {
            DataSet ds = am.ShowPhoto(Int32.Parse(Session["categoryID"].ToString()));
            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Redirect("ManageDefault.aspx");
            }
            lvPhoto.DataSource = ds;
            lvPhoto.DataBind();
        }
        else
        {
            return;
        }
    }
    //单击小图片显示大图片
    protected void lkbImg_Command(object sender, CommandEventArgs e)
    {
        imgBig.Style.Add("visibility", "visibe");
        imgBig.Src = "UpSmall/" + e.CommandArgument.ToString();
        sDescription.InnerHtml = e.CommandName.ToString();
    }
    //切换到编辑状态
    protected void lvPhoto_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        lvPhoto.EditIndex = e.NewEditIndex;
        BindListView();
    }
    //取消编辑
    protected void lvPhoto_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        lvPhoto.EditIndex = -1;
        BindListView();
    }
    //更新数据
    protected void lvPhoto_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        TextBox title = (TextBox)lvPhoto.Items[e.ItemIndex].FindControl("tbName");
        TextBox description = (TextBox)lvPhoto.Items[e.ItemIndex].FindControl("tbDescript");
        int DataKey = Int32.Parse(lvPhoto.DataKeys[e.ItemIndex].Value.ToString());
        //通过LINQ to SQL实现修改操作
        var results = from result in lqc.Photo
                      where result.ID == DataKey
                      select result;
        results.SingleOrDefault().Title = title.Text.Trim();//修改照片标题
        results.SingleOrDefault().Descript = description.Text.Trim();//修改照片描述
        lqc.SubmitChanges();//提交修改操作
        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('更新成功！');", true);
        BindListView();//重新绑定下ListView控件 
    }
    //为删除按钮添加onclick事件
    protected void lvPhoto_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        LinkButton del = (LinkButton)e.Item.FindControl("lkbDelete");
        if (del != null)
        {
            del.Attributes.Add("onclick", "return confirm('确定要删除吗？')");
        }
    }
    //通过LINQ技术删除图片
    protected void lvPhoto_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {        
        //删除图片文件
        LinkButton lkb = (LinkButton)lvPhoto.Items[e.ItemIndex].FindControl("lkbImg");
        FileInfo fi = new FileInfo(Server.MapPath("UpSmall/" + lkb.CommandArgument.ToString()));
        if (fi.Exists)
        { 
            fi.Delete();
        }
        FileInfo fi2 = new FileInfo(Server.MapPath("UpFile/" + lkb.CommandArgument.ToString()));
        if (fi2.Exists)
        {
            fi2.Delete();
        }
        //获取ListView控件中所要删除的数据索引值
        int DataKey = Int32.Parse(lvPhoto.DataKeys[e.ItemIndex].Value.ToString());
        //通过LINQ to SQL删除数据库记录
        Photo p = lqc.Photo.SingleOrDefault(itm => itm.ID == DataKey);
        lqc.Photo.DeleteOnSubmit(p);//执行删除操作
        lqc.SubmitChanges();//提交删除动作
        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('删除成功！');", true);
        BindListView();//重新绑定ListView控件
    }
}
