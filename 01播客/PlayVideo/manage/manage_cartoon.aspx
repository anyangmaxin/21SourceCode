<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_cartoon.aspx.cs" Inherits="manage_manage_cartoon" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
        <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/bg.gif);
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {font-size: 12px; line-height: 22px; color: #000000; font-family: "宋体";}
-->
</style>   
</head>
<body scroll="no" bgcolor="#FFFFFF">
    <form id="form1" runat="server">
    <div style="text-align: center">
      <table align="center" cellpadding="0" cellspacing="0" style="width: 619px; height: 25px">
            <tr>
                <td  background="../images/htgl_wz.jpg" style="width: 613px; text-align: left;">
                   &nbsp; &nbsp; &nbsp; &nbsp;&gt;&gt; 当前位置：动漫视频管理</td>
            </tr>
        </table>

        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px; height: 10px">
                </td>
                <td style="width: 100px; height: 10px">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                        RepeatDirection="Horizontal" Width="358px">
                        <asp:ListItem Selected="True" Value="0">所有视频</asp:ListItem>
                        <asp:ListItem Value="1">未审核视频</asp:ListItem>
                        <asp:ListItem Value="2">已审核视频</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td style="width: 100px; height: 10px">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="gvVideo" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvVideo_RowDataBound" OnRowDeleting="gvVideo_RowDeleting" OnSelectedIndexChanging="gvVideo_SelectedIndexChanging" AllowPaging="True" OnPageIndexChanging="gvVideo_PageIndexChanging" Width="580px">
                        <Columns>
                            <asp:TemplateField HeaderText="视频名称">
                                <ItemTemplate>
                                 <a title="<%#Eval("videoTitle") %>"> <%#operateMethod.interceptStr((string )Eval("videoTitle"),5 ) %> </a>  
                                </ItemTemplate>
                            </asp:TemplateField>                       
                            <asp:BoundField DataField="userName" HeaderText="发布人" />
                            <asp:BoundField DataField="videoDate" HeaderText="发布日期" DataFormatString="{0:d}" HtmlEncode="False" />
                            <asp:BoundField DataField="playSum" HeaderText="总点击率" />
                            <asp:BoundField DataField="Auditing" HeaderText="状态" />
                            <asp:TemplateField HeaderText="详细信息">
                                <ItemTemplate>
                                     <a href ='../play.aspx?id=<%#Eval("id") %>' target="_blank"   >查看</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="操作" SelectText="通过/取消" ShowSelectButton="True" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                         <RowStyle CssClass="huise1" />
                       
                        <HeaderStyle BackColor="#E0EEF3" CssClass="hongcu" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
