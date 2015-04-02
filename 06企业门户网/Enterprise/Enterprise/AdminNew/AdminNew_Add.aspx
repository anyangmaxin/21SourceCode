<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminNew_Add.aspx.cs" Inherits="AdminNew_Add" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; background-image: url(../image/后台页.jpg);
        width: 527px; height: 216px">
        <tr>
            <td align="center" colspan="3" style="height: 24px; text-align: center">
                添加新闻信息</td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center; height: 292px;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<div
                    style="text-align: center">
                    <table style="width: 98%">
                        <tr>
                            <td style="width: 100px">
                                新闻编号：</td>
                            <td style="width: 100px; text-align: center;">
                <asp:TextBox ID="Txtid" runat="server" Width="234px"></asp:TextBox></td>
                            <td style="width: 100px">
                <asp:Button ID="BtnCheck" runat="server" OnClick="BtnCheck_Click" Text="审核编号" SkinID="btnSkin" CausesValidation="False" /></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                新闻标题：</td>
                            <td style="width: 100px; text-align: center;">
                <asp:TextBox ID="TxtTitle" runat="server" Width="234px"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                新闻内容：</td>
                            <td style="width: 100px; text-align: center;">
                <asp:TextBox ID="TxtContent" runat="server" Height="92px" TextMode="MultiLine" Width="234px"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                发布时间：</td>
                            <td style="width: 100px; text-align: left;">
                <asp:TextBox ID="TxtTime" runat="server" Width="234px"　></asp:TextBox></td>
                            <td style="width: 100px">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtTime"
                                    ErrorMessage="时间格式不正确，应为2008-08-08" Height="16px" Operator="DataTypeCheck" Type="Date"
                                    Width="102px"></asp:CompareValidator>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 100px; height: 17px">
                                发布人：</td>
                            <td style="width: 100px; height: 17px; text-align: center;">
                <asp:TextBox ID="TxtPerson" runat="server" Width="234px"></asp:TextBox></td>
                            <td style="width: 100px; height: 17px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                摘自：</td>
                            <td style="width: 100px; text-align: center;">
                <asp:TextBox ID="TxtComeFrom" runat="server" Width="234px"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 31px">
                                <asp:Button ID="BtnAdd" runat="server" Height="25px" OnClick="BtnAdd_Click"
                    Text="添加" Width="80px" SkinID="btnSkin" /></td>
                        </tr>
                    </table>
                </div>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

