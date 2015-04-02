<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminUser_Add.aspx.cs" Inherits="AdminUser_AdminUser_Add" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="background-image: url(../image/LeaveWordB.jpg); width: 98%; text-align: left;">
        <tr>
            <td colspan="6" style="height: 20px; text-align: center">
                <span style="font-size: 9pt">添加用户信息</span></td>
        </tr>
        <tr>
            <td style="width: 315px; height: 67px">
                <span style="font-size: 9pt">用户名：</span></td>
            <td style="width: 81px; height: 67px; text-align: left;">
                <asp:TextBox ID="TxtUserName" runat="server" Width="92px"></asp:TextBox></td>
            <td style="width: 79px; height: 67px">
                <asp:RequiredFieldValidator ID="RequiredRfvName" runat="server" ControlToValidate="TxtUserName"
                    Display="Dynamic" ErrorMessage="用户名不能为空" Font-Size="9pt" Height="27px" Width="75px"></asp:RequiredFieldValidator></td>
            <td style="width: 58px; height: 67px">
                <span style="font-size: 9pt">电话号码：</span></td>
            <td style="width: 100px; height: 67px">
                <asp:TextBox ID="TxtTel" runat="server" Width="92px"></asp:TextBox></td>
            <td style="width: 82px; height: 67px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtTel"
                    Display="Dynamic" ErrorMessage="电话号码不能为空" Font-Size="9pt"></asp:RequiredFieldValidator>&nbsp;
                <asp:RegularExpressionValidator ID="revydtel" runat="server" ControlToValidate="TxtTel"
                    Display="Dynamic" ErrorMessage="移动电话格式只能是数字" Font-Size="Small" Height="30px"
                    ValidationExpression="\d*" Width="57px"></asp:RegularExpressionValidator></td>
        </tr>
        <tr style="font-size: 9pt; color: #000000">
            <td style="width: 315px">
                <span>密码：</span></td>
            <td style="width: 81px">
                <asp:TextBox ID="TxtUserPwd" runat="server" TextMode="Password" Width="92px"></asp:TextBox></td>
            <td style="width: 79px">
                <asp:RequiredFieldValidator ID="RfvUserPwd" runat="server" ControlToValidate="TxtUserPwd"
                    Display="Dynamic" ErrorMessage="密码不能为空" Font-Size="9pt"></asp:RequiredFieldValidator></td>
            <td style="width: 58px; color: #000000">
                <span style="font-size: 9pt">Email：</span></td>
            <td style="width: 100px">
                <asp:TextBox ID="TxtEmail" runat="server" Width="95px"></asp:TextBox></td>
            <td style="width: 82px">
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TxtEmail"
                    Display="Dynamic" ErrorMessage="Email不能为空" Font-Size="9pt"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="请按邮箱的格式填写" runat="server" ControlToValidate="TxtEmail" Display="Dynamic"
                        ErrorMessage="格式不正确" Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        Width="77px"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="width: 315px; height: 58px;">
                <span style="font-size: 9pt">确认密码：</span></td>
            <td style="width: 81px; height: 58px; text-align: left;">
                <asp:TextBox ID="TxtTruePwd" runat="server" Height="17px" TextMode="Password" Width="92px"></asp:TextBox></td>
            <td style="width: 79px; height: 58px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTruePwd"
                    Display="Dynamic" ErrorMessage="确认密码不能为空" Font-Size="9pt"></asp:RequiredFieldValidator><asp:CompareValidator
                        ID="cvPwd" runat="server" ControlToCompare="TxtUserPwd" ControlToValidate="TxtTruePwd"
                        Display="Dynamic" ErrorMessage="两次输入的密码不一致" Font-Size="9pt"></asp:CompareValidator></td>
            <td style="width: 58px; height: 58px;">
                <span style="font-size: 9pt">QQ：</span></td>
            <td style="width: 100px; height: 58px;">
                <asp:TextBox ID="TxtQQ" runat="server" Height="17px" Width="92px"></asp:TextBox></td>
            <td style="width: 82px; height: 58px;">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtQQ"
                    Display="Dynamic" ErrorMessage="QQ号码只能是数字" Font-Size="9pt" ValidationExpression="\d*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="width: 315px">
                <span style="font-size: 9pt">角色：</span></td>
            <td style="width: 81px">
                <asp:DropDownList ID="DdlRole" runat="server" ForeColor="Red" Width="99px">
                    <asp:ListItem Selected="True">普通用户</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 79px">
            </td>
            <td style="width: 58px">
                <span style="font-size: 9pt">个人地址：</span></td>
            <td style="width: 100px">
                <asp:TextBox ID="TxtAddress" runat="server" Width="92px"></asp:TextBox></td>
            <td style="width: 82px">
            </td>
        </tr>
        <tr>
            <td style="width: 315px">
                <span style="font-size: 9pt">真实姓名：</span></td>
            <td style="width: 81px">
                <asp:TextBox ID="TxtTrueName" runat="server" Width="92px"></asp:TextBox></td>
            <td style="width: 79px">
            </td>
            <td style="width: 58px">
                <span style="font-size: 9pt">个人主页：</span></td>
            <td style="width: 100px">
                <asp:TextBox ID="Txthomepage" runat="server" Width="92px">http://www.mrbccd.com</asp:TextBox></td>
            <td style="width: 82px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txthomepage"
                    ErrorMessage="格式不正确" Font-Size="9pt" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="width: 315px">
                <span style="font-size: 9pt">取回密码提示：</span></td>
            <td style="width: 81px; text-align: left;">
                <asp:TextBox ID="TxtRetakePwd" runat="server" Width="92px"></asp:TextBox></td>
            <td style="width: 79px">
                <asp:RequiredFieldValidator ID="RfvAnswerPwd" runat="server" ControlToValidate="TxtRetakePwd"
                    Display="Dynamic" ErrorMessage="取回密码提示不能为空" Font-Size="9pt" Width="78px"></asp:RequiredFieldValidator></td>
            <td style="width: 58px">
                <span style="font-size: 9pt">个人简介：</span></td>
            <td style="width: 100px">
                <asp:TextBox ID="TxtIntro" runat="server" Height="40px" Width="95px" TextMode="MultiLine"></asp:TextBox></td>
            <td style="width: 82px">
            </td>
        </tr>
        <tr>
            <td style="width: 315px">
                <span style="font-size: 9pt">取回密码回答：</span></td>
            <td style="width: 81px">
                <asp:TextBox ID="txtAnswerPassWord" runat="server" Width="92px"></asp:TextBox></td>
            <td style="width: 79px">
                <asp:RequiredFieldValidator ID="RfvAnswerPassWord" runat="server" ControlToValidate="txtAnswerPassWord"
                    Display="Dynamic" ErrorMessage="取回密码回答不能为空" Font-Size="9pt" Width="74px"></asp:RequiredFieldValidator></td>
            <td style="width: 58px">
                <span style="font-size: 9pt">头像：</span></td>
            <td style="width: 100px">
                <asp:DropDownList ID="ddlPhoto" runat="server" AutoPostBack="True" Font-Size="9pt"
                    OnSelectedIndexChanged="ddlPhoto_SelectedIndexChanged" Width="102px">
                </asp:DropDownList></td>
            <td style="width: 82px">
            </td>
        </tr>
        <tr>
            <td style="width: 315px">
                <span style="font-size: 9pt">性别：</span></td>
            <td style="width: 81px">
                <asp:DropDownList ID="ddlSex" runat="server" ForeColor="Red" Width="96px">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 79px">
            </td>
            <td style="width: 58px">
            </td>
            <td style="width: 100px">
                <asp:Image ID="imgPhoto" runat="server" Height="94px" Width="94px" /></td>
            <td style="width: 82px">
            </td>
        </tr>
        <tr>
            <td style="width: 315px">
                <span style="font-size: 9pt">年龄：</span></td>
            <td style="width: 81px">
                <asp:TextBox ID="TxtAge" runat="server" Width="92px"></asp:TextBox></td>
            <td style="width: 79px">
                <asp:RequiredFieldValidator ID="RfvAge" runat="server" ControlToValidate="TxtAge"
                    Display="Dynamic" ErrorMessage="年龄不能为空" Font-Size="9pt"></asp:RequiredFieldValidator><asp:RangeValidator
                        ID="RangeValidator2" runat="server" ControlToValidate="TxtAge" Display="Dynamic"
                        ErrorMessage="必须输入数字.且100>年龄>18" Font-Size="Small" Height="24px" MaximumValue="100"
                        MinimumValue="18" Type="Integer" Width="76px"></asp:RangeValidator></td>
            <td style="width: 58px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 82px">
            </td>
        </tr>
        <tr>
            <td style="width: 315px">
            </td>
            <td style="width: 81px; text-align: center;">
                <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" SkinID="btnSkin"
                    Text="添加" Width="46px" /></td>
            <td style="width: 79px">
            </td>
            <td style="width: 58px">
            </td>
            <td style="width: 100px; text-align: center;">
                <asp:Button ID="BtnCancel" runat="server" SkinID="btnSkin" Text="取消" Width="50px" OnClick="BtnCancel_Click" CausesValidation="False" /></td>
            <td style="width: 82px">
            </td>
        </tr>
        <tr>
            <td style="width: 315px">
            </td>
            <td style="width: 81px">
            </td>
            <td style="width: 79px">
            </td>
            <td style="width: 58px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 82px">
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

