<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegPro.aspx.cs" Inherits="Module_Admin_Register" %>

<%@ Register Src="../control/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="../control/foot.ascx" TagName="foot" TagPrefix="uc2" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>注册协议</title>
            <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px; vertical-align: top; text-align: center;">
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="width: 755px; background-image: url(../image/background.jpg);" border="1">
            <tr>
                <td colspan="3" style="vertical-align: bottom; height: 6px">
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3" style="background-image: url(../../Images/Skin/bbgg.jpg); vertical-align: middle;
                    height: 450px; text-align: center">
                    <table style="width: 224px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 368px; height: 21px; text-align: center">
                                <strong><span style="color: #3399cc">用户注册协议</span></strong></td>
                        </tr>
                        <tr>
                            <td rowspan="2" style="width: 368px; height: 302px;">
                                <table align="center" style="border-right: black thin solid; border-top: black thin solid;
                                    border-left: black thin solid; width: 369px; border-bottom: black thin solid">
                                    <tr>
                                        <td colspan="4" rowspan="4" style="height: 15px; text-align: left;">
                                            <span style="font-size: 9pt">
                                            为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：
                                            <br />
                                            <br />
                                                一、不得利用本网站做违法的问题，要注意以下几点：
                                            <br />
                                                （一）不得利用本网站进行商业广告宣传；
                                            <br />
                                                （二）要爱护网上良好风气；
                                            <br />
                                                （三）要多发表热情洋溢的文章；
                                            <br />
                                                （四）要多爱自己；
                                            <br />
                                                （五）要对自己和别人信心；
                                            <br />
                                                （六）不要在自己博客中发表伤害人的话；
                                            <br />
                                                （七）在自己博客中多多写自己的心得；
                                            <br />
                                                （八）把本网站发给你的朋友、家人等，让他们也拥有自己的博客空间；
                                            <br />
                                                （九）多摘写些有意义的文章发表出来；
                                            <br />
                                                （十）最重要的是爱自己。
                                            <br />
                                            二、互相尊重，对自己的言论和行为负责。 </span>
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td colspan="4" rowspan="1" style="height: 8px; text-align: center">
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="同意以上条款" Font-Size="9pt" CausesValidation="False" />&nbsp;
                                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="不同意" Font-Size="9pt" CausesValidation="False" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 78px">
                    <uc2:foot ID="Foot1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
