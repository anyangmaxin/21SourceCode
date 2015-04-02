<%@ Page Language="C#" AutoEventWireup="true" CodeFile="More_Soft.aspx.cs" Inherits="MoreSoft" %>

<%@ Register Src="control/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="control/foot.ascx" TagName="foot" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网站</title>
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {
}

// ]]>
</script>
</head>
<body style="background-image: url(image/bg.jpg); text-align: center">
    <form id="form1" runat="server">
    <div>
        <table border="0" style="width: 776px; background-image: url(image/bg4.jpg);">
            <tr>
                <td colspan="2" style="width: 793px; height: 151px">
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2" rowspan="3" style="width: 793px; height: 131px" valign="top">
                    <div style="text-align: center">
                        <div style="text-align: center">
                            <div style="text-align: center">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:DataList ID="dlContent" runat="server" 
                                                OnItemDataBound="dlContent_ItemDataBound" 
                                                Width="554px" OnItemCommand="dlContent_ItemCommand">
                                                <ItemTemplate>
                                                    <div style="text-align: center">
                                                        <div style="text-align: center">
                                                            <table style="border-right: #99cccc thin solid; border-top: #99cccc thin solid; border-left: #99cccc thin solid;
                                                                width: 100%; border-bottom: #99cccc thin solid; height: 275px">
                                                                <tr>
                                                                    <td colspan="2" style="width: 231px; border-bottom: 1px dashed; height: 27px; text-align: center">
                                                                        <span style="font-size: 9pt">
                                                                            <asp:Image ID="ImgName" runat="server" ImageUrl="~/image/产品名称.bmp" /></span></td>
                                                                    <td style="width: 269px; border-bottom: 1px dashed; height: 27px; text-align: center">
                                                                        <asp:Label ID="LblName" runat="server" Font-Size="9pt" Text='<%# DataBinder.Eval(Container.DataItem,"Name") %>'></asp:Label></td>
                                                                    <td align="center" rowspan="5" style="font-weight: bold; width: 100px" valign="top">
                                                                        <asp:Image ID="Image12" runat="server" Height="220px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"Image") %>'
                                                                            Width="356px" /></td>
                                                                </tr>
                                                                <tr style="font-weight: bold">
                                                                    <td colspan="2" style="width: 231px; border-bottom: 1px dashed; height: 28px; text-align: center">
                                                                        <span style="font-size: 9pt">版本号：</span></td>
                                                                    <td style="width: 269px; border-bottom: 1px dashed; height: 28px; text-align: center">
                                                                        <asp:Label ID="LblEdition" runat="server" Font-Size="9pt" Text='<%# DataBinder.Eval(Container.DataItem,"Edition") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="width: 231px; border-bottom: 1px dashed; height: 28px; text-align: center">
                                                                        <span style="font-size: 9pt"><strong>运行平台：</strong></span></td>
                                                                    <td style="width: 269px; border-bottom: 1px dashed; height: 28px">
                                                                        <asp:Label ID="LblCondition" runat="server" Font-Size="9pt" Text='<%# DataBinder.Eval(Container.DataItem,"Condition") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="width: 231px; border-bottom: 1px dashed; height: 30px; text-align: center">
                                                                        <span style="font-size: 9pt"><strong>价 格：</strong></span></td>
                                                                    <td style="width: 269px; border-bottom: 1px dashed; height: 30px">
                                                                        <asp:Label ID="LblPrice" runat="server" Font-Size="9pt" Text='<%# DataBinder.Eval(Container.DataItem,"price") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="width: 231px; border-bottom: 1px dashed; height: 26px; text-align: center">
                                                                        <span style="font-size: 9pt"><strong>软件类别：</strong></span></td>
                                                                    <td style="width: 269px; border-bottom: 1px dashed; height: 26px">
                                                                        <asp:Label ID="LblLeibie" runat="server" Font-Size="9pt" Text='<%# DataBinder.Eval(Container.DataItem,"LeiBie") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="width: 231px; text-align: center">
                                                                        <strong><span style="font-size: 9pt">产品介绍：</span></strong></td>
                                                                    <td colspan="2" style="text-align: center">
                                                                        <asp:Label ID="LblIntro" runat="server" Font-Size="9pt" Height="27px" Text='<%# DataBinder.Eval(Container.DataItem,"Intro") %>'
                                                                            Width="481px"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="width: 231px; height: 45px; text-align: center">
                                                                        <a href='list_softdownload.aspx?ID=<%#Eval("id") %>'><span style="font-size: 9pt;
                                                                color: #ff0000" >详细信息>></span></a></td>
                                                                    <td style="width: 269px; height: 45px">
                                                                    </td>
                                                                    <td align="center" rowspan="1" style="width: 100px; height: 45px">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 21px">
                                            <table cellpadding="0" cellspacing="0" style="width: 579px">
                                                <tr>
                                                    <td style="font-size: 9pt; width: 500px; height: 16px; text-align: right">
                                                        <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                                                        【
                                                        <asp:Label ID="labPage" runat="server" Font-Bold="True" Text="1" Width="1px"></asp:Label>
                                                        &nbsp;】
                                                        <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                                        【
                                                        <asp:Label ID="labBackPage" runat="server" Font-Bold="True"></asp:Label>
                                                        &nbsp;】<asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
                                                            OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red"
                                                            OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                                                        <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                                                            OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                                                        <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red"
                                                            OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="2" style="width: 793px; height: 21px">
                    <uc2:foot ID="Foot1" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
