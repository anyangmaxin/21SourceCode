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

using System.Drawing;
using System.Drawing.Drawing2D;
public partial class CreateImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CreatePic(RandomNum(4));//生成四位随机验证码
    }
    //生成随机码
    public string RandomNum(int Len)
    {
        string str = "0,1,2,3,4,5,6,7,8,9,";
        str += "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";
        str += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
        string[] s = str.Split(new char[] { ',' });//将字符串拆分成字符串数组
        string strNum = "";
        int tag = -1;//用于记录上一个随机数的值，避免产生两个重复值
        Random rnd = new Random();
        //产生一个长度为Len的随机字符串
        for (int i = 1; i <= Len; i++)
        {
            if (tag == -1)
            {
                rnd = new Random(i * tag * unchecked((int)DateTime.Now.Ticks));//初始化一个Random实例
            }
            int rndNum = rnd.Next(0, 61);//返回小于６１的非负随机数
            //如果产生与前一个随机数相同的数，则重新生成一个新随机数
            if (tag != -1 && tag == rndNum)
            {
                return RandomNum(Len);
            }
            tag = rndNum;
            strNum += s[rndNum];
        }
        //将生成的随机码保存到Session中
        Session["CheckCode"] = strNum;
        return strNum;
    }
    //绘制随机码
    private void CreatePic(string checkCode)
    {
        if (checkCode == null || checkCode.Trim() == String.Empty)
            return;
        Bitmap image = new Bitmap(checkCode.Length * 12 + 10, 22);
        Graphics g = Graphics.FromImage(image);
        try
        {
            //生成随机生成器 
            Random random = new Random();
            //清空图片背景色 
            g.Clear(Color.White);
            //画图片的背景噪音线 
            for (int i = 0; i < 25; i++)
            {
                int x1 = random.Next(image.Width);
                int x2 = random.Next(image.Width);
                int y1 = random.Next(image.Height);
                int y2 = random.Next(image.Height);
                g.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
            }
            //画图片字体和字号
            Font font = new Font("Arial", 12, (FontStyle.Bold | FontStyle.Italic));
            //初始化画刷
            LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.BlueViolet, Color.Crimson, 1.2f, true);
            g.DrawString(checkCode, font, brush, 2, 2);
            //画图片的前景噪音点 
            for (int i = 0; i < 100; i++)
            {
                int x = random.Next(image.Width);
                int y = random.Next(image.Height);
                image.SetPixel(x, y, Color.FromArgb(random.Next()));
            }
            //画图片的边框线 
            g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
            // 输出图像
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            //将图像保存到指定流
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            Response.ClearContent();
            //配置输出类型
            Response.ContentType = "image/Gif";
            //输入内容
            Response.BinaryWrite(ms.ToArray());

        }
        finally
        {
            //清空不需要的资源
            g.Dispose();
            image.Dispose();

        }
    }

}
