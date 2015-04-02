<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlogManage.aspx.cs" Inherits="Module_Admin_AdminMagage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>博客信息管理</title>
    <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="font-size: 12pt; margin-top: 0px; padding-top: 0px;">
    <form id="form1" runat="server">
    <div align="left">
        <table style="width: 251px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="vertical-align: middle; text-align: center; height: 477px; background-image: url(../../Images/Skin/bg.jpg); width: 768px;" colspan="3" rowspan="2">
                    <table style="left: 0px; width: 546px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="1" style="height: 31px">
                                <span style="color: #993300"><strong>博客用户信息</strong></span></td>
                        </tr>
                        <tr>
                            <td colspan="1" rowspan="2" style="height: 221px; vertical-align: top; text-align: center;">
                                <table style="width: 510px; vertical-align: top; text-align: center;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 114px; height: 10px">
                                            <span style="font-size: 9pt">查询条件</span></td>
                                        <td style="width: 92px; height: 10px">
                                            <asp:DropDownList ID="ddlSearch" runat="server" Width="114px" Font-Size="9pt">
                                                <asp:ListItem>博客ID</asp:ListItem>
                                                <asp:ListItem>博客姓名</asp:ListItem>
                                                <asp:ListItem>QQ</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td style="width: 115px; height: 10px">
                                            <span style="font-size: 9pt">关键字</span></td>
                                        <td style="width: 142px; height: 10px">
                                            <asp:TextBox ID="txtKey" runat="server" Width="85px" Font-Size="9pt"></asp:TextBox></td>
                                        <td style="width: 81px; height: 10px">
                                            <asp:Button ID="btnSearch" runat="server" Text="查找" OnClick="btnSearch_Click" Font-Size="9pt" /></td>
                                        <td style="width: 111px; height: 10px">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" rowspan="2" style="height: 131px; vertical-align: top; text-align: center;">
                                            <asp:GridView ID="gvBlog" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                Font-Size="9pt" ForeColor="#333333" GridLines="None" Width="500px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="gvBlog_RowDataBound">
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="博客ID" DataField="BlogID" />
                                                    <asp:BoundField HeaderText="博客姓名" DataField="UserName" />
                                                    <asp:BoundField HeaderText="博客性别" DataField="Sex" />
                                                    <asp:BoundField HeaderText="QQ" DataField="QQ" />
                                                    <asp:BoundField HeaderText="注册时间" DataField="RegTime" />
                                                    <asp:HyperLinkField DataNavigateUrlFields="BlogID" DataNavigateUrlFormatString="BlogInfo.aspx?id={0}"
                                                        HeaderText="详细信息" Text="详细信息" />
                                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                                </Columns>
                                                <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="White" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <EditRowStyle BackColor="#7C6F57" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                </table>
                                &nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
