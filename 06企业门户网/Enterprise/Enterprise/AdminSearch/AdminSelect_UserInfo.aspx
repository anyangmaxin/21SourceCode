<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminSelect_UserInfo.aspx.cs" Inherits="AdminSelect_UserInfo" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 91%; height: 458px; background-color: lightblue;" border="1">
            <tr>
                <td colspan="2" style="height: 36px">
                    <span style="font-size: 9pt">用户详细信息</span></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center; height: 22px;">
                    <span style="font-size: 9pt">编号：</span></td>
                <td style="width: 100px; text-align: center; height: 22px;">
                    <asp:Label ID="LblUserId" runat="server" Width="90px" Font-Size="9pt"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center; height: 22px;">
                    <span style="font-size: 9pt">用户名：</span></td>
                <td style="width: 100px; height: 22px;">
                    <asp:Label ID="lblUserName" runat="server" Font-Size="9pt" Width="90px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center; height: 25px;">
                    <span style="font-size: 9pt">角色：</span></td>
                <td style="width: 100px; height: 25px; text-align: left;" align="left">
                    <asp:Label ID="Lblrole" runat="server" Font-Size="9pt" Width="100px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center; height: 19px;">
                    <span style="font-size: 9pt">性别：</span></td>
                <td style="width: 100px; height: 19px; text-align: center;" align="left">
                    <asp:Label ID="lblSex" runat="server" Font-Size="9pt" Width="100px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center;">
                    <span style="font-size: 9pt">年龄</span>：</td>
                <td style="width: 100px; text-align: center;" align="left">
                    <asp:Label ID="LblAge" runat="server" Font-Size="9pt" Width="100px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center;">
                    <span style="font-size: 9pt">电话：</span></td>
                <td style="width: 100px; text-align: center;" align="left">
                    <asp:Label ID="lblphone" runat="server" Width="100px" Font-Size="9pt"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center;">
                    <span style="font-size: 9pt">&nbsp; &nbsp; 电子邮箱：</span></td>
                <td style="width: 100px; text-align: center;">
                    <asp:Label ID="lblEmail" runat="server" Font-Size="9pt" Width="100px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center;">
                    <span style="font-size: 9pt">&nbsp; &nbsp; &nbsp;&nbsp; QQ：</span></td>
                <td style="width: 100px; text-align: center;">
                    <asp:Label ID="lblQQ" runat="server" Font-Size="9pt" Width="100px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center; height: 18px;">
                    <span style="font-size: 9pt">
                    个人地址：</span></td>
                <td style="width: 100px; height: 18px; text-align: center;">
                    <asp:Label ID="lblAddress" runat="server" Font-Size="9pt" Width="100px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; height: 23px;">
                    <span style="font-size: 9pt">个人主页：</span></td>
                <td style="width: 100px; text-align: center; height: 23px;">
                    <asp:Label ID="lblhomepage" runat="server" Font-Size="9pt" Width="100px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center; height: 23px;">
                    <span style="font-size: 9pt">
                    个人简介：</span></td>
                <td style="width: 100px; height: 23px; text-align: left;">
                    <asp:Label ID="LblIntro" runat="server" Font-Size="9pt" Width="144px" Height="57px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 179px; text-align: center;">
                    <span style="font-size: 9pt">个人头像：</span></td>
                <td style="width: 100px; text-align: center;">
                    <asp:Image ID="Img" runat="server" Height="136px" Width="118px" /></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 30px">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Font-Size="9pt" Width="74px" Height="22px">返回</asp:LinkButton></td>
            </tr>
        </table>
    </div>
</asp:Content>

