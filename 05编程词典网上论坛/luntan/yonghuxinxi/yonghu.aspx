<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yonghu.aspx.cs" Inherits="yonghu" %>

<%@ Register Src="../UserControl/foot.ascx" TagName="foot" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编程词典网上论坛</title>
</head>
<body >
    <form id="form1" runat="server">
        <div style="text-align: center">
            <table border="1" style="width: 730px">
                <tr>
                    <td style="width: 100px; height: 145px;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/image/index_02.gif" /></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <table border="0" style="width: 82%">
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="Label7" runat="server" Font-Size="9pt" Text="欢迎光临编程词典网上论坛 ！" Width="170px" ForeColor="#C04000"></asp:Label></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        OnClick="LinkButton2_Click" Width="100px" CausesValidation="False">用户信息管理</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image7" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" ForeColor="Blue"
                                        OnClick="LinkButton3_Click" Width="120px" CausesValidation="False">修改当前用户信息</asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image3" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="LinkButton6" runat="server" Font-Size="9pt" 
                                        Width="100px" OnClick="LinkButton6_Click" CausesValidation="False">用户信息查询 </asp:LinkButton></td>
                                <td style="width: 100px">
                                    <asp:Image ID="Image4" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                        Width="12px" /></td>
                                <td style="width: 177px">
                                    <asp:LinkButton ID="LinkButton7" runat="server" Font-Size="9pt" ForeColor="Blue"
                                         Width="80px" OnClick="LinkButton7_Click" CausesValidation="False">用户登录</asp:LinkButton></td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 806064px">
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" CausesValidation="False" OnClick="ImageButton2_Click"
                                        /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="font-family: Times New Roman">
                    <td align="center" style="width: 100px">
                        <table style="width: 704px; height: 178px">
                            <tr>
                                <td colspan="4" style="height: 16px">
                                    &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="华文新魏" Font-Size="24px"
                            Text="用户列表"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 107px; height: 16px">
                                </td>
                                <td colspan="2" style="height: 16px">
                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="华文新魏" ForeColor="Blue"
                            OnClick="LinkButton1_Click">添加</asp:LinkButton>
                                    &nbsp; &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" Font-Names="华文新魏" ForeColor="Blue"
                            OnClick="LinkButton2_Click">查询</asp:LinkButton>
                                    &nbsp; &nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" Font-Names="华文新魏" Font-Size="Medium"
                            OnClick="LinkButton3_Click">返回首页</asp:LinkButton>&nbsp;</td>
                                <td align="center" style="width: 81px; height: 16px">
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 107px; height: 4px">
                                </td>
                                <td align="center" colspan="2" rowspan="5">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" Font-Size="Small" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting"
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="99%" OnRowDataBound="GridView1_RowDataBound">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="UserId" HeaderText="用户编号" />
                                <asp:BoundField DataField="UserName" HeaderText="用户姓名" />
                                <asp:BoundField DataField="Ename" HeaderText="英文姓名" />
                                <asp:BoundField DataField="Email" HeaderText="电子邮箱" />
                                <asp:CommandField ShowDeleteButton="True" HeaderText="删除" />
                                <asp:HyperLinkField DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="yonghuxiugai.aspx?UserId={0}"
                                    Text="修改" HeaderText="修改" />
                            </Columns>
                            <RowStyle BackColor="#EFF3FB" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BorderStyle="None" Font-Bold="True" ForeColor="White" BackColor="#507CD1" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                                    &nbsp;&nbsp;
                                </td>
                                <td style="font-size: 12pt; width: 81px; font-family: Times New Roman; height: 4px">
                                    &nbsp;</td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td align="right" style="width: 107px">
                                </td>
                                <td style="width: 81px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td align="center" style="width: 107px">
                                </td>
                                <td align="center" style="width: 81px">
                                    &nbsp;</td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td style="width: 107px; height: 30px">
                                </td>
                                <td style="width: 81px; height: 30px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td style="width: 107px">
                                </td>
                                <td style="width: 81px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td colspan="1" style="width: 107px">
                                </td>
                                <td colspan="3">
                                    <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Maroon" Text="提示：不能删除姓名为Tsoft（管理员）的信息"></asp:Label>&nbsp;</td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td style="width: 107px">
                                </td>
                                <td style="width: 89px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 81px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td colspan="1" style="width: 107px">
                                </td>
                                <td colspan="3">
                                    </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td style="width: 100px">
                        <uc1:foot ID="Foot1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
