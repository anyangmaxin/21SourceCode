<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Left.ascx.cs" Inherits="control_WebUserControl" %>
<%@ Register Src="HyperlinkControl.ascx" TagName="HyperlinkControl" TagPrefix="uc1" %>
<table style="border-style: solid; border-color: inherit; border-width: 1px; width: 24%; ">
    <tr>
        <td style="width: 90px; height: 287px;">
            <div style="text-align: center">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100px">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/index_download.gif" /></td>
                    </tr>
                    <tr>
                        <td style="width: 100px; height: 201px">
            <asp:DataList ID="DLGongGao" runat="server"
                Width="217px" OnUpdateCommand="DLGongGao_UpdateCommand">
                <ItemTemplate>
                    <div style="text-align: center">
                        <table style="width: 100%">
                            <tr>
                                <td align="right" style="width: 24px; height: 30px;">
                                    &nbsp;<asp:Image ID="Image9" runat="server" ImageUrl="~/image/tb.jpg" Width="12px" /></td>
                                <td align="left" style="width: 100px; height: 30px;">
                                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" Font-Underline="False"　Text='<%# DataBinder.Eval(Container.DataItem,"title") %>' CommandName="Update" Width="172px"></asp:LinkButton></td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:DataList></td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td style="width: 90px">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/image/index_tools_dlS.gif" /></td>
    </tr>
    <tr>
        <td style="width: 90px">
            <asp:DataList ID="DlToolsDownLoad" runat="server"
                Width="229px" OnUpdateCommand="DlToolsDownLoad_UpdateCommand">
                <ItemTemplate>
                    <div style="text-align: center">
                        <table style="width: 100%">
                            <tr>
                                <td align="center" style="width: 48px; height: 27px;">
                                    &nbsp;<asp:Image ID="Image9" runat="server" ImageUrl="~/image/tb.jpg" Width="12px" /></td>
                                <td align="left" style="width: 100px; height: 27px;">
                                    <asp:LinkButton ID="lbToolsDownLoad" runat="server" Font-Size="9pt" Font-Underline="False"　Text='<%# DataBinder.Eval(Container.DataItem,"Name") %>'
                                        Width="171px" CommandName="Update"></asp:LinkButton></td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:DataList></td>
    </tr>
    <tr>
        <td style="width: 90px">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/image/index_mend_dlS.gif" /></td>
    </tr>
    <tr>
        <td style="width: 90px">
            <asp:DataList ID="DataList2" runat="server" OnUpdateCommand="DataList2_UpdateCommand"
                Width="229px">
                <ItemTemplate>
                    <div style="text-align: center">
                        <table style="width: 100%">
                            <tr>
                                <td align="center" style="width: 47px; height: 25px"><asp:Image ID="Image9" runat="server" ImageUrl="~/image/tb.jpg" Width="12px" /></td>
                                <td style="width: 100px; height: 25px">
                                    <asp:LinkButton ID="LinBtnToolsMend" runat="server" CommandName="update" Font-Size="9pt" Font-Underline="False"
                                        Text='<%# DataBinder.Eval(Container.DataItem,"Name") %>' Width="161px"></asp:LinkButton></td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:DataList></td>
    </tr>
    <tr>
        <td style="width: 90px">
            <asp:Image ID="Image4" runat="server" ImageUrl="~/image/index_friendlink.gif" /></td>
    </tr>
    <tr>
        <td style="width: 90px; height: 38px;" align="center">
            <uc1:HyperlinkControl ID="HyperlinkControl1" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 90px">
        </td>
    </tr>
    <tr>
        <td style="width: 90px">
        </td>
    </tr>
    <tr>
        <td style="width: 90px">
        </td>
    </tr>
</table>
