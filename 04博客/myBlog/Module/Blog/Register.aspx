<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Module_Admin_Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>博客注册</title>
            <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
<!--

function TABLE1_onclick() {

}

function Reset1_onclick() {

}

// -->
</script>
   
    <style type="text/css">
        .style1
        {
            width: 82px;
            height: 26px;
        }
        .style2
        {
            width: 16px;
            height: 31px;
        }
        .style4
        {
            width: 82px;
            height: 29px;
        }
        .style5
        {
            width: 173px;
            height: 29px;
        }
        .style6
        {
            width: 82px;
            height: 31px;
        }
        .style7
        {
            width: 173px;
            height: 31px;
        }
        .style8
        {
            width: 100%;
        }
    </style>
   
</head>
<body style="text-align: center; margin-top: 0px; padding-top: 0px;" text="#00">

    <form id="form1" runat="server">
    <div style="text-align: center" align="center">
        <table style="width: 755px" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" style="text-align: center; height: 81px;">
                    &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Skin/head.jpg" /></td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center; height: 369px; background-image: url(../../Images/Skin/bbgg.jpg); background-repeat: no-repeat;">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 923px">
                        <tr>
                            <td style="width: 100px; background-color: slategray">
                            </td>
                            <td style="width: 94px">
                    <table style="border: thin solid black; width: 712px; text-align: center; height: 578px;" 
                        id="TABLE1" language="javascript" onclick="return TABLE1_onclick()" 
                        align="center">
                        <tr>
                            <td colspan="3" rowspan="1" style="height: 15px; text-align: center">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 20px; text-align: center">
                                <span style="color: #993300"><strong>博客注册资料</strong></span></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">用 户 名:</span></td>
                            <td style="width: 16px; height: 21px; text-align: center; font-size: 12pt;">
                                <asp:TextBox ID="txtName" runat="server" Width="235px" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left; font-size: 12pt;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Font-Size="9pt" ErrorMessage="用户名不允许为空">*</asp:RequiredFieldValidator>
                                <asp:Button ID="btnCheck" CssClass="ButtonCss" runat="server" CausesValidation="False" Text="检测用户" Font-Size="9pt"  OnClick="btnCheck_Click" Width="120px" /></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">注册日期:</span></td>
                            <td style="text-align: left; font-size: 12pt; height: 25px;" class="style4">
                                <asp:TextBox ID="txtICQ" runat="server" Width="233px" Font-Size="9pt" 
                                    ReadOnly="True"></asp:TextBox></td>
                            <td colspan="1" style="text-align: left; font-size: 12pt; width: 173px; height: 25px;" class="style5">
                                &nbsp;
                                <asp:Button ID="Button1" CssClass="ButtonCss" runat="server" CausesValidation="False"
                                    OnClick="Button1_Click" Text="请选择日期" Width="115px" Height="21px" />
                                </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                密 &nbsp;&nbsp; 码:</span></td>
                            <td style="width: 16px; height: 21px; text-align: center">
                                <asp:TextBox ID="txtPwd" runat="server" Width="233px" TextMode="Password" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                                    Font-Size="9pt" ErrorMessage="请输入密码">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 9pt; color: #000000">
                            <td style="width: 82px; height: 17px; text-align: center">
                                <span>
                                确认密码:</span></td>
                            <td style="width: 16px; height: 17px; text-align: center">
                                <asp:TextBox ID="txtOKpwd" runat="server" Width="231px" TextMode="Password" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 17px; text-align: left">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd"
                                    ControlToValidate="txtOKpwd">*密码不一致</asp:CompareValidator></td>
                        </tr>
                        <tr style="font-size: 12pt; color: #000000">
                            <td style="text-align: center" class="style6">
                                <span style="font-size: 9pt">
                                性 &nbsp;&nbsp; 别:</span></td>
                            <td style="text-align: center" class="style2">
                                <asp:DropDownList ID="ddlSex" runat="server" Font-Size="9pt" Width="113px">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList><span style="font-size: 9pt">&nbsp;</span></td>
                            <td colspan="1" style="font-size: 9pt;" class="style7">
                            </td>
                        </tr>
                        <tr style="font-size: 9pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span>
                                真实姓名:</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtRealName" runat="server" Width="117px" Font-Size="9pt"></asp:TextBox>
                                （必填）</td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left; font-size: 12pt;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRealName" Font-Size="9pt" ErrorMessage="姓名不能为空">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="color: #000000; font-size: 12pt;">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                生 &nbsp;&nbsp; 日:</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtBirthday" runat="server" Width="117px" Font-Size="9pt"></asp:TextBox>
                                格式如：2011/3/25</td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left;">
                                </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                博客主题:</span></td>
                            <td colspan="2" style="height: 21px; font-size: 12pt; text-align: left;">
                                <asp:TextBox ID="txtSubject" runat="server" Width="292px" Font-Size="9pt"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                家庭地址:</span></td>
                            <td colspan="2" style="height: 21px; text-align: left">
                                <asp:TextBox ID="txtAddress" runat="server" Width="290px" Font-Size="9pt"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                邮政编码:</span></td>
                            <td style="width: 16px; height: 21px; text-align: left">
                                <asp:TextBox ID="txtPostCode" runat="server" Width="117px" Font-Size="9pt"></asp:TextBox></td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left;">
                                <asp:RegularExpressionValidator ID="revPostCode" runat="server" ControlToValidate="txtPostCode"
                                    ErrorMessage="您的邮编输入有误" Font-Size="9pt" ValidationExpression="\d{6}" Width="134px">您的邮编输入有误</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                密码问题:</span></td>
                            <td colspan="2" align="left">
                                <asp:TextBox ID="txtQues" runat="server" Width="290px" Font-Size="9pt"></asp:TextBox>
                                （必填）<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="txtQues" Display="Dynamic" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
                                            </td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                问题答案:</span></td>
                            <td colspan="2" align="left">
                                <asp:TextBox ID="txtAns" runat="server" Width="290px" Font-Size="9pt"></asp:TextBox>
                                （必填）<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="txtAns" Display="Dynamic" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
                                            </td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
