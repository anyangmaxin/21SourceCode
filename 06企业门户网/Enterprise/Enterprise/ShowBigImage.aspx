<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowBigImage.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>显示大图片</title>
</head>
<body >
    <form id="form1" runat="server">
    <div>
        &nbsp;<div style="text-align: center">
            <table style="width: 33%; height: 182px " >
                <tr>
                    <td style="width: 100px; text-align: center; height: 399px;" align="center">
                        <asp:Image ID="Image1" runat="server" Height="377px" Width="450px" /><br />
                        <div style="text-align: center">
                            &nbsp;</div>
                        &nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" style="width: 100px; text-align: center">
                        【<asp:LinkButton ID="LinBtnReturn" runat="server" Font-Size="9pt" OnClick="LinBtnReturn_Click">返回首页</asp:LinkButton>】</td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
