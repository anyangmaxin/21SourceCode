<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestAnswer.aspx.cs" Inherits="Web_TestAnswer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>试卷答案</title>
</head>
<body topmargin=2 leftmargin=0 rightmargin=0>
    <form id="form1" runat="server">
    <div>
    <table cellSpacing="0" style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=500 align="center"
				bgColor="#ffffff" border="1" bordercolor=gray>
				<tr height=40>
					<td align=center>						
						<IMG height="25" src="../Images/ico_Xp03.gif"><font color=#4D2600><b><asp:Label ID="lblPaperName"
                            runat="server"></asp:Label>试题答案</b></font>				
					</td>
				</tr>
				
				<tr>
				    <td>                        
                        <asp:GridView ID="GridView1" runat="server" Width=100% AutoGenerateColumns="False">
                            <Columns>
				                <asp:TemplateField>
				                    <HeaderTemplate>				                    
				                            <asp:Label id=Label24 runat="server" Text=一、单选题(每题>
									                </asp:Label>
									        <asp:Label id=Label27 runat="server">
									                </asp:Label>
                                            <asp:Label ID="Label25" runat="server" Text=分)>
                                            </asp:Label>
				                    </HeaderTemplate>
					                <ItemTemplate>
						                <TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
							                <TR>
								                <TD colSpan="3">
									                <asp:Label id=Label1 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
									                </asp:Label>
									                <asp:Label id=Label2 runat="server" Text='<%# Eval("Title","、{0}") %>'>
									                </asp:Label>
									                <asp:Label id=Label3 runat="server" ForeColor=red Text='<%# Eval("Answer") %>' >
									                </asp:Label>
									                <asp:Label id=Label4 runat="server" Text='<%# Eval("Mark") %>' Visible=false>
									                </asp:Label>									                
									                </TD>
							                </TR>
							                <TR>
								                <TD width="35%">
									                A:<asp:RadioButton id=RadioButton1 runat="server" Text='<%# Eval("AnswerA") %>' GroupName="Sl">
									                </asp:RadioButton></TD>
								                <TD width="35%">
									                B:<asp:RadioButton id=RadioButton2 runat="server" Text='<%# Eval("AnswerB") %>' GroupName="Sl">
									                </asp:RadioButton></TD>
								                <TD></TD>
							                </TR>
							                <TR>
								                <TD width="35%">
									                C:<asp:RadioButton id=RadioButton3 runat="server" Text='<%# Eval("AnswerC") %>' GroupName="Sl">
									                </asp:RadioButton></TD>
								                <TD width="35%">
									                D:<asp:RadioButton id=RadioButton4 runat="server" Text='<%# Eval("AnswerD") %>' GroupName="Sl">
									                </asp:RadioButton></TD>
								                <TD></TD>
							                </TR>
						                </TABLE>
					                </ItemTemplate>
				                </asp:TemplateField>
			                </Columns>
                            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                        </asp:GridView>
                    </td>
                </tr>				                
				<tr>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" Width=100% AutoGenerateColumns="False">
                            <Columns>
				                <asp:TemplateField>
				                    <HeaderTemplate>				                    
				                            <asp:Label id=Label22 runat="server" Text=二、多选题(每题>
									                </asp:Label>
									        <asp:Label id=Label28 runat="server">
									                </asp:Label>
                                            <asp:Label ID="Label23" runat="server" Text=分)>
                                            </asp:Label>
				                    </HeaderTemplate>
					                <ItemTemplate>
						                <TABLE id="Table3" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
							                <TR>
								                <TD colSpan="3">
									                <asp:Label id=Label5 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
									                </asp:Label>
									                <asp:Label id=Label6 runat="server" Text='<%# Eval("Title","、{0}") %>'>
									                </asp:Label>
									                <asp:Label id=Label7 runat="server" ForeColor=red Text='<%# Eval("Answer") %>'>
									                </asp:Label>
									                <asp:Label id=Label8 runat="server" Text='<%# Eval("Mark") %>' Visible=false>
									                </asp:Label>									                
									                </TD>
							                </TR>
							                <TR>
								                <TD style="HEIGHT: 22px" width="35%">
									                A:<asp:CheckBox id=CheckBox1 runat="server" Text='<%# Eval("AnswerA") %>'>
									                </asp:CheckBox></TD>
								                <TD style="HEIGHT: 22px" width="35%">
									                B:<asp:CheckBox id=CheckBox2 runat="server" Text='<%# Eval("AnswerB") %>'>
									                </asp:CheckBox></TD>
								                <TD style="HEIGHT: 22px"></TD>
							                </TR>
							                <TR>
								                <TD width="35%">
									               C:<asp:CheckBox id=CheckBox3 runat="server" Text='<%# Eval("AnswerC") %>'>
									                </asp:CheckBox></TD>
								                <TD width="350%">
									                D:<asp:CheckBox id=CheckBox4 runat="server" Text='<%# Eval("AnswerD") %>'>
									                </asp:CheckBox></TD>
								                <TD></TD>
							                </TR>
						                </TABLE>
					                </ItemTemplate>
				                </asp:TemplateField>
			                </Columns>
                            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" Width=100% AutoGenerateColumns="False">
                            <Columns>
				                <asp:TemplateField>
				                    <HeaderTemplate>				                    
				                            <asp:Label id=Label20 runat="server" Text=三、判断题(每题>
									                </asp:Label>
									        <asp:Label id=Label29 runat="server">
									                </asp:Label>
                                            <asp:Label ID="Label21" runat="server" Text=分)>
                                            </asp:Label>
				                    </HeaderTemplate>
					                <ItemTemplate>
						                <TABLE id="Table4" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
							                <tr>
								                <TD width="80%">
									                <asp:Label id=Label9 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
									                </asp:Label>
									                <asp:Label id=Label10 runat="server" Text='<%# Eval("Title","、{0}") %>'>
									                </asp:Label>
									                <asp:Label id=Label11 runat="server" ForeColor=red Text='<%# Eval("Answer") %>'>
									                </asp:Label>
									                <asp:Label id=Label12 runat="server" Text='<%# Eval("Mark") %>' Visible=false>
									                </asp:Label>									                
									                </TD>
								                <td width="10%">
									                <asp:CheckBox id="CheckBox5" runat="server" Text="正确"></asp:CheckBox></td>
									                <td width="10%">
									                <asp:CheckBox ID="CheckBox6" runat="server" Text="错误" />
									                </td>
							                </tr>
						                </TABLE>
                                        
					                </ItemTemplate>
				                </asp:TemplateField>
			                </Columns>
                            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView4" runat="server" Width=100% AutoGenerateColumns="False">
                            <Columns>
				                <asp:TemplateField >
				                    <HeaderTemplate>				                    
				                            <asp:Label id=Label18 runat="server" Text=四、填空题(每题>
									                </asp:Label>
									        <asp:Label id=Label30 runat="server" >
									                </asp:Label>
                                            <asp:Label ID="Label19" runat="server" Text=分)>
                                            </asp:Label>
				                    </HeaderTemplate>
					                <ItemTemplate>
						                <TABLE id="Table5" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
							                <TR>
								                <TD>
									                <asp:Label id=Label13 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
									                </asp:Label>
									                <asp:Label id=Label14 runat="server" Text='<%# Eval("FrontTitle","、{0}") %>'>
									                </asp:Label>
									                <asp:TextBox id="TextBox1" runat="server" ForeColor=red Width="100px" Text='<%# Eval("Answer") %>'></asp:TextBox>
									                <asp:Label id=Label15 runat="server" Text='<%# Eval("BackTitle") %>'>
									                </asp:Label>									                
									                <asp:Label id=Label17 runat="server" Text='<%# Eval("Mark") %>' Visible=false>
									                </asp:Label>									                												                
									                </TD>
							                </TR>
						                </TABLE>
					                </ItemTemplate>
				                </asp:TemplateField>
			                </Columns>
                            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                        </asp:GridView>
                    </td>
                </tr>                              
			</table>
    </div>
    </form>
</body>
</html>
