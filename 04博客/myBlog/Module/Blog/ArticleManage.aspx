<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArticleManage.aspx.cs" Inherits="Module_Blog_ArticleManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>文章管理</title>
           <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />    
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div style="text-align: left">
                    <table style="left: 0px; width: 590px; vertical-align: top; background-image: url(../../Images/Skin/); height: 406px;" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="3" style="height: 38px; width: 582px;">
                                <span style="color: #993300"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong></span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 582px; height: 30px">
                                <strong><span style="color: #993300">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 文章信息管理</span></strong></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 224px; width: 582px;" align="center">
                                <table style="width: 510px; height: 281px;">
                                    <tr>
                                        <td style="width: 114px; height: 26px">
                                            <span style="font-size: 9pt">查询条件</span></td>
                                        <td style="width: 92px; height: 26px">
                                            <asp:DropDownList ID="ddlSearch" runat="server" Font-Size="9pt" Width="114px">
                                                <asp:ListItem>文章ID</asp:ListItem>
                                                <asp:ListItem>文章主题</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td style="width: 83px; height: 26px">
                                            <span style="font-size: 9pt">关键字</span></td>
                                        <td style="width: 142px; height: 26px">
                                            <asp:TextBox ID="txtKey" runat="server" Width="101px" Font-Size="9pt"></asp:TextBox></td>
                                        <td style="width: 54px; height: 26px">
                                            <asp:Button ID="btnSearch" runat="server" Font-Size="9pt"
                                                Text="查找" OnClick="btnSearch_Click" /></td>
                                        <td style="width: 111px; height: 26px">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="height: 130px; vertical-align: top; text-align: center;">
                                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                CellPadding="4" Font-Size="9pt" ForeColor="#333333" GridLines="None" 
                                                Width="500px" OnRowDeleting="GridView1_RowDeleting" 
                                                OnPageIndexChanging="GridView1_PageIndexChanging" 
                                                OnRowDataBound="GridView1_RowDataBound" PageSize="6" Height="1px">
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <Columns>
                                                    <asp:BoundField DataField="ST_n_id" HeaderText="文章ID" />
                                                    <asp:BoundField DataField="ST_n_title" HeaderText="文章主题" />
                                                    <asp:BoundField DataField="ST_n_hit" HeaderText="人气指数" />
                                                    <asp:BoundField DataField="ST_n_re" HeaderText="评论" />
                                                    <asp:HyperLinkField DataNavigateUrlFields="ST_n_id" DataNavigateUrlFormatString="ViewContent.aspx?id={0}"
                                                        HeaderText="修改" Text="修改" />
                                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                                    <asp:TemplateField HeaderText="选择">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" Font-Size="9pt" Width="9px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    </table>
                                <asp:CheckBox ID="checkAll" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged"
                                    Text="全选" Width="54px" />
                                &nbsp;<asp:Button ID="btnCancel" CssClass="ButtonCss" runat="server" OnClick="Button1_Click" Text="取消全选" />
                                <asp:Button ID="btnAllDelete"  CssClass="ButtonCss" runat="server" OnClick="btnAllDelete_Click" 
                                    Text="批量删除" /></td>
                        </tr>
                        </table>
    
    </div>
    </form>
</body>
</html>
