<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhucexinxi.aspx.cs" Inherits="zhucexinxi" %>

<%@ Register Src="../UserControl/foot.ascx" TagName="foot" TagPrefix="uc1" %>







<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编程词典网上论坛</title>
</head>
<body background="image/background.gif">
    <form id="form1" runat="server">
    <div>
        <div>
            <div>
                <div style="text-align: center">
                    <table border="1" style="width: 714px">
                        <tr>
                            <td style="width: 90px">
                                &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/image/index_02.gif" Width="863px" /></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 90px">
                                <table border="0" style="width: 82%">
                                    <tr>
                                        <td style="width: 100px; height: 25px;">
                                            <asp:Label ID="Label7" runat="server" Font-Size="9pt" Text="欢迎光临编程词典网上论坛 ！" Width="180px" ForeColor="Maroon"></asp:Label></td>
                                        <td style="width: 100px; height: 25px;">
                                            <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="9pt" ForeColor="Blue"
                                                Width="100px" OnClick="LinkButton2_Click">用户信息管理</asp:LinkButton></td>
                                        <td style="width: 100px; height: 25px">
                                            <asp:Image ID="Image7" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                                Width="12px" /></td>
                                        <td style="width: 101px; height: 25px;">
                                            <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="9pt" ForeColor="Blue"
                                                Width="120px" OnClick="LinkButton3_Click">修改当前用户信息</asp:LinkButton></td>
                                        <td style="width: 101px; height: 25px">
                                            <asp:Image ID="Image1" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                                Width="12px" /></td>
                                        <td style="width: 100px; height: 25px;">
                                            <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" Width="100px">用户信息查询 </asp:LinkButton></td>
                                        <td style="width: 100px; height: 25px">
                                            <asp:Image ID="Image3" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                                Width="12px" /></td>
                                        <td style="width: 177px; height: 25px;">
                                            <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                                Width="80px" OnClick="LinkButton4_Click" Height="17px">用户登录</asp:LinkButton></td>
                                        <td style="width: 177px; height: 25px">
                                            <asp:Image ID="Image4" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                                Width="12px" /></td>
                                        <td style="width: 100px; height: 25px;">
                                            <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" OnClick="lbtnsy_Click"
                                                Width="80px">返回首页</asp:LinkButton></td>
                                        <td style="width: 815121px; height: 25px;">
                                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" OnClick="ImageButton2_Click" /></td>
                                    </tr>
                                </table>
                                <table align="center" border="0" cellpadding="0" cellspacing="0" height="27" width="806">
                                    <tr>
                                        <td style="height: 33px" width="28">
                                            <asp:Image ID="Image5" runat="server" ImageUrl="~/image/speaker.gif" />&nbsp;</td>
                                        <td style="width: 211px; height: 33px; text-align: left">
                                            <asp:Label ID="Label2" runat="server" Font-Size="10pt" Text="游客您好,请您先注册后登录！" Width="184px"></asp:Label></td>
                                        <td style="width: 24px; height: 33px; text-align: left">
                                        </td>
                                        <td style="width: 6px; height: 33px; text-align: left">
                                            &nbsp;<asp:Label ID="Label3" runat="server" Font-Size="10pt" Text="服务热线：（0431）8437**7*"
                                                Width="170px"></asp:Label></td>
                                        <td style="width: 23px; height: 33px">
                                        </td>
                                        <td style="height: 33px" width="135">
                                            &nbsp;<asp:Label ID="Label4" runat="server" Font-Size="10pt" Text="Email:tmoonbook@sina.com"
                                                Width="150px"></asp:Label></td>
                                        <td style="width: 38px; height: 33px">
                                            &nbsp;</td>
                                        <td style="height: 33px" width="136">
                                            &nbsp;</td>
                                        <td style="height: 33px" valign="middle" width="72">
                                            &nbsp;<asp:Label ID="Label5" runat="server" Font-Size="10pt" Text="广阔的空间，编程者的天地！"
                                                Width="172px"></asp:Label></td>
                                        <td style="height: 33px" width="64">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 90px; height: 17px" align="right">
                                &nbsp;<table style="width: 704px; height: 178px">
                                    <tr>
                                        <td colspan="1" style="width: 425px; height: 16px">
                                        </td>
                                        <td colspan="3" style="height: 16px">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 425px; height: 16px">
                                        </td>
                                        <td style="width: 89px; height: 16px">
                                        </td>
                                        <td style="width: 100px; height: 16px">
                                        </td>
                                        <td align="center" style="width: 313px; height: 16px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 425px; height: 4px">
                                        </td>
                                        <td align="center" style="width: 89px; height: 4px">
                                        </td>
                                        <td align="center" rowspan="5" style="width: 100px">
                                            <table border="1" style="width: 473px">
                                                <tr>
                                                    <td bgcolor="#99ccff" colspan="2">
                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="华文新魏" Font-Size="X-Large"
                                                            ForeColor="Maroon" Text="用户注册协议"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#99ccff" colspan="2">
                                                        <asp:Label ID="Label13" runat="server" Font-Names="华文行楷" Font-Size="Large" Text="为维护网上公共秩序和社会稳定,请您自觉遵守以下条款："></asp:Label></td>
                                                </tr>
                                                <tr style="font-size: 12pt; color: #000000; font-family: Times New Roman">
                                                    <td bgcolor="#99ccff" colspan="2" style="height: 22px" align="left">
                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="华文新魏" ForeColor="RoyalBlue"
                                                            Text="（一）不得利用本论坛进行商业广告宣传；" Width="325px"></asp:Label></td>
                                                </tr>
                                                <tr style="font-size: 12pt; font-family: Times New Roman">
                                                    <td bgcolor="#99ccff" colspan="2" align="left">
                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="华文新魏" ForeColor="RoyalBlue"
                                                            Text="（二）不得利用本论坛发送非法文章；" Width="360px"></asp:Label></td>
                                                </tr>
                                                <tr style="font-size: 12pt; font-family: Times New Roman">
                                                    <td bgcolor="#99ccff" colspan="2" align="left">
                                                        &nbsp;
                                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="华文新魏" ForeColor="RoyalBlue"
                                                            Text="(三）互相尊重，对自己的言论和行为负责；" Width="81%"></asp:Label></td>
                                                </tr>
                                                <tr style="font-size: 12pt; font-family: Times New Roman">
                                                    <td bgcolor="#99ccff" colspan="2" align="left">
                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="华文新魏" ForeColor="RoyalBlue"
                                                            Text="（四）本论坛版权归XXXX公司，不得对本论坛进行转载或作为私用；" Width="523px"></asp:Label></td>
                                                </tr>
                                                <tr style="font-size: 12pt; font-family: Times New Roman">
                                                    <td bgcolor="#99ccff" colspan="2" style="height: 35px">
                                                        <asp:Button ID="btnty" runat="server" OnClick="btnty_Click" Text="我同意" Height="23px" Width="48px" />
                                                        <asp:Button ID="btnbty" runat="server" OnClick="btnbty_Click" Text="不同意" Height="23px" Width="48px" /></td>
                                                </tr>
                                                <tr style="font-size: 12pt; font-family: Times New Roman">
                                                    <td colspan="2" style="height: 21px">
                                                        &nbsp; &nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="font-size: 12pt; width: 313px; font-family: Times New Roman; height: 4px">
                                            &nbsp;</td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="width: 425px">
                                        </td>
                                        <td align="right" style="width: 89px">
                                        </td>
                                        <td style="width: 313px">
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="center" style="width: 425px">
                                        </td>
                                        <td align="center" style="width: 89px">
                                        </td>
                                        <td align="center" style="width: 313px">
                                            &nbsp;</td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td style="width: 425px; height: 30px">
                                        </td>
                                        <td style="width: 89px; height: 30px">
                                        </td>
                                        <td style="width: 313px; height: 30px">
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td style="width: 425px">
                                        </td>
                                        <td style="width: 89px">
                                        </td>
                                        <td style="width: 313px">
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td colspan="1" style="width: 425px">
                                        </td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td colspan="1" style="width: 425px">
                                        </td>
                                        <td colspan="3">
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="center" style="width: 90px; height: 17px">
                                <uc1:foot ID="Foot1" runat="server" />
                                </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="center" rowspan="6" style="width: 90px">
                                &nbsp;</td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
