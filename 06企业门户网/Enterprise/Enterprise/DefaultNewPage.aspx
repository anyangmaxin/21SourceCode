<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultNewPage.aspx.cs" Inherits="DefaultNewPage" %>

<%@ Register Src="control/New.ascx" TagName="New" TagPrefix="uc4" %>

<%@ Register Src="control/MarqueeImage.ascx" TagName="MarqueeImage" TagPrefix="uc3" %>





<%@ Register Src="control/Left.ascx" TagName="Left" TagPrefix="uc2" %>

<%@ Register Src="control/header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>
</head>
<body style="background-image: url(image/bg.jpg)">
    <form id="form1" runat="server">
    <div>
        <div>
            <div style="text-align: center">
                <table style="width: 776px; background-image: url(image/bg4.jpg);">
                    <tr>
                        <td colspan="2" style="height: 200px">
                            <uc1:header ID="Header1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" rowspan="3" style="width: 12px" valign="top">
                            <div style="text-align: center">
                                                              </div>
                            <uc2:Left ID="Left1" runat="server" />
                        </td>
                        <td rowspan="2" style="width: 100px; height: 123px;" valign="top">
                            <div style="text-align: center">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 100px; height: 5px" valign="top">
                                            <uc4:New ID="New1" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 100px">
                                            <asp:Image ID="Image5" runat="server" ImageUrl="~/image/yulan.gif" /></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 100%">
                                            <marquee onmouseout="this.start()" onmouseover="this.stop()"><asp:DataList id="DataList1" __designer:dtid="14355223812243456" runat="server" Width="426px" Height="70px" RepeatColumns="100" RepeatDirection="Horizontal" __designer:wfdid="w31">
    <ItemTemplate __designer:dtid="14355223812243457">
        &nbsp;<table __designer:dtid="14355223812243458" style="border-right: thin solid; border-top: thin solid; font-size: 12px;
            border-left: thin solid; width: 229px; border-bottom: thin solid; height: 207px">
            <tr __designer:dtid="14355223812243459">
                <td __designer:dtid="14355223812243460" style="border-right: #99cccc thin solid; border-top: #99cccc thin solid; border-left: #99cccc thin solid;
                    width: 104px; border-bottom: #99cccc thin solid; height: 12px">
                    <asp:Label __designer:dtid="14355223812243461" ID="lblName" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Black"
                        Text='<%# Eval("name") %>' Width="312px"></asp:Label></td>
            </tr>
            <tr __designer:dtid="14355223812243462">
                <td __designer:dtid="14355223812243463" style="border-right: #99cccc thin solid; border-top: #99cccc thin solid; border-left: #99cccc thin solid;
                    width: 104px; border-bottom: #99cccc thin solid; height: 11px" valign="top">
                    <table __designer:dtid="14355223812243464" style="width: 189px; height: 191px;">
                        <tr __designer:dtid="14355223812243465">
                            <td __designer:dtid="14355223812243466" style="width: 100px; height: 111px" valign="top">
                    <asp:Image __designer:dtid="14355223812243467" ID="Image1" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"Image") %>' runat="server" Width="214px" Height="152px"  /></td>
                            <td __designer:dtid="14355223812243468" align="center" style="width: 292px;
                                height: 111px; border-right: #99cccc thin solid; border-top: #99cccc thin solid; border-left: #99cccc thin solid; border-bottom: #99cccc thin solid;" valign="top">
                                <table __designer:dtid="14355223812243469">
                                    <tr __designer:dtid="14355223812243470">
                                        <td __designer:dtid="14355223812243471" style="width: 100px">
                                            <asp:Label __designer:dtid="14355223812243472" ID="lblPri" runat="server" Font-Size="10pt" ForeColor="Red" Text="价格："></asp:Label>
                                            &nbsp;
                                            <asp:Label __designer:dtid="14355223812243473" ID="lblPrice" runat="server" Font-Size="9pt" Text='<%# Eval("Price") %>'></asp:Label></td>
                                    </tr>
                                    <tr __designer:dtid="14355223812243474">
                                        <td __designer:dtid="14355223812243475" align="left" style="width: 100px; height: 21px">
                                            <asp:Label __designer:dtid="14355223812243476" ID="LblState" runat="server" Font-Size="9pt" Text="类别："></asp:Label>&nbsp;
                                            <asp:Label __designer:dtid="14355223812243477" ID="lblZt" runat="server" Font-Size="9pt" Text='<%# Eval("LeiBie") %>'
                                                Width="47px"></asp:Label></td>
                                    </tr>
                                    <tr __designer:dtid="14355223812243478">
                                        <td __designer:dtid="14355223812243479" style="width: 100px">
                                            <asp:Label __designer:dtid="14355223812243480" ID="lblXb" runat="server" Font-Size="9pt" ForeColor="Red" Text="类型："></asp:Label>
                                            &nbsp;
                                            <asp:Label __designer:dtid="14355223812243481" ID="lblType" runat="server" Font-Size="9pt" Text='<%# Eval("type") %>'
                                                Width="42px"></asp:Label></td>
                                    </tr>
                                    <tr __designer:dtid="14355223812243482">
                                        <td __designer:dtid="14355223812243483" style="width: 100px; height: 51px;">
                                            &nbsp;&nbsp;
                                            <div __designer:dtid="14355223812243484" style="text-align: center">
                                                <table __designer:dtid="14355223812243485" style="width: 100%">
                                                    <tr __designer:dtid="14355223812243486">
                                                        <td __designer:dtid="14355223812243487" style="width: 100px">
                                            <asp:Label __designer:dtid="14355223812243488" ID="lblPoint" runat="server" Font-Size="9pt" Text="下载次数：" Width="60px"></asp:Label></td>
                                                        <td __designer:dtid="14355223812243489" style="width: 100px">
                                            <asp:Label __designer:dtid="14355223812243490" ID="lblZw" runat="server" Font-Size="9pt" Text='<%# Eval("point") %>'
                                                Width="44px"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr __designer:dtid="14355223812243491">
                                        <td __designer:dtid="14355223812243492" align="center" style="width: 100px">
                                            </td>
                                    </tr>
                                </table>
                                <a __designer:dtid="14355223812243493" href='list_softdownload.aspx?ID=<%#Eval("id") %>' __designer:servercode=" href ">查看</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList></marquee>
                                           
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td style="width: 100px; height: 46px" valign="top">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 96px; height: 23px; text-align: center;">
                                        <span style="font-size: 14pt">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/Xiangxi.gif" /></span></td>
                                </tr>
                                <tr>
                                    <td style="width: 96px; height: 1047%; valign: top">
                                        <table cellpadding="0" cellspacing="0" style="background-image: url(images/背景4.JPG);
                                            width: 400px">
                                            <tr>
                                                <td align="left" style="vertical-align: middle; width: 415px; height: 50px; text-align: center">
                                                    <asp:Label ID="LblTitle" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="SteelBlue"
                                                        Width="335px"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="vertical-align: top; width: 400px; height: 237px; text-align: left">
                                                    <asp:Label ID="lblContent" runat="server" Font-Size="9pt" ForeColor="SteelBlue" Height="322px"
                                                        Width="526px" Font-Bold="True"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 96px; height: 11px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 21px">
                            <asp:Image ID="Image7" runat="server" ImageUrl="~/image/foot.GIF" /></td>
                    </tr>
                </table>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
