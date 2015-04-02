<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewContent.aspx.cs" Inherits="Module_Blog_ReplayContent" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>查看文章</title>
            <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div style="text-align:left">
        <table style="width: 470px; height: 340px" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" style="height: 135px; width: 696px; vertical-align: top; text-align: left; background-image: url(../../Images/Skin/bg.jpg);">
                    <table style="width: 469px; height: 239px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 3298852px; height: 22px">
                            </td>
                            <td style="width: 613px; height: 22px; text-align: left">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 3298852px; height: 16px;">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="Label1" runat="server" Text="主题:" Width="67px"></asp:Label></span></td>
                            <td style="text-align: left; width: 613px; height: 16px;">
                                <asp:Label ID="labSubject" runat="server" Width="316px" Font-Size="9pt" ></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 3298852px; height: 15px">
                                <span style="font-size: 9pt">
                                    <asp:Label ID="Label2" runat="server" Text="内容:" Width="65px"></asp:Label></span></td>
                            <td style="height: 15px; width: 613px; text-align: left; vertical-align: top;">
                                <table style="width: 443px; height: 251px; border-top-width: thin; border-left-width: thin; border-left-color: black; border-bottom-width: thin; border-bottom-color: black; border-top-color: black; border-right-width: thin; border-right-color: black;">
                                    <tr>
                                        <td colspan="3" style="width: 602px; height: 193px;">
                                            <asp:TextBox ID="txtContent" runat="server" Font-Size="9pt" Height="257px" TextMode="MultiLine"
                                                Width="405px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="txtContent" ErrorMessage="修改内容不能空！">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
        </table>
                                <asp:Button ID="btnUpdate" runat="server" Font-Size="9pt" OnClick="btnUpdate_Click"
                                    Text="修改" Width="55px" />
                                <asp:Button ID="btnBack" runat="server" Font-Size="9pt" 
            OnClick="btnBack_Click" Text="返回" Width="47px" CausesValidation="False" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="24px" 
            ShowMessageBox="True" ShowSummary="False" Width="196px" />
        <br />
    
    </div>
    </form>
</body>
</html>
