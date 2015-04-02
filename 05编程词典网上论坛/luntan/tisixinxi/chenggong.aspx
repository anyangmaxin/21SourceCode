<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chenggong.aspx.cs" Inherits="chenggong" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编程词典网上论坛</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
            <br />
            <div style="text-align: center">
                <table border="0" style="background-image: url(../image/success.jpg);">
                    <tr>
                        <td style="width: 73px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 73px; height: 137px" valign="bottom">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20px" ForeColor="Maroon"
                            Text="恭喜您！成功完成操作！" Width="387px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 73px; height: 24px">
                            <div style="text-align: center">
                                <table border="0" style="width: 413%">
                                    <tr>
                                        <td style="width: 158px">
                                        </td>
                                        <td style="width: 266px">
                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Small" OnClick="LinkButton1_Click">返回首页</asp:LinkButton></td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
