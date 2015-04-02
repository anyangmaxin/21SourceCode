<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_saveTaxis.aspx.cs" Inherits="manage_asveTaxis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="../css/css.css" rel="stylesheet" type="text/css" />
    <title>无标题页</title>
</head>
<body scroll="no"  bgcolor="#FFFFFF">
    <form id="form1" runat="server">
    <div style="text-align: center">
            <table align="center" cellpadding="0" cellspacing="0" style="width: 619px; height: 25px">
            <tr>
                <td  background="../images/htgl_wz.jpg" style="width: 613px; text-align: left;">
                   &nbsp; &nbsp; &nbsp; &nbsp;&gt;&gt; 当前位置：保存月视频排行</td>
            </tr>
        </table>

        <table class="huise1" border="0" cellpadding="0" cellspacing="0" style="width: 214px">
            <tr>
                <td style="width: 130px">
                    选择视频类型：</td>
                <td style="width: 100px; text-align: left">
                    <asp:DropDownList ID="ddlType" runat="server">
                        <asp:ListItem Value="搞笑">搞笑视频</asp:ListItem>
                        <asp:ListItem Value="电影">电影视频</asp:ListItem>
                        <asp:ListItem Value="体育">体育视频</asp:ListItem>
                        <asp:ListItem Value="动漫">动漫视频</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2">
        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" /></td>
            </tr>
        </table>
        <br />
        </div>
    </form>
</body>
</html>
