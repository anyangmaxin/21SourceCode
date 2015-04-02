<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_AD.aspx.cs" Inherits="manage_AD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>循环播放广告</title>
    <link href="CSS/style.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align:center">
                        <br />
            &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 551px; height: 230px; border-right: #cccccc thin solid; border-top: #cccccc thin solid; border-left: #cccccc thin solid; border-bottom: #cccccc thin solid;">
                <tr>
                    <td colspan="3">
                        循环广告管理</td>
                </tr>
                <tr>
                    <td style="width: 139px; height: 19px;">
                        选择上传的图片：</td>
                    <td style="height: 19px; text-align: left;" colspan="2">
                        <asp:FileUpload ID="fileupAD" runat="server" Width="259px" />请选择上传图片<br />
                        （注意：上传图片格式要求为.jpg，且不能超过80KB。）</td>
                </tr>
                <tr>
                    <td style="width: 139px">
                        选择广告位置：</td>
                    <td colspan="2" style="text-align: left">
                        <asp:RadioButtonList ID="radListPlace" runat="server" RepeatDirection="Horizontal" Width="232px">
                            <asp:ListItem Selected="True" Value="1">位置1</asp:ListItem>
                            <asp:ListItem Value="2">位置2</asp:ListItem>
                            <asp:ListItem Value="3">位置3</asp:ListItem>
                            <asp:ListItem Value="4">位置4</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td style="width: 139px">
                        输入链接网址：</td>
                    <td colspan="2" style="text-align: left">
                        <asp:TextBox ID="txtADurl" runat="server" Width="155px">http://www.mrbccd.com</asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtADurl"
                            Display="Dynamic" ErrorMessage="网址格式不正确" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator><span style="color: #ff0033">如：http://www.mrbccd.com</span></td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 19px">
                        <asp:Button ID="btnUp" runat="server"  Text="上 传 图 片" OnClick="btnUp_Click" Width="151px" />
                        </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
