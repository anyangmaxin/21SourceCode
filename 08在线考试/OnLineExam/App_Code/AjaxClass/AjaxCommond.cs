using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


namespace OnLineExam.AjaxClass
{
    /// <summary>
    /// AjaxCommond 的摘要说明
    /// </summary>
    public class AjaxCommond
    {
        public AjaxCommond()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        ///<summary>
        ///在ASP.NET　AJAX环境中，为Button控件弹出一个提示对话框
        ///</summary>
        ///<param name="button">Button控件</param>
        ///<param name="message">对话框中的消息</param>
        public void OpenDialogForButton(Button button, string message)
        {
            ScriptManager.RegisterClientScriptBlock(
                button,
                typeof(Button),
                DateTime.Now.ToString().Replace(":", " "),///使用当前时间作为标识
               "alert('" + message + "')",
               true);
        }
        ///<summary>
        ///在ASP.NET　AJAX环境中，为Page对象弹出一个提示对话框
        ///</summary>
        ///<param name="button">Page对象</param>
        ///<param name="message">对话框中的消息</param>
        public void OpenDialogForPage(Page page, string message)
        {
            ScriptManager.RegisterClientScriptBlock(
               page,
               typeof(Page),
               DateTime.Now.ToString().Replace(":", " "),///使用当前时间作为标识
              "alert('" + message + "')",
              true);
        }
    }
}
