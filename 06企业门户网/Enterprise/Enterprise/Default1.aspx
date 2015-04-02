<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="Default1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        <div style="text-align: center">
            <table style="width: 500px">
                <tr>
                    <td colspan="2" style="height: 72px">
                        <asp:Label ID="Label1" runat="server" Text="您已安全退出" Font-Bold="True" ForeColor="Red" Height="40px" Width="400px"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px; text-align: center;">
                        <asp:LinkButton ID="LinbtnSy" runat="server" Font-Size="9pt" OnClick="LinbtnSy_Click">返回首页</asp:LinkButton></td>
                    <td style="width: 100px; text-align: center;">
                                        <asp:LinkButton ID="LinBtnHT" runat="server" Font-Size="9pt" OnClick="LinBtnHT_Click">进入后台</asp:LinkButton></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
