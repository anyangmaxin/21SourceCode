<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dqyhxinxixg.aspx.cs" Inherits="xiangxixinxi" %>

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
                <div style="text-align: center">
                    <table border="1" style="width: 714px">
                        <tr>
                            <td style="width: 96px; height: 125px;">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/image/index_02.gif" Width="863px" /></td>
                        </tr>
                        <tr>
                            <td style="width: 96px; height: 19px">
                                &nbsp;<TABLE style="WIDTH: 82%" border=0><TBODY><TR><TD style="WIDTH: 483031px; height: 25px;">
                                    &nbsp;<asp:Label ID="Label7" runat="server" Font-Size="9pt" ForeColor="#C04000" Text="欢迎光临编程词典网上论坛 ！"
                                        Width="192px"></asp:Label></TD><TD 
          style="WIDTH: 99px; height: 25px;"><asp:LinkButton id="LinkButton2" runat="server" Width="100px" ForeColor="Blue" Font-Size="9pt" OnClick="LinkButton2_Click" CausesValidation="False">用户信息管理</asp:LinkButton></TD>
                                    <td style="width: 10120px; height: 25px">
                                    </td>
                                    <TD 
          style="WIDTH: 100px; height: 25px;"><asp:LinkButton id="LinkButton3" runat="server" Width="120px" ForeColor="Blue" Font-Size="9pt" OnClick="LinkButton3_Click" CausesValidation="False">修改当前用户信息</asp:LinkButton></TD>
                                    <td style="width: 600px; height: 25px">
                                    </td>
                                    <TD 
          style="WIDTH: 100px; height: 25px;"><asp:LinkButton id="LinkButton5" runat="server" Width="100px" Font-Size="9pt" OnClick="LinkButton5_Click" CausesValidation="False">用户信息查询 </asp:LinkButton></TD><TD 
          style="WIDTH: 177px; height: 25px;"><asp:LinkButton id="LinkButton4" runat="server" Width="80px" ForeColor="Blue" Font-Size="9pt" OnClick="LinkButton4_Click" CausesValidation="False">用户登录</asp:LinkButton></TD><TD 
          style="WIDTH: 100px; height: 25px;">
              <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" OnClick="lbtnsy_Click"
                  Width="80px" CausesValidation="False">返回首页</asp:LinkButton></TD><TD 
          style="WIDTH: 6162940px; height: 25px;"><asp:ImageButton id="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" CausesValidation="False" OnClick="ImageButton2_Click"></asp:ImageButton></TD></TR></TBODY></TABLE>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 96px; height: 19px" align="center">
                                <table style="width: 654px">
                                    <tr>
                                        <td colspan="1" style="width: 251px">
                                        </td>
                                        <td colspan="4">
                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="华文新魏" Font-Size="X-Large"
                                                ForeColor="DarkRed">当前用户信息修改</asp:Label><br />
                                            <table border="1" style="width: 473px">
                                                <tr style="font-size: 12pt; color: #000000">
                                                    <td bgcolor="#99ccff" style="width: 95px; height: 22px">
                                                        用户姓名：</td>
                                                    <td style="width: 150px; height: 22px">
                                                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="Rfvname" runat="server" ControlToValidate="txtname"
                                                            Display="Dynamic" ErrorMessage="用户姓名不能为空" Font-Size="Small" Width="129px"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr style="font-size: 12pt">
                                                    <td bgcolor="#99ccff" style="width: 95px">
                                                        用户密码：</td>
                                                    <td style="width: 150px" align="left">
                                                        <asp:TextBox ID="txtpwd" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvpwd" runat="server" ControlToValidate="txtpwd"
                                                            Display="Dynamic" ErrorMessage="用户密码不能为空" Font-Size="Small" Width="129px"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr style="font-size: 12pt">
                                                    <td bgcolor="#99ccff" style="width: 95px">
                                                        英文姓名：</td>
                                                    <td style="width: 150px">
                                                        <asp:TextBox ID="txtywname" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr style="font-size: 12pt">
                                                    <td bgcolor="#99ccff" style="width: 95px">
                                                        电子邮箱：</td>
                                                    <td style="width: 150px">
                                                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr style="font-size: 12pt">
                                                    <td bgcolor="#99ccff" style="width: 95px; height: 19px">
                                                        头像：</td>
                                                    <td align="center" style="width: 150px; height: 19px">
                                                        <asp:DropDownList ID="ddltouxiang" runat="server" AutoPostBack="True" ForeColor="Red" OnSelectedIndexChanged="ddltouxiang_SelectedIndexChanged"
                                                            >
                                                        </asp:DropDownList>
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                        <asp:Image ID="imgtouxiang" runat="server" Height="118px" Width="116px" />&nbsp;
                                                    </td>
                                                </tr>
                                                <tr style="font-size: 12pt">
                                                    <td bgcolor="#99ccff" style="width: 95px; height: 21px">
                                                    </td>
                                                    <td style="width: 150px; height: 21px">
                                                        <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="保存" Width="45px" Height="22px" />
                                                        &nbsp;&nbsp;
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Font-Size="Small"
                                                            ForeColor="Blue" OnClick="LinkButton1_Click" >返回首页</asp:LinkButton>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt">
                                        <td colspan="1" style="width: 251px">
                                        </td>
                                        <td colspan="4">
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 96px; height: 19px">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 96px; height: 19px">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="height: 19px" align="center" width="100%">
                                <uc1:foot ID="Foot1" runat="server" />
                            </td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 96px; height: 19px">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
