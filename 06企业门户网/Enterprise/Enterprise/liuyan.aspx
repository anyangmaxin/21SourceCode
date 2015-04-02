<%@ Page Language="C#" AutoEventWireup="true" CodeFile="liuyan.aspx.cs" Inherits="liuyan" StylesheetTheme="MRSOFTASPNET"%>

<%@ Register Src="control/Left.ascx" TagName="Left" TagPrefix="uc1" %>
<%@ Register Src="control/header.ascx" TagName="header" TagPrefix="uc2" %>
<%@ Register Src="control/foot.ascx" TagName="foot" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>

</head>
<body style="text-align: center">
    <form id="form1" runat="server">
                <table border="1" style="width: 776px">
                    <tr>
                        <td colspan="2" style="height: 275px">
                            <uc2:header ID="Header1" runat="server" />
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td align="left" rowspan="1" style="width: 12px" valign="top">
                            <div style="text-align: center">
                                <uc1:Left ID="Left1" runat="server"  />
                                &nbsp;</div>
                        </td>
                        <td rowspan="1" style="width: 96px; height: 470px;" valign="top">
                            <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt;
                                width: 529px; height: 241px">
                                <tr>
                                    <td align="center" colspan="3" style="height: 24px; text-align: center">
                                            </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="3" style="height: 305px; text-align: center">
                                        <div
                                            style="text-align: center">
                                            <table style="width: 98%; background-image: url(image/后台页.jpg); height: 334px;">
                                                <tr>
                                                    <td colspan="3" style="height: 2px">
                                                        = 添加留言信息 =
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px">
                                                        留言主题：</td>
                                                    <td style="width: 100px; text-align: left">
                                                            <asp:TextBox ID="TxtTitle" runat="server" Width="319px"></asp:TextBox></td>
                                                    <td style="width: 100px">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 143px;">
                                                        留言内容：</td>
                                                    <td style="width: 100px; height: 143px;">
                                                            <asp:TextBox ID="TxtContent" runat="server" Height="181px" TextMode="MultiLine" Width="319px"></asp:TextBox></td>
                                                    <td style="width: 100px; height: 143px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px">
                                                        留言时间：</td>
                                                    <td style="width: 100px; text-align: left">
                                                            <asp:TextBox ID="TxtTime" runat="server"  ReadOnly="false" Width="321px"></asp:TextBox></td>
                                                    <td style="width: 100px">
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtTime"
                                                            Display="Dynamic" ErrorMessage="时间格式不对，格式应该为2008-08-08" Font-Size="9pt" Operator="DataTypeCheck"
                                                            Type="Date"></asp:CompareValidator></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px">
                                                        留言人：</td>
                                                    <td style="width: 100px; text-align: left">
                                                            <asp:TextBox ID="TxtPerson" runat="server" Width="319px" ForeColor="Red" ReadOnly="True"></asp:TextBox></td>
                                                    <td style="width: 100px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="height: 31px">
                                                            <asp:Button ID="BtnLiuYan" runat="server" Text="我要留言" OnClick="BtnLiuYan_Click" Width="63px" SkinID="btnSkin" />
                                                        &nbsp; &nbsp;&nbsp;
                                                        <asp:LinkButton ID="linBtnSee" runat="server" OnClick="linBtnSee_Click">查看我的留言</asp:LinkButton></td>
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
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 21px">
                            <uc3:foot ID="Foot1" runat="server" />
                        </td>
                    </tr>
                </table>
    </form>
</body>
</html>
