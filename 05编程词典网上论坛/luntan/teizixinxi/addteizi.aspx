<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addteizi.aspx.cs" Inherits="addteizi" %>

<%@ Register Src="../UserControl/foot.ascx" TagName="foot" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编程词典网上论坛</title>
</head>
<body background="image/background.gif">
    <form id="form1" runat="server">
        <div style="text-align: center">
            <table border="1" style="width: 734px">
                <tr>
                    <td style="width: 95px; height: 145px">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/image/index_02.gif" /></td>
                </tr>
                <tr>
                    <td style="width: 95px">
                        <table border="0" style="width: 82%">
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="Label7" runat="server" Font-Size="9pt" ForeColor="#C04000" Text="欢迎光临编程词典网上论坛 ！"
                                        Width="160px"></asp:Label></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="9pt" ForeColor="Blue"
                                         Width="80px" CausesValidation="False">用户信息管理</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image7" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        OnClick="LinkButton3_Click" Width="100px" CausesValidation="False">修改当前用户信息</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image3" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" 
                                        Width="80px" CausesValidation="False" OnClick="LinkButton5_Click">用户信息查询 </asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image4" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 177px">
                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                         Width="55px" CausesValidation="False" OnClick="LinkButton4_Click">用户登录</asp:LinkButton></td>
                                <td style="width: 177px">
                                    <asp:Image ID="Image5" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="lbtnsy" runat="server" CausesValidation="False" Font-Size="Small"
                                        OnClick="lbtnsy_Click" Width="60px">返回首页</asp:LinkButton></td>
                                <td style="width: 806064px">
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" CausesValidation="False" OnClick="ImageButton2_Click"
                                         /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="font-family: Times New Roman">
                    <td align="center" style="width: 95px">
                        <table style="width: 704px; height: 178px">
                            <tr>
                                <td style="width: 107px; height: 16px">
                                </td>
                                <td colspan="2" style="height: 16px">
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                </td>
                                <td align="center" style="width: 81px; height: 16px">
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 107px; height: 4px">
                                </td>
                                <td align="center" colspan="2" rowspan="5">
                        <table style="width: 500px" align="center" border="1">
            <tr>
                <td align="center" colspan="2" bgcolor="#99ccff">
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="发表新帖子" Font-Bold="True" ForeColor="White"></asp:Label></td>
            </tr>
            <tr style="font-size: 12pt; color: #000000">
                <td align="left" bgcolor="#99ccff" style="width: 36px; height: 21px">
                    <asp:Label ID="lblname" runat="server" Font-Size="Small" Text="用户名：" Width="56px"></asp:Label></td>
                <td style="width: 100px; height: 21px">
                    &nbsp;&nbsp;
                    <asp:Label ID="lblyhm" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td align="center" bgcolor="#99ccff" style="width: 36px">
                    <asp:Label ID="lbltitle" runat="server" Font-Size="Small" Text="标　题：" Width="55px"></asp:Label></td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtbt" runat="server" Width="170px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvbt" runat="server" ControlToValidate="txtbt" Display="Dynamic"
                        ErrorMessage="标题不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" bgcolor="#99ccff" style="width: 36px; height: 80px">
                    <asp:Label ID="lblnr" runat="server" Font-Size="Small" Text="具体内容：" Width="68px"></asp:Label></td>
                <td align="left" style="width: 100px; height: 80px">
                    <asp:TextBox ID="txtnr" runat="server" Height="77px" TextMode="MultiLine" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnr"
                        Display="Dynamic" ErrorMessage="内容不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" bgcolor="#99ccff" style="width: 36px; height: 22px">
                </td>
                <td align="center" style="width: 100px; height: 22px">
                    &nbsp; &nbsp;
                    <div style="text-align: center">
                        <table>
                            <tr>
                                <td style="width: 296px">
                    <asp:Button ID="Button2" runat="server" Text="保存" OnClick="Button2_Click" /></td>
                                <td style="width: 238px">
                    <asp:Button ID="Button1" runat="server" Text="重写" CausesValidation="False" /></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#99ccff" colspan="2" style="height: 23px">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Small" ForeColor="Blue"
                        OnClick="LinkButton1_Click" CausesValidation="False">返回首页</asp:LinkButton></td>
            </tr>
        </table>
                                    &nbsp;</td>
                                <td style="font-size: 12pt; width: 81px; font-family: Times New Roman; height: 4px">
                                    &nbsp;</td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td align="right" style="width: 107px">
                                </td>
                                <td style="width: 81px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td align="center" style="width: 107px">
                                </td>
                                <td align="center" style="width: 81px">
                                    &nbsp;</td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td style="width: 107px; height: 30px">
                                </td>
                                <td style="width: 81px; height: 30px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td style="width: 107px">
                                </td>
                                <td style="width: 81px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td colspan="1" style="width: 107px">
                                </td>
                                <td colspan="3">
                                    &nbsp;</td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td colspan="1" style="width: 107px">
                                </td>
                                <td colspan="3">
                                    ------------------------------------------------------</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td style="width: 95px">
                        <uc1:foot ID="Foot2" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
