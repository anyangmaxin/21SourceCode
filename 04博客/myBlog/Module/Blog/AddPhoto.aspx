<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPhoto.aspx.cs" Inherits="Module_Blog_AddPhoto" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加图片</title>
        <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div align="left" style="text-align: center">
        <table style="width: 527px; height: 258px;" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" style="height: 241px; width: 755px;">
                    <table style="width: 475px; height: 60px">
                        <tr>
                            <td colspan="5" style="text-align: center">
                                <strong><span style="color: #993300">添加图片</span></strong></td>
                        </tr>
                        <tr>
                            <td style="width: 123px">
                                <span style="font-size: 9pt">
                                图片主题:</span></td>
                            <td colspan="4">
                                <asp:TextBox ID="txtSubject" runat="server" Width="225px" Font-Size="9pt"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 123px">
                                <span style="font-size: 9pt">
                                上传图片:</span></td>
                            <td colspan="4">
                                <asp:FileUpload ID="fileUp" runat="server" Font-Size="9pt" Width="231px" /></td>
                        </tr>
                        <tr>
                            <td style="width: 123px">
                            </td>
                            <td colspan="4" style="text-align: center">
                                <asp:Button ID="btnOK" CssClass="ButtonCss" runat="server" Font-Size="9pt" Text="确定" 
                                    OnClick="btnOK_Click" Height="21px" Width="63px" />
                                <asp:Button ID="btnCancle" CssClass="ButtonCss" runat="server" Font-Size="9pt" Text="取消" OnClick="btnCancle_Click" Width="69px" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
