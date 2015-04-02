<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Module_Admin_Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员注册</title>
        <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
<!--

function Reset1_onclick() {

}

// -->
</script>
</head>
<body style="text-align: center; margin-top: 0px; padding-top: 0px;" text="#00">
    <form id="form1" runat="server">
    <div style="text-align: center; vertical-align: top;" align="left">
        <table style="width: 311px" cellpadding="0" cellspacing="0" align="left">
            <tr>
                <td colspan="3" style="height: 11px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center; height: 465px; background-repeat: no-repeat;" align="left">
                    <table style="width: 392px; vertical-align: top; border-top-width: thin; border-left-width: thin; border-left-color: black; border-bottom-width: thin; border-bottom-color: black; border-top-color: black; border-right-width: thin; border-right-color: black;" id="TABLE1" runat="server" align="left">
                        <tr>
                            <td colspan="4" rowspan="1" style="height: 20px; text-align: center">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" rowspan="2" style="height: 20px; text-align: center">
                                <span style="color: #993300"><strong>管理员注册资料</strong></span></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">用 户 名:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center; font-size: 12pt;">
                                <asp:TextBox ID="txtName" runat="server" Width="115px" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left; font-size: 12pt;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Size="9pt" ControlToValidate="txtName" ErrorMessage="用户名不能为空">*</asp:RequiredFieldValidator>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" Text="检测用户" Font-Size="9pt" OnClick="Button1_Click" /></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span><span style="font-size: 9pt">
                                密 &nbsp;&nbsp; 码<span>:</span></span></span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center; font-size: 9pt;">
                                <asp:TextBox ID="txtPwd" runat="server" Width="117px" TextMode="Password" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left; font-size: 9pt;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                                    Font-Size="9pt" ErrorMessage="密码不能为空">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 9pt; color: #000000">
                            <td style="width: 82px; height: 17px; text-align: center">
                                <span>
                                确认密码:</span></td>
                            <td colspan="2" style="width: 16px; height: 17px; text-align: center">
                                <asp:TextBox ID="txtOKpwd" runat="server" Width="117px" TextMode="Password" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 17px; text-align: left">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd"
                                    ControlToValidate="txtOKpwd" Font-Size="9pt">*密码不一致</asp:CompareValidator></td>
                        </tr>
                        <tr style="font-size: 12pt; color: #000000">
                            <td style="width: 82px; height: 18px; text-align: center">
                                <span style="font-size: 9pt">
                                性 &nbsp;&nbsp; 别:</span></td>
                            <td colspan="2" style="width: 16px; height: 18px; text-align: center">
                                <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="9pt">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList>&nbsp;</td>
                            <td colspan="1" style="width: 173px; height: 18px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                真实姓名:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtRealName" runat="server" Width="117px" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left;">
                                <span style="font-size: 9pt">&nbsp;</span><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Size="9pt" ControlToValidate="txtRealName" ErrorMessage="真实姓名不能为空">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="color: #000000">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                生 &nbsp;&nbsp; 日:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtBirthday" runat="server" Width="117px" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left;">
                                超级管理员:<asp:DropDownList ID="DropDownList2" runat="server" Font-Size="9pt">
                                    <asp:ListItem>是</asp:ListItem>
                                    <asp:ListItem>否</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                家庭地址:</span></td>
                            <td colspan="3" style="height: 21px; text-align: center">
                                <asp:TextBox ID="txtAddress" runat="server" Width="290px" Font-Size="9pt"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                邮政编码:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtPostCode" runat="server" Width="117px" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left;">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                密码问题:</span></td>
                            <td colspan="3" style="height: 21px; text-align: center">
                                <asp:TextBox ID="txtQues" runat="server" Width="290px" Font-Size="9pt"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                问题答案:</span></td>
                            <td colspan="3" style="height: 21px; text-align: center">
                                <asp:TextBox ID="txtAns" runat="server" Width="290px" Font-Size="9pt"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                E-mail:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtEmail" runat="server" Width="119px" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left">
                                QQ:<asp:TextBox ID="txtQQ" runat="server" Width="117px" Font-Size="9pt"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                家庭电话:</span></td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtHphone" runat="server" Width="117px" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left;">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">手机号码</span>:</td>
                            <td colspan="2" style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtMphone" runat="server" Width="115px" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left;">
                                ICQ:<asp:TextBox ID="txtICQ" runat="server" Width="117px" Font-Size="9pt"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 21px; text-align: center">
                                <asp:Button ID="btnOK" runat="server" Text="确定" Font-Size="9pt" OnClick="btnOK_Click" Width="68px" />
                                <asp:Button ID="btnBack" runat="server" Text="取消" Font-Size="9pt" OnClick="btnBack_Click" CausesValidation="False" Width="60px" /><br />
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="9pt" Height="28px"
                                    ShowMessageBox="True" ShowSummary="False" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
