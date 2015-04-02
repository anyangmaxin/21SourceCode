<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinkManManage.aspx.cs" Inherits="Module_Blog_MessageList" StylesheetTheme= %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>联系人管理</title>
            <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="font-size: 12pt; margin-top: 0px; padding-top: 0px;">
    <form id="form1" runat="server">
    <div align="left" style="margin-top: 0px; padding-top: 0px; text-align: center;">
        <table style="width: 506px; vertical-align: top;" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" rowspan="2" style="text-align:center; height: 477px; background-image: url(../../Images/Skin/bg.jpg); vertical-align: middle;">
                    <table style="left: 0px; width: 173px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="3" style="height: 31px">
                                <span style="color: #993300"><strong>联系人信息</strong></span></td>
                        </tr>
                        <tr>
                            <td colspan="3" rowspan="2" style="height: 206px; vertical-align: top; text-align: center;">
                                <table style="width: 510px">
                                    <tr>
                                        <td style="width: 114px; height: 17px">
                                            <span style="font-size: 9pt">查询条件</span></td>
                                        <td style="width: 92px; height: 17px">
                                            <asp:DropDownList ID="ddlSearch" runat="server" Width="114px" Font-Size="9pt">
                                                <asp:ListItem>联系人ID</asp:ListItem>
                                                <asp:ListItem>姓名</asp:ListItem>
                                                <asp:ListItem>QQ</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td style="width: 115px; height: 17px">
                                            <span style="font-size: 9pt">关键字</span></td>
                                        <td style="width: 142px; height: 17px">
                                            <asp:TextBox ID="txtKey" runat="server" Width="101px" Font-Size="9pt"></asp:TextBox></td>
                                        <td style="width: 54px; height: 17px">
                                            <asp:Button ID="btnSearch" CssClass="ButtonCss" runat="server" Text="查找" Font-Size="9pt" OnClick="btnSearch_Click" Width="62px" /></td>
                                        <td style="width: 111px; height: 17px">
                                            <asp:LinkButton ID="lnkbtnAdd" runat="server" Font-Size="9pt" PostBackUrl="~/Module/Blog/AddLinkMan.aspx" Font-Underline="False" ForeColor="Blue">添加新信息</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" rowspan="2" style="height: 164px; vertical-align: top; text-align: center;">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                Font-Size="9pt" Width="550px" AllowPaging="True" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" Height="282px" ForeColor="#333333" GridLines="None">
                                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="联系人ID" DataField="MessageID" />
                                                    <asp:BoundField HeaderText="姓名" DataField="FriendName" />
                                                    <asp:BoundField HeaderText="性别" DataField="Sex" />
                                                    <asp:BoundField HeaderText="QQ" DataField="QQ" />
                                                    <asp:HyperLinkField HeaderText="详细信息" Text="详细信息" DataNavigateUrlFields="MessageID" DataNavigateUrlFormatString="LinkManInfo.aspx?id={0}" />
                                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                                </Columns>
                                                <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <AlternatingRowStyle BackColor="White" />
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
