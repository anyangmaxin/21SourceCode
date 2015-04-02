<%@ Page Language="C#" AutoEventWireup="true" CodeFile="soft_Search.aspx.cs" Inherits="softLeibie_Search" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="control/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="control/foot.ascx" TagName="foot" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <div style="text-align: center">
                <table border="1" style="width: 776px">
                    <tr>
                        <td colspan="2" style="height: 275px">
                            <uc1:header ID="Header1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" rowspan="1" valign="top">
                            <div style="text-align: center">
                                &nbsp;</div>
                            <div style="text-align: center">
                                <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; background-image: url(../image/后台页2.jpg);
                                    width: 625px; height: 337px">
                                    <tr>
                                        <td align="center" colspan="3" style="height: 24px; text-align: center">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3" style="height: 24px; text-align: center">
                                            产品信息查找</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3" style="text-align: center">
                                            <asp:Label ID="Label1" runat="server" Text="搜索条件："></asp:Label>
                                            <asp:DropDownList ID="ddlCondition" runat="server" Width="79px">
                                                <asp:ListItem Value="Name">产品名称</asp:ListItem>
                                                <asp:ListItem Value="ID">产品编号</asp:ListItem>
                                                <asp:ListItem Value="Edition">产品版本</asp:ListItem>
                                                <asp:ListItem Value="Condition">运行环境</asp:ListItem>
                                                <asp:ListItem Value="Price">产品价格</asp:ListItem>
                                            </asp:DropDownList><asp:Label ID="Label3" runat="server" Text="搜索关键字："></asp:Label>
                                            <asp:TextBox ID="txtKey" runat="server" Width="117px"></asp:TextBox>
                                            类别：<asp:DropDownList ID="ddlLeibie" runat="server">
                                            </asp:DropDownList>
                                            <asp:Button ID="btnSel" runat="server" Height="20px" OnClick="btnSel_Click" Text="搜索"
                                                Width="58px" />
                                            <asp:Button ID="BtnShow" runat="server" Height="20px" OnClick="BtnShow_Click" Text="全显"
                                                Width="58px" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="vertical-align: top; height: 174px; text-align: center">
                                            <br />
                                            <asp:GridView ID="gvUserInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False" Font-Size="9pt" OnPageIndexChanging="gvUserInfo_PageIndexChanging"
                                                PageSize="8" Width="564px" SkinID="gvSkin1">
                                                <Columns>
                                                    <asp:BoundField DataField="ID" HeaderText="产品编号" />
                                                    <asp:BoundField DataField="Name" HeaderText="产品名称" />
                                                    <asp:BoundField DataField="Edition" HeaderText="产品版本" />
                                                    <asp:BoundField DataField="Condition" HeaderText="运行环境" />
                                                    <asp:BoundField DataField="Price" HeaderText="产品价格" />
                                                    <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="list_softdownload.aspx?ID={0}"
                                                        HeaderText="详细信息" Text="详细信息">
                                                        <ControlStyle Font-Underline="False" ForeColor="Black" />
                                                    </asp:HyperLinkField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                                &nbsp;</div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 21px">
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 21px">
                            <uc2:foot ID="Foot1" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
