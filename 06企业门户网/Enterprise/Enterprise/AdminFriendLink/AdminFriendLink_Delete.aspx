<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminFriendLink_Delete.aspx.cs" Inherits="AdminFriendLink_Delete" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" style="background-image: url(../image/后台页.jpg);
        width: 534px; height: 340px">
        <tr>
            <td colspan="1" style="width: 100px">
            </td>
            <td colspan="4" style="width: 411px; text-align: center">
            </td>
            <td colspan="1" style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="1" style="width: 100px; height: 7px; text-align: left">
            </td>
            <td align="center" colspan="4" style="width: 411px; height: 7px; text-align: center">
                <span style="font-size: 9pt">删除友情链接&nbsp;</span></td>
            <td colspan="1" style="width: 100px; height: 7px; text-align: left">
            </td>
        </tr>
        <tr>
            <td align="left" colspan="1" style="width: 100px; text-align: center; height: 214px;">
            </td>
            <td align="left" colspan="4" style="width: 411px; text-align: center; height: 214px;" valign="top">
                <table>
                    <tr>
                        <td style="width: 57px; height: 37px">
                        </td>
                        <td style="width: 82px; height: 37px">
                            <span style="font-size: 9pt">链接编号</span></td>
                        <td colspan="2" style="font-size: 12pt; height: 37px">
                            <asp:TextBox ID="TxtId" runat="server" ReadOnly="True" Width="166px"></asp:TextBox></td>
                        <td colspan="1" style="font-size: 12pt; height: 37px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 57px; height: 30px">
                        </td>
                        <td style="width: 82px; height: 30px">
                            <span style="font-size: 9pt">上传时间</span></td>
                        <td colspan="2" style="font-size: 12pt; height: 30px">
                            <asp:TextBox ID="TxtTime" runat="server"  ReadOnly="True"
                                Width="166px"></asp:TextBox></td>
                        <td colspan="1" style="font-size: 12pt; height: 30px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 57px; height: 33px">
                        </td>
                        <td style="width: 82px; height: 33px">
                            <span style="font-size: 9pt">链接地址</span></td>
                        <td colspan="2" style="height: 33px">
                            <asp:TextBox ID="txtAddress" runat="server" Font-Size="9pt" ReadOnly="True" Width="166px"></asp:TextBox></td>
                        <td colspan="1" style="height: 33px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 57px; height: 55px">
                        </td>
                        <td style="width: 82px; height: 55px">
                            <span style="font-size: 9pt">链接图片</span></td>
                        <td colspan="2" style="height: 55px">
                            <asp:Image ID="imgPhoto" runat="server" Height="68px" Width="175px" /></td>
                        <td colspan="1" style="height: 55px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 57px; height: 49px;">
                        </td>
                        <td style="width: 82px; height: 49px;">
                        </td>
                        <td align="right" style="width: 78px; height: 49px;">
                            <asp:Button ID="btnDelete" runat="server" Font-Size="9pt" OnClick="btnupdate_Click"
                                Text="删除" />
                        </td>
                        <td align="left" style="width: 45px; height: 49px;">
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" Font-Size="9pt"
                                OnClick="Button1_Click" Text="返回" />
                        </td>
                        <td align="left" style="width: 80px; height: 49px;">
                        </td>
                    </tr>
                </table>
                &nbsp;&nbsp;
            </td>
            <td align="left" colspan="1" style="width: 100px; text-align: center; height: 214px;">
            </td>
        </tr>
    </table>
</asp:Content>

