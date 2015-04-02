<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminGongGao_Add.aspx.cs" Inherits="AdminGongGao_Add" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    &nbsp;<table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt;
        background-image: url(../image/后台页.jpg); width: 529px; height: 334px">
        <tr>
            <td align="center" colspan="3" style="height: 24px; text-align: center">
                添加公告</td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center; height: 273px;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div style="text-align: center">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 136px; height: 26px; text-align: right;">
                                公告编号：</td>
                            <td style="width: 105px; height: 26px; text-align: center;">
                <asp:TextBox ID="Txtid" runat="server" Width="201px"></asp:TextBox></td>
                            <td style="width: 100px; height: 26px; text-align: left;">
                <asp:Button ID="BtnCheck" runat="server" Text="审核编号" OnClick="BtnCheck_Click" SkinID="btnSkin" 
                                    Width="79px" Height="29px" /></td>
                        </tr>
                        <tr>
                            <td style="width: 136px; text-align: right; height: 26px;">
                                公告标题：</td>
                            <td style="width: 105px; text-align: center; height: 26px;">
                <asp:TextBox ID="TextBox1" runat="server" Width="201px"></asp:TextBox></td>
                            <td style="width: 100px; height: 26px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 136px; text-align: right;">
                                公告内容：</td>
                            <td style="width: 105px; text-align: center;">
                <asp:TextBox ID="TextBox2" runat="server" Height="92px" TextMode="MultiLine" Width="201px"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 136px; text-align: right;">
                                </td>
                            <td style="width: 105px; text-align: center;">
                </td>
                            <td style="width: 100px">
                                </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 27px">
                <asp:Button ID="Button2" runat="server" Height="22px"  Text="添加"
                    Width="64px" OnClick="Button2_Click" SkinID="btnSkin" />
                            </td>
                        </tr>
                    </table>
                </div>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
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

