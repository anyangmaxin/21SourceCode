<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yonghuadd.aspx.cs" Inherits="yonghuxinxi_yonghuadd" %>

<%@ Register Src="../UserControl/foot.ascx" TagName="foot" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编程词典网上论坛</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
        </div>
        <div style="text-align: center" align="center">
        </div>
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
                        <table border="0" style="width: 60%">
                            <tr>
                                <td style="width: 166px; height: 25px;">
                                    <asp:Label ID="Label8" runat="server" Font-Size="9pt" ForeColor="#C04000" Text="欢迎光临编程词典网上论坛 ！"
                                        Width="170px"></asp:Label></td>
                                <td style="width: 100px; height: 25px;">
                                    <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="9pt" ForeColor="Blue"
                                         Width="100px" CausesValidation="False">用户信息管理</asp:LinkButton></td>
                                <td style="width: 100px; height: 25px">
                                    <asp:Image ID="Image7" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px; height: 25px;">
                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                         Width="120px" CausesValidation="False" OnClick="LinkButton4_Click">修改当前用户信息</asp:LinkButton></td>
                                <td style="width: 100px; height: 25px">
                                    <asp:Image ID="Image3" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px; height: 25px;">
                                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" Width="100px" CausesValidation="False" OnClick="LinkButton5_Click">用户信息查询 </asp:LinkButton></td>
                                <td style="width: 100px; height: 25px">
                                    <asp:Image ID="Image4" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px; height: 25px;">
                                    <asp:LinkButton ID="LinkButton6" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        Width="80px" CausesValidation="False" OnClick="LinkButton6_Click">用户登录</asp:LinkButton></td>
                                <td style="width: 100px; height: 25px">
                                    <asp:Image ID="Image5" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 122px; height: 25px;">
                                    <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="Small" ForeColor="Blue"
                                         Width="80px" CausesValidation="False" OnClick="LinkButton3_Click">返回首页</asp:LinkButton></td>
                                <td style="width: 1871px; height: 25px;">
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" CausesValidation="False" /></td>
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
                                            <td colspan="3" style="height: 16px">
                                                </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 107px; height: 27px">
                                            </td>
                                            <td style="width: 181px; height: 27px">
                                            </td>
                                            <td style="width: 100px; height: 27px" align="center" valign="top">
                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="华文新魏" Font-Size="X-Large"
                                        ForeColor="SandyBrown" Width="415px">用户信息添加</asp:Label></td>
                                            <td align="center" style="width: 100px; height: 27px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="width: 107px; height: 4px">
                                            </td>
                                            <td align="center" style="width: 181px; height: 4px">
                                            </td>
                                            <td align="center" rowspan="5" style="width: 100px">
                       <table border="1" style="width: 473px" align="center">
                            <tr style="font-size: 12pt; color: #000000; font-family: Times New Roman">
                                <td bgcolor="#99ccff" style="width: 121px; height: 22px">
                                    用户姓名：</td>
                                <td style="width: 150px; height: 22px">
                                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rfvname" runat="server" ControlToValidate="txtname"
                                        Display="Dynamic" ErrorMessage="用户姓名不能为空" Font-Size="Small" Width="139px"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td bgcolor="#99ccff" style="width: 121px">
                                    用户密码：</td>
                                <td style="width: 150px">
                                    <asp:TextBox ID="txtpwd" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvpwd" runat="server" ControlToValidate="txtpwd"
                                        Display="Dynamic" ErrorMessage="用户密码不能为空" Font-Size="Small" Width="151px"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td bgcolor="#99ccff" style="width: 121px">
                                    英文姓名：</td>
                                <td style="width: 150px">
                                    <asp:TextBox ID="txtywname" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtywname"
                                        Display="Dynamic" ErrorMessage="英文姓名不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td bgcolor="#99ccff" style="width: 121px">
                                    电子邮箱：</td>
                                <td style="width: 150px">
                                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail"
                                        Display="Dynamic" ErrorMessage="电子邮箱不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td bgcolor="#99ccff" style="width: 121px; height: 19px">
                                    头像：</td>
                                <td align="center" style="width: 150px; height: 19px">
                                    &nbsp; &nbsp;<table border="0" style="width: 100%">
                                        <tr>
                                            <td style="width: 100px">
                                                <asp:Image ID="imgtouxiang" runat="server" Height="118px" Width="116px" /></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px">
                                                <asp:DropDownList ID="ddltouxiang" runat="server" AutoPostBack="True" ForeColor="Red" OnSelectedIndexChanged="ddltouxiang_SelectedIndexChanged" Width="112px"
                                                    >
                                                </asp:DropDownList></td>
                                        </tr>
                                    </table>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td bgcolor="#99ccff" style="width: 121px; height: 21px">
                                </td>
                                <td style="width: 150px; height: 21px">
                                    <asp:Button ID="Button1" runat="server"  Text="保存" Width="51px" OnClick="Button1_Click" />
                                    &nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Font-Size="Small"
                                        ForeColor="Blue" >返回首页</asp:LinkButton>&nbsp;</td>
                            </tr>
                        </table>
                                            </td>
                                            <td style="font-size: 12pt; width: 100px; font-family: Times New Roman; height: 4px">
                                                &nbsp;</td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td align="right" style="width: 107px">
                                            </td>
                                            <td align="right" style="width: 181px">
                                            </td>
                                            <td style="width: 100px">
                                            </td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td align="center" style="width: 107px">
                                            </td>
                                            <td align="center" style="width: 181px">
                                            </td>
                                            <td align="center" style="width: 100px">
                                                &nbsp;</td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td style="width: 107px; height: 30px">
                                            </td>
                                            <td style="width: 181px; height: 30px">
                                            </td>
                                            <td style="width: 100px; height: 30px">
                                            </td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td style="width: 107px">
                                            </td>
                                            <td style="width: 181px">
                                            </td>
                                            <td style="width: 100px">
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
                                <td align="center" rowspan="3" style="width: 90px">
                                    <uc1:foot ID="Foot2" runat="server" />
                                    &nbsp;</td>
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
