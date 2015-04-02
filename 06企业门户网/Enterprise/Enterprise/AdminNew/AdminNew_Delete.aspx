<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminNew_Delete.aspx.cs" Inherits="AdminNew_Delete" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<br />
    <br />
    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; background-image: url(../image/后台页.jpg);
        width: 529px; height: 334px">
        <tr>
            <td align="left" colspan="3" style="height: 16px; text-align: center">
                新闻信息删除  
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center; height: 304px;">
                <div style="text-align: center">
                    <table style="width: 95%">
                        <tr>
                            <td style="width: 100px">
                                新闻编号：</td>
                            <td style="width: 100px">
                <asp:TextBox ID="TextBox1" runat="server" Width="203px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                新闻标题：</td>
                            <td style="width: 100px">
                <asp:TextBox ID="TextBox2" runat="server" Width="203px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                新闻内容：</td>
                            <td style="width: 100px">
                <asp:TextBox ID="TxtContent" runat="server" Height="92px" TextMode="MultiLine" Width="203px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                发布时间：</td>
                            <td style="width: 100px">
                <asp:TextBox ID="TxtTime" runat="server" Width="203px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                发布人：</td>
                            <td style="width: 100px">
                <asp:TextBox ID="TxtPerson" runat="server" Width="199px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                摘自：</td>
                            <td style="width: 100px">
                <asp:TextBox ID="TxtComeFrom" runat="server" Width="198px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="text-align: center">
                &nbsp;<asp:Button ID="BtnDelete" runat="server" Height="25px" OnClick="Button2_Click"
                    Text="删除" Width="50px" SkinID="btnSkin" />&nbsp;
                <asp:LinkButton ID="LinBtnReturn" runat="server" Font-Size="9pt" OnClick="LinBtnReturn_Click">返 回</asp:LinkButton></td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

