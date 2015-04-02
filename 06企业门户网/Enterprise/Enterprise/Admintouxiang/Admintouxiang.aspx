<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Admintouxiang.aspx.cs" Inherits="Admintouxiang" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;&nbsp;
    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; width: 529px;
        height: 334px">
        <tr>
            <td align="center" colspan="3" style="height: 24px; text-align: center">
                管理用户头像</td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;<span style="color: #0000ff; text-decoration: underline"><a href='UpTouxiang.aspx'>添加新头像>></a></span>
                &nbsp; &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center">
                    <asp:DataList ID="dlTouxiang" runat="server" OnDeleteCommand="dlTouxiang_DeleteCommand" RepeatColumns="4" OnItemDataBound="dlTouxiang_ItemDataBound">
                        <ItemTemplate>
                            <div style="text-align: center">
                                <table style="background-image: url(image/bg.bmp); width: 65%; height: 175px">
                                    <tr>
                                        <td style="width: 100px; color: #ff3366">
                                            <span style="font-size: 9pt">编号：<asp:Label ID="lblId" runat="server" ForeColor="Black"
                                                Text='<%# Eval("id") %>'></asp:Label></span></td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 100px">
                                            <asp:Image ID="imgPhoto" runat="server" Height="122px" ImageUrl='<%# Eval("ImagePhone") %>'
                                                Width="109px" /></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <span style="font-size: 9pt">上传时间</span>：<asp:Label ID="lblTime" runat="server" Font-Size="9pt"
                                                Text='<%# Eval("Uptime") %>' Width="129px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 100px; height: 11px; color: #ffcc66;">
                                            <span style="font-size: 9pt; color: #6699cc">&nbsp;【</span>
                                            <asp:LinkButton ID="LinBtnDelete" runat="server" CommandName="Delete" Font-Size="9pt"
                                                Width="32px">删除</asp:LinkButton>
                                            <span style="font-size: 9pt; color: #6699cc">】</span></td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList></td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center">
                    <table cellpadding="0" cellspacing="0" style="width: 579px">
                        <tr>
                            <td style="font-size: 9pt; width: 500px; height: 16px; text-align: right">
                                <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                                【
                                <asp:Label ID="labPage" runat="server" Font-Bold="True" Text="1" Width="1px"></asp:Label>
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
</asp:Content>

