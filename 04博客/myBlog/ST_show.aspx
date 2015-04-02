<%@ Page language="c#" Inherits="ST_GROUP.Blog.ST_show" CodeFile="ST_show.aspx.cs" ValidateRequest="false" %>
<%@ Register src="UserControl/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc2" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>BLOG 文章查看</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/css.css" type="text/css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </HEAD>
	<body topmargin="0" bgColor="<%#ST_tcolor%>">
	<form id="Form1" method="post" runat="server">
		<table cellSpacing="1" cellPadding="0" align="center" bgColor="#f9f8f4" 
            border="0" style="width: 753px">
			
				<TBODY>
					<tr>
						<td colSpan="2">
                            <uc1:Header ID="Header1" runat="server" />
                        </td>
					</tr>
					<tr bgColor="#ffffff">
						<td vAlign="top" width="210" height="13" style="background-image: url(Images/Skin/)">
							<table width="200" border="0" align="center" cellPadding="0" cellSpacing="1" bgcolor="<%#ST_bgcolor%>" style="background-image: url(Images/Skin/)">
								<tr>
									<td height="25" align="center">
                                        <img src="Images/Skin/blog%20fenlei.gif" style="width: 212px; height: 34px" /></td>
								</tr>
								<tr>
									<td bgcolor="#ffffff" ><asp:datalist id="ClassList" runat="server">
											<HeaderTemplate>
												<FONT color="red" size="2">★</FONT><a href="BlogIndex.aspx"> 博客首页</a>
											</HeaderTemplate>
											<ItemTemplate>
												<FONT color="red" size="2">★</FONT><a href='BlogIndex_<%# DataBinder.Eval(Container.DataItem, "ST_c_name") %>_<%# DataBinder.Eval(Container.DataItem, "ST_c_id") %>.aspx'>
													<%# DataBinder.Eval(Container.DataItem, "ST_c_name") %>
												</a>
											</ItemTemplate>
										</asp:datalist></td>
								</tr>
							</table>
							<table width="200" border="0" align="center" cellPadding="0" cellSpacing="1" bgcolor="<%#ST_bgcolor%>" style="background-image: url(Images/Skin/)">
								<tr>
									<td align="center" height="25">
                                        <img src="Images/Skin/tuijian%20wenzhang.gif" 
                                            style="width: 212px; height: 34px" /></td>
								</tr>
								<tr>
									<td bgcolor="#ffffff" style="background-image: url(images/)"><asp:datalist id="CmdList" runat="server">
											<ItemTemplate>
												&nbsp;<a href='<%# DataBinder.Eval(Container.DataItem, "ST_n_id") %>.aspx'>
													<%# DataBinder.Eval(Container.DataItem, "ST_n_title") %>
												</a>
											</ItemTemplate>
										</asp:datalist></td>
								</tr>
							</table>
							<TABLE id=Table1 cellSpacing=1 cellPadding=0 width=200 align=center 
      bgColor="<%#ST_bgcolor%>" border=0 style="background-image: url(Images/Skin/)">
								<TR>
									<TD height="25">
										<DIV align="center"><STRONG>
            <DIV align=center><img 
                    src="Images/Skin/boke%20zhu%20ren.gif" style="width: 212px; height: 34px" /></DIV></STRONG></DIV>
									</TD>
								</TR>
								<TR>
									<TD align="center" bgColor="#ffffff" style="background-image: url(images/)">
										<BR>
										<A href="ST_message.aspx"><FONT size="3">[给我留言]</FONT></A></TD>
								</TR>
							</TABLE>
						</td>
						<td vAlign="top" width="540" bgColor="#ffffff" style="background-image: url(images/1294850_472733.gif)">
                            <asp:GridView ID="NewsShow" runat="server" AutoGenerateColumns="False" 
                                Width="708px">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
									<table border="0" style="width: 98%">
										<tr>
											<td><a href='BlogIndex.aspx'>首页</a>-&gt;<a href="#">文章查看</a></td>
										</tr>
										<tr align="center" bgcolor="<%#ST_bgcolor%>" height="25">
											<td>
												<font size="-1" color="#ff6633"><b>
														<%#DataBinder.Eval(Container.DataItem, "ST_n_title")%>
													</b></font>
											</td>
										</tr>
										<tr align="right" height="25">
											<td class="content">
												<font size="-1">[作者：<%#DataBinder.Eval(Container.DataItem, "ST_n_author")%>] 
                                                [人气：<%#DataBinder.Eval(Container.DataItem, "ST_n_hit")%>] [回复：<%#DataBinder.Eval(Container.DataItem, "ST_n_re")%>] 
                                                [发布时间:<%#DataBinder.Eval(Container.DataItem, "ST_n_date")%>]
												</font>
											</td>
										</tr>
										<tr>
											<td class="content">
												<font size="-1">
													<%#DataBinder.Eval(Container.DataItem, "ST_n_content")%>
												</font>
											</td>
										</tr>
									</table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
							<br>
							<table border="0" align="center" cellPadding="0" cellSpacing="1" 
                                bgcolor="<%#ST_bgcolor%>" style="width: 103%">
								<tr>
									<td bgcolor="#ffffff" height="30">
										<%ST_get_Replay();%>
									<strong>网友回应</strong></td>
								</tr>
							</table>
							<table border="0" align="center" cellpadding="0" cellspacing="0" 
                                style="width: 120%">
								<tr>
									<td height="25" colspan="2" class="article">&nbsp;&nbsp;<strong>来说两句吧</strong></td>
								</tr>
								<tr>
									<td height="20" class="style3"><div align="center">
                                        <span class="style2">您的大名：</span></div>
									</td>
									<td width="82%" style="background-image: url(images/1294850_472733.gif)">&nbsp;
										<asp:TextBox id="r_nick" runat="server" Width="174px" 
                                            ForeColor="LightSteelBlue"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td height="20" class="style3"><div align="center">
                                        <span class="style2">评论标题</span><span style="font-size: 11pt">：</span></div>
									</td>
									<td style="background-image: url(images/1294850_472733.gif)">&nbsp;
										<asp:TextBox id="r_title" runat="server" Width="174px"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td height="20" class="style1" colspan="2"><div align="left">
                                        <span class="style2">您给予的评论内容</span><span style="font-size: 11pt">：</span></div>
										<FTB:FreeTextBox id="FreeTextBox1" runat="Server" Language="zh-cn"  
                                    SupportFolder="aspnet_client/FreeTextBox/" Height="200px" Width="700px" 
                                    HtmlModeDefaultsToMonoSpaceFont="True" DownLevelCols="50" DownLevelRows="10" 
                                    ButtonDownImage="False" GutterBackColor="LightSteelBlue" 
                                    ToolbarBackgroundImage="True" 
                                    ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print" 
                                    ToolbarStyleConfiguration="NotSet" BackColor="255, 198, 140" 
                                    EditorBorderColorDark="255, 198, 140" />
									</td>
								</tr>
								<tr>
									<td height="20" colspan="2" style="background-image: url(images/1294850_472733.gif)">
                                        &nbsp;
										<asp:Button id="replay" runat="server" Text="我要评论" onclick="replay_Click" 
                                            CausesValidation="False" style="font-size: x-small" Width="95px"></asp:Button></td>
								</tr>
							</table>
						</td>
					</tr>
			</TBODY>
		</table>
        <div align=center>
            <img src="Images/Skin/bottom.jpg" style="width: 924px; height: 62px" />&nbsp;</div>
	</form>
	</body>
</HTML>
