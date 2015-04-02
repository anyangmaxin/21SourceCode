<%@ Page Language="C#" AutoEventWireup="true" CodeFile="New_info.aspx.cs" Inherits="New_info" %>

<%@ Register Src="control/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="control/foot.ascx" TagName="foot" TagPrefix="uc2" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>新闻详细信息</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <div style="text-align: center">
                <table border="1" style="width: 776px">
                    <tr>
                        <td colspan="2" style="height: 151px; width: 793px;">
                            &nbsp;
                            <uc1:header ID="Header1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" rowspan="3" style="height: 131px; width: 793px;" valign="top">
                            <div style="text-align: center">
                                <div style="text-align: center">
                                    <table style="background-image: url(image/后台页.jpg); width: 67%; height: 254px">
                                        <tr>
                                            <td colspan="2" style="height: 33px; text-align: center">
                                                <span style="font-size: 9pt">=&nbsp;新闻详细信息 =</span></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 123px; height: 25px; text-align: center;">
                                                <span style="font-size: 9pt">新闻编号：</span></td>
                                            <td align="left" style="font-size: 12pt; width: 173px; height: 25px">
                                                &nbsp;<asp:Label ID="lblid" runat="server" BackColor="White" Font-Size="9pt" Height="21px"
                                                    Width="313px"></asp:Label></td>
                                        </tr>
                                        <tr style="font-size: 12pt">
                                            <td style="width: 123px; height: 32px; text-align: center;">
                                                <span style="font-size: 9pt">新闻标题：</span></td>
                                            <td align="left" style="width: 173px; height: 32px">
                                                <asp:Label ID="lblTitle" runat="server" BackColor="White" Font-Size="9pt" Height="59px"
                                                    Text="Label" Width="319px"></asp:Label></td>
                                        </tr>
                                        <tr style="font-size: 12pt">
                                            <td style="width: 123px; text-align: center;">
                                                <span style="font-size: 9pt">新闻内容：</span></td>
                                            <td style="width: 173px; text-align: left">
                                                <asp:TextBox ID="TxtContent" runat="server" Height="78px" TextMode="MultiLine" Width="311px"></asp:TextBox>&nbsp;</td>
                                        </tr>
                                        <tr style="font-size: 12pt">
                                            <td style="width: 123px; height: 22px; text-align: center;">
                                                <span style="font-size: 9pt">发布时间：</span></td>
                                            <td style="width: 173px; height: 22px; text-align: left">
                                                <asp:Label ID="lblAddTime" runat="server" BackColor="White" Font-Size="9pt" Height="23px"
                                                    Width="319px"></asp:Label></td>
                                        </tr>
                                        <tr style="font-size: 12pt">
                                            <td style="width: 123px; height: 22px; text-align: center;">
                                                <span style="font-size: 9pt">发布人：</span></td>
                                            <td style="width: 173px; height: 22px; text-align: left">
                                                <asp:Label ID="lblPerson" runat="server" BackColor="White" Font-Size="9pt" Height="22px"
                                                    Width="319px"></asp:Label></td>
                                        </tr>
                                        <tr style="font-size: 12pt">
                                            <td style="width: 123px; height: 22px; text-align: center;">
                                                <span style="font-size: 9pt">摘 自：</span></td>
                                            <td style="width: 173px; height: 22px; text-align: left">
                                                <asp:Label ID="lblComeFrom" runat="server" BackColor="White" Font-Size="9pt" Height="23px"
                                                    Width="319px"></asp:Label></td>
                                        </tr>
                                        <tr style="font-size: 12pt">
                                            <td colspan="2" style="height: 31px">
                                                <asp:LinkButton ID="LinBtnreturn" runat="server" Font-Size="9pt" OnClick="LinBtnreturn_Click"
                                                    Width="56px">返　 回</asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                    </tr>
                    <tr style="font-size: 12pt">
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="2" style="height: 21px; width: 793px;">
                            &nbsp;
                            <uc2:foot ID="Foot1" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
