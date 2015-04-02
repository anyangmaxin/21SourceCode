<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControlUserLogin.ascx.cs" Inherits="WebUserControlUserLogin" %>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<table border="0" cellpadding="0" cellspacing="0" style="width: 390px; height: 18px;">
    <tr>
        <td style="width: 174px" valign="middle">
            <asp:Panel ID="PanelHello" runat="server" Height="18px" Width="248px" Direction="LeftToRight">
                <asp:Label ID="Label1" runat="server" Width="0px"></asp:Label>欢迎您登录！【<asp:LinkButton
                    ID="LinkBtnLogout" CssClass="chengse" runat="server" OnClick="LinkBtnLogout_Click">注销</asp:LinkButton>】</asp:Panel>
        </td>
        <td style="width: 100px">
            <asp:Panel ID="PanelLogin" runat="server" Height="9px" Width="129px" Direction="RightToLeft">
                【<a class="chengse" href="login.aspx">登录</a>】【<a class="chengse" href="Register.aspx">注册</a>】</asp:Panel>
        </td>
    </tr>
</table>
