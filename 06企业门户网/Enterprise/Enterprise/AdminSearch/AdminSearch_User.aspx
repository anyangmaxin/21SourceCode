<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminSearch_User.aspx.cs" Inherits="AdminSearch" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 100%; background-color: #ffffff">
            <tr>
                <td colspan="4">
                    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; background-image: url(../image/后台页.jpg);
                        width: 529px; height: 334px">
                        <tr>
                            <td align="center" colspan="3" style="height: 24px; text-align:center">
                                用户查找</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3" style="text-align: center">
                                <asp:Label ID="Label1" runat="server" Text="搜索条件："></asp:Label>
                                <asp:DropDownList ID="ddlCondition" runat="server" Width="79px">
                                    <asp:ListItem Value="UserId">编号</asp:ListItem>
                                    <asp:ListItem Value="Sex">性别</asp:ListItem>
                                    <asp:ListItem Value="role">权限</asp:ListItem>
                                    <asp:ListItem Value="Age">年龄</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="Label3" runat="server" Text="搜索关键字："></asp:Label>
                                <asp:TextBox ID="txtKey" runat="server" Width="135px"></asp:TextBox>
                                <asp:Button ID="btnSel" runat="server" Height="20px"  Text="搜索"
                                    Width="58px" OnClick="btnSel_Click" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="vertical-align: top; height: 181px; text-align: center">
                                <br />
                                <asp:GridView ID="gvUserInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CellPadding="4" Font-Size="9pt" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvUserInfo_PageIndexChanging"
                                    PageSize="8" Width="410px">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="UserId" HeaderText="编号" />
                                        <asp:BoundField DataField="UserName" HeaderText="姓名" />
                                        <asp:BoundField DataField="Sex" HeaderText="性别" />
                                        <asp:BoundField DataField="Age" HeaderText="年龄" />
                                        <asp:BoundField DataField="role" HeaderText="权限（角色）" />
                                        <asp:HyperLinkField HeaderText="详细信息" Text="详细信息" DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="AdminSelect_UserInfo.aspx?UserId={0}">
                                            <ControlStyle Font-Underline="False" ForeColor="Black" />
                                        </asp:HyperLinkField>
                                    </Columns>
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EditRowStyle BackColor="#999999" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#CBCF7A" ForeColor="Black" HorizontalAlign="Right" />
                                    <HeaderStyle BackColor="#CBCF7A" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 72px">
                    &nbsp;
                    <asp:Image ID="ImgT" runat="server" ImageUrl="~/image/search.gif" /></td>
            </tr>
        </table>
    </div>
</asp:Content>

