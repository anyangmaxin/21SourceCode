<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CommonPage.aspx.cs" Inherits="Module_CommonPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>系统公告</title>
</head>
<body style="text-align: center; background-image: url(../../Images/SysSkin/right.jpg);">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <br />
        <br />
        <br />
        <br />
        &nbsp;</div>
                   <table style="height: 346px; vertical-align: middle; text-align: center; border-right: #afafaf 1px solid; border-top: #afafaf 1px solid; border-left: #afafaf 1px solid; border-bottom: #afafaf 1px solid; width: 529px;" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="3" rowspan="2" style="height: 264px; width: 429px; vertical-align: middle; text-align: center;">
                    <MARQUEE direction="up" onmouseout="this.start()" onmouseover="this.stop()" scrollAmount="2" scrollDelay="4" style="height: 237px; vertical-align: middle; text-align: center; width: 524px;">
                        <asp:DataList ID="DataList1" runat="server">
                            <ItemTemplate>
                                &nbsp;<table width="100%">
                                    <tr>
                                        <td colspan="2" rowspan="2" style="width: 415px; text-align: left">
                                <asp:Label ID="Label1" runat="server" Text=<%# DataBinder.Eval(Container,"DataItem.NoticeContent") %> Font-Size="9pt" Width="390px"></asp:Label></td>
                                        <td>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Font-Size="9pt" Text='<%# DataBinder.Eval(Container,"DataItem.NoticeTime","{0:yyyy-MM-dd}") %>' Width="88px"></asp:Label></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList></ MARQUEE >
                    </td>
                </tr>
                <tr>
                </tr>
            </table> 
    </form>
</body>
</html>
