<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserPaper.aspx.cs" Inherits="Web_UserPaper" StylesheetTheme="MRSOFTASPNET"%>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>�Ծ�����</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />     
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      
    <tr>
      <td style="height:4px;" colspan="3">
            &nbsp;<img alt="" src="../Images/top-01.jpg" style="width: 1003px; height: 137px" /></td>
    </tr>
        <tr style="background: url(../Images/lineS.jpg) repeat-x;">
            <td style="height:25;" colspan="3">
                &nbsp;&nbsp;&nbsp;��ӭ����<asp:Label ID="labUser" runat="server" Text="Label" Width="70px"></asp:Label>&nbsp;&nbsp;
                                <script type="text/javascript">getDate();</script>

                <span id="ShowTime"></span></td>         
        </tr>


          <tr>
            <td  style="width: 20%;" align="center" valign="top">
                <uc1:lefttree ID="Lefttree1" runat="server" />
              </td>          
              <td  style="width: 4px;  background: url(../Images/line.gif) repeat-y;"> 
            </td>   
            <td  valign="top" align="left">
           
                                     <table cellpadding="0" cellspacing="0" border="1"  bordercolor="#cccccc" style="border-collapse:collapse" width="100%" frame="below">
              <tr>
                    <td style="text-align:right;">
                       �Ծ�</td>
                     <td  colspan="3">
                         &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label16" runat="server" Text="����ʱ�䣺" Width="103px"></asp:Label>
                                     <asp:Label ID="lblExamtime" runat="server" Width="236px"></asp:Label>
                         <asp:Label ID="Xpaperid" runat="server" Text="" Visible="false"></asp:Label></td>
                </tr>
                 <tr>
                    <td colspan="2"><b>����˵������ѡ�⡢��ѡ�⡢�ж��⡢�������ϵͳ�Զ����ֵģ��ʴ�����Ҫ��ÿ����������������</b></td>
                                  
                </tr>
                
                 <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">��ѡ��÷֣�</td>
                    <td >&nbsp;<div align="left">&nbsp;&nbsp;<asp:Label ID="sinScore" runat="server" Text="0" Font-Bold="true"></asp:Label>                                      </div></td>                   
                </tr>
                  <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">��ѡ��÷֣�</td>
                    <td >&nbsp;<div align="left">&nbsp;&nbsp;<asp:Label ID="mulScore" runat="server" Text="0" Font-Bold="true"></asp:Label>                                                    </div></td>                   
                </tr>
                  <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">�ж���÷֣�</td>
                    <td >&nbsp;<div align="left">&nbsp;&nbsp;<asp:Label ID="judScore" runat="server" Text="0" Font-Bold="true"></asp:Label>                     </div></td>                   
                </tr>
                  <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">�����÷֣�</td>
                    <td >&nbsp;<div align="left">&nbsp;&nbsp;<asp:Label ID="filScore" runat="server" Text="0" Font-Bold="true"></asp:Label>                     </div></td>                   
                </tr>
                 <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">�ʴ���÷֣�</td>
                    <td >&nbsp;<div align="left"><asp:Label  id="queScore" runat="server" Font-Bold="true"></asp:Label>
                        &nbsp; &nbsp;<asp:Label  id="lblQuestion" runat="server" Text="(>>����������ʴ�������з�<<)" Font-Bold="true"></asp:Label>                            </div></td>                   
                </tr>
                 <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">�ܷ֣�</td>
                    <td >&nbsp; &nbsp;<div align="left"><asp:Label id="sumScore" runat="server" Font-Bold="true"></asp:Label>                  
                       </div></td>                   
                </tr>
                 <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">���</td>
                    <td >&nbsp; &nbsp;<div align="left"><asp:TextBox id="tbxPingyu" runat="server" Font-Bold="true" Width="100%"></asp:TextBox>                  
                       </div></td>                   
                </tr>
                 <tr>
                    <td></td>
                    <td >&nbsp;<div align="left">                        
                        <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="../Images/Save.GIF" OnClick="imgBtnSave_Click" />
                        <asp:Label ID="lblMessage" runat="server" Width="300px" ForeColor=Red></asp:Label>
                         <asp:ImageButton ID="imgBtnReturn" runat="server" CausesValidation="false" ImageUrl="../Images/Return.GIF" OnClick="imgBtnReturn_Click" /></div></td>                   
                </tr>
				<tr>
				    <td colspan=4>                       
                            <table cellSpacing="0" style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=100%	bgColor="#ffffff" border="1" bordercolor=gray>
				                <tr>
				                    <td>
				                        <asp:GridView ID="GridView1" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
								                 <asp:TemplateField>
				                                   <HeaderTemplate>				                    
				                                       <asp:Label id="Label24" runat="server" Text="һ����ѡ��(ÿ��"></asp:Label>
									                   <asp:Label id="Label27" runat="server"></asp:Label>
                                                       <asp:Label ID="Label25" runat="server" Text="��)"></asp:Label>                                                       
				                                  </HeaderTemplate>
									                <ItemTemplate>
										                <TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											                <br />
											                <TR>
												                <TD colSpan="3">
													                <asp:Label id=Label1 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label2 runat="server" Text='<%# Eval("Title","��{0}") %>'>
													                </asp:Label>
													                <asp:Label id=Label3 runat="server" Text='<%# Eval("UserAnswer") %>' Visible="False"></asp:Label>
													                <asp:Label id=Label4 runat="server" Text='<%# Eval("Mark") %>' Visible=false></asp:Label>
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
											                <tr>
											                  <td colspan="3">
											                  �ο��𰸣� <asp:Label id=Label23 runat="server" Text='<%# Eval("Answer") %>'></asp:Label>
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
				                        <asp:GridView ID="GridView2" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
								                <asp:TemplateField>
				                                 <HeaderTemplate>				                    
				                                    <asp:Label id="Label22" runat="server" Text=������ѡ��(ÿ��></asp:Label>
									                <asp:Label id="Label28" runat="server"></asp:Label>
                                                    <asp:Label ID="Label23" runat="server" Text=��)></asp:Label>                                                   
				                                </HeaderTemplate>
									                <ItemTemplate>
										                <TABLE id="Table3" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											               <br />
											                <TR>
												                <TD colSpan="3">
													                <asp:Label id=Label5 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label6 runat="server" Text='<%# Eval("Title","��{0}") %>'>
													                </asp:Label>
													                 <asp:Label id=Label7 runat="server" Text='<%# Eval("UserAnswer") %>' Visible="False"></asp:Label>
													                <asp:Label id=Label8 runat="server" Text='<%# Eval("Mark") %>' Visible=false></asp:Label>
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
											                 <tr>
											                  <td colspan="3">
											                  �ο��𰸣�<asp:Label id=Label27 runat="server" Text='<%# Eval("Answer") %>'></asp:Label>
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
				                        <asp:GridView ID="GridView3" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
								                <asp:TemplateField>
				                               <HeaderTemplate>				                    
				                                   <asp:Label id="Label20" runat="server" Text=�����ж���(ÿ��></asp:Label>
									                <asp:Label id="Label29" runat="server"></asp:Label>
                                                   <asp:Label ID="Label21" runat="server" Text=��)></asp:Label>                                                  
				                                </HeaderTemplate>
									                <ItemTemplate>
										                <TABLE id="Table4" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											               <br />
											                <tr>
												                <td width="84%">
													                <asp:Label id="Label9" runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label10 runat="server" Text='<%# Eval("Title","��{0}") %>'>
													                </asp:Label>
													                 <asp:Label id=Label11 runat="server" Text='<%# Eval("UserAnswer")%>' Visible="false"></asp:Label>
													                <asp:Label id=Label12 runat="server" Text='<%# Eval("Mark") %>' Visible="false"></asp:Label>
													                </td>
												                <td width="8%">
													                <asp:CheckBox id="CheckBox5" runat="server" Text="��ȷ"></asp:CheckBox></td>
													             <td width="8%">
													             <asp:CheckBox ID="CheckBox6" runat="server" Text="����" />
													             </td>   
											                </tr>
											                 <tr>
											                  <td colspan="3">
											                  �ο��𰸣� <asp:Label id="Label21" runat="server" Text='<%# Eval("Answer").ToString()=="True"?"��ȷ":"����" %>'></asp:Label>
											                             <asp:Label id="Label41" runat="server" Text='<%# Eval("Answer")%>' Visible="false"></asp:Label>
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
				                                  <asp:Label id="Label18" runat="server" Text=�ġ������(ÿ��></asp:Label>
									              <asp:Label id="Label30" runat="server" ></asp:Label>
                                                  <asp:Label ID="Label19" runat="server" Text=��)> </asp:Label>                                                   
				                               </HeaderTemplate>
									                <ItemTemplate>
										                <TABLE id="Table5" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											               <br />
											                <TR>
												                <TD>
													                <asp:Label id=Label13 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label14 runat="server" Text='<%# Eval("FrontTitle","��{0}") %>'>
													                </asp:Label>
													                 <asp:TextBox id="TextBox1" Text='<%# Eval("UserAnswer") %>' runat="server" Width="150px" style="BORDER-BOTTOM:   gray   1px   solid" BorderStyle="None"></asp:TextBox>
													                <asp:Label id=Label15 runat="server" Text='<%# Eval("BackTitle") %>'>
													                </asp:Label>
													                <asp:Label id="Label17" runat="server" Text='<%# Eval("Mark") %>' Visible=false></asp:Label>												                
													                </TD>
											                </TR>
											                 <tr>
											                  <td>
											                  �ο��𰸣� <asp:Label id="Label26" runat="server" Text='<%# Eval("Answer") %>'></asp:Label>
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
				                        <asp:GridView ID="GridView5" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
								                <asp:TemplateField>
								                 <HeaderTemplate>				                    
				                                    <asp:Label id="Label32" runat="server" Text=�塢�ʴ���(ÿ��></asp:Label>
									                <asp:Label id="Label31" runat="server" ></asp:Label>
                                                    <asp:Label ID="Label33" runat="server" Text=��)></asp:Label>                                                   
				                                </HeaderTemplate>
									                <ItemTemplate>
										                <TABLE id="Table6" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											                <br>
											                <TR>
												                <TD>
													                <asp:Label id=Label18 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label19 runat="server" Text='<%# Eval("Title","��{0}") %>'>
													                </asp:Label>	
													                (����÷֣�<asp:TextBox ID="tbxqueScore" runat="server" Width="50px"></asp:TextBox>
													                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbxqueScore" ValidationExpression="^\d+$" ErrorMessage="ֻ��Ϊ��������0" Display="dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="����Ϊ��" ControlToValidate="tbxqueScore" Display="dynamic"></asp:RequiredFieldValidator>)
													                <br />												               
													            
													              <asp:TextBox ID="TextBox2" runat="server" TextMode="multiLine" ReadOnly="true" Width="100%" Text='<%# Eval("UserAnswer") %>'></asp:TextBox>													                
													                <asp:Label id=Label21 runat="server" Text='<%# Eval("Mark") %>' Visible=false></asp:Label>												                
													                </TD>
											                </TR>
											                 <tr>
											                  <td>
											                  �ο��𰸣� <br />
											                  <asp:TextBox ID="TextBox3" runat="server" TextMode="multiLine" Width="100%" Height="60px" ReadOnly="true" Text='<%#Eval("Answer") %>'></asp:TextBox>
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
				                    <br /><center> <asp:Button ID="Button1" runat="server" Text="�����Ծ��ܷ�������" 
                                               OnClick="Button1_Click" CausesValidation="true" SkinID="btnSkin"/>	
				                    </center>									              											            
				                   </td>
				                </tr>
				               
				            </table>          
              
            </td>
        </tr>
    </table>  
      </form>  
</body>
</html>