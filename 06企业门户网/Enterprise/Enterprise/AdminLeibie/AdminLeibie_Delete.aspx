<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLeibie_Delete.aspx.cs" Inherits="AdminLeibie_AdminLeibie_Delete" Title="Untitled Page" StylesheetTheme="mRSOFTASPNET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 97%; height: 338px; background-image: url(../image/后台页.jpg);">
        <tr>
            <td colspan="3" style="height: 33px; text-align: center">
                <span style="font-size: 9pt">&nbsp;&nbsp; 产品类别删除</span></td>
        </tr>
        <tr>
            <td style="width: 154px; height: 8px">
                <span style="font-size: 9pt"></span>
            </td>
            <td style="width: 111px; height: 8px">
                &nbsp;</td>
            <td style="width: 139px; height: 8px">
            </td>
        </tr>
        <tr>
            <td style="width: 154px; height: 53px; text-align: center;">
                <span style="font-size: 9pt">类别名称：</span></td>
            <td align="left" style="font-size: 12pt; width: 111px; height: 53px">
                <asp:TextBox ID="TxtName" runat="server" Height="17px" Width="173px" ReadOnly="True"></asp:TextBox>
            </td>
            <td align="left" style="font-size: 12pt; width: 139px; height: 53px">
                </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 154px; height: 35px">
                <span></span>
            </td>
            <td align="left" style="width: 111px; height: 35px">
            </td>
            <td align="left" style="width: 139px; height: 35px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 154px; height: 32px; text-align: center;">
                <span style="font-size: 9pt">添加时间：</span></td>
            <td style="width: 111px; height: 32px;">
                <asp:TextBox ID="TxtTime" runat="server" Height="17px" 
                    Width="173px" ReadOnly="True"></asp:TextBox>
            </td>
            <td style="width: 139px; height: 32px;">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td align="center" colspan="3" style="height: 24px">
                <asp:Button ID="BtnDelete" runat="server" Height="25px" OnClick="BtnUpdate_Click"
                    Text="删　除" Width="52px" SkinID="btnSkin" />&nbsp;
                <asp:LinkButton ID="LinBtnReturn" runat="server" Font-Size="9pt" Width="44px" OnClick="LinBtnReturn_Click">返 回</asp:LinkButton></td>
        </tr>
        <tr style="font-size: 12pt">
            <td align="center" colspan="3" style="height: 24px">
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

