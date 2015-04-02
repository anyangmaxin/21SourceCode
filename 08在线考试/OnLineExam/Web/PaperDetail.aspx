<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaperDetail.aspx.cs" Inherits="Web_PaperDetail" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>试卷制定</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      
    <tr>
      <td style="height:4px;" colspan="3">
            <img src="../Images/top-01.jpg" style="border: 0px; left: 0px; position: relative; top: 0px;" title="" width ="100%"/>
         </td>
    </tr>
        <tr style="background: url(../Images/lineS.jpg) repeat-x;">
            <td style="height:15px;" colspan="3">
                &nbsp;&nbsp;&nbsp;欢迎您：<asp:Label ID="labUser" runat="server" Text="Label" Width="70px"></asp:Label>&nbsp;&nbsp;
                                <script type="text/javascript">getDate();</script>

                <span id="ShowTime"></span></td>         
        </tr>


          <tr>
            <td  align="left" valign="top" style="width:20%; height: 2002px;">
                <table  style="width: 31px;" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 100px; height: 131px;">
                            <table style="width: 28px" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 100px">
                                        <uc1:lefttree ID="Lefttree1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; height: 14px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                </td>          
              <td  style="background: url(../Images/line.gif) repeat-y; height: 2002px;"> 
            </td>   
            <td  valign="top" align="left" style="height: 2002px">
            
           
            <table cellpadding="0" cellspacing="0" border="1"  bordercolor="#cccccc" style="border-collapse:collapse" width="100%" frame="below">
              <tr>
                    <td  style="text-align:left; width: 80px;">
                       试卷：</td>
                     <td  colspan="3">&nbsp;<div align="left"></div>
                    </td>
                </tr>
				<tr>
				    <td colspan=4>                       
                            <table cellSpacing="0" style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=100%	bgColor="#ffffff" border="1" bordercolor=gray>
				                <tr>
				                    <td>
				                        <asp:GridView ID="GridView1" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
								                <asp:TemplateField HeaderText="一、选择题">
									                <ItemTemplate>
										                <TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											                <br />
											                <TR>
												                <TD colSpan="3">
													                <asp:Label id=Label1 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label2 runat="server" Text='<%# Eval("Title","、{0}") %>'>
													                </asp:Label>
													                <asp:Label id=Label3 runat="server" Text='<%# Eval("ID") %>' Visible="False">
													                </asp:Label>
													                </TD>
											                </TR>
											                <TR>
												                <TD width="35%">
                                                                    A:<asp:RadioButton id="RadioButton1" runat="server" Text='<%# Eval("AnswerA") %>' GroupName="Sl">
													                </asp:RadioButton></TD>
												                <TD style="width: 35%">
													                B:<asp:RadioButton id="RadioButton2" runat="server" Text='<%# Eval("AnswerB") %>' GroupName="Sl">
													                </asp:RadioButton></TD>
												                <TD></TD>
											                </TR>
											                <TR>
												                <TD width="35%">
													                C:<asp:RadioButton id="RadioButton3" runat="server" Text='<%# Eval("AnswerC") %>' GroupName="Sl">
													                </asp:RadioButton></TD>
												                <TD style="width: 35%">
													                D:<asp:RadioButton id="RadioButton4" runat="server" Text='<%# Eval("AnswerD") %>' GroupName="Sl">
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
				                    <td style="height: 484px">
				                        <asp:GridView ID="GridView2" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
								                <asp:TemplateField HeaderText="二、多选题">
									                <ItemTemplate>
										                <TABLE id="Table3" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											               <br />
											                <TR>
												                <TD colSpan="3">
													                <asp:Label id=Label9 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label10 runat="server" Text='<%# Eval("Title","、{0}") %>'>
													                </asp:Label>
													                <asp:Label id=Label6 runat="server" Text='<%# Eval("ID") %>' Visible="False">
													                </asp:Label>
													                </TD>
											                </TR>
											                <TR>
												                <TD style="HEIGHT: 22px" width="35%">
													                A:<asp:CheckBox id="CheckBox1" runat="server" Text='<%# Eval("AnswerA") %>'>
													                </asp:CheckBox></TD>
												                <TD style="HEIGHT: 22px" width="35%">
													                B:<asp:CheckBox id="CheckBox2" runat="server" Text='<%# Eval("AnswerB") %>'>
													                </asp:CheckBox></TD>
												                <TD style="HEIGHT: 22px"></TD>
											                </TR>
											                <TR>
												                <TD width="35%">
													                C:<asp:CheckBox id="CheckBox3" runat="server" Text='<%# Eval("AnswerC") %>'>
													                </asp:CheckBox></TD>
												                <TD width="350%">
													                D:<asp:CheckBox id="CheckBox4" runat="server" Text='<%# Eval("AnswerD") %>'>
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
				                        <asp:GridView ID="GridView3" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
								                <asp:TemplateField HeaderText="三、判断题">
									                <ItemTemplate>
										                <table id="Table4" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
											               <br />
                                                            <tr>
												                <td width="80%">
													                <asp:Label id="Label19" runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id="Label20" runat="server" Text='<%# Eval("Title","、{0}") %>'>
													                </asp:Label>
													                <asp:Label id="Label7" runat="server" Text='<%# Eval("ID") %>' Visible="False">
													                </asp:Label>
													                </td>
												                <td style="width: 10%">
													                <asp:CheckBox id="CheckBox5" runat="server" Text="正确"></asp:CheckBox></td>
                                                                <td style="width: 10%">
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
								                <asp:TemplateField HeaderText="四、填空题">
									                <ItemTemplate>
										                <TABLE id="Table5" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											               <br />
											                <TR>
												                <TD>
													                <asp:Label id=Label16 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label17 runat="server" Text='<%# Eval("FrontTitle","、{0}") %>'>
													                </asp:Label>
													                <asp:TextBox id="TextBox1" runat="server" Width="150px" style="BORDER-BOTTOM:   gray   1px   solid" BorderStyle="None"></asp:TextBox>
													                <asp:Label id=Label18 runat="server" Text='<%# Eval("BackTitle") %>'>
													                </asp:Label>
													                <asp:Label id=Label8 runat="server" Text='<%# Eval("ID") %>' Visible="False">
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
				                
				                <tr>
				                    <td>
				                        <asp:GridView ID="GridView5" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
								                <asp:TemplateField HeaderText="四、问答题">
									                <ItemTemplate>
										                <TABLE id="Table6" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											                <br>
											                <TR>
												                <TD>
													                <asp:Label id=Label21 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label22 runat="server" Text='<%# Eval("Title","、{0}") %>'>
													                </asp:Label>	
													                <br />												               
													                <asp:TextBox id="txtAnswer" runat="server" Width="100%" TextMode="MultiLine"></asp:TextBox>													                
													                <asp:Label id=Label23 runat="server" Text='<%# Eval("ID") %>' Visible="False">
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
				                
				                <tr>
				                    <td align=center style="height: 31px">
                                        <asp:ImageButton ID="imgBtnReturn" runat="server" CausesValidation="false" ImageUrl="../Images/Return.GIF" OnClick="imgBtnReturn_Click" />
                                        </td>
				                </tr>
				            </table>                      
				    </td>
				</tr>
				
            </table>         
              
            </td>
        </tr>
    </table>  
      </form>  
</body>
</html>