E-mail:</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtEmail" runat="server" Width="167px" Font-Size="9pt"></asp:TextBox>
                                （必填）</td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left">
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="您输入的E-mail地址格式不正确，请重新输入" Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Width="138px">您输入的E-mail地址格式不正确，请重新输入</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                家庭电话:                           </span></td>
                            <td align="left">
                                <asp:TextBox ID="txtHphone" runat="server" Width="167px" Font-Size="9pt"></asp:TextBox>
                                （可选择填写）</td>
                            <td colspan="1" style="width: 173px; height: 21px; text-align: left;">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">手机号码</span>:</td>
                            <td align="left">
                                <asp:TextBox ID="txtMphone" runat="server" Width="165px" Font-Size="9pt"></asp:TextBox>
                                （可选择填写）</td>
                            <td colspan="1" style="width: 173px; height: 21px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                                <span style="font-size: 9pt">
                                QQ:</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtQQ" runat="server" Width="167px" Font-Size="9pt"></asp:TextBox>
                                （可选择填写）</td>
                            <td colspan="1" style="width: 173px; height: 21px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: center" class="style6" colspan="2" align="center">
                                &nbsp;&nbsp; &nbsp;<table cellpadding="0" cellspacing="0" class="style8">
                                    <tr>
                                        <td>
                                <asp:Button ID="btnOK" CssClass="ButtonCss" runat="server" Text="确定" Font-Size="9pt" OnClick="btnOK_Click" Width="54px" />
                                        </td>
                                        <td align="center">
                                            <asp:Button ID="btnBack" CssClass="ButtonCss" runat="server" Text="取消" Font-Size="9pt" OnClick="btnBack_Click" CausesValidation="False" Width="58px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td colspan="1" align="left" class="style7" style="width: 173px">
                                <asp:Calendar ID="Calendar1" runat="server" 
                                    style="position:absolute; left: 775px; top: 237px;" 
                                    BackColor="White" BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" 
                                    ForeColor="Black" OnSelectionChanged="Calendar1_SelectionChanged" 
                                    Visible="False" Width="200px" Height="180px" CellPadding="4" 
                                    DayNameFormat="Shortest">
                        <SelectedDayStyle BackColor="#666666" ForeColor="White" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <DayHeaderStyle Font-Bold="True" Font-Size="7pt" BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" Font-Bold="True" BorderColor="Black" />
                                    <SelectorStyle BackColor="#CCCCCC" />
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 82px; height: 21px; text-align: center">
                            </td>
                            <td colspan="2" style="height: 21px; text-align: left">
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="9pt" Height="15px" Width="133px" ShowMessageBox="True" ShowSummary="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center" class="style1">
                                &nbsp;</td>
                        </tr>
                    </table>
                            </td>
                            <td style="width: 100px; background-color: slategray">
                            </td>
                        </tr>
                    </table>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Skin/bottom.jpg" />
                </td>
            </tr>
        </table>
    </div>
    </form>

</body>
</html>
