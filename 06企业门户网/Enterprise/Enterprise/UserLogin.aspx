<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>
</head>
<body style="text-align: center; background-image: url(image/bg.jpg);">
    <form id="form1" runat="server">
    <div>
        <table style="width: 410px; height: 125px">
            <tr>
                <td colspan="2" rowspan="4" style="background-image: url(image/denglubg.jpg); height: 271px; width: 622px;">
                    <div style="text-align: center">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 54px; height: 52px">
                                </td>
                                <td style="width: 80px; height: 52px">
                                </td>
                                <td style="width: 55px; height: 52px; text-align: center">
                                </td>
                                <td style="width: 35px; height: 52px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 54px; height: 35px">
                                </td>
                                <td style="width: 80px; height: 35px">
                                    <span style="font-size: 9pt">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/image/UserName.jpg" /></span></td>
                                <td style="width: 55px; height: 35px; text-align: left">
                                    <asp:TextBox ID="TxtUserName" runat="server" Width="97px"></asp:TextBox></td>
                                <td style="width: 35px; height: 35px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 54px; height: 16px">
                                </td>
                                <td style="width: 80px; height: 16px; text-align: center;">
                                    <span style="font-size: 9pt">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/image/Userpwd.jpg" /></span></td>
                                <td align="center" style="width: 55px; height: 16px; text-align: left">
                                    <asp:TextBox ID="TxtUserPwd" runat="server" Width="97px" TextMode="Password"></asp:TextBox></td>
                                <td style="width: 35px; height: 16px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 54px; height: 16px">
                                </td>
                                <td style="width: 80px; height: 16px; text-align: center">
                                    <span style="font-size: 9pt">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/image/yzm.jpg" /></span></td>
                                <td align="center" style="width: 55px; height: 16px; text-align: left">
                                    <asp:TextBox ID="TxtCode" runat="server" Width="97px"></asp:TextBox></td>
                                <td style="width: 35px; height: 16px">
                                    <img src="checkcode.aspx" /></td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                </td>
                                <td colspan="2">
                                    <asp:ImageButton ID="ImgBtnLogin" runat="server" ImageUrl="~/image/dl.jpg" OnClick="ImgBtnLogin_Click" />
                                    &nbsp;
                                    <asp:ImageButton
                                        ID="ImgCZ" runat="server" ImageUrl="~/image/注册.jpg" OnClick="ImgCZ_Click" /></td>
                                <td style="width: 35px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 54px">
                                </td>
                                <td style="width: 80px">
                                </td>
                                <td style="width: 55px">
                                </td>
                                <td style="width: 35px">
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
