<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLeaveWord_Update.aspx.cs" Inherits="AdminLeaveWord" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 90%; height: 397px; background-color: lightblue;">
            <tr>
                <td colspan="2" style="background-image: url(image/留言本1.jpg); height: 79px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/image/留言本1.jpg" /></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 41px">
                    <span style="font-size: 9pt">回复和修改留言信息</span></td>
            </tr>
            <tr>
                <td style="width: 291px; height: 40px;">
                    <span style="font-size: 9pt">留言主题</span></td>
                <td style="width: 97px; text-align: center; height: 40px;">
                    <asp:TextBox ID="TexTitle" runat="server" Font-Size="9pt" Width="192px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 291px; text-align: center; height: 43px;">
                    <span style="font-size: 9pt">留言时间</span></td>
                <td style="width: 97px; text-align: left; height: 43px;">
                    <asp:TextBox ID="TexTime" runat="server" Font-Size="9pt" Width="192px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TexTime"
                        ErrorMessage="时间格式不正确，应为2008-08-08" Font-Size="9pt" Height="16px" Operator="DataTypeCheck"
                        Type="Date" Width="102px"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td style="width: 291px; text-align: center; height: 25px;">
                    <span style="font-size: 9pt">留言人</span></td>
                <td style="width: 97px; text-align: left; height: 25px;">
                    <asp:TextBox ID="TexPerson" runat="server" Font-Size="9pt" Width="192px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 291px; height: 43px; text-align: center;">
                    <span style="font-size: 9pt">留言内容</span></td>
                <td style="width: 97px; height: 43px; text-align: left;">
                    <asp:TextBox ID="TexContent" runat="server" Font-Size="9pt" Height="67px"
                        Width="192px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 291px; height: 51px; text-align: center;">
                    <span style="font-size: 9pt">回复留言</span></td>
                <td style="width: 97px; height: 51px; text-align: left;">
                    <asp:TextBox ID="TxtReply" runat="server" Font-Size="9pt" Height="63px" TextMode="MultiLine"
                        Width="192px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="回复/修改" Width="71px" OnClick="Button1_Click" SkinID="btnSkin" />
                    <asp:LinkButton ID="LinBtnReturn" runat="server" Font-Size="9pt" OnClick="LinBtnReturn_Click">返  回</asp:LinkButton></td>
            </tr>
        </table>
    </div>
    <br />
    <br />
</asp:Content>

