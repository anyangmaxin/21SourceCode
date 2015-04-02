<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminUser_Delete.aspx.cs" Inherits="AdminUser_AdminUser_Delete" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="background-image: url(../image/LeaveWordB.jpg); width: 98%">
        <tr>
            <td colspan="6" style="height: 20px; text-align: center">
                <span style="font-size: 9pt">删除用户信息</span></td>
        </tr>
        <tr>
            <td style="width: 281px; height: 67px">
                <span style="font-size: 9pt">用户名：</span></td>
            <td style="width: 88px; height: 67px">
                <asp:TextBox ID="TxtUserName" runat="server" Width="95px"></asp:TextBox></td>
            <td style="width: 48px; height: 67px">
                <asp:RequiredFieldValidator ID="RequiredRfvName" runat="server" ControlToValidate="TxtUserName"
                    Display="Dynamic" ErrorMessage="用户名不能为空" Font-Size="9pt" Height="30px" Width="51px"></asp:RequiredFieldValidator></td>
            <td style="width: 219px; height: 67px">
                <span style="font-size: 9pt">电话：</span></td>
            <td style="width: 203px; height: 67px">
                <asp:TextBox ID="TxtTel" runat="server" Width="92px"></asp:TextBox></td>
            <td style="width: 100px; height: 67px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtTel"
                    Display="Dynamic" ErrorMessage="电话号码不能为空" Font-Size="9pt" Width="50px"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="revydtel" runat="server" ControlToValidate="TxtTel" Display="Dynamic" ErrorMessage="移动电话格式只能是数字"
                        Font-Size="Small" ValidationExpression="\d*" Height="30px" Width="57px"></asp:RegularExpressionValidator></td>
        </tr>
        <tr style="font-size: 9pt; color: #000000">
            <td style="width: 281px">
                <span>Email：</span></td>
            <td style="width: 88px">
                <asp:TextBox ID="TxtEmail" runat="server" Width="95px"></asp:TextBox></td>
            <td style="width: 48px">
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TxtEmail"
                    Display="Dynamic" ErrorMessage="Email不能为空" Font-Size="9pt"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="请按邮箱的格式填写" runat="server" ControlToValidate="TxtEmail" Display="Dynamic"
                        ErrorMessage="格式不正确" Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        Width="62px"></asp:RegularExpressionValidator></td>
            <td style="width: 219px; color: #000000">
                <span>QQ：</span></td>
            <td style="width: 203px">
                <asp:TextBox ID="TxtQQ" runat="server" Height="17px" Width="95px"></asp:TextBox></td>
            <td style="width: 100px">
                </td>
        </tr>
        <tr>
            <td style="width: 281px">
                <span style="font-size: 9pt">角色：</span></td>
            <td style="width: 88px">
                <asp:DropDownList ID="DdlRole" runat="server" ForeColor="Red" Width="99px">
                    <asp:ListItem Selected="True">普通用户</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 48px">
            </td>
            <td style="width: 219px">
                <span style="font-size: 9pt">个人地址：</span></td>
            <td style="width: 203px">
                <asp:TextBox ID="TxtAddress" runat="server" Width="95px"></asp:TextBox></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 281px">
                <span style="font-size: 9pt">真实姓名：</span></td>
            <td style="width: 88px">
                <asp:TextBox ID="TxtTrueName" runat="server" Width="95px"></asp:TextBox></td>
            <td style="width: 48px">
            </td>
            <td style="width: 219px">
                <span style="font-size: 9pt">个人主页：</span></td>
            <td style="width: 203px">
                <asp:TextBox ID="Txthomepage" runat="server" Width="95px"></asp:TextBox></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 281px">
                <span style="font-size: 9pt">取回密码提示：</span></td>
            <td style="width: 88px">
                <asp:TextBox ID="TxtRetakePwd" runat="server" Width="95px"></asp:TextBox></td>
            <td style="width: 48px">
                <asp:RequiredFieldValidator ID="RfvAnswerPwd" runat="server" ControlToValidate="TxtRetakePwd"
                    Display="Dynamic" ErrorMessage="取回密码提示不能为空" Font-Size="9pt" Width="64px"></asp:RequiredFieldValidator></td>
            <td style="width: 219px">
                <span style="font-size: 9pt">个人简介：</span></td>
            <td style="width: 203px">
                <asp:TextBox ID="TxtIntro" runat="server" Height="15px" TextMode="MultiLine" Width="95px"></asp:TextBox></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 281px">
                <span style="font-size: 9pt">取回密码回答：</span></td>
            <td style="width: 88px">
                <asp:TextBox ID="txtAnswerPassWord" runat="server" Width="95px"></asp:TextBox></td>
            <td style="width: 48px">
                <asp:RequiredFieldValidator ID="RfvAnswerPassWord" runat="server" ControlToValidate="txtAnswerPassWord"
                    Display="Dynamic" ErrorMessage="取回密码回答不能为空" Font-Size="9pt" Width="64px"></asp:RequiredFieldValidator></td>
            <td style="width: 219px">
                <span style="font-size: 9pt">头像：</span></td>
            <td style="width: 203px">
                <asp:DropDownList ID="ddlPhoto" runat="server" AutoPostBack="True" Font-Size="9pt"
                    OnSelectedIndexChanged="ddlPhoto_SelectedIndexChanged" Width="95px">
                </asp:DropDownList></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 281px">
                <span style="font-size: 9pt">性别：</span></td>
            <td style="width: 88px">
                <asp:DropDownList ID="ddlSex" runat="server" ForeColor="Red" Width="100px">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 48px">
            </td>
            <td style="width: 219px">
            </td>
            <td style="width: 203px">
                <asp:Image ID="imgPhoto" runat="server" Height="94px" Width="94px" /></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 281px">
                <span style="font-size: 9pt">年龄：</span></td>
            <td style="width: 88px">
                <asp:TextBox ID="TxtAge" runat="server" Width="95px"></asp:TextBox></td>
            <td style="width: 48px">
                <asp:RequiredFieldValidator ID="RfvAge" runat="server" ControlToValidate="TxtAge"
                    Display="Dynamic" ErrorMessage="年龄不能为空" Font-Size="9pt"></asp:RequiredFieldValidator><asp:RangeValidator
                        ID="RangeValidator2" runat="server" ControlToValidate="TxtAge" Display="Dynamic"
                        ErrorMessage="必须输入数字.且100>年龄>18" Font-Size="Small" Height="24px" MaximumValue="100"
                        MinimumValue="18" Type="Integer" Width="59px"></asp:RangeValidator></td>
            <td style="width: 219px">
            </td>
            <td style="width: 203px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 281px; height: 25px;">
            </td>
            <td style="width: 88px; height: 25px;">
                <asp:Button ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" SkinID="btnSkin"
                    Text="删除" Width="56px" /></td>
            <td style="width: 48px; height: 25px;">
            </td>
            <td style="width: 219px; height: 25px;">
            </td>
            <td style="width: 203px; height: 25px;">
                <asp:Button ID="BtnReturn" runat="server" OnClick="BtnReturn_Click" SkinID="btnSkin"
                    Text="返回" Width="56px" /></td>
            <td style="width: 100px; height: 25px;">
            </td>
        </tr>
        <tr>
            <td style="width: 281px">
            </td>
            <td style="width: 88px">
            </td>
            <td style="width: 48px">
            </td>
            <td style="width: 219px">
            </td>
            <td style="width: 203px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
    </table>
</asp:Content>

