
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="amendVideoInfo.aspx.cs" Inherits="user_revertVideoInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>修改视频信息</title>
    
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
    
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
      <table background="../images/xgsp.jpg" border="0" cellpadding="0" cellspacing="0"
            style="width: 492px; height: 208px">
            <tr>
                <td style="width: 87px; height: 43px">
                </td>
                <td style="width: 100px; height: 43px; text-align: center;">
                    修改视频信息</td>
                <td style="width: 100px; height: 43px">
                </td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2">

        <table border="0" cellpadding="0" cellspacing="0" style="width: 414px; height: 199px;
            text-align: center; background-image: url(images/xgsp.jpg); background-repeat: no-repeat;" background="../images/xgsp.jpg">
            <tr>
                <td style="width: 123px; text-align: right">
                    视频标题：</td>
                <td colspan="2" style="text-align: left">
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 123px; text-align: right">
                    视频内容：</td>
                <td style="width: 32px; text-align: left">
                    <asp:TextBox ID="txtContent" runat="server" Height="143px" TextMode="MultiLine" Width="195px"></asp:TextBox></td>
                <td align="left" style="width: 191px" valign="top">
                    <span style="color: #ff0000">内容在200字以内<br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContent"
                            ErrorMessage="长度超出" ValidationExpression="^[\s\S]{0,200}"></asp:RegularExpressionValidator></span></td>
            </tr>
            <tr>
                <td style="width: 123px; height: 29px; text-align: right">
                    视频类型：</td>
                <td colspan="2" style="height: 29px; text-align: left">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="21px" RepeatDirection="Horizontal"
                        Width="228px">
                        <asp:ListItem>搞笑</asp:ListItem>
                        <asp:ListItem>体育</asp:ListItem>
                        <asp:ListItem>电影</asp:ListItem>
                        <asp:ListItem>动漫</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td colspan="3" style="height: 23px; text-align: center">
                    <asp:Button ID="btnAmend" runat="server" OnClick="btnAmend_Click" Text="修  改" />
                    &nbsp;&nbsp;
                </td>
            </tr>
        </table>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    

    </form>
</body>
</html>
