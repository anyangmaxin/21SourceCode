using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
//引入命名空间
using System.Data.SqlClient;
using System.IO;

/// <summary>
///Album 的摘要说明
/// </summary>
public class Album
{
    //私有变量，数据库连接
    protected SqlConnection conn;
    protected string ConnectionString;
    public LqDBDataContext lqc = new LqDBDataContext();
    public Album()//构造函数
    {
        ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    //保护方法，打开数据库连接
    private void Open()
    {
        //判断数据库连接是否存在
        if (conn == null)
        {
            //不存在，新建并打开
            conn = new SqlConnection(ConnectionString);
            conn.Open();
        }
        else
        {
            //存在，判断是否处于关闭状态
            if (conn.State.Equals(ConnectionState.Closed))
                conn.Open();    //连接处于关闭状态，重新打开
        }
    }

    //公有方法，关闭数据库连接
    public void Close()
    {
        if (conn.State.Equals(ConnectionState.Open))
        {
            conn.Close();     //连接处于打开状态，关闭连接
        }
    }

    /// <summary>
    /// 析构函数，释放非托管资源
    /// </summary>
    ~Album()
    {
        try
        {
            if (conn != null)
                conn.Close();
        }
        catch { }
        try
        {
            Dispose();
        }
        catch { }
    }

    //公有方法，释放资源
    public void Dispose()
    {
        if (conn != null)		// 确保连接被关闭
        {
            conn.Dispose();
            conn = null;
        }
    }
    public DataSet GetDataSet(string SqlCom)
    {
        try
        {
            Open();//建立数据库连接并打开
            SqlCommand sqlcom = new SqlCommand(SqlCom, conn);
            SqlDataAdapter sqldata = new SqlDataAdapter();
            sqldata.SelectCommand = sqlcom;
            DataSet ds = new DataSet();
            sqldata.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            //抛出异常
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            Close();
        }
    }

    //重载GetDataSet()方法
    public DataSet GetDataSet(string SqlCom, string tablename)
    {
        try
        {
            Open();
            SqlCommand sqlcom = new SqlCommand(SqlCom, conn);
            SqlDataAdapter sqldata = new SqlDataAdapter();
            sqldata.SelectCommand = sqlcom;
            DataSet ds = new DataSet();
            sqldata.Fill(ds, tablename);
            return ds;
        }
        catch (Exception ex)
        {
            //抛出异常
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            Close();
        }
    }
    /// <summary>
    /// 添加分类
    /// </summary>
    public int AddCategory(string Cname, string Cstatus)
    {
        //标识变量
        int result = 1;
        //创建LINQ查询语句
        var results = from v_pc in lqc.Photo_Category
                     where v_pc.C_Name == Cname
                     select v_pc;
        //判断是否存在同名分类名称
        if (results.Count() > 0)
        {
            result = 0;//说明存在同名分类
        }
        else//执行添加操作
        {
            Photo_Category pc = new Photo_Category();
            pc.C_Name = Cname;
            pc.C_Status = Cstatus;
            try
            {
                //插入信息
                lqc.Photo_Category.InsertOnSubmit(pc);
                //提交数据库
                lqc.SubmitChanges();
                
            }
            catch (Exception ex)
            {
                //抛出异常
                throw new Exception(ex.Message, ex);
            }
        }
        return result;
    }
    /// <summary>
    /// 更新相册分类
    /// </summary>
    public int EditCategory(int id, string Cname, string Cstatus)
    {
        //标识变量
        int result = 1;
        var results = from pc in lqc.Photo_Category
                      where pc.C_Status==Cstatus&&pc.C_Name==Cname
                      select pc;
        //判断是否有相同分类
        if (results.Count() > 0)
        {
            result = 0;//说明存在同名分类
        }
        else
        {

            var results1 = from pc in lqc.Photo_Category
                          where pc.ID==id
                          select pc;
            results1.SingleOrDefault().C_Name = Cname;
            results1.SingleOrDefault().C_Status=Cstatus;
            //将修改信息添加到数据库中
            lqc.SubmitChanges();
           
        }
        return result;
    }
    /// <summary>
    /// 将相册分类填充到DataSet
    /// </summary>
    public DataSet DDLCategory()
    {
        //打开数据库连接
        Open();
        //定义SQL语句
        string sqlstr = "select ID,C_Name from Photo_Category order by ID desc";
        //创建DataAdapter对象
        SqlDataAdapter da = new SqlDataAdapter(sqlstr, conn);
        //创建DataSet对象
        DataSet ds = new DataSet();
        try
        {
            //填充数据
            da.Fill(ds, "Category");
        }
        catch (Exception ex)
        {
            //抛出异常
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            //关闭连接
            Close();
        }
        return ds;
    }
    /// <summary>
    /// 添加图片信息
    /// </summary>
    /// <returns></returns>
    public int AddPhoto(string title, string descript, string url, string p_type, int p_size, int categoryId)
    {
        //通过LINQ to SQL 实现照片信息的添加操作
        Photo p = new Photo();
        p.Title = title;
        p.Descript = descript;
        p.Url = url;
        p.P_Type=p_type;
        p.P_Size = p_size;
        p.CategoryID = categoryId;
        int result = -1;
        try
        {
            lqc.Photo.InsertOnSubmit(p);//向tb_LeaveMessage表添加该实体对象
            lqc.SubmitChanges();//调用SubmitChanges()方法告诉LINQ执行Insert操作
        }
        catch (Exception ex)
        {
            //抛出异常
            throw new Exception(ex.Message, ex);
        }
        return result;
    }
    /// <summary>
    /// 根据时间创建字符串
    /// </summary>
    /// <returns></returns>
    public static string CreateDateTimeString()
    {
        DateTime now = DateTime.Now;
        string newString = now.Year.ToString()
            + now.Month.ToString().PadLeft(2, '0')
            + now.Day.ToString().PadLeft(2, '0')
            + now.Hour.ToString().PadLeft(2, '0')
            + now.Minute.ToString().PadLeft(2, '0')
            + now.Second.ToString().PadLeft(2, '0')
            + now.Millisecond.ToString().PadLeft(3, '0');
        return (newString);
    }
    /// <summary>
    /// 显示分类内的相册
    /// </summary>
    /// <param name="Category"></param>
    /// <returns></returns>
    public DataSet ShowPhoto(int Category)
    {
        Open();
        string sqlstr = "select * from Photo where CategoryID = @CategoryID";
        SqlDataAdapter da = new SqlDataAdapter(sqlstr, conn);
        da.SelectCommand.Parameters.Add("@CategoryID", SqlDbType.Int, 4).Value = Category;
        DataSet ds = new DataSet();
        try
        {
            da.Fill(ds, "Photo");
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            Close();
        }
        return ds;
    }
    /// <summary>
    /// 生成缩略图
    /// </summary>    
    public void GetThumbnail(string serverImagePath, string thumbnailImagePath, int width, int height, string p)
    {
        System.Drawing.Image serverImage = System.Drawing.Image.FromFile(serverImagePath);

        //画板大小
        int towidth = width;
        int toheight = height;
        //缩略图矩形框的像素点
        int x = 0;
        int y = 0;
        int ow = serverImage.Width;
        int oh = serverImage.Height;

        switch (p)
        {
            case "WH"://指定高宽缩放（可能变形）                
                break;
            case "W"://指定宽，高按比例                    
                toheight = serverImage.Height * width / serverImage.Width;
                break;
            case "H"://指定高，宽按比例
                towidth = serverImage.Width * height / serverImage.Height;
                break;
            case "Cut"://指定高宽裁减（不变形）                
                if ((double)serverImage.Width / (double)serverImage.Height > (double)towidth / (double)toheight)
                {
                    oh = serverImage.Height;
                    ow = serverImage.Height * towidth / toheight;
                    y = 0;
                    x = (serverImage.Width - ow) / 2;
                }
                else
                {
                    ow = serverImage.Width;
                    oh = serverImage.Width * height / towidth;
                    x = 0;
                    y = (serverImage.Height - oh) / 2;
                }
                break;
            default:
                break;
        }

        //新建一个bmp图片
        System.Drawing.Image bm = new System.Drawing.Bitmap(towidth, toheight);

        //新建一个画板
        System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bm);

        //设置高质量插值法
        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

        //设置高质量,低速度呈现平滑程度
        g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

        //清空画布并以透明背景色填充
        g.Clear(System.Drawing.Color.Transparent);

        //在指定位置并且按指定大小绘制原图片的指定部分
        g.DrawImage(serverImage, new System.Drawing.Rectangle(0, 0, towidth, toheight),
            new System.Drawing.Rectangle(x, y, ow, oh),
            System.Drawing.GraphicsUnit.Pixel);

        try
        {
            //以jpg格式保存缩略图
            bm.Save(thumbnailImagePath, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
        catch (System.Exception e)
        {
            throw e;
        }
        finally
        {
            serverImage.Dispose();
            bm.Dispose();
            g.Dispose();
        }
    }
}
