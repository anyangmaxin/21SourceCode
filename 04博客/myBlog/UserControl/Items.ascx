<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Items.ascx.cs" Inherits="UserControl_Items" %>
<style type="text/css">
    .style1
    {
        width: 18%;
    }
</style>
<table cellpadding="0" cellspacing="0" class="style1">
    <tr>
        <td colspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                Width="195px" DataKeyNames="ItemID" style="font-size: small;">
                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="投票号" />
                    <asp:BoundField DataField="ItemName" HeaderText="投票主题" />
                    <asp:TemplateField HeaderText="选择">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Btntp" runat="server" Text="我要投票" onclick="Btntp_Click" 
                Width="70px" CausesValidation="False" Height="25px" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
