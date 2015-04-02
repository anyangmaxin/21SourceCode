<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编程词典网上论坛</title>
    <link href="css.css" rel="stylesheet" type="text/css">
    <style type="text/css">
<!--
body,td,th {
	font-size: 14px;
}
-->
</style>


</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
            <table border="0" style="width: 800px">
                <tr>
                    <td style="width: 807px" align="center">
                  
                        <div style="text-align: center">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td style="width: 100px; height: 161px;">
                                    </td>
                                    <td style="width: 100px; height: 161px;">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/image/index_02.gif" Width="863px" /></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 807px; height: 44px;">
                        <div style="text-align: center">
                            <table border="0" style="width: 131%">
                                <tr>
                                    <td colspan="6" style="width: 76px">
                                        <div style="text-align: center">
                                            <table border="0" width="100%">
                                                <tr>
                                                    <td style="width: 120px; height: 26px;">
                                        <asp:Label ID="Label7" runat="server" Font-Size="9pt" Text="欢迎光临编程词典网上论坛 ！" Width="210px" ForeColor="#C00000"></asp:Label></td>
                                                    <td style="width: 100px; height: 26px;">
                                        <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="9pt" ForeColor="Blue"
                                             Width="100px" OnClick="LinkButton2_Click">用户信息管理</asp:LinkButton></td>
                                                    <td style="width: 100px; height: 26px" valign="middle">
                                                        &nbsp;</td>
                                                    <td style="width: 100px; height: 26px;">
                                        <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="9pt" ForeColor="Blue"
                                             Width="140px" OnClick="LinkButton3_Click">修改当前用户信息</asp:LinkButton></td>
                                                    <td style="width: 433px; height: 26px">
                                                        </td>
                                                    <td style="width: 100px; height: 26px;">
                                        <asp:LinkButton ID="LinkButton5" runat="server" Font-Size="9pt" 
                                            Width="130px" OnClick="LinkButton5_Click">用户信息查询 </asp:LinkButton></td>
                                                    <td style="width: 100px; height: 26px">
                                                        </td>
                                                    <td style="width: 177px; height: 26px;">
                                        <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="9pt" ForeColor="Blue"
                                             Width="130px" OnClick="LinkButton4_Click">用户登录</asp:LinkButton></td>
                                                    <td style="width: 100px; height: 26px;">
                                                    </td>
                                                    <td style="width: 806064px; height: 26px;">
                                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" OnClick="ImageButton2_Click" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="width: 116px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="width: 76px; height: 4px">
                                        <table align="center" border="0" cellpadding="0" cellspacing="0" height="27" width="806">
                                            <tr>
                                                <td style="height: 33px" width="28">
                              <asp:Image ID="Image3" runat="server" ImageUrl="~/image/speaker.gif" />&nbsp;</td>
                                                <td style="height: 33px; text-align: left; width: 59px;">
                        <asp:Label ID="Label6" runat="server" Text="Label" Width="60px" ForeColor="#FF8000"></asp:Label></td>
                                                <td style="height: 33px; text-align: left; width: 56px;">
                                                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
                                                <td style="height: 33px; text-align: left; width: 6px;">
                                                            <asp:Image ID="Image1" runat="server" Height="8px" ImageUrl="~/image/jiantou.gif"
                                                                Width="12px" />&nbsp;</td>
                                                <td style="height: 33px; width: 68px;">
                                                    &nbsp;用户名：</td>
                                                <td style="height: 33px" width="135">
                              <asp:TextBox ID="txtname" runat="server" Width="131px"></asp:TextBox>&nbsp;</td>
                                                <td style="height: 33px" width="54">
                                                    密码：&nbsp;</td>
                                                <td style="height: 33px" width="136">
                              <asp:TextBox ID="txtpwd" runat="server" Width="131px" TextMode="Password"></asp:TextBox>&nbsp;</td>
                                                <td style="height: 33px" width="72">
                                                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/denglu an niu.gif"
                                                                OnClick="ImageButton1_Click1" /></td>
                                                <td style="height: 33px" width="64">
                                                    &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/image/zhuce an niu.gif"
                                                                OnClick="ImageButton3_Click" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 116px; height: 4px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="height: 29px; width: 76px; background-color: #ffffff;" align="center">
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/image/biaotilan.gif" Width="871px" /></td>
                                    <td style="width: 116px; height: 29px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="width: 76px">
                        <asp:GridView ID="gvlt" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" Font-Size="12pt" ForeColor="#333333" GridLines="None" Width="870px" Font-Names="华文新魏" PageSize="14" OnRowDeleting="gvlt_RowDeleting">
                            <FooterStyle BackColor="#8080FF" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ContId" HeaderText="编号" Visible="False" />
                                <asp:BoundField DataField="Subject" HeaderText="标题" />
                                <asp:BoundField DataField="UserName" HeaderText="作者　" />
                                <asp:BoundField DataField="CreateTime" HeaderText="创建日期及时间" />
                                <asp:BoundField DataField="LastAnswerTime" HeaderText="最后回复时间" />
                                <asp:BoundField DataField="HitCount" HeaderText="人气指数" />
                                <asp:HyperLinkField DataNavigateUrlFields="ContId" DataNavigateUrlFormatString="~/teizixinxi/chakan.aspx?ContId={0}"
                                    HeaderText="详细信息" Text="详细信息" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                            <RowStyle BackColor="LightBlue" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="LightBlue" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="DimGray" />
                            <AlternatingRowStyle BackColor="White" Font-Size="Small" />
                        </asp:GridView>
                                    </td>
                                    <td style="width: 116px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="width: 76px">
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/image/index_17.gif" Width="865px" /></td>
                                    <td style="width: 116px">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
