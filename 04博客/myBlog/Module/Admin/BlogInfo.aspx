<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlogInfo.aspx.cs" Inherits="Module_Admin_BlogInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>博客信息</title>
    <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div>
        <table align="left" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" colspan="3" rowspan="2" style="height: 450px; background-image: url(../../Images/Skin/bg.jpg); width: 753px; background-repeat: no-repeat;">
                    <table style="width: 392px; vertical-align: top; border-top-width: thin; border-left-width: thin; border-left-color: black; border-bottom-width: thin; border-bottom-color: black; border-top-color: black; border-right-width: thin; border-right-color: black;">
                        <tr>
                            <td colspan="4" rowspan="2" style="height: 20px; text-align: center">
                                <span style="color: #993300"><strong>博客详细资料</strong></span></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">用 户 名:</span></td>
                            <td colspan="2" style="font-size: 12pt; width: 32px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtName" runat="server" Width="131px"></asp:TextBox></td>
                            <td colspan="1" style="font-size: 12pt; width: 173px; height: 21px; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="*用户名不能为空" Font-Size="9pt"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">密 &nbsp;&nbsp; 码:</span></td>
                            <td colspan="2" style="width: 32px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtPwd" runat="server" BackColor="#E0E0E0" ReadOnly="True" Width="132px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left">
                            </td>
                        </tr>
                        <tr style="font-size: 9pt; color: #000000">
                            <td style="width: 82px; height: 17px; text-align: center">
                                <span>修改密码:</span></td>
                            <td colspan="2" style="width: 32px; height: 17px; text-align: center">
                                <asp:TextBox ID="txtOKpwd" runat="server" Width="132px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 17px; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOKpwd"
                                    ErrorMessage="*密码不能为空"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 12pt; color: #000000">
                            <td style="width: 82px; height: 18px; text-align: center">
                                <span style="font-size: 9pt">性 &nbsp;&nbsp; 别:</span></td>
                            <td colspan="3" align="left">
                                <asp:DropDownList ID="ddlSex" runat="server" Width="59px">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList>&nbsp;<span style="font-size: 9pt">&nbsp;
                                </span></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">真实姓名:</span></td>
                            <td colspan="2" style="width: 32px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtRealName" runat="server" Width="130px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*真实姓名不能为空"
                                    Font-Size="9pt" ControlToValidate="txtRealName"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">博客主题:</span></td>
                            <td colspan="3" style="font-size: 12pt; height: 21px" align="left">
                                <asp:TextBox ID="txtSubject" runat="server" Width="292px"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">家庭地址:</span></td>
                            <td colspan="3" align="left">
                                <asp:TextBox ID="txtAddress" runat="server" Width="292px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">邮政编码:</span></td>
                            <td align="left" colspan="3" style="height: 21px">
                                <asp:TextBox ID="txtPostCode" runat="server" Width="130px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">密码问题:</span></td>
                            <td colspan="3" align="left">
                                <asp:TextBox ID="txtQues" runat="server" Width="292px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">问题答案:</span></td>
                            <td colspan="3" align="left">
                                <asp:TextBox ID="txtAns" runat="server" Width="292px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">E-mail:</span></td>
                            <td colspan="3" align="left">
                                <asp:TextBox ID="txtEmail" runat="server" Width="130px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">家庭电话:</span></td>
                            <td colspan="3" align="left">
                                <asp:TextBox ID="txtHphone" runat="server" Width="130px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">手机号码</span>:</td>
                            <td align="left" colspan="3" style="height: 21px">
                                <asp:TextBox ID="txtMphone" runat="server" Width="130px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">注册时间:</span></td>
                            <td colspan="2" style="width: 32px; height: 21px; text-align: center">
                                <asp:TextBox ID="TextBox1" runat="server" BackColor="#E0E0E0" ReadOnly="True" Width="117px"></asp:TextBox>IP:</td>
                            <td colspan="1" style="width: 173px; height: 21px" align="left">
                                <asp:TextBox ID="txtIP" runat="server" BackColor="#E0E0E0" ReadOnly="True" Width="117px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 6px; text-align: center">
                                <asp:Button ID="btnOK" runat="server" Font-Size="9pt" OnClick="btnOK_Click" Text="修改" />
                                <asp:Button ID="btnBack" runat="server" Font-Size="9pt" OnClick="Button1_Click" Text="返回" CausesValidation="False" /></td>
                        </tr>
                    </table>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="9pt" ShowMessageBox="True"
                        ShowSummary="False" />
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
