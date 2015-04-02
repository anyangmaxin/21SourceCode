<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yonghuchaxun.aspx.cs" Inherits="yonghuchaxun" %>

<%@ Register Src="../UserControl/foot.ascx" TagName="foot" TagPrefix="uc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编程词典网上论坛</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <div>
                <div>
                    <div style="text-align: center">
                        <table border="1" style="width: 680px">
                            <tr>
                                <td style="width: 690px" align="center">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/image/index_02.gif" /></td>
                            </tr>
                            <tr>
                                <td style="width: 690px; height: 17px">
                                    <table border="0" style="width: 82%">
                                        <tr>
                                            <td style="width: 100px">
                                                <asp:Label ID="Label7" runat="server" Font-Size="9pt" Text="欢迎光临编程词典网上论坛 ！" Width="180px" ForeColor="#C04000"></asp:Label></td>
                                            <td style="width: 100px">
                                                <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="9pt" ForeColor="Blue"
                                                     Width="80px" OnClick="LinkButton2_Click">用户信息管理</asp:LinkButton></td>
                                            <td style="width: 100px">
                                                <asp:Image ID="Image7" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                                    Width="12px" /></td>
                                            <td style="width: 100px">
                                                <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="9pt" ForeColor="Blue"
                                                     Width="100px" OnClick="LinkButton3_Click">修改当前用户信息</asp:LinkButton></td>
                                            <td style="width: 100px">
                                                <asp:Image ID="Image3" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                                    Width="12px" /></td>
                                            <td style="width: 100px">
                                                <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" 
                                                    Width="80px" OnClick="LinkButton5_Click">用户信息查询 </asp:LinkButton></td>
                                            <td style="width: 100px">
                                                <asp:Image ID="Image4" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                                    Width="12px" /></td>
                                            <td style="width: 177px">
                                                <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                                    Width="60px" OnClick="LinkButton4_Click">用户登录</asp:LinkButton></td>
                                            <td style="width: 177px">
                                                <asp:Image ID="Image5" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                                    Width="12px" /></td>
                                            <td style="width: 133px">
                                                <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" OnClick="lbtnsy_Click"
                                                    Width="80px">返回首页</asp:LinkButton></td>
                                            <td style="width: 815121px">
                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" OnClick="ImageButton2_Click"
                                                     /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 690px; height: 17px">
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 690px; height: 17px">
                                    <div style="text-align: center">
                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="华文新魏" Font-Size="X-Large"
                                                    ForeColor="Brown" Width="706px">用户信息查询</asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 690px; height: 17px">
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 690px; height: 17px">
                                    <table style="width: 754px">
                                        <tr>
                                            <td style="width: 100px; height: 26px">
                                            </td>
                                            <td style="width: 100px; height: 26px">
                                                &nbsp;<asp:RadioButton ID="RadioButton1" runat="server" Font-Size="Small" GroupName="a"
                                                    Text="用户编号" Width="119px" /></td>
                                            <td style="width: 100px; height: 26px">
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                            <td style="width: 100px; height: 26px">
                                                <asp:RadioButton ID="RadioButton2" runat="server" Font-Size="Small" GroupName="a"
                                                    Text="用户名称" Width="91px" /></td>
                                            <td style="width: 100px; height: 26px">
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                            <td style="width: 100px; height: 26px">
                                                <asp:Button ID="btnselect" runat="server" Text="查询" OnClick="btnselect_Click" /></td>
                                            <td style="width: 100px; height: 26px">
                                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="全部显示" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 690px; height: 17px">
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                    ForeColor="#333333" GridLines="None"  AllowPaging="True" Height="149px"  OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" Width="620px" Font-Names="华文行楷" Font-Size="11pt" OnRowDataBound="GridView1_RowDataBound">
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:ImageField DataImageUrlField="Logo" HeaderText="头像">
                                                        </asp:ImageField>
                                                        <asp:BoundField DataField="UserId" HeaderText="用户编号" />
                                                        <asp:BoundField DataField="UserName" HeaderText="用户名称" />
                                                        <asp:BoundField DataField="Ename" HeaderText="英文姓名" />
                                                        <asp:BoundField DataField="Email" HeaderText="电子邮箱" />
                                                        <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                                        <asp:HyperLinkField DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="~/dangqianxinxi/xiangxixinxi.aspx?UserId={0}"
                                                            HeaderText="详细信息" Text="详细信息" />
                                                    </Columns>
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 690px; height: 17px">
                                    <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Maroon" Text="提示：不能删除姓名为Tsoft（管理员）的信息"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 690px; height: 17px">
                                    <uc1:foot ID="Foot1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
