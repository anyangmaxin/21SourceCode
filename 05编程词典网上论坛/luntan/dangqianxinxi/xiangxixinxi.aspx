<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xiangxixinxi.aspx.cs" Inherits="xiangxixinxi" %>

<%@ Register Src="../UserControl/foot.ascx" TagName="foot" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编程词典网上论坛</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <div>
                    <div style="text-align: center">
                        <table border="1" style="width: 714px">
                            <tr>
                                <td style="width: 90px; height: 182px">
                                    &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/image/index_02.gif" Width="863px" /></td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 90px">
                        <table border="0" style="width: 82%">
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="Label7" runat="server" Font-Size="9pt" ForeColor="#C04000" Text="欢迎光临编程词典网上论坛 ！"
                                        Width="180px"></asp:Label></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="lyhgl" runat="server" Font-Size="9pt" ForeColor="Blue" 
                                        Width="100px" CausesValidation="False">用户信息管理</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image7" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        OnClick="LinkButton3_Click" Width="120px" CausesValidation="False">修改当前用户信息</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image3" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" 
                                        Width="100px" OnClick="LinkButton5_Click" CausesValidation="False">用户信息查询 </asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image4" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 177px">
                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                         Width="80px" OnClick="LinkButton4_Click" CausesValidation="False">用户登陆</asp:LinkButton></td>
                                <td style="width: 177px">
                                    <asp:Image ID="Image5" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 333px">
                                    <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" OnClick="lbtnsy_Click"
                                        Width="80px" CausesValidation="False">返回首页</asp:LinkButton></td>
                                <td style="width: 815121px">
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" CausesValidation="False" OnClick="ImageButton2_Click"
                                         /></td>
                            </tr>
                        </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 90px; height: 17px">
                                    &nbsp;<table style="width: 704px; height: 178px">
                                        <tr>
                                            <td colspan="1" style="width: 107px; height: 16px">
                                            </td>
                                            <td colspan="1" style="height: 16px">
                                            </td>
                                            <td colspan="3" style="height: 16px">
                                                </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 107px; height: 16px">
                                            </td>
                                            <td style="width: 89px; height: 16px">
                                            </td>
                                            <td style="width: 89px; height: 16px">
                                            </td>
                                            <td style="width: 100px; height: 16px">
                                            </td>
                                            <td align="center" style="width: 100px; height: 16px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="width: 107px; height: 4px">
                                            </td>
                                            <td align="center" style="width: 89px; height: 4px">
                                            </td>
                                            <td align="center" style="width: 89px; height: 4px">
                                            </td>
                                            <td align="center" rowspan="5" style="width: 100px">
                                                <table border="1" style="width: 473px; font-family: Times New Roman">
                                                    <tr style="font-size: 12pt; color: #000000">
                                                        <td colspan="2" style="height: 22px">
                                                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="华文新魏" Font-Size="X-Large"
                                                    ForeColor="Brown">当前用户信息详情</asp:Label></td>
                                                    </tr>
                                                    <tr style="font-size: 12pt; color: #000000; font-family: Times New Roman;">
                                                        <td bgcolor="#99ccff" style="width: 133px; height: 22px">
                                                            用户姓名：</td>
                                                        <td style="width: 150px; height: 22px">
                                                            <asp:Label ID="lblywname" runat="server" Text="Label"></asp:Label></td>
                                                    </tr>
                                                    <tr style="font-size: 12pt; font-family: Times New Roman;">
                                                        <td bgcolor="#99ccff" style="width: 133px">
                                                            用户密码：</td>
                                                        <td style="width: 150px">
                                                            &nbsp;<asp:Label ID="lblyhpwd" runat="server" Text="Label"></asp:Label></td>
                                                    </tr>
                                                    <tr style="font-size: 12pt; font-family: Times New Roman;">
                                                        <td bgcolor="#99ccff" style="width: 133px">
                                                            英文姓名：</td>
                                                        <td style="width: 150px">
                                                            &nbsp;<asp:Label ID="lblyhname" runat="server" Text="Label"></asp:Label></td>
                                                    </tr>
                                                    <tr style="font-size: 12pt; font-family: Times New Roman;">
                                                        <td bgcolor="#99ccff" style="width: 133px; height: 22px;">
                                                            电子邮箱：</td>
                                                        <td style="width: 150px; height: 22px;">
                                                            &nbsp;<asp:Label ID="lblyhyx" runat="server" Text="Label"></asp:Label></td>
                                                    </tr>
                                                    <tr style="font-size: 12pt; font-family: Times New Roman;">
                                                        <td bgcolor="#99ccff" style="width: 133px; height: 19px">
                                                            头像：</td>
                                                        <td align="center" style="width: 150px; height: 19px">
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                            <asp:Image ID="imgtouxiang" runat="server" Height="118px" Width="116px" />&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr style="font-size: 12pt; font-family: Times New Roman;">
                                                        <td bgcolor="#99ccff" style="height: 21px" colspan="2">
                                                            &nbsp;
                                                            &nbsp;&nbsp;
                                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Font-Size="Small"
                                                                ForeColor="Blue" OnClick="LinkButton1_Click" >返回首页</asp:LinkButton>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="font-size: 12pt; width: 100px; font-family: Times New Roman; height: 4px">
                                                &nbsp;</td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td align="right" style="width: 107px">
                                            </td>
                                            <td align="right" style="width: 89px">
                                            </td>
                                            <td align="right" style="width: 89px">
                                            </td>
                                            <td style="width: 100px">
                                            </td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td align="center" style="width: 107px">
                                            </td>
                                            <td align="center" style="width: 89px">
                                            </td>
                                            <td align="center" style="width: 89px">
                                            </td>
                                            <td align="center" style="width: 100px">
                                                &nbsp;</td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td style="width: 107px; height: 30px">
                                            </td>
                                            <td style="width: 89px; height: 30px">
                                            </td>
                                            <td style="width: 89px; height: 30px">
                                            </td>
                                            <td style="width: 100px; height: 30px">
                                            </td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td style="width: 107px">
                                            </td>
                                            <td style="width: 89px">
                                            </td>
                                            <td style="width: 89px">
                                            </td>
                                            <td style="width: 100px">
                                            </td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td style="width: 107px">
                                            </td>
                                            <td style="width: 89px">
                                            </td>
                                            <td style="width: 89px">
                                            </td>
                                            <td style="width: 100px">
                                            </td>
                                            <td style="width: 100px">
                                            </td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td colspan="1" style="width: 107px">
                                            </td>
                                            <td colspan="1">
                                            </td>
                                            <td colspan="3">
                                                </td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td style="width: 107px; height: 26px">
                                            </td>
                                            <td style="width: 89px; height: 26px">
                                            </td>
                                            <td style="width: 89px; height: 26px">
                                            </td>
                                            <td style="width: 100px; height: 26px">
                                            </td>
                                            <td style="width: 100px; height: 26px">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td align="center" style="width: 90px; height: 17px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td align="center" style="width: 90px; height: 17px">
                                    <uc1:foot ID="Foot2" runat="server" />
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
