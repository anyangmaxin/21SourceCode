<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shibai.aspx.cs" Inherits="shibai" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编程词典网上论坛</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
                    &nbsp;</div>
        <div style="text-align: center">
            <table border="0" style="background-image: url(../image/sorry.jpg);">
                <tr>
                    <td style="width: 128px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 128px; height: 143px" valign="bottom">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20px" ForeColor="Maroon"
                        Text="很遗憾！信息操作失败！" Width="377px" Height="58px"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 128px; height: 26px" align="center">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div
                            style="text-align: center">
                            <table border="0" style="width: 284%">
                                <tr>
                                    <td style="width: 100px">
                                    </td>
                                    <td style="width: 100px">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Small" OnClick="LinkButton1_Click">返回首页</asp:LinkButton></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
