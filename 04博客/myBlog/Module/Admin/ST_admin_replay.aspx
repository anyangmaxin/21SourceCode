<%@ Page language="c#" Inherits="ST_GROUP.Blog.ST_admin_replay" CodeFile="ST_admin_replay.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ST_admin_replay</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body style="margin:0;border:0;background-image: url(images/05.jpg)">
		<form id="Form1" method="post" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 611px">
                <tr>
                    <td align="right" style="width: 55px">
                    </td>
                    <td style="width: 100px">
                        <strong><span style="color: #993300">&nbsp;评论管理&nbsp; </span></strong>
                    </td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 55px">
                        <asp:CheckBox ID="CheckBox2" runat="server" Font-Size="9pt" Text="全选" AutoPostBack="True" OnCheckedChanged="CheckBox2_CheckedChanged" /></td>
                    <td style="width: 100px">
                        <asp:Button ID="Button1" runat="server" Text="取消全选" OnClick="Button1_Click" />
                        </td>
                    <td style="width: 100px">
                        <asp:Button ID="Button2" runat="server" Text="批量删除" OnClick="Button2_Click" /></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:GridView ID="ReplayList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        DataKeyNames="ID" Font-Names="Tahoma" OnPageIndexChanging="ReplayList_PageIndexChanging" OnRowDataBound="ReplayList_RowDataBound" PageSize="8"
                                        SkinID="gvSkin" Style="font-size: x-small" Width="99%" OnRowDeleting="ReplayList_RowDeleting" CellPadding="4" Font-Size="10pt" ForeColor="#333333" GridLines="None">
                                        <RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" BackColor="#E3EAEB" />
                                        <EmptyDataRowStyle ForeColor="Blue" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="评论者">
                                                <ItemTemplate>
                                                    <a>
                                                        <%# Eval("ST_r_nick")%>
                                                    </a>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="评论内容">
                                                <ItemTemplate>
                                                    <%# Eval("ST_r_content").ToString().Length > 15 ? Eval("ST_r_content").ToString().Substring(0, 15) + "..." : Eval("ST_r_content")%>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="65%" />
                                            </asp:TemplateField>
                                            <asp:HyperLinkField HeaderText="详细信息" Text="详细信息" DataNavigateUrlFields="ST_r_id" DataNavigateUrlFormatString="ReplyInfo.aspx?ST_r_id={0}" NavigateUrl="~/Module/Admin/ReplyInfo.aspx">
                                                <ItemStyle Width="14%" />
                                            </asp:HyperLinkField>
                                            <asp:TemplateField HeaderText="选中">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Font-Size="9pt" Width="44px" />
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>
                                            <asp:CommandField ShowDeleteButton="True" HeaderText="删除" />
                                        </Columns>
                                       
                                        <HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                    </td>
                </tr>
            </table>
		</form>
	</body>
</HTML>
