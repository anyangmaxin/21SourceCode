<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Findpwd.aspx.cs" Inherits="Module_Admin_Findpwd" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>找回密码</title>
            <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div>
        <table align="center" style="width: 755px; text-align: center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" style="height: 8px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Skin/head.jpg" /></td>
            </tr>
            <tr>
                <td style="height: 371px; background-image: url(../../Images/Skin/reg.jpg); vertical-align: middle; text-align: center;" 
                    colspan="3">
                    <table style="width: 392px">
                        <tr>
                            <td colspan="3">
                                <strong><span style="color: #993300; vertical-align: middle; text-align: center;">找回密码</span></strong></td>
                        </tr>
                        <tr>
                            <td style="width: 98px">
                                <span style="font-size: 9pt">问&nbsp; &nbsp; 题:</span></td>
                            <td style="width: 228px">
                                <asp:TextBox ID="txtQues" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox></td>
                            <td style="width: 129px">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 98px">
                                <span style="font-size: 9pt">回答问题:</span></td>
                            <td style="width: 228px">
                                <asp:TextBox ID="txtAns" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                            <td style="width: 129px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAns"
                                    ErrorMessage="请回答问题">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 98px">
                            </td>
                            <td style="width: 228px">
                                <asp:Button ID="btnOK" runat="server" CssClass="ButtonCss" Text="确定" OnClick="btnOK_Click" Font-Size="9pt" />
                                <asp:Button ID="btnCancle" runat="server" CssClass="ButtonCss" CausesValidation="False" Text="取消" OnClick="Button2_Click" Font-Size="9pt" /></td>
                            <td style="width: 129px">
                            </td>
                        </tr>
                    </table>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="9pt" ShowMessageBox="True" ShowSummary="False" />
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 21px">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Skin/bottom.jpg" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
