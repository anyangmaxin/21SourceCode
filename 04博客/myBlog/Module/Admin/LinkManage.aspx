<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinkManage.aspx.cs" Inherits="Module_Blog_LinkManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>链接管理</title>
        <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 10px;
            width: 59px;
        }
    </style>
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div style="text-align: left">
        <table cellpadding="0" cellspacing="0" style="width: 473px; height: 285px">
            <tr>
                <td align="left" colspan="3" style="background-image: url(../../Images/Skin/bg.jpg);
                    vertical-align: middle; height: 478px; text-align: center">
                    <table cellpadding="0" cellspacing="0" style="left: 0px; width: 507px; height: 263px">
                        <tr>
                            <td colspan="3" style="height: 31px">
                                <span style="color: #993300"><strong>超链接管理</strong></span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="vertical-align: top; height: 205px; text-align: left">
                                <table style="width: 510px; height: 211px">
                                    <tr>
                                        <td style="width: 114px; height: 10px">
                                            <span style="font-size: 9pt">查询条件</span></td>
                                        <td style="width: 92px; height: 10px">
                                            <asp:DropDownList ID="ddlSearch" runat="server" Font-Size="9pt" Width="114px">
                                                <asp:ListItem Selected="True">地址ID</asp:ListItem>
                                                <asp:ListItem>网站名称</asp:ListItem>
                                                <asp:ListItem>链接网址</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td class="style1">
                                            <span style="font-size: 9pt">关键字</span></td>
                                        <td style="width: 142px; height: 10px">
                                            <asp:TextBox ID="txtKey" runat="server" Font-Size="9pt" Width="77px"></asp:TextBox></td>
                                        <td style="width: 54px; height: 10px">
                                            <asp:Button ID="btnSearch" runat="server" Font-Size="9pt" OnClick="btnSearch_Click"
                                                Text="查找" Height="21px" Width="64px" /></td>
                                        <td style="width: 111px; height: 10px">
                                            <asp:LinkButton ID="lnkbtnAdd" runat="server" Font-Size="9pt" Font-Underline="False"
                                                ForeColor="Blue" PostBackUrl="~/Module/Admin/AddLink.aspx" 
                                                onclick="lnkbtnAdd_Click">添加新链接</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="vertical-align: top; height: 163px; text-align: center">
                                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                CellPadding="4" Font-Size="9pt" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging"
                                                OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting"
                                                Width="500px">
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <Columns>
                                                    <asp:BoundField DataField="ST_l_id" HeaderText="地址ID" />
                                                    <asp:BoundField DataField="ST_l_name" HeaderText="网站名称" />
                                                    <asp:BoundField DataField="ST_l_url" HeaderText="链接网址" />
                                                    <asp:HyperLinkField DataNavigateUrlFields="ST_l_id" DataNavigateUrlFormatString="AmendLink.aspx?ID={0}"
                                                        HeaderText="修改" Text="修改" />
                                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                                </Columns>
                                                <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    </table>
                                &nbsp;&nbsp;</td>
                        </tr>
                        </table>
                </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
