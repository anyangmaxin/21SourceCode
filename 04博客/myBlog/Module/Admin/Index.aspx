<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Module_Admin_Index" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员登陆</title>
    <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 24px;
        }
        .style2
        {
            color: #FF0000;
        }
    </style>
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div align="center">
        <table style="width: 755px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="text-align: center; width: 691px; height: 82px;" colspan="3">
                    &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Skin/head.jpg" /></td>
            </tr>
            <tr>
                <td style="text-align: center; width: 691px; vertical-align: middle; height: 477px; background-image: url(../../Images/Skin/reg.jpg);" 
                    colspan="3">
                    <table style="width: 919px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="3" style="text-align: center; height: 18px;">
                                <span style="color: #993300"><strong>管理员登录</strong></span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center; height: 12px;" align="center">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td rowspan="3" style="width: 100px">
                                <table style="width: 291px">
                                    <tr>
                                        <td style="width: 74px; height: 21px">
                                            <span style="font-size: 9pt">用户名:</span></td>
                                        <td style="height: 21px; text-align: left">
                                            <asp:TextBox ID="txtUid" runat="server" Width="191px" Font-Size="9pt"></asp:TextBox><br />
                                            <asp:CheckBox ID="cbxRemeberUser" runat="server" Text="记住用户名" Checked="true" /></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 74px">
                                            <span style="font-size: 9pt">密&nbsp; 码:</span></td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="txtPwd" runat="server" Width="191px" TextMode="Password" Font-Size="9pt"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 74px; height: 24px;">
                                            <span style="font-size: 9pt">验证码:</span></td>
                                        <td style="text-align: left; " class="style1">
                                            <asp:TextBox ID="txtVali" runat="server" Width="94px" Font-Size="9pt"></asp:TextBox>
                        <img id="Img1" src="../../CheckCode.aspx" alt="看不清，请点击我！" onclick="this.src=this.src+'?'" 
                                style="width: 65px; height: 22px" />&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnOK" runat="server" Font-Size="9pt" Text="确定" OnClick="btnOK_Click" CausesValidation="False" /><span
                                                style="color: #ff0000"> </span>
                                            <asp:Button ID="btnCancle" runat="server" Font-Size="9pt" Text="取消" OnClick="btnCancle_Click" CausesValidation="False" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 5px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 16px">
                                            &nbsp;<br />
                                            <span class="style2">注意：验证码看不清，请单击图片</span></td>
                                    </tr>
                                </table>
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center; width: 691px; height: 12px;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Skin/bottom.jpg" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
