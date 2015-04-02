<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Liuyan_search.aspx.cs" Inherits="Liuyan_search" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="control/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="control/Left.ascx" TagName="Left" TagPrefix="uc2" %>
<%@ Register Src="control/foot.ascx" TagName="foot" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>
        <table border="1" style="width: 776px">
            <tr>
                <td colspan="2" style="height: 275px">
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td align="left" rowspan="3" style="width: 12px" valign="top">
                    <div style="text-align: center">
                        &nbsp;<uc2:Left ID="Left1" runat="server" />
                    </div>
                </td>
                <td rowspan="1" style="width: 96px; height: 470px" valign="top">
                    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; width: 529px;
                        height: 241px">
                        <tr>
                            <td align="center" colspan="3" style="height: 24px; text-align: center">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="3" style="height: 305px; text-align: center">
                                <div style="text-align: center">
                                    <table style="background-image: url(image/后台页.jpg); width: 98%; height: 334px">
                                        <tr>
                                            <td colspan="3" style="height: 2px; text-align: center;">
                                                = 查看留言信息 =
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="height: 2px; text-align: center">
                                                <asp:Label ID="lblMessage" runat="server" Font-Size="Medium" ForeColor="Red" Height="26px"
                                                    Text="暂无留言内容！" Width="200px" Visible="False"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="height: 101px">
                                                &nbsp;<asp:GridView ID="GvLeaveWord" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    Font-Size="9pt" OnPageIndexChanging="GvLeaveWord_PageIndexChanging" 
                                                    PageSize="5" SkinID="gvSkin" Width="497px" OnRowDataBound="GvLeaveWord_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="id" HeaderText="留言编号" />
                                                        <asp:BoundField DataField="Title" HeaderText="留言主题" />
                                                        <asp:BoundField DataField="person" HeaderText="留言人" />
                                                        <asp:BoundField DataField="RevertContent" HeaderText="回复状态" />
                                                        <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="liuyan_info.aspx?id={0}" Text="详细信息" HeaderText="详细信息" />
                                                        <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="liuyan_delete.aspx?id={0}"
                                                            HeaderImageUrl="~/image/shanchu.jpg" Text="删除" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px">
                                            </td>
                                            <td style="width: 100px; text-align: center">
                                                </td>
                                            <td style="width: 100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="height: 31px">
                                                &nbsp; &nbsp; &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 96px; height: 23px">
                </td>
            </tr>
            <tr>
                <td style="width: 96px; height: 21px">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 21px">
                    <uc3:foot ID="Foot1" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
