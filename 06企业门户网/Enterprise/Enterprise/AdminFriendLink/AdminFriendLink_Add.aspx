<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminFriendLink_Add.aspx.cs" Inherits="AdminFriendLink_Add" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table cellpadding="0" cellspacing="0" style="background-image: url(../image/后台页.jpg);
        width: 534px; height: 171px">
        <tr>
            <td colspan="1" style="width: 100px">
            </td>
            <td colspan="4" style="width: 411px; text-align: center">
            </td>
            <td colspan="1" style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="1" style="width: 100px; height: 31px; text-align: left">
            </td>
            <td align="center" colspan="4" style="width: 411px; height: 31px; text-align: center">
                <span style="font-size: 9pt">= 添加友情链接 =</span></td>
            <td colspan="1" style="width: 100px; height: 31px; text-align: left">
            </td>
        </tr>
        <tr>
            <td align="left" colspan="1" style="width: 100px; text-align: center">
            </td>
            <td align="left" colspan="4" style="width: 411px; text-align: center">
                <table>
                    <tr>
                        <td style="width: 57px; height: 33px">
                        </td>
                        <td style="width: 82px; height: 33px">
                            <span style="font-size: 9pt">上传时间</span></td>
                        <td colspan="2" style="font-size: 12pt; height: 33px">
                            <asp:TextBox ID="TxtTime" runat="server" Width="166px"></asp:TextBox></td>
                        <td colspan="1" style="font-size: 12pt; height: 33px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTime"
                                Display="Dynamic" ErrorMessage="不能为空" Font-Size="9pt"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtTime"
                                Display="Dynamic" ErrorMessage="格式不正确，格式应为2008-08-08" Font-Size="9pt" Height="39px"
                                Operator="DataTypeCheck" Type="Date" Width="72px"></asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 57px; height: 27px">
                        </td>
                        <td style="width: 82px; height: 27px">
                            <span style="font-size: 9pt">链接地址</span></td>
                        <td colspan="2" style="height: 27px">
                            <asp:TextBox ID="txtAddress" runat="server" Font-Size="9pt" Width="166px">http://www.mrbccd.com</asp:TextBox></td>
                        <td colspan="1" style="height: 27px">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAddress"
                                ErrorMessage="格式不正确" Font-Size="9pt" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 57px; height: 30px">
                        </td>
                        <td style="width: 82px; height: 30px">
                            <span style="font-size: 9pt">链接图片</span></td>
                        <td colspan="2" style="height: 30px">
                            <table id="Tab_UpDownFile" runat="server" cellpadding="0" cellspacing="0" enableviewstate="true">
                                <tr>
                                    <td style="width: 100px; height: 30px">
                                        <asp:FileUpload ID="FileUpload1" runat="server" Height="20px" Width="178px" /></td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="1" style="height: 30px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 57px; height: 72px">
                        </td>
                        <td style="width: 82px; height: 72px">
                        </td>
                        <td colspan="2" style="height: 72px">
                            <asp:Label ID="LblImage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label><asp:Label
                                ID="LblMessage" runat="server" Font-Bold="True" ForeColor="#FF0033" Width="116px"></asp:Label></td>
                        <td colspan="1" style="height: 72px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 57px">
                        </td>
                        <td style="width: 82px">
                        </td>
                        <td align="right" style="width: 78px">
                            <asp:Button ID="btnAdd" runat="server" Font-Size="9pt" OnClick="btnAdd_Click"
                                Text="添加" />
                        </td>
                        <td align="left" style="width: 45px">
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" Font-Size="9pt"
                                OnClick="Button1_Click" Text="返回" />
                        </td>
                        <td align="left" style="width: 80px">
                        </td>
                    </tr>
                </table>
                &nbsp;&nbsp;
            </td>
            <td align="left" colspan="1" style="width: 100px; text-align: center">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 60px;">
            </td>
            <td colspan="4" style="width: 55px; height: 60px;">
            </td>
            <td style="width: 100px; height: 60px;">
            </td>
        </tr>
    </table>
</asp:Content>

