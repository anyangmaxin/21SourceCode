<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReplyInfo.aspx.cs" Inherits="Module_Admin_ReplyInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="1" bordercolor="#cccc66" cellpadding="0" cellspacing="0"
            style="font-size: 9pt; background-image: url(../Image/例图/购物信息查询.jpg); width: 513px;
            height: 355px">
            <tr>
                <td colspan="2" style="text-align: center">
                    === 评论详细信息 ===<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Module/Admin/ST_admin_replay.aspx">返回留言管理页</asp:HyperLink></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 30px; text-align: center">
                    评论 ID：</td>
                <td style="width: 346px; height: 30px">
                    <asp:TextBox ID="txtGID" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 30px; text-align: center">
                    评论者：</td>
                <td style="width: 346px; height: 30px">
                    <asp:TextBox ID="txtGName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 30px; text-align: center">
                    评论标题：</td>
                <td style="width: 346px; height: 30px">
                    <asp:TextBox ID="txtGType" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 30px; text-align: center">
                    评论日期：</td>
                <td style="width: 346px; height: 30px">
                    <asp:TextBox ID="txtGStore" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;评论内容：</td>
            </tr>
            <tr>
                <td colspan="2" style="vertical-align: top; text-indent: 8pt; height: 134px; text-align: center">
                    <asp:TextBox ID="txtGIntro" runat="server" Height="150px" ReadOnly="True" TextMode="MultiLine"
                        Width="510px"></asp:TextBox></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
