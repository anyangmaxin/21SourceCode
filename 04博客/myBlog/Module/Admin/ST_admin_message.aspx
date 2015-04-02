<%@ Page language="c#" Inherits="ST_GROUP.Blog.ST_admin_message" CodeFile="ST_admin_message.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ST_admin_message</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link href="css/css.css" rel="stylesheet" type="text/css">
	
<script language="javascript" type="text/javascript">
// <!CDATA[

function Table1_onclick() {

}

// ]]>
</script>
</HEAD>
	<body style="margin:0;border:0;">
		<form id="Form1" method="post" runat="server">
            <table cellpadding="0" cellspacing="0" style="width: 578px; height: 285px">
                <tr>
                    <td align="left" colspan="3" style="background-image: url(../../Images/Skin/right.jpg);
                        vertical-align: middle; height: 478px; text-align: center">
                        <strong><span style="color: #993300"></span></strong><table cellpadding="0" cellspacing="0" style="left: 0px; width: 528px; height: 263px">
                            <tr>
                                <td colspan="3" style="height: 31px">
                                    <span style="color: #993300;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <span style="color: #993300">留言信息管理</span></strong></span></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="vertical-align: top; height: 205px; text-align: left">
                                    <table style="width: 510px; height: 211px">
                                        <tr>
                                            <td style="width: 114px; height: 10px">
                                                <span style="font-size: 9pt"></span></td>
                                            <td style="width: 92px; height: 10px">
                                                <asp:CheckBox ID="CheckBox2" runat="server" Font-Size="9pt" Text="全选" Width="61px" AutoPostBack="True" OnCheckedChanged="CheckBox2_CheckedChanged" /></td>
                                            <td style="width: 115px; height: 10px">
                                                <span style="font-size: 9pt">
                                                    <asp:Button ID="Button1" runat="server" Font-Size="9pt" Text="取消全选" OnClick="Button1_Click" /></span></td>
                                            <td style="width: 142px; height: 10px">
                                                <asp:Button ID="Button2" runat="server" Font-Size="9pt" Text="批量删除" OnClick="Button2_Click" /></td>
                                            <td style="width: 54px; height: 10px">
                                                </td>
                                            <td style="width: 111px; height: 10px">
                                                </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6" style="vertical-align: top; height: 163px; text-align: center">
            <asp:GridView ID="MessageList" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None" Font-Size="9pt" Width="511px" 
                                                    AllowPaging="True" OnPageIndexChanging="MessageList_PageInexChanging" 
                                                    PageSize="6" ForeColor="#333333">
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <RowStyle BackColor="#E3EAEB" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
											<TABLE class="table" cellSpacing="0" cellPadding="0" border="0" style="width: 101%">
												<TR>
                                                    <td style="width: 11%; height: 20px" >
                                                        <span style="font-size: 11pt">&nbsp; &nbsp;&nbsp;&nbsp; 操作</span></td>
													<TD style="height: 20px; width: 10%;">
														<DIV align="center">
                                                            <span style="font-size: 11pt">
                                                            时间</span></DIV>
													</TD>
													<TD style="height: 20px; width: 14%;">
														<DIV align="center">
                                                            <span style="font-size: 11pt">姓名/标题</span></DIV>
													</TD>
													<TD style="height: 20px; width: 11%;">
														<DIV align="center">
                                                            <span style="font-size: 11pt">博客内容&nbsp; &nbsp; </span></DIV>
													</TD>
													<TD style="height: 20px; width: 10%;">
														<DIV align="center">
                                                            <span style="font-size: 11pt">选择</span></DIV>
													</TD>
												</TR>
											</TABLE>
                        </HeaderTemplate>
                        <ItemTemplate>
											<TABLE class="table" cellSpacing="0" cellPadding="0" border="0" style="width: 100%">
												<TR>
                                                    <td height="20" style="width: 18%">
														<DIV align="center"><A onclick="return confirm('确定删除')" href='ST_edit.aspx?action=delmsg&id=<%# DataBinder.Eval(Container.DataItem, "ST_id") %>'>
                                                            <span style="font-size: 11pt">删除</span></A><span style="font-size: 11pt">/</span><a href='ST_edit.aspx?action=hfmsg&id=<%# DataBinder.Eval(Container.DataItem, "ST_id") %>'><span
                                                                    style="font-size: 11pt">回复</span></a></DIV>
													</td>
													<TD height="20" style="width: 20%">
														<DIV align="center"><%# DataBinder.Eval(Container.DataItem, "ST_mdate") %></DIV>
													</TD>
													<TD width="19%" height="20">
														<DIV align="center"><%# DataBinder.Eval(Container.DataItem, "ST_nickname") %>
                                                            <span style="font-size: 11pt">/<%# DataBinder.Eval(Container.DataItem, "ST_title") %></span></DIV>
													</TD>
													<TD height="20" style="width: 27%">
														<%--<DIV align="center"><%# DataBinder.Eval(Container.DataItem, "ST_content") %>--%>
														<DIV align="center"><%# Eval("ST_content").ToString().Length > 20 ? Eval("ST_content").ToString().Substring(0, 20) + "..." : Eval("ST_content")%>
                                                            <span style="font-size: 11pt">/<%# DataBinder.Eval(Container.DataItem, "ST_hf") %></span></DIV>
													</TD>
													<TD height="20" style="width: 57px">
                                                            <asp:CheckBox ID="CheckBox1" runat="server" Font-Size="8pt" Height="14px" Width="1px" /></TD>
												</TR>
											</TABLE>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
            </asp:GridView>
                                                &nbsp;</td>
                                        </tr>
                                        </table>
                                    
                                    
                                    </td>
                            </tr>
                            </table>
                        </td>
                </tr>
                </table>
            &nbsp;
		</form>
	</body>
</HTML>
