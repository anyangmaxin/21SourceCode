<%@ Control Language="C#" AutoEventWireup="true" CodeFile="New.ascx.cs" Inherits="control_New" %>
<table style="width: 76%; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; height: 152px;">
    <tr>
        <td style="width: 96px; height: 24px">
            <asp:Image ID="Image5" runat="server" ImageUrl="~/image/index_07.gif" /></td>
    </tr>
    <tr>
        <td align="left" style="width: 96px; height: 5px" valign="top">
            <asp:DataList ID="DlNew" runat="server" OnUpdateCommand="DlNew_UpdateCommand" Width="485px">
                <ItemTemplate>
                    <div style="text-align: center">
                        <table style="width: 100%">
                            <tr>
                                <td align="left" style="width: 49px">
                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/image/whiteline_head.gif" /></td>
                                <td align="left" style="width: 50px">
                                    <asp:LinkButton ID="lbNew" runat="server" CommandName="Update" Font-Size="9pt" Font-Underline="False"
                                        Text='<%# DataBinder.Eval(Container.DataItem,"title") %>' Width="156px"></asp:LinkButton></td>
                                <td align="left" style="width: 84px">
                                    <asp:Label ID="Label1" runat="server" Font-Size="9pt" ForeColor="#FF8000" Text='<%# DataBinder.Eval(Container.DataItem,"PublishTime","{0:yyyy年MM月dd日}") %>'
                                        Width="124px"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <div style="text-align: center">
                        <div style="text-align: center">
                            &nbsp;</div>
                    </div>
                </AlternatingItemTemplate>
            </asp:DataList>
            <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="9pt" Font-Underline="False" OnClick="LinkButton2_Click" ForeColor="Red">更多新闻>></asp:LinkButton></td>
    </tr>
</table>
