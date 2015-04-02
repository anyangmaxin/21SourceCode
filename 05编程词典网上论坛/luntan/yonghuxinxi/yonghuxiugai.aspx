<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yonghuxiugai.aspx.cs" Inherits="yonghuxiugai" %>

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
                                <td style="width: 90px">
                                    &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/image/index_02.gif" Width="863px" /></td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 90px">
                        <table border="0" style="width: 80%">
                            <tr>
                                <td style="width: 166px">
                                    <asp:Label ID="Label8" runat="server" Font-Size="9pt" Text="欢迎光临编程词典网上论坛 ！" Width="180px" ForeColor="#C04000"></asp:Label></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        OnClick="LinkButton2_Click" Width="100px" CausesValidation="False">用户信息管理</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image7" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        OnClick="LinkButton3_Click" Width="120px" CausesValidation="False">修改当前用户信息</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image3" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" Width="100px" OnClick="LinkButton5_Click">用户信息查询 </asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image4" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton6" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        Width="80px" OnClick="LinkButton6_Click" CausesValidation="False">用户登录</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image5" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 122px">
                                    <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="Small" ForeColor="Blue"
                                        OnClick="LinkButton3_Click" Width="80px" CausesValidation="False">返回首页</asp:LinkButton></td>
                                <td style="width: 1871px">
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" CausesValidation="False" OnClick="ImageButton2_Click" /></td>
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
                                                ------------------------------------------------------</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 107px; height: 16px">
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
                                            <td align="center" rowspan="5" style="width: 100px">
                <table border="1" style="width: 473px">
                    <tr>
                        <td bgcolor="#99ccff" colspan="2">
                            &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="华文新魏" Font-Size="X-Large"
                                ForeColor="SandyBrown">用户信息修改</asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt; color: #000000; font-family: Times New Roman;">
                        <td bgcolor="#99ccff" style="width: 121px; height: 22px">
                            用户姓名：</td>
                        <td style="width: 150px; height: 22px">
                            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Rfvname" runat="server" ControlToValidate="txtname"
                                Display="Dynamic" ErrorMessage="用户姓名不能为空" Font-Size="Small" Width="139px"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr style="font-size: 12pt; font-family: Times New Roman;">
                        <td bgcolor="#99ccff" style="width: 121px">
                            用户密码：</td>
                        <td style="width: 150px">
                            <asp:TextBox ID="txtpwd" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvpwd" runat="server" ControlToValidate="txtpwd"
                                Display="Dynamic" ErrorMessage="用户密码不能为空" Font-Size="Small" Width="133px"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr style="font-size: 12pt; font-family: Times New Roman;">
                        <td bgcolor="#99ccff" style="width: 121px">
                            英文姓名：</td>
                        <td style="width: 150px">
                            <asp:TextBox ID="txtywname" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr style="font-size: 12pt; font-family: Times New Roman;">
                        <td bgcolor="#99ccff" style="width: 121px">
                            电子邮箱：</td>
                        <td style="width: 150px">
                            <asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr style="font-size: 12pt; font-family: Times New Roman;">
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
                            <asp:DropDownList ID="ddltouxiang" runat="server" AutoPostBack="True" ForeColor="Red" OnSelectedIndexChanged="ddltouxiang_SelectedIndexChanged"
                                >
                            </asp:DropDownList></td>
                                </tr>
                            </table>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr style="font-size: 12pt; font-family: Times New Roman;">
                        <td bgcolor="#99ccff" style="width: 121px; height: 21px">
                        </td>
                        <td style="width: 150px; height: 21px">
                            <asp:Button ID="Button1" runat="server"  Text="保存" Width="39px" OnClick="Button1_Click" />
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Small" ForeColor="Blue"
                                OnClick="LinkButton1_Click" CausesValidation="False">返回首页</asp:LinkButton>&nbsp;</td>
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
                                            <td style="width: 100px">
                                            </td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td align="center" style="width: 107px">
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
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td colspan="1" style="width: 107px">
                                            </td>
                                            <td colspan="3">
                                                &nbsp;</td>
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
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td colspan="1" style="width: 107px">
                                            </td>
                                            <td colspan="3">
                                                ------------------------------------------------------</td>
                                        </tr>
                                        <tr style="font-size: 12pt; font-family: Times New Roman">
                                            <td style="width: 107px; height: 10px">
                                            </td>
                                            <td style="width: 89px; height: 10px">
                                            </td>
                                            <td style="width: 100px; height: 10px">
                                            </td>
                                            <td style="width: 100px; height: 10px">
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
                                <td align="center" rowspan="3" style="width: 90px">
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
