<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_bulletin.aspx.cs" Inherits="manage_manage_bulletin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body scroll="no" bgcolor="#FFFFFF">
    <form id="form1" runat="server">
    <div style="text-align: center">
          <table align="center" cellpadding="0" cellspacing="0" style="width: 619px; height: 25px">
            <tr>
                <td  background="../images/htgl_wz.jpg" style="width: 613px; text-align: left;">
                   &nbsp; &nbsp; &nbsp; &nbsp;&gt;&gt; 当前位置：发布公告信息</td>
            </tr>
        </table>
   
        <table class="huise1" border="0" cellpadding="0" cellspacing="0" style="width: 362px; height: 151px">
            <tr>
                <td style="width: 152px">
                    公告标题：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 152px">
                    公告内容：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="txtContent" runat="server" Height="81px" TextMode="MultiLine" Width="251px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnEnd" runat="server" OnClick="btnEnd_Click" Text="修 改" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
