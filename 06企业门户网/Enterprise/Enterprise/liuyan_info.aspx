<%@ Page Language="C#" AutoEventWireup="true" CodeFile="liuyan_info.aspx.cs" Inherits="liuyan_info" %>

<%@ Register Src="control/foot.ascx" TagName="foot" TagPrefix="uc1" %>
<%@ Register Src="control/Left.ascx" TagName="Left" TagPrefix="uc2" %>
<%@ Register Src="control/header.ascx" TagName="header" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>
        <div>
            <table border="1" style="width: 776px">
                <tr>
                    <td colspan="2" style="height: 275px">
                        <uc3:header ID="Header1" runat="server" />
                    </td>
                </tr>
                <tr style="font-size: 12pt">
                    <td align="left" rowspan="1" style="width: 12px" valign="top">
                        <div style="text-align: center">
                            <uc2:Left ID="Left1" runat="server" />
                            &nbsp;
                        </div>
                    </td>
                    <td rowspan="1" style="width: 96px; height: 372px" valign="top">
                        <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; width: 529px;
                            height: 241px">
                            <tr>
                                <td align="center" colspan="3" style="height: 24px; text-align: center">
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3" style="height: 305px; text-align: center">
                                    <div style="text-align: center">
                                        <table style="width: 98%; height: 334px">
                                            <tr>
                                                <td colspan="3" style="height: 2px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <table style="background-image: url(image/LeaveWordB.jpg); width: 90%; height: 394px" border="1">
                                                        <tr>
                                                            <td colspan="2" style="background-image: url(~/image/留言本1.jpg); height: 79px">
                                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/image/留言本1.jpg" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="height: 41px; text-align: center">
                                                                <span style="font-size: 9pt">= 查看留言详细信息 = </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 253px; height: 26px; text-align: center">
                                                                <span style="font-size: 9pt">留言主题</span></td>
                                                            <td style="width: 109px; height: 26px; text-align: center">
                                                                <asp:Label ID="LblTitle" runat="server" Font-Size="9pt" Width="162px"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 253px; height: 24px; text-align: center">
                                                                <span style="font-size: 9pt">&nbsp;留言时间</span></td>
                                                            <td style="width: 109px; height: 24px; text-align: center">
                                                                <asp:Label ID="LblTime" runat="server" Font-Size="9pt" onClick="Fcalendar(this)"
                                                                    Width="166px"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 253px; height: 28px; text-align: center">
                                                                <span style="font-size: 9pt">&nbsp;留言人</span></td>
                                                            <td style="width: 109px; height: 28px; text-align: center">
                                                                <asp:Label ID="LblPerson" runat="server" Font-Size="9pt" Width="164px"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 253px; height: 43px; text-align: center">
                                                                <span style="font-size: 9pt">&nbsp; 留言内容</span></td>
                                                            <td style="width: 109px; height: 43px; text-align: left">
                                                                <asp:TextBox ID="TxtContent" runat="server" Height="56px" TextMode="MultiLine" Width="161px"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 253px; height: 51px; text-align: center">
                                                                <span style="font-size: 9pt">&nbsp; 回复留言</span></td>
                                                            <td style="width: 109px; height: 51px; text-align: center">
                                                                <asp:TextBox ID="TxtReply" runat="server" Font-Size="9pt" Height="63px" TextMode="MultiLine"
                                                                    Width="159px"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="height: 40px">
                                                                &nbsp;<asp:LinkButton ID="LinBtnReturn" runat="server" Font-Size="9pt" OnClick="LinBtnReturn_Click">返  回</asp:LinkButton></td>
                                                        </tr>
                                                    </table>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" rowspan="2">
                                                    &nbsp; &nbsp; &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
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
                        <uc1:foot ID="Foot1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
