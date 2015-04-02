<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AmendLink.aspx.cs" Inherits="Module_Blog_AmendLink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>修改链接</title>
    <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div style="text-align: left">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;</div>
                    <table style="width: 444px">
                        <tr>
                            <td colspan="3">
                                <strong><span style="color: #993300">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp;修改链接</span></strong></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; text-align: center">
                                <span style="font-size: 9pt">网站名称:</span></td>
                            <td colspan="2" style="width: 304px">
                                <asp:TextBox ID="txtName" runat="server" Width="251px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">链接地址:</span></td>
                            <td colspan="2" style="height: 21px; width: 304px;">
                                <asp:TextBox ID="txtUrl" runat="server" Width="251px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 21px" align="center">
                                <asp:Button ID="btnAmend" runat="server" OnClick="btnAmend_Click" Text="修改" Font-Size="9pt" Width="47px" />
                                <asp:Button ID="btnCancle" runat="server" OnClick="btnCancle_Click" Text="取消" Font-Size="9pt" Width="49px" /></td>
                        </tr>
                    </table>
    </form>
</body>
</html>
