<%@ Page Language="C#" AutoEventWireup="true" CodeFile="softLeibie.aspx.cs" Inherits="softLeibie" StylesheetTheme="MRSOFTASPNET"%>

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
            <div style="background-image: url(image/bg.jpg); text-align: center">
                <table style="background-image: url(image/bg4.jpg); width: 776px">
                    <tr>
                        <td align="left" colspan="2" style="height: 37px">
                            <uc1:header ID="Header1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" rowspan="2" style="width: 16px" valign="top">
                            <div style="text-align: center">
                                <table style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                                    width: 100%; border-bottom: 1px solid">
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Image ID="Image1" runat="server" Height="67px" ImageUrl="~/image/index_type.gif"
                                                Width="228px" /></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:DataList ID="DlLeibie" runat="server" OnUpdateCommand="DlLeibie_UpdateCommand"
                                                Width="223px">
                                                <ItemTemplate>
                                                    <div style="text-align: center">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 100px; height: 21px">
                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/image/tb.jpg" /></td>
                                                                <td style="width: 100px; height: 21px">
                                                                    <asp:LinkButton ID="LinBtnLeibie" runat="server" CommandName="Update" Font-Size="9pt"
                                                                        Text='<%# Eval("name") %>'></asp:LinkButton></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td style="width: 559px">
                            <div style="text-align: center">
                                <table style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                                    width: 100%; border-bottom: 1px solid">
                                    <tr>
                                        <td colspan="3" style="height: 25px; background-color: #6699ff">
                                            <span style="font-size: 9pt; color: #ffffff">= 按<asp:Label ID="LblLeiBie" runat="server"></asp:Label>分类查看产品信息
                                                =</span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="height: 154px">
                                            <asp:GridView ID="GridView1" runat="server" Font-Size="9pt" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" SkinID="gvSkin">
                                                <Columns>
                                                    <asp:BoundField DataField="ID" HeaderText="产品编号" />
                                                    <asp:BoundField DataField="Name" HeaderText="产品名称" />
                                                    <asp:BoundField DataField="LeiBie" HeaderText="产品类别" />
                                                    <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="list_softdownload.aspx?ID={0}"
                                                        HeaderText="详细信息" Text="详细信息" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 559px; height: 16px;">
                            <asp:LinkButton ID="LinBtnReturn" runat="server" Font-Size="9pt" OnClick="LinBtnReturn_Click">［返回］</asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
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
