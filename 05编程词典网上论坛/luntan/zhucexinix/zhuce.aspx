<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhuce.aspx.cs" Inherits="zhuce" %>

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
                        <table border="0" style="width: 82%">
                            <tr>
                                <td style="width: 100px; height: 25px;">
                                    <asp:Label ID="Label7" runat="server" Font-Size="9pt" Text="欢迎光临编程词典网上论坛 ！" Width="180px" ForeColor="#C04000"></asp:Label></td>
                                <td style="width: 100px; height: 25px;">
                                    <asp:LinkButton ID="lyhgl" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        Width="100px" OnClick="lyhgl_Click" CausesValidation="False">用户信息管理</asp:LinkButton></td>
                                <td style="width: 100px; height: 25px">
                                    <asp:Image ID="Image7" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px; height: 25px;">
                                    <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        Width="120px" OnClick="LinkButton3_Click" CausesValidation="False">修改当前用户信息</asp:LinkButton></td>
                                <td style="width: 100px; height: 25px">
                                    <asp:Image ID="Image1" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px; height: 25px;">
                                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" Width="100px" OnClick="LinkButton5_Click" CausesValidation="False">用户信息查询 </asp:LinkButton></td>
                                <td style="width: 100px; height: 25px">
                                    <asp:Image ID="Image3" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 177px; height: 25px;">
                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        Width="80px" OnClick="LinkButton4_Click" CausesValidation="False">用户登录</asp:LinkButton></td>
                                <td style="width: 177px; height: 25px">
                                    <asp:Image ID="Image4" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px; height: 25px;">
                                    <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" OnClick="lbtnsy_Click"
                                        Width="80px" CausesValidation="False">返回首页</asp:LinkButton></td>
                                <td style="width: 815121px; height: 25px;">
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" OnClick="ImageButton2_Click" CausesValidation="False" /></td>
                            </tr>
                        </table>
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" height="27" width="806">
                                        <tr>
                                            <td style="height: 33px" width="28">
                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/image/speaker.gif" />&nbsp;</td>
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
                                <td align="center" style="width: 90px; height: 17px">
                                    &nbsp;<table style="width: 704px; height: 178px">
                                        <tr>
                                            <td colspan="4" style="height: 20px; background-image: url(../image/zhu ti 2.gif);" align="left" valign="middle" bgcolor="#ff9933">
                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/image/zhu ti 1.gif" />
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#404040"
                            Text="新用户注册" Font-Names="华文新魏"></asp:Label>
                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <asp:LinkButton ID="lbtn" runat="server" Font-Size="Small" ForeColor="Blue"
                            OnClick="LinkButton2_Click" CausesValidation="False">返回首页</asp:LinkButton></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 107px">
                                            </td>
                                            <td style="width: 89px">
                                            </td>
                                            <td style="width: 100px">
                                            </td>
                                            <td align="center" style="width: 100px">
                        </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="width: 107px; height: 4px">
                                            </td>
                                            <td align="center" style="width: 89px; height: 4px">
                                            </td>
                                            <td align="center" rowspan="5" style="width: 100px">
            <table style="width: 473px" border="1">
                <tr>
                    <td bgcolor="#99ccff" colspan="2">
                        </td>
                </tr>
                <tr style="font-size: 12pt; color: #000000; font-family: Times New Roman">
                    <td bgcolor="#99ccff" style="width: 198px; height: 22px">
                        用户姓名：</td>
                    <td style="width: 150px; height: 22px">
                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Rfvname" runat="server" ControlToValidate="txtname"
                            Display="Dynamic" ErrorMessage="用户姓名不能为空" Font-Size="Small" Width="129px"></asp:RequiredFieldValidator></td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td bgcolor="#99ccff" style="width: 198px">
                        用户密码：</td>
                    <td style="width: 150px">
                        <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" Width="147px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvpwd" runat="server" ControlToValidate="txtpwd"
                            Display="Dynamic" ErrorMessage="用户密码不能为空" Font-Size="Small" Width="131px"></asp:RequiredFieldValidator></td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td bgcolor="#99ccff" style="width: 198px">
                        英文姓名：</td>
                    <td style="width: 150px">
                        <asp:TextBox ID="txtywname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtywname"
                            Display="Dynamic" ErrorMessage="英文姓名不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td bgcolor="#99ccff" style="width: 198px">
                        电子邮箱：</td>
                    <td style="width: 150px">
                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="电子邮箱不能为空" ControlToValidate="txtemail" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator></td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td bgcolor="#99ccff" style="width: 198px; height: 19px">
                        头像：</td>
                    <td style="width: 150px; height: 19px" align="center">
                        <asp:DropDownList ID="ddltouxiang" runat="server" AutoPostBack="True" ForeColor="Red"
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="94px">
                        </asp:DropDownList>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                        </td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td colspan="2" style="height: 19px">
                        <asp:Image ID="imgtouxiang" runat="server" Height="118px" Width="116px" /></td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td style="width: 198px; height: 21px">
                    </td>
                    <td style="width: 150px; height: 21px">
                        <asp:Button ID="btnok" runat="server" OnClick="Button1_Click" Text="保存" Width="39px" />
                        &nbsp; &nbsp; &nbsp;
                    </td>
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
