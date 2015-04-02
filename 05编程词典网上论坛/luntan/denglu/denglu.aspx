<%@ Page Language="C#" AutoEventWireup="true" CodeFile="denglu.aspx.cs" Inherits="denglu" %>

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
            <div style="text-align: center">
                <table style="width: 714px" border="1">
                    <tr>
                        <td style="width: 96px">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/image/index_02.gif" Width="863px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 96px; height: 11px">
                            <table border="0" style="width: 82%">
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="Label7" runat="server" Font-Size="9pt" ForeColor="#C04000" Text="欢迎光临编程词典网上论坛 ！"
                                            Width="170px"></asp:Label></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                             Width="80px" CausesValidation="False" OnClick="LinkButton4_Click">用户信息管理</asp:LinkButton></td>
                                    <td style="width: 100px">
                                        <asp:Image ID="Image7" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                            Width="12px" /></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" ForeColor="Blue"
                                             Width="120px" CausesValidation="False" OnClick="LinkButton5_Click">修改当前用户信息</asp:LinkButton></td>
                                    <td style="width: 100px">
                                        <asp:Image ID="Image3" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                            Width="12px" /></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="LinkButton6" runat="server" Font-Size="9pt" Width="100px" CausesValidation="False" OnClick="LinkButton6_Click">用户信息查询 </asp:LinkButton></td>
                                    <td style="width: 100px">
                                        <asp:Image ID="Image4" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                            Width="12px" /></td>
                                    <td style="width: 177px">
                                        <asp:LinkButton ID="LinkButton7" runat="server" Font-Size="9pt" ForeColor="Blue"
                                            Width="80px" CausesValidation="False" OnClick="LinkButton7_Click">用户登录</asp:LinkButton></td>
                                    <td style="width: 177px">
                                        <asp:Image ID="Image5" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                            Width="12px" /></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" OnClick="lbtnsy_Click"
                                            Width="80px" CausesValidation="False">返回首页</asp:LinkButton></td>
                                    <td style="width: 1322307px">
                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" CausesValidation="False" OnClick="ImageButton2_Click" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 96px; height: 11px">
                            &nbsp;<marquee style="width: 811px; height: 16px"><asp:Label id="Label3" runat="server" Width="818px" Text="**欢迎您访问编程词典网上论坛 ！**" ForeColor="RoyalBlue" Font-Size="9pt" Font-Bold="False"></asp:Label></marquee> </td>
                    </tr>
                    <tr>
                        <td style="width: 96px; height: 331px" align="center" valign="top">
                         
                            <table style="width: 704px; height: 178px">
                                <tr>
                                    <td colspan="1" style="width: 107px; height: 12px">
                                    </td>
                                    <td colspan="3" style="height: 12px">
                                        </td>
                                    <td colspan="1" style="height: 12px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 107px; height: 16px">
                                    </td>
                                    <td style="width: 89px; height: 16px;">
                                    </td>
                                    <td style="width: 101px; height: 16px;">
                                        <asp:Label ID="Label2" runat="server" Font-Names="华文新魏" Font-Size="20pt" ForeColor="Brown"
                                            Text="用户登录" Width="489px" Font-Bold="True"></asp:Label></td>
                                    <td style="width: 100px; height: 16px;" align="center">
                                        </td>
                                    <td align="center" style="width: 100px; height: 16px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 107px; height: 4px">
                                    </td>
                                    <td style="width: 89px; height: 4px;" align="center">
                                        </td>
                                    <td style="width: 101px;" align="center" rowspan="5">
                                        <div style="text-align: center" align="center">
                                            &nbsp;</div>
                                        <div style="text-align: center">
                                            <table border="0" style="width: 493%">
                                                <tr>
                                                    <td align="left" style="width: 81px">
                                                        </td>
                                                    <td style="width: 105px" align="left">
                                                        &nbsp;&nbsp;
                                        <asp:Label ID="Label1" runat="server" Height="20px" Text="用户姓名：" Width="134px" Font-Bold="True" Font-Names="华文新魏" Font-Size="X-Large"></asp:Label></td>
                                                    <td style="width: 100px">
                                        <asp:TextBox ID="txtyhm" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvyhm" runat="server" ControlToValidate="txtyhm"
                                            Display="Dynamic" ErrorMessage="用户名称不能为空" Font-Bold="False" Font-Size="Medium"
                                            Width="156px" Font-Names="华文行楷"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 81px">
                                                    </td>
                                                    <td align="right" style="width: 105px">
                                                    </td>
                                                    <td style="width: 100px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 81px">
                                                    </td>
                                                    <td align="right" style="width: 105px">
                                                        &nbsp;
                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="华文新魏" Font-Size="X-Large"
                                            Text="用户密码：" Width="136px"></asp:Label></td>
                                                    <td style="width: 100px">
                                        <asp:TextBox ID="txtyhmm" runat="server" TextMode="Password" Width="151px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvyhmm" runat="server" ControlToValidate="txtyhmm"
                                            Display="Dynamic" ErrorMessage="用户密码不能为空" Font-Bold="False" Font-Size="Medium"
                                            Width="164px" Font-Names="华文行楷"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 81px">
                                                    </td>
                                                    <td style="width: 105px">
                                                    </td>
                                                    <td style="width: 100px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="1" style="width: 81px">
                                                    </td>
                                                    <td colspan="2">
                                        <asp:Button ID="btnOk" runat="server" Text="确定" OnClick="btnOk_Click" />
                                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                                        <asp:Button ID="btncancel" runat="server" Text="取消" CausesValidation="False" OnClick="btncancel_Click" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="width: 100px; height: 4px; font-size: 12pt; font-family: Times New Roman;">
                                        &nbsp;</td>
                                    <td style="font-size: 12pt; width: 100px; font-family: Times New Roman; height: 4px">
                                    </td>
                                </tr>
                                <tr style="font-size: 12pt; font-family: Times New Roman">
                                    <td align="right" style="width: 107px">
                                    </td>
                                    <td align="right" style="width: 89px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr style="font-size: 12pt; font-family: Times New Roman">
                                    <td align="center" style="width: 107px">
                                    </td>
                                    <td style="width: 89px" align="center">
                                        </td>
                                    <td style="width: 100px" align="center">
                                        &nbsp;</td>
                                    <td align="center" style="width: 100px">
                                    </td>
                                </tr>
                                <tr style="font-size: 12pt; font-family: Times New Roman">
                                    <td style="width: 107px; height: 30px">
                                    </td>
                                    <td style="width: 89px; height: 30px;">
                                    </td>
                                    <td style="width: 100px; height: 30px;">
                                    </td>
                                    <td style="width: 100px; height: 30px">
                                    </td>
                                </tr>
                                <tr style="font-size: 12pt; font-family: Times New Roman">
                                    <td style="width: 107px">
                                    </td>
                                    <td style="width: 89px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 58px" width="100%">
                            <uc1:foot ID="Foot1" runat="server" />
                           
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
