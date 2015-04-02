<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Reg.aspx.cs" Inherits="User_Reg" %>

<%@ Register Src="../control/foot.ascx" TagName="foot" TagPrefix="uc1" %>
<%@ Register Src="../control/header.ascx" TagName="header" TagPrefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
            <table style="width: 776px; border-right: #ffcc33 thin solid; border-top: #ffcc33 thin solid; border-left: #ffcc33 thin solid; border-bottom: #ffcc33 thin solid; background-image: url(image/background.jpg);">
                <tr>
                    <td colspan="6">
                        &nbsp;<uc2:header ID="Header1" runat="server" />
                    </td>
                </tr>
               
                <tr>
                    <td colspan="6" style="height: 14px; ">
                      <asp:Image id="ImgHead" runat="server" ImageUrl="~/image/zhuce.jpg"></asp:Image></td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">用户名：</span></td>
                    <td style="width: 168px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">
                        <asp:TextBox ID="TxtUserName" runat="server" Width="125px"></asp:TextBox></span></td>
                    <td style="width: 72px; height: 37px;">
                        <asp:RequiredFieldValidator ID="RequiredRfvName" runat="server" ControlToValidate="TxtUserName"
                            Display="Dynamic" ErrorMessage="用户名不能为空" Font-Size="9pt" Width="99px"></asp:RequiredFieldValidator></td>
                    <td style="width: 123px; height: 37px; text-align: center">
                        <span style="font-size: 9pt">电话：</span></td>
                    <td style="width: 174px; height: 37px">
                        <span style="font-size: 9pt">
                        <asp:TextBox ID="TxtTel" runat="server" Width="125px"></asp:TextBox></span></td>
                    <td style="width: 136px; height: 37px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtTel"
                            Display="Dynamic" ErrorMessage="电话号码不能为空" Font-Size="9pt"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revydtel" runat="server" ControlToValidate="TxtTel"
                            Display="Dynamic" ErrorMessage="移动电话格式只能是数字" Font-Size="Small" ValidationExpression="\d*"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 35px; text-align: right;">
                        <span style="font-size: 9pt">密码：</span></td>
                    <td style="width: 168px; height: 35px; text-align: right;">
                        <span style="font-size: 9pt">
                        <asp:TextBox ID="TxtUserPwd" runat="server" TextMode="Password" Width="125px"></asp:TextBox></span></td>
                    <td style="width: 72px; height: 35px; text-align: center;">
                        <asp:RequiredFieldValidator ID="RfvUserPwd" runat="server" ControlToValidate="TxtUserPwd"
                            Display="Dynamic" ErrorMessage="密码不能为空" Font-Size="9pt"></asp:RequiredFieldValidator></td>
                    <td style="width: 123px; height: 35px; text-align: center">
                        <span style="font-size: 9pt">Email：</span></td>
                    <td style="width: 174px; height: 35px">
                        <asp:TextBox ID="TxtEmail" runat="server" Width="125px"></asp:TextBox></td>
                    <td style="width: 136px; height: 35px">
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TxtEmail"
                            Display="Dynamic" ErrorMessage="Email不能为空" Font-Size="9pt"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RevEmail" runat="server" ControlToValidate="TxtEmail"
                            Display="Dynamic" ErrorMessage="格式不正确" Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Width="77px"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">确认密码：</span></td>
                    <td style="width: 168px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">
                        <asp:TextBox ID="TxtTruePwd" runat="server" TextMode="Password" Width="125px" Height="17px"></asp:TextBox></span></td>
                    <td style="width: 72px; height: 37px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTruePwd"
                            Display="Dynamic" ErrorMessage="确认密码不能为空" Font-Size="9pt"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPwd" runat="server" ControlToCompare="TxtUserPwd" ControlToValidate="TxtTruePwd"
                            Display="Dynamic" ErrorMessage="两次输入的密码不一致" Font-Size="9pt"></asp:CompareValidator></td>
                    <td style="width: 123px; height: 37px; text-align: center">
                        <span style="font-size: 9pt">QQ：</span></td>
                    <td style="width: 174px; height: 37px">
                        <asp:TextBox ID="TxtQQ" runat="server" Height="17px" Width="125px"></asp:TextBox></td>
                    <td style="width: 136px; height: 37px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 44px; text-align: right;">
                        <span style="font-size: 9pt">角色：</span></td>
                    <td style="width: 168px; height: 44px; text-align: center;">
                        <span style="font-size: 9pt">
                        <asp:DropDownList ID="DdlRole" runat="server" Width="99px" ForeColor="Red">
                            <asp:ListItem Selected="True">普通用户</asp:ListItem>
                        </asp:DropDownList></span></td>
                    <td style="width: 72px; height: 44px;" align="left">
                        </td>
                    <td align="left" style="width: 123px; height: 44px; text-align: center">
                        <span style="font-size: 9pt">个人地址：</span></td>
                    <td align="left" style="width: 174px; height: 44px; text-align: center">
                        <asp:TextBox ID="TxtAddress" runat="server" Width="125px"></asp:TextBox></td>
                    <td style="width: 136px; height: 44px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 36px; text-align: right;">
                        <span style="font-size: 9pt">真实姓名：</span></td>
                    <td style="width: 168px; height: 36px; text-align: right;">
                        <span style="font-size: 9pt">
                        <asp:TextBox ID="TxtTrueName" runat="server" Width="125px"></asp:TextBox></span></td>
                    <td style="width: 72px; height: 36px; text-align: center;" align="left">
                        <asp:RequiredFieldValidator ID="RfvTrueName" runat="server" ErrorMessage="真实姓名不能为空"
                            Font-Size="9pt" ControlToValidate="TxtTrueName" Display="Dynamic"></asp:RequiredFieldValidator></td>
                    <td align="left" style="width: 123px; height: 36px; text-align: center">
                        <span style="font-size: 9pt">个人主页：</span></td>
                    <td align="left" style="width: 174px; height: 36px; text-align: center">
                        <asp:TextBox ID="Txthomepage" runat="server" Width="125px">http://www.mrbccd.com</asp:TextBox></td>
                    <td style="width: 136px; height: 36px">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txthomepage"
                            ErrorMessage="格式不正确" Font-Size="9pt" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">取回密码提示：</span></td>
                    <td style="width: 168px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">
                        <asp:TextBox ID="TxtRetakePwd" runat="server" Width="125px"></asp:TextBox></span></td>
                    <td style="width: 72px; height: 37px; text-align: center;" align="left">
                        <asp:RequiredFieldValidator ID="RfvAnswerPwd" runat="server" ErrorMessage="取回密码提示不能为空"
                            Font-Size="9pt" ControlToValidate="TxtRetakePwd" Display="Dynamic" Width="78px"></asp:RequiredFieldValidator></td>
                    <td align="left" style="width: 123px; height: 37px; text-align: center">
                        <span style="font-size: 9pt">个人简介：</span></td>
                    <td align="left" style="width: 174px; height: 37px; text-align: center">
                        <asp:TextBox ID="TxtIntro" runat="server" Height="33px" Width="125px" TextMode="MultiLine"></asp:TextBox></td>
                    <td style="width: 136px; height: 37px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">取回密码回答：</span></td>
                    <td style="width: 168px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">
                        <asp:TextBox ID="txtAnswerPassWord" runat="server" Width="125px"></asp:TextBox></span></td>
                    <td style="width: 72px; height: 37px; text-align: center;">
                        <asp:RequiredFieldValidator ID="RfvAnswerPassWord" runat="server" ControlToValidate="txtAnswerPassWord"
                            Display="Dynamic" ErrorMessage="取回密码回答不能为空" Font-Size="9pt" Width="74px"></asp:RequiredFieldValidator></td>
                    <td style="width: 123px; height: 37px; text-align: center">
                        <span style="font-size: 9pt">头像：</span></td>
                    <td style="width: 174px; height: 37px">
                        <asp:DropDownList ID="ddlPhoto" runat="server" AutoPostBack="True" Font-Size="9pt"
                            OnSelectedIndexChanged="ddlPhoto_SelectedIndexChanged" Width="127px">
                        </asp:DropDownList></td>
                    <td style="width: 136px; height: 37px" align="left">
                        </td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 39px; text-align: right;">
                        <span style="font-size: 9pt">性别：</span></td>
                    <td style="width: 168px; height: 39px; text-align: center;">
                        <span style="font-size: 9pt">
                        <asp:DropDownList ID="ddlSex" runat="server" ForeColor="Red" Width="100px">
                            <asp:ListItem Selected="True">男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:DropDownList></span></td>
                    <td style="width: 72px; height: 39px" align="left">
                        </td>
                    <td align="left" style="width: 123px; height: 39px">
                        <asp:Image ID="ImgT" runat="server" ImageUrl="~/image/t.jpg" /></td>
                    <td align="left" style="width: 174px; height: 39px; text-align: center">
                        <asp:Image ID="imgPhoto" runat="server" Height="120px" Width="120px" /></td>
                    <td style="width: 136px; height: 39px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">年龄：</span></td>
                    <td style="width: 168px; height: 37px; text-align: right;">
                        <span style="font-size: 9pt">
                        <asp:TextBox ID="TxtAge" runat="server" Width="125px"></asp:TextBox></span></td>
                    <td style="width: 72px; height: 37px; text-align: center;">
                        <asp:RequiredFieldValidator ID="RfvAge" runat="server" ControlToValidate="TxtAge"
                            Display="Dynamic" ErrorMessage="年龄不能为空" Font-Size="9pt"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RvAge" runat="server" ControlToValidate="TxtAge"
                            Display="Dynamic" ErrorMessage="必须输入数字.且100>年龄>18" Font-Size="Small" MaximumValue="100"
                            MinimumValue="18" Type="Integer" Width="96px" Height="16px"></asp:RangeValidator></td>
                    <td style="width: 123px; height: 37px">
                    </td>
                    <td style="width: 174px; height: 37px">
                    </td>
                    <td style="width: 136px; height: 37px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 39px">
                        <span style="font-size: 9pt"></span>
                    </td>
                    <td style="width: 168px; height: 39px">
                        <span style="font-size: 9pt">
                        <asp:ImageButton ID="ImgBtnReg" runat="server" ImageUrl="~/image/zc.jpg" OnClick="ImgBtnReg_Click" /></span></td>
                    <td style="width: 72px; height: 39px">
                        </td>
                    <td style="width: 123px; height: 39px">
                        <asp:ImageButton ID="ImgCz" runat="server" ImageUrl="~/image/cz.jpg" CausesValidation="False" OnClick="ImgCz_Click" /></td>
                    <td style="width: 174px; height: 39px">
                    </td>
                    <td style="width: 136px; height: 39px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 326px; height: 38px">
                        <span style="font-size: 9pt"></span>
                    </td>
                    <td style="width: 168px; height: 38px">
                        <span style="font-size: 9pt"></span></td>
                    <td style="width: 72px; height: 38px">
                        </td>
                    <td style="width: 123px; height: 38px">
                    </td>
                    <td style="width: 174px; height: 38px">
                    </td>
                    <td style="width: 136px; height: 38px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6">
                        &nbsp;<uc1:foot ID="Foot1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
