<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MoreNew.aspx.cs" Inherits="MoreNew" StylesheetTheme="MRSOFTASPNET" %>

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
                <div>
                    <div style="text-align: center">
                        <table border="1" style="width: 776px">
                            <tr>
                                <td colspan="2" style="height: 275px">
                                    <uc1:header ID="Header1" runat="server" />
                                    &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2" rowspan="3" valign="top">
                                    <div style="text-align: center">
                                        &nbsp;</div>
                                    <div style="text-align: center">
                                        <div style="text-align: center">
                                            <table style="width: 98%">
                                                <tr>
                                                    <td colspan="2" style="background-image: url(image/bg1.jpg); height: 55px">
                                                        <asp:Image ID="ImgT" runat="server" ImageUrl="~/image/xinwen.gif" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height: 69px">
                                                        <asp:GridView ID="GvNew" runat="server" AllowPaging="True" AutoGenerateColumns="False" Font-Size="9pt" OnPageIndexChanging="GvNew_PageIndexChanging"
                                                            Width="759px" SkinID="gvSkin" OnRowDataBound="GvNew_RowDataBound" PageSize="8">
                                                            <Columns>
                                                                <asp:BoundField DataField="id" HeaderText="新闻编号" />
                                                                <asp:BoundField DataField="title" HeaderText="新闻标题" />
                                                                <asp:BoundField DataField="PublishTime" HeaderText="发布时间" />
                                                                <asp:BoundField DataField="PublishPerson" HeaderText="发布人" />
                                                                <asp:BoundField DataField="ComeFrom" HeaderText="摘自" />
                                                                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="New_info.aspx?id={0}"
                                                                    HeaderText="详细信息" Text="详细信息" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 21px;">
                                                    </td>
                                                    <td style="width: 100px; height: 21px;">
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        &nbsp;&nbsp;</div>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 21px">
                                    &nbsp;
                                    <uc2:foot ID="Foot1" runat="server" />
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
