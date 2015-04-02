<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlogType.aspx.cs" Inherits="Module_Admin_BlogType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="width: 404px">
            <tr>
                <td colspan="3" rowspan="2" style="vertical-align: middle; width: 768px; height: 477px; text-align: center">
                    <table cellpadding="0" cellspacing="0" style="left: 0px; vertical-align: top; width: 466px">
                        <tr>
                            <td colspan="3" style="width: 582px; height: 31px">
                                <span style="color: #993300"><strong>文章类别管理</strong></span></td>
                        </tr>
                        <tr>
                            <td colspan="3" rowspan="1" style="width: 582px; height: 219px">
                                <table style="width: 510px">
                                    <tr>
                                        <td style="width: 114px; height: 26px">
                                            <span style="font-size: 9pt">查询条件</span></td>
                                        <td style="width: 92px; height: 26px">
                    <asp:DropDownList ID="ddlSelect" runat="server" Font-Size="9pt" Width="75px">
                        <asp:ListItem>类型编号</asp:ListItem>
                        <asp:ListItem>文章类型</asp:ListItem>
                    </asp:DropDownList></td>
                                        <td style="width: 83px; height: 26px">
                                            <span style="font-size: 9pt">关键字</span></td>
                                        <td style="width: 142px; height: 26px">
                    <asp:TextBox ID="txtKey" runat="server" Font-Size="9pt" Width="136px"></asp:TextBox></td>
                                        <td style="width: 54px; height: 26px">
                    <asp:Button ID="btnSearch" runat="server" Font-Size="10pt" OnClick="btnSearch_Click" Text="查询"
                        Width="53px" /></td>
                                        <td style="width: 111px; height: 26px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" rowspan="2" style="vertical-align: top; height: 201px; text-align: center">
                    <asp:GridView ID="ClassList" runat="server" AutoGenerateColumns="False"
                        CellPadding="4" Font-Size="11pt" GridLines="None" Width="468px" OnRowCancelingEdit="ClassList_RowCancetingEdit" OnRowDeleting="ClassList_RowDeleting" OnRowEditing="ClassList_RowEditing" OnRowUpdating="ClassList_RowUpdating" ForeColor="#333333" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="ClassList_PageIndexChangging" PageSize="6" OnRowDataBound="ClassList_RowDataBound">
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="选项">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Font-Size="9pt" Height="1px" Width="1px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ST_c_id" HeaderText="类型编号" ReadOnly="True" />
                            <asp:BoundField DataField="ST_c_name" HeaderText="文章类别" />
                            <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                        <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <RowStyle BackColor="#E3EAEB" />
                        <EditRowStyle BackColor="#7C6F57" />
                    </asp:GridView><table style="width: 510px">
                        <tr>
                            <td style="width: 85px; height: 26px">
                                <span style="font-size: 9pt">文章类别：</span></td>
                            <td style="height: 26px" colspan="3">
                                <span style="font-size: 9pt">
                                            <asp:TextBox ID="typename" runat="server" Font-Size="11pt"></asp:TextBox>
                                </span>
                            </td>
                            <td style="width: 54px; height: 26px"><asp:Button id="btmAdd" onclick="btmAdd_Click" runat="server" Font-Size="10pt" Text="添加"></asp:Button></td>
                            <td style="width: 111px; height: 26px">
                            </td>
                        </tr>
                    </table>
                                            <table style="width: 510px; border-top-style: solid; border-bottom-style: solid;">
                                                <tr>
                                                    <td style="width: 114px; height: 26px">
                                                        <span style="font-size: 9pt">全选操作：</span></td>
                                                    <td style="width: 92px; height: 26px">
                                <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged"
                                    Text="全选" Width="54px" /></td>
                                                    <td style="width: 120px; height: 26px">
                                                        <span style="font-size: 9pt">&nbsp;<asp:Button ID="btnDelte" runat="server" OnClick="Button2_Click" Text="批量删除" Width="81px" />&nbsp;<asp:Button ID="btnCancel" runat="server" OnClick="Button3_Click" Text="取消全选" Width="79px" /></span></td>
                                                    <td style="width: 142px; height: 26px">
                                                    </td>
                                                    <td style="width: 54px; height: 26px">
                                                    </td>
                                                    <td style="width: 111px; height: 26px">
                                                    </td>
                                                </tr>
                                            </table>
                                            &nbsp; &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                </table>
                                &nbsp; &nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
