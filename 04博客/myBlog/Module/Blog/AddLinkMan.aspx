<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddLinkMan.aspx.cs" Inherits="Module_Blog_AddFriend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加联系人</title>
        <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0px; padding-top: 0px; text-align: left;">
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="width: 579px">
            <tr>
                <td colspan="1" style="background-image: url(../../Images/Skin/bg.jpg); width: 755px;
                    height: 469px; text-align: center">
                </td>
                <td colspan="1" style="background-image: url(../../Images/Skin/bg.jpg); width: 755px;
                    height: 469px; text-align: center">
                </td>
                <td colspan="3" style="background-image: url(../../Images/Skin/bg.jpg); height: 469px;
                    text-align: center; width: 755px;">
                    &nbsp;<br />
                    <br />
                    <table style="width: 491px; border-top-width: thin; border-left-width: thin; border-left-color: black; border-bottom-width: thin; border-bottom-color: black; border-top-color: black; border-right-width: thin; border-right-color: black;">
                        <tr>
                            <td colspan="4" rowspan="2" style="height: 20px; text-align: center">
                                <span style="color: #993300"><strong>添加人员资料</strong></span></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">姓 &nbsp; &nbsp; 名:</span></td>
                            <td colspan="2" style="font-size: 12pt; width: 16px; height: 21px; text-align: left">
                                <asp:TextBox ID="txtName" runat="server" Width="230px"></asp:TextBox></td>
                            <td colspan="1" style="font-size: 12pt; width: 173px; height: 21px; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="用户名不允许为空">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 9pt; color: #000000">
                            <td style="width: 82px; height: 18px; text-align: center">
                                <span>性 &nbsp;&nbsp; 别:</span></td>
                            <td colspan="2" style="width: 16px; height: 18px; text-align: left; font-size: 12pt;">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="146px">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList>&nbsp;</td>
                            <td colspan="1" style="width: 173px; height: 18px">
                            </td>
                        </tr>
                        <tr style="color: #000000">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">生 &nbsp;&nbsp; 日:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: left; font-size: 12pt;">
                                <asp:TextBox ID="txtBirthday" runat="server" Width="228px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left; font-size: 12pt;">
                                </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">家庭地址:</span></td>
                            <td colspan="3" style="font-size: 12pt; height: 21px; text-align: left">
                                <asp:TextBox ID="txtAddress" runat="server" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">邮政编码:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: left">
                                <asp:TextBox ID="txtPostCode" runat="server" Width="228px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px" align="left">
                                <asp:RegularExpressionValidator ID="revPostCode" runat="server" ControlToValidate="txtPostCode"
                                    ErrorMessage="您的邮编输入有误" Font-Size="9pt" ValidationExpression="\d{6}" Width="134px">您的邮编输入有误</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">E-mail:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: left; font-size: 12pt;">
                                <asp:TextBox ID="txtEmail" runat="server" Width="226px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left; font-size: 12pt;">
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="您输入的E-mail地址格式不正确，请重新输入" Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Width="138px">您输入的E-mail地址格式不正确，请重新输入</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">家庭电话:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: left">
                                <asp:TextBox ID="txtHphone" runat="server" Width="224px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtHphone"
                                    ErrorMessage="您输入的电话号码有误，请重新输入" Font-Size="9pt" ValidationExpression="\d{3,4}-\d{7,8}">您输入的电话号码有误，请重新输入</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">手机号码</span>:</td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: left">
                                <asp:TextBox ID="txtMphone" runat="server" Width="221px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMphone"
                                    ErrorMessage="您输入的号码有误，请重新输入" Font-Size="9pt" ValidationExpression="^[1]\d{10}">您输入的手机号码有误，请重新输入</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">QQ:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: left">
                                <asp:TextBox ID="txtQQ" runat="server" Width="220px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">ICQ:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: left">
                                <asp:TextBox ID="txtICQ" runat="server" Width="221px"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 21px; text-align: center">
                                <asp:Button ID="btnOK" CssClass="ButtonCss" runat="server" Font-Size="9pt" Text="确定" OnClick="btnOK_Click" />
                                <asp:Button ID="btnCancle" CssClass="ButtonCss" runat="server" Font-Size="9pt" OnClick="btnCancle_Click"
                                    Text="返回" CausesValidation="False" /><br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False" Font-Size="9pt" />
                </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
