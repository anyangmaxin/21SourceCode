<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLeaveWord_Delete.aspx.cs" Inherits="AdminLeaveWord_Delete" Title="Untitled Page" StylesheetTheme="mRSOFTASPNET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt;
        background-image: url(../image/后台页.jpg); width: 529px; height: 334px">
        <tr>
            <td align="center" colspan="3" style="height: 24px; text-align: center">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="height: 46px; text-align: center">
                删除留言信息</td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<div style="text-align: center">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 120px; text-align: right">
                                留言主题：</td>
                            <td style="width: 100px">
                <asp:Label ID="LblTitle" runat="server" Font-Size="9pt" Width="206px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 120px; text-align: right">
                                &nbsp;留言时间：</td>
                            <td style="width: 100px">
                <asp:Label ID="LblTime" runat="server" Font-Size="9pt" Width="206px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 120px; text-align: right; height: 18px;">
                                &nbsp;留言人：</td>
                            <td style="width: 100px; height: 18px;">
                <asp:Label ID="LblPerson" runat="server" Font-Size="9pt" Width="206px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 120px; height: 17px; text-align: right">
                                &nbsp; 留言内容：</td>
                            <td style="width: 100px; height: 17px">
                <asp:Label ID="LblContent" runat="server" Font-Size="9pt" Height="67px" Width="206px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 120px; text-align: right">
                                回复留言：</td>
                            <td style="width: 100px">
                <asp:TextBox ID="TxtReply" runat="server" Font-Size="9pt" Height="63px" ReadOnly="True"
                    TextMode="MultiLine" Width="206px"></asp:TextBox></td>
                        </tr>
                    </table>
                </div>
                &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="删　除" Width="52px" SkinID="btnSkin" />
                &nbsp; &nbsp; <asp:LinkButton ID="LinBtnReturn" runat="server" Font-Size="9pt" OnClick="LinBtnReturn_Click">返　回</asp:LinkButton>
                &nbsp; &nbsp;</td>
        </tr>
    </table>
</asp:Content>

