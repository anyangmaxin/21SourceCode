<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="UserControl_Login" %>
<table align="center" cellpadding="0" cellspacing="0" class="style2">
    <tr>
        <td align="center">
            &nbsp;</td>
        <td align="right">
            <asp:Label ID="Label8" runat="server" SkinID="20" Text="用户名：" Width="68px" 
                style="font-size: small"></asp:Label>
        </td>
        <td colspan="2">
                        <span style="font-size: 9pt"><asp:TextBox ID="txtUid" 
                runat="server" Width="105px" Font-Size="9pt"></asp:TextBox></span>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="right">
            <asp:Label ID="Label3" runat="server" style="font-size: small" Text="密 码："></asp:Label>
        </td>
        <td colspan="2">
                        <span style="font-size: 9pt">
                        <asp:TextBox ID="txtPwd" runat="server" Width="105px" 
                TextMode="Password" Font-Size="9pt"></asp:TextBox></span>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="right">
            <asp:Label ID="Label9" runat="server" Height="20px" Text="验证码：" Width="67px"></asp:Label>
        </td>
        <td colspan="2">
                        
                <asp:TextBox ID="txtVali" runat="server" Width="105px" Height="16px" ></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="3" align="right">                                     
                    <img src="CheckCode.aspx" id="valiCode" alt="验证码" /><a title="刷新验证码" href="" 
                        onclick="javascript:document.getElementById('valiCode').src='UserControl/CheckCode.aspx?id='+Math.random();return false;">看不清，请换张图？</a>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="right">
            <asp:ImageButton ID="btnLoad" runat="server" CausesValidation="False" 
                Height="21px" ImageUrl="~/Images/Skin/登录_06.jpg" OnClick="btnLoad_Click" 
                Width="55px" />
            </td>
        <td class="style6">
                        <asp:LinkButton ID="lnkbtnForget" runat="server" Font-Size="9pt" 
                            PostBackUrl="~/Module/Blog/Findpwd1.aspx" CausesValidation="False" 
                            Font-Underline="False" ForeColor="Red" Width="108px" 
                Height="16px">忘记密码？</asp:LinkButton>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="right">
            <asp:ImageButton ID="btnRegister" runat="server" CausesValidation="False" 
                Height="21px" ImageUrl="~/Images/Skin/注册_08.jpg" OnClick="btnRegister_Click" 
                Width="53px" />
        </td>
        <td class="style6">
                        <asp:LinkButton ID="lnkbtnAdmin" runat="server" Font-Size="9pt" 
                PostBackUrl="~/Module/Admin/Index.aspx" CausesValidation="False" 
                Font-Underline="False" ForeColor="Red" Width="83px" onclick="lnkbtnAdmin_Click" 
                            Height="16px">管理员登录</asp:LinkButton>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>


