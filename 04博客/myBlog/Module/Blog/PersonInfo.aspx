<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PersonInfo.aspx.cs" Inherits="Module_Blog_PersonInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>个人信息</title>
            <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table style="width: 314px; text-align: center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" colspan="3" rowspan="2" style="height: 477px; text-align: center; background-image: url(../../Images/Skin/bg.jpg);">
                    <table style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                        width: 392px; border-bottom: black thin solid">
                        <tr>
                            <td colspan="4" rowspan="2" style="height: 20px; text-align: center">
                                <span style="color: #993300"><strong>个人详细资料</strong></span></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">用户名:</span></td>
                            <td colspan="2" style="font-size: 12pt; width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtName" runat="server" BackColor="White" Width="115px" ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="font-size: 12pt; width: 173px; height: 21px; text-align: left">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; color: #000000">
                            <td style="width: 81px; height: 18px; text-align: center">
                                <span style="font-size: 9pt">性 &nbsp;&nbsp; 别:</span></td>
                            <td colspan="2" style="width: 16px; height: 18px; text-align: center">
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList><span style="font-size: 9pt">&nbsp;</span></td>
                            <td colspan="1" style="font-size: 9pt; width: 173px; height: 18px">
                            </td>
                        </tr>
                        <tr style="font-size: 9pt">
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span>真实姓名:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtRealName" runat="server" Width="117px" ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left">
                            </td>
                        </tr>
                        <tr style="color: #000000">
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">生 &nbsp;&nbsp; 日:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtBirthday" runat="server" Width="117px" ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left">
                                </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">家庭地址:</span></td>
                            <td colspan="3" style="font-size: 12pt; height: 21px; text-align: left">
                                <asp:TextBox ID="txtAddress" runat="server" Width="290px" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">邮政编码:</span></td>
                            <td colspan="2" style="font-size: 12pt; width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtPostCode" runat="server" Width="117px" ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="font-size: 12pt; width: 173px; height: 21px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">E-mail:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtEmail" runat="server" Width="117px" ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">家庭电话:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtHphone" runat="server" Width="117px" ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">手机号码</span>:</td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtMphone" runat="server" Width="117px" ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">QQ:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtQQ" runat="server" Width="117px" ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 81px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">ICQ:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtICQ" runat="server" Width="117px" ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 21px; text-align: center">
                                <asp:Button ID="btnUpdate" CssClass="ButtonCss" runat="server" Font-Size="9pt" Text="确定" OnClick="btnUpdate_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
