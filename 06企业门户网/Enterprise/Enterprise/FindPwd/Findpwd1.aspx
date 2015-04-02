<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Findpwd1.aspx.cs" Inherits="Module_Admin_Findpwd" %>

<%@ Register Src="../control/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="../control/foot.ascx" TagName="foot" TagPrefix="uc2" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>找回密码</title>
            <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div>
        <table align="center" style="width: 755px; text-align: center" cellpadding="0" cellspacing="0" border="1">
            <tr>
                <td colspan="3" style="height: 8px; width: 784px;">
                    <uc1:header ID="Header1" runat="server" />
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="height: 200px; background-image: url(../../Images/Skin/bg.jpg); vertical-align: middle; text-align: center; width: 784px;" colspan="3" rowspan="2" valign="top">
                    <table style="width: 784px; height: 147px;">
                        <tr>
                            <td colspan="3" style="color: #ffffff; height: 26px; background-color: #3399ff">
                                <span style="font-size: 9pt">
                                找回密码--第一步</span></td>
                        </tr>
                        <tr>
                            <td style="width: 355px; height: 26px;">
                                <span style="font-size: 9pt">用户名:</span></td>
                            <td style="width: 228px; text-align: left; height: 26px;">
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                            <td style="width: 243px; height: 26px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="请输入用户名">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 355px">
                                <span style="font-size: 9pt">验证码:</span></td>
                            <td style="width: 228px; text-align: left;">
                                <asp:TextBox ID="txtVali" runat="server" Width="147px"></asp:TextBox>
                                <asp:Label ID="labVial" runat="server" Font-Bold="False" Font-Size="12pt" ForeColor="Blue"
                                    Width="63px"></asp:Label></td>
                            <td style="width: 243px">
                                </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="btnOK" runat="server" Text="确定" OnClick="btnOK_Click" Font-Size="9pt" />
                                <asp:Button ID="btnCancle" runat="server" CausesValidation="False" Text="重置" OnClick="Button2_Click" Font-Size="9pt" /></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 59px">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="9pt" ShowMessageBox="True" ShowSummary="False" />
                            </td>
                        </tr>
                    </table>
                    </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="3" rowspan="1" style="height: 21px; width: 784px;">
                    &nbsp;
                    <uc2:foot ID="Foot1" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
