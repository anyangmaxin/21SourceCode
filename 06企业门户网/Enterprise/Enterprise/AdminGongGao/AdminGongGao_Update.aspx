<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminGongGao_Update.aspx.cs" Inherits="AdminOpration_AdminGongGao_Update" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET"　%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <br />
    <div style="text-align: center">
        <table style="width: 90%; background-color: gainsboro; background-image: url(../image/后台页.jpg); height: 339px;">
            <tr>
                <td colspan="3" style="height: 33px">
                    <span style="font-size: 9pt">公告详细信息修改</span></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 26px">
                    <span style="font-size: 9pt">公告编号：</span></td>
                <td style="width: 116px; height: 26px; text-align: center;">
                                    <asp:TextBox ID="Txtid" runat="server" Width="201px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 26px" align="left">
                    <asp:Button ID="BtnCheck" runat="server" Text="审核编号" OnClick="BtnCheck_Click" SkinID="btnSkin" Width="58px" /></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 23px">
                    <span style="font-size: 9pt">公告标题：</span></td>
                <td style="width: 116px; height: 23px; text-align: center;">
                    <asp:TextBox ID="TextBox1" runat="server" Width="203px"></asp:TextBox></td>
                <td style="width: 100px; height: 23px" align="left">
                    </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 47px">
                    <span style="font-size: 9pt">公告内容：</span></td>
                <td style="width: 116px; height: 47px; text-align: center;">
                    <asp:TextBox ID="TextBox2" runat="server" Height="92px" TextMode="MultiLine" Width="203px"></asp:TextBox></td>
                <td style="width: 100px; height: 47px" align="left">
                    </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 26px;">
                    <span style="font-size: 9pt">发布时间：</span></td>
                <td style="width: 116px; height: 26px; text-align: center;">
                    <asp:TextBox ID="TextBox3" runat="server" Width="203px"></asp:TextBox></td>
                <td style="width: 100px; height: 26px;" align="left">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox3"
                        ErrorMessage="时间格式不正确，应为2008-08-08" Font-Size="9pt" Height="16px" Operator="DataTypeCheck"
                        Type="Date" Width="102px"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 16px">
                    &nbsp;<asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="修改"
                        Width="57px" SkinID="btnSkin" />
                    &nbsp;
                    <asp:LinkButton ID="LinBtnReturn" runat="server" Font-Size="9pt" OnClick="LinBtnReturn_Click">返 回</asp:LinkButton></td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

