<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLeibie_Update.aspx.cs" Inherits="AdminLeibie_AdminLeibie_Update" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <table style="width: 97%; height: 340px; background-image: url(../image/后台页.jpg);">
        <tr>
            <td colspan="3" style="height: 33px; text-align: center">
                <span style="font-size: 9pt">&nbsp;&nbsp; = &nbsp;产品类别修改 =</span></td>
        </tr>
        <tr>
            <td style="width: 157px; height: 10px">
                <span style="font-size: 9pt"></span>
            </td>
            <td style="width: 111px; height: 10px">
                &nbsp;</td>
            <td style="width: 139px; height: 10px">
            </td>
        </tr>
        <tr>
            <td style="width: 157px; height: 17px; text-align: center;">
                <span style="font-size: 9pt">类别名称：</span></td>
            <td align="left" style="font-size: 12pt; width: 111px; height: 17px; text-align: center;">
                <asp:TextBox ID="TxtName" runat="server" Width="173px" Height="18px"></asp:TextBox>
            </td>
            <td align="left" style="font-size: 12pt; width: 139px; height: 17px">
                </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 157px; height: 32px">
                <span></span>
            </td>
            <td align="left" style="width: 111px; height: 32px">
            </td>
            <td align="left" style="width: 139px; height: 32px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 157px; text-align: center;">
                <span style="font-size: 9pt">添加时间：</span></td>
            <td style="width: 111px; text-align: center;">
                <asp:TextBox ID="TxtTime" runat="server"  Width="173px" Height="19px"></asp:TextBox>
            </td>
            <td style="width: 139px">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtTime"
                    Display="Dynamic" ErrorMessage="时间格式不对，格式应该为2008-08-08" Font-Size="9pt" Operator="DataTypeCheck"
                    Type="Date"></asp:CompareValidator></td>
        </tr>
        <tr style="font-size: 12pt">
            <td align="center" colspan="3" style="height: 16px">
                <asp:Button ID="BtnUpdate" runat="server" Height="25px" OnClick="BtnUpdate_Click" Text="修　改"
                    Width="52px" SkinID="btnSkin" />&nbsp;&nbsp;
                <asp:LinkButton ID="LinBtnReturn" runat="server" Font-Size="9pt" OnClick="LinBtnReturn_Click">返　回</asp:LinkButton></td>
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
</asp:Content>

