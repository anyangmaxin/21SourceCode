<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center;">
            <table style="width: 600px; height: 125px">
                <tr>
                    <td colspan="2" rowspan="4" style="background-image: url(image/3.jpg); height: 395px">
                        <div style="text-align: center">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 75px; height: 32px;">
                                    </td>
                                    <td style="width: 70px; height: 32px;">
                                    </td>
                                    <td style="width: 80px; height: 32px;">
                                        <span style="font-size: 9pt">用户名：</span></td>
                                    <td style="width: 62px; height: 32px; text-align: center;">
                                        <asp:TextBox ID="TxtAdminName" runat="server" Width="97px">mr</asp:TextBox></td>
                                    <td style="width: 45px; height: 32px;">
                                    </td>
                                    <td style="width: 100px; height: 32px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 75px; height: 26px;">
                                    </td>
                                    <td style="width: 70px; height: 26px;">
                                    </td>
                                    <td style="width: 80px; height: 26px;">
                                        <span style="font-size: 9pt">用户密码：</span></td>
                                    <td align="center" style="width: 62px; height: 26px; text-align: center;">
                                        <asp:TextBox ID="TxtAdminPwd" runat="server" Width="97px" TextMode="Password">mrsoft</asp:TextBox></td>
                                    <td style="width: 45px; height: 26px;">
                                    </td>
                                    <td style="width: 100px; height: 26px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 75px; height: 27px;">
                                    </td>
                                    <td style="width: 70px; height: 27px;">
                                    </td>
                                    <td style="width: 80px; height: 27px;">
                                        <span style="font-size: 9pt">用户权限：</span></td>
                                    <td align="center" style="width: 62px; height: 27px; text-align: center;">
                                        <asp:DropDownList ID="DDlRole" runat="server" Width="101px">
                                            <asp:ListItem>管理员</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 45px; height: 27px;">
                                    </td>
                                    <td style="width: 100px; height: 27px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 75px">
                                    </td>
                                    <td style="width: 70px">
                                    </td>
                                    <td colspan="2">
                                        <asp:ImageButton ID="ImgBtnLogin" runat="server" ImageUrl="~/image/login.jpg" OnClick="ImgBtnLogin_Click" /><asp:ImageButton
                                            ID="ImgCZ" runat="server" ImageUrl="~/image/chongzhi.jpg" OnClick="ImgCZ_Click" /></td>
                                    <td style="width: 45px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 75px">
                                    </td>
                                    <td style="width: 70px">
                                    </td>
                                    <td style="width: 80px">
                                    </td>
                                    <td style="width: 62px">
                                    </td>
                                    <td style="width: 45px">
                                    </td>
                                    <td style="width: 100px">
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
    
    </div>
    </form>
</body>
</html>
