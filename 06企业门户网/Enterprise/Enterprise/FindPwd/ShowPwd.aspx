<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowPwd.aspx.cs" Inherits="Module_Admin_Pwd" %>

<%@ Register Src="../control/header.ascx" TagName="header" TagPrefix="uc3" %>
<%@ Register Src="../control/foot.ascx" TagName="foot" TagPrefix="uc4" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>密码显示</title>
            <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table style="width: 755px" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" style="height: 113px">
                    &nbsp;<uc3:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td rowspan="2" style="height: 181px; background-image: url(../../Images/Skin/bg.jpg); vertical-align: middle; text-align: center;" colspan="3">
                    <table style="width: 447px">
                        <tr>
                            <td style="width: 152px">
                            </td>
                            <td style="width: 167px">
                                <strong><span style="color: #993300">找回密码</span></strong></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 152px; height: 18px; text-align: right">
                                <span style="font-size: 9pt">用户名称：</span></td>
                            <td style="width: 167px; height: 18px">
                                <asp:Label ID="LblUserName" runat="server" Font-Size="9pt" Width="146px"></asp:Label></td>
                            <td style="height: 18px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 152px; text-align: right; height: 18px;">
                                <span style="font-size: 9pt">您的密码：</span></td>
                            <td style="width: 167px; height: 18px;">
                                <asp:TextBox ID="txtPwd" runat="server" BackColor="White" ReadOnly="True" ForeColor="Red"></asp:TextBox></td>
                            <td style="height: 18px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 152px; height: 18px; text-align: right">
                            </td>
                            <td style="width: 167px; color: #993300; height: 18px">
                                <strong>修改密码</strong></td>
                            <td style="height: 18px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 152px; text-align: right; height: 22px;">
                                <span style="font-size: 9pt">修改密码：</span></td>
                            <td style="width: 167px; height: 22px;">
                                <asp:TextBox ID="txtOKpwd" runat="server"></asp:TextBox></td>
                            <td style="height: 22px; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOKpwd"
                                    ErrorMessage="*密码不能为空" Font-Size="9pt"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 152px; text-align: right">
                            </td>
                            <td style="width: 167px">
                                <asp:Button ID="btnChange" runat="server" Text="修改" OnClick="btnChange_Click" Font-Size="9pt" Width="62px" />
                                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="返回" Font-Size="9pt" CausesValidation="False" Width="60px" /></td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="3" rowspan="1" style="height: 32px">
                    &nbsp;<uc4:foot ID="Foot1" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
