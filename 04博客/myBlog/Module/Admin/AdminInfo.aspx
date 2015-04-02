<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminInfo.aspx.cs" Inherits="Module_Admin_AdminInfo" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员信息</title>
    <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px; text-align: left;">
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="width: 489px; border-left-color: #99cc33;">
            <tr>
                <td colspan="3" style="background-image: url(../../Images/Skin/bg.jpg); background-repeat: no-repeat;
                    height: 492px; width: 755px;">
                    <table style="width: 392px; vertical-align: top; border-top-width: thin; border-left-width: thin; border-left-color: black; border-bottom-width: thin; border-bottom-color: black; border-top-color: black; border-right-width: thin; border-right-color: black;">
                        <tr>
                            <td colspan="4" style="height: 20px; text-align: center">
                                <span style="color: #993300"><strong>管理员详细资料</strong></span></td>
                        </tr>
                        <tr>
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">用 户 名:</span></td>
                            <td colspan="2" style="font-size: 12pt; width: 28px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtName" runat="server" BackColor="White" Width="115px"></asp:TextBox></td>
                            <td colspan="1" style="font-size: 12pt; width: 132px; height: 21px; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="*用户名不能为空" Font-Size="9pt"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">密 &nbsp;&nbsp; 码:</span></td>
                            <td colspan="2" style="width: 28px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtPwd" runat="server" BackColor="#E0E0E0" ReadOnly="True" Width="117px"></asp:TextBox></td>
                            <td colspan="1" style="width: 132px; height: 21px; text-align: left">
                            </td>
                        </tr>
                        <tr style="font-size: 9pt; color: #000000">
                            <td style="width: 335px; height: 17px; text-align: center">
                                <span>修改密码:</span></td>
                            <td colspan="2" style="width: 28px; height: 17px; text-align: center">
                                <asp:TextBox ID="txtOKpwd" runat="server" Width="117px"></asp:TextBox></td>
                            <td colspan="1" style="width: 132px; height: 17px; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOKpwd"
                                    ErrorMessage="*密码不能为空" Font-Size="9pt"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 12pt; color: #000000">
                            <td style="width: 335px; height: 18px; text-align: center">
                                <span style="font-size: 9pt">性 &nbsp;&nbsp; 别:</span></td>
                            <td colspan="2" style="width: 28px; height: 18px; text-align: center">
                                <asp:DropDownList ID="ddlSex" runat="server">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList><span style="font-size: 9pt">&nbsp;</span></td>
                            <td colspan="1" style="font-size: 9pt; width: 132px; height: 18px">
                            </td>
                        </tr>
                        <tr style="font-size: 9pt">
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span>真实姓名:</span></td>
                            <td colspan="2" style="width: 28px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtRealName" runat="server" Width="117px"></asp:TextBox></td>
                            <td colspan="1" style="width: 132px; height: 21px; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRealName"
                                    ErrorMessage="*真实姓名不能为空" Font-Size="9pt"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="color: #000000">
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">生 &nbsp;&nbsp; 日:</span></td>
                            <td colspan="2" style="width: 28px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtBirthday" runat="server" Width="117px"></asp:TextBox></td>
                            <td colspan="1" style="width: 132px; height: 21px; text-align: left">
                                超级管理员:<asp:DropDownList ID="DropDownList1" runat="server" Height="17px" Width="45px">
                                    <asp:ListItem Value="True">是</asp:ListItem>
                                    <asp:ListItem Value="False">否</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">家庭地址:</span></td>
                            <td colspan="3" style="font-size: 12pt; height: 21px; text-align: center">
                                <asp:TextBox ID="txtAddress" runat="server" Width="290px"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">邮政编码:</span></td>
                            <td colspan="2" style="font-size: 12pt; width: 28px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtPostCode" runat="server" Width="117px"></asp:TextBox></td>
                            <td colspan="1" style="font-size: 12pt; width: 132px; height: 21px">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">密码问题:</span></td>
                            <td colspan="3" style="height: 21px; text-align: center">
                                <asp:TextBox ID="txtQues" runat="server" Width="290px"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">问题答案:</span></td>
                            <td colspan="3" style="height: 21px; text-align: center">
                                <asp:TextBox ID="txtAns" runat="server" Width="290px"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">家庭电话:</span></td>
                            <td colspan="2" style="width: 28px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtEmail" runat="server" Width="112px"></asp:TextBox>
                                <span style="font-size: 9pt">QQ:</span></td>
                            <td colspan="1" style="width: 132px; height: 21px; text-align: left">
                                <asp:TextBox ID="txtHphone" runat="server" Width="115px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">手机号码:</span></td>
                            <td colspan="2" style="width: 28px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtMphone" runat="server" Width="111px"></asp:TextBox></td>
                            <td colspan="1" style="width: 132px; height: 21px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">E-mail:</span></td>
                            <td colspan="2" style="width: 28px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtQQ" runat="server" Width="115px"></asp:TextBox>ICQ:</td>
                            <td colspan="1" style="width: 132px; height: 21px">
                                <asp:TextBox ID="txtICQ" runat="server" Width="117px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 335px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">注册时间:</span></td>
                            <td colspan="2" style="width: 28px; height: 21px; text-align: center">
                                <asp:TextBox ID="TextBox1" runat="server" BackColor="#E0E0E0" ReadOnly="True" Width="121px"></asp:TextBox>IP:</td>
                            <td colspan="1" style="width: 132px; height: 21px">
                                <asp:TextBox ID="txtIP" runat="server" BackColor="#E0E0E0" ReadOnly="True" Width="117px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 21px; text-align: center">
                                <asp:Button ID="btnUpdate" runat="server" Font-Size="9pt" Text="修改" OnClick="btnUpdate_Click" />
                                <asp:Button ID="txtBack" runat="server" Font-Size="9pt" Text="返回" OnClick="txtBack_Click" CausesValidation="False" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
