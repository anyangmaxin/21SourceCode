<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowPwd.aspx.cs" Inherits="Module_Admin_Pwd" %>


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
                <td colspan="3" style="height: 72px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Skin/head.jpg" /></td>
            </tr>
            <tr>
                <td style="height: 181px; background-image: url(../../Images/Skin/reg.jpg); vertical-align: middle; text-align: center;" 
                    colspan="3">
                    <table style="width: 447px">
                        <tr>
                            <td style="width: 152px">
                            </td>
                            <td style="width: 167px">
                                <strong><span style="color: #993300">密 &nbsp;&nbsp; 码</span></strong></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 152px; text-align: right; height: 18px;">
                                <span style="font-size: 9pt">您的密码:</span></td>
                            <td style="width: 167px; height: 18px;">
                                <asp:TextBox ID="txtPwd" runat="server" BackColor="#E0E0E0" ReadOnly="True"></asp:TextBox></td>
                            <td style="height: 18px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 152px; text-align: right; height: 22px;">
                                <span style="font-size: 9pt">修改密码</span>:</td>
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
                                <asp:Button ID="btnChange" CssClass="ButtonCss" runat="server" Text="修改" OnClick="btnChange_Click" Font-Size="9pt" />
                                <asp:Button ID="btnBack" runat="server" CssClass="ButtonCss" OnClick="btnBack_Click" Text="返回" Font-Size="9pt" CausesValidation="False" /></td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 32px">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Skin/bottom.jpg" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
