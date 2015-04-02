<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminTools.aspx.cs" Inherits="AdminTools" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 90%; border-top-width: thin; border-left-width: thin; border-left-color: #cccccc; border-bottom-width: thin; border-bottom-color: #cccccc; border-top-color: #cccccc; border-right-width: thin; border-right-color: #cccccc;">
            <tr>
                <td colspan="2">
                    <span style="font-size: 9pt">工具下载管理</span></td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="text-align: left">
                    <asp:LinkButton ID="LinBtnAdd" runat="server" Font-Size="9pt" OnClick="LinBtnAdd_Click" ForeColor="Red">添加工具软件>></asp:LinkButton></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 446px">
                    <asp:DataList ID="dlContent" runat="server" Width="554px" OnDeleteCommand="dlContent_DeleteCommand" OnItemDataBound="dlContent_ItemDataBound" OnUpdateCommand="dlContent_UpdateCommand">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="background-image: url(../image/标头.jpg); width: 554px; height: 26px; text-align: left">
                                        &nbsp; &nbsp; <span style="font-size: 9pt">产品编号</span>：<a style="font-size: 9pt; text-decoration: none">
                                            <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                        </a>
                                        <asp:Label ID="Label1" runat="server" Font-Size="9pt" Text="——"></asp:Label><span
                                            style="font-size: 9pt">产品名称</span>：
                                        <a style="font-size: 9pt; text-decoration: none">
                                            <%# DataBinder.Eval(Container.DataItem,"Name") %>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="background-image: url(../image/内容左侧.jpg); vertical-align: top; width: 76px;
                                        height: 97px; text-align: center">
                                        <asp:Label ID="labID" runat="server" Font-Size="9pt" Height="14px" Text="产品版本" Width="68px"></asp:Label>
                                        <br />
                                        <br />
                                        <a style="font-size: 9pt; text-decoration: none">
                                            <%# DataBinder.Eval(Container.DataItem, "Edition")%>
                                        </a>
                                    </td>
                                    <td style="width: 478px; text-align: left; background-image: url(../image/标头.jpg);">
                                        <table cellpadding="0" cellspacing="0" style="width: 478px">
                                            <tr>
                                                <td style="background-image: url(../image/3.jpg); width: 478px; height: 21px">
                                                    &nbsp; &nbsp;
                                                    <asp:Label ID="Label3" runat="server" Font-Size="9pt" Text="产品介绍："></asp:Label></td>
                                            </tr>
                                        </table>
                                        <table cellpadding="0" cellspacing="0" style="width: 478px">
                                            <tr>
                                                <td style="background-image: url(../image/文本.jpg); vertical-align: top; width: 478px;
                                                    height: 54px">
                                                    &nbsp; &nbsp; &nbsp; &nbsp;
                                                    <asp:Label ID="labCardContent" runat="server" Font-Size="9pt" Height="50px" Text='<%# DataBinder.Eval(Container.DataItem,"Intro") %>'
                                                        Width="408px"></asp:Label></td>
                                            </tr>
                                        </table>
                                        <table cellpadding="0" cellspacing="0" style="width: 478px">
                                            <tr>
                                                <td style="background-image: url(Image/时间.jpg); width: 478px; height: 22px; text-align: right">
                                                    <asp:Label ID="Label2" runat="server" Font-Size="9pt" Text="下载次数：" Width="64px"></asp:Label>
                                                    <asp:Label ID="labDate" runat="server" Font-Size="9pt" Height="15px" Text='<%# DataBinder.Eval(Container.DataItem,"point") %>'
                                                        Width="95px"></asp:Label>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" Font-Size="9pt"
                                            Font-Underline="False" ForeColor="Blue">【删除工具】</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="9pt" ForeColor="Blue"　Font-Underline="False" CommandName="update">【修改工具】</asp:LinkButton></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 24px">
                    <table cellpadding="0" cellspacing="0" style="width: 579px">
                        <tr>
                            <td style="font-size: 9pt; width: 500px; text-align: right; height: 16px;">
                                <asp:Label ID="LblNowPage" runat="server" Text="当前页码为："></asp:Label>
                                【
                                <asp:Label ID="labPage" runat="server" Text="1" Font-Bold="True" Width="1px"></asp:Label>
                                &nbsp;】
                                <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                【
                                <asp:Label ID="labBackPage" runat="server" Font-Bold="True"></asp:Label>
                                &nbsp;】<asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <br />
</asp:Content>

