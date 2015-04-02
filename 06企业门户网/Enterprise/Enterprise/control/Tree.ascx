<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tree.ascx.cs" Inherits="WebUserControl" %>
<table style="width: 232px; height: 519px">
    <tr>
        <td rowspan="3" style="width: 34px; height: 518px;">
<asp:TreeView ID="TreeView1" runat="server" DataSourceID="XmlDataSource1" Font-Size="9pt"
    Height="494px" ImageSet="Faq" Width="240px" BackColor="GhostWhite" >
    <ParentNodeStyle Font-Bold="False" />
    <HoverNodeStyle Font-Underline="True" ForeColor="Purple" />
    <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" VerticalPadding="0px" />
    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="DarkBlue" HorizontalPadding="5px"
        NodeSpacing="0px" VerticalPadding="0px" />
    <DataBindings>
        <asp:TreeNodeBinding DataMember="Hardware" Text="后台管理" Value="后台管理" />
        <asp:TreeNodeBinding DataMember="Item" Text="管理员管理" Value="管理员管理" />
        <asp:TreeNodeBinding DataMember="Option" NavigateUrlField="Url" Text="Option" TextField="Choice" Value="Option" />
        <asp:TreeNodeBinding DataMember="leaf" NavigateUrlField="Url" Text="leaf" TextField="son" Value="leaf" />
    </DataBindings>
</asp:TreeView>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
</table>
&nbsp;
<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/XMLTreeView.xml">
</asp:XmlDataSource>
