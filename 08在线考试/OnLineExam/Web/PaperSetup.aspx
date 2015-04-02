<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaperSetup.aspx.cs" Inherits="Web_PaperSetup2" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>试卷制定</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
    <%--<link href="../CSS/CSS.css" rel="stylesheet" type="text/css" /> --%>    
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
  
      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
         <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      
    <tr>
      <td style="height:4px;" colspan="3">
            <img src="../Images/top-01.jpg" style="border: 0px; left: 0px; position: relative; top: 0px;" title="" width ="100%"/>
         </td>
    </tr>
        <tr style="background: url(../Images/lineS.jpg) repeat-x;">
            <td style="height:25;" colspan="3">
                &nbsp;&nbsp;&nbsp;欢迎您：<asp:Label ID="labUser" runat="server" Text="Label" Width="70px"></asp:Label>&nbsp;&nbsp;
                                <script type="text/javascript">getDate();</script>

                <span id="ShowTime"></span></td>         
        </tr>


          <tr>
            <td  style="width: 130px" align="center" valign="top">
                <uc1:lefttree ID="Lefttree1" runat="server" />
           </td>          
              <td  style="width: 4px;  background: url(../Images/line.gif) repeat-y;"> 
            </td>   
            <td  valign="top" align="left"  width="960px">
            
           
                       <table cellpadding="0" cellspacing="0" border="1"  bordercolor="#cccccc" style="border-collapse:collapse" width="100%" frame="below">
               <tr>
                    <td bgcolor="#f6dda4" style="width:100%;" colspan="4"> <div class="title" align="left"><h4>试卷制定</h4></div></td>                    
                </tr>
                <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;"><b>考试科目：</b></td>
                    <td >&nbsp;<div align="left"><asp:dropdownlist id="MyddlCourse" runat="server" Font-Size="9pt" Width="88px"></asp:dropdownlist></div>
                    </td>
                    <td bgcolor="#f6dda4" style="text-align:right;">试卷名称：</td>
                     <td >&nbsp;<div align="left">  <asp:TextBox ID="txtPaperName" runat="server" style="BORDER-TOP-STYLE: none;BORDER-BOTTOM: 1px solid;BORDER-RIGHT-STYLE: none;BORDER-LEFT-STYLE: none;width:120px;" Width="120px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPaperName" ErrorMessage="不能为空！" Display="Dynamic"></asp:RequiredFieldValidator>
                         <asp:Button ID="CheckPagerName" runat="server" Text="检测试卷名称是否存在！" Width="137px" 
                             CausesValidation="False" onclick="CheckPagerName_Click" SkinID="btnSkin" />
                         </div>
                    </td>
                </tr>                 
				<tr> 
                    <td bgcolor="#f6dda4" style="text-align:right;"><b>单选题</b>每题分值：</td>
                     <td colspan="3">&nbsp;<div align="left">   <asp:TextBox ID="txtSingleFen" style="BORDER-TOP-STYLE: none;BORDER-BOTTOM: 1px solid;BORDER-RIGHT-STYLE: none;BORDER-LEFT-STYLE: none;width:120px;" runat="server" Width="120px"></asp:TextBox>
                         <asp:Label ID="Label1" runat="server" Text="分"></asp:Label>&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                             ControlToValidate="txtSingleFen" ValidationExpression="^(0|[1-9]\d*)$" 
                             ErrorMessage="请输入正确分值" Display="Dynamic"></asp:RegularExpressionValidator>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ControlToValidate="txtSingleFen" Display="Dynamic"></asp:RequiredFieldValidator></div>
                    </td>
                </tr>                
                <tr>                   
                    <td bgcolor="#f6dda4" style="text-align:right;"><b>多选题</b>每题分值：</td>
                     <td colspan="3">&nbsp;<div align="left">    <asp:TextBox ID="txtMultiFen" runat="server" style="BORDER-TOP-STYLE: none;BORDER-BOTTOM: 1px solid;BORDER-RIGHT-STYLE: none;BORDER-LEFT-STYLE: none;width:120px;" Width="120px"></asp:TextBox>
                         <asp:Label ID="Label4" runat="server" Text="分"></asp:Label>&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                             ControlToValidate="txtMultiFen" ValidationExpression="^\+?[1-9][0-9]d*$" 
                             ErrorMessage="请输入正确分值" Display="Dynamic"></asp:RegularExpressionValidator>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="不能为空" ControlToValidate="txtMultiFen" Display="Dynamic"></asp:RequiredFieldValidator></div>
                    </td>
                </tr>                
                <tr>                   
                    <td bgcolor="#f6dda4" style="text-align:right;"><b>判断题</b>每题分值：</td>
                     <td colspan="3">&nbsp;<div align="left">   <asp:TextBox ID="txtJudgeFen" runat="server" style="BORDER-TOP-STYLE: none;BORDER-BOTTOM: 1px solid;BORDER-RIGHT-STYLE: none;BORDER-LEFT-STYLE: none;width:120px;" Width="120px"></asp:TextBox>
                         <asp:Label ID="Label5" runat="server" Text="分"></asp:Label>&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                             ControlToValidate="txtJudgeFen" ValidationExpression="^(0|[1-9]\d*)$" 
                             ErrorMessage="请输入正确分值数" Display="Dynamic"></asp:RegularExpressionValidator>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="不能为空" ControlToValidate="txtJudgeFen" Display="Dynamic"></asp:RequiredFieldValidator></div>
                    </td>
                </tr>                
                <tr>                    
                    <td bgcolor="#f6dda4" style="text-align:right;"><b>填空题</b>每题分值：</td>
                     <td colspan="3">&nbsp;<div align="left">    <asp:TextBox ID="txtFillFen" runat="server" style="BORDER-TOP-STYLE: none;BORDER-BOTTOM: 1px solid;BORDER-RIGHT-STYLE: none;BORDER-LEFT-STYLE: none;width:120px;" Width="120px"></asp:TextBox>
                         <asp:Label ID="Label9" runat="server" Text="分"></asp:Label>&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                             ControlToValidate="txtFillFen" ValidationExpression="^(0|[1-9]\d*)$" 
                             ErrorMessage="请输入正确分值" Display ="Dynamic"></asp:RegularExpressionValidator>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="不能为空" ControlToValidate="txtFillFen" Display="Dynamic"></asp:RequiredFieldValidator></div>
                    </td>
                </tr>                 
                <tr>                   
                    <td bgcolor="#f6dda4" style="text-align:right;"><b>问答题</b>每题分值：</td>
                     <td colspan="3">&nbsp;<div align="left">    <asp:TextBox ID="txtQuestionFen" runat="server" style="BORDER-TOP-STYLE: none;BORDER-BOTTOM: 1px solid;BORDER-RIGHT-STYLE: none;BORDER-LEFT-STYLE: none;width:120px;" Width="120px"></asp:TextBox>
                         <asp:Label ID="Label11" runat="server" Text="分"></asp:Label>&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                             runat="server" ControlToValidate="txtQuestionFen" 
                             ValidationExpression="^\+?[1-9][0-9]d*$" ErrorMessage="请输入正确分值" 
                             Display ="Dynamic"></asp:RegularExpressionValidator>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="不能为空" ControlToValidate="txtQuestionFen" Display ="Dynamic"></asp:RequiredFieldValidator></div>
                    </td>
                </tr>
				<tr>
				    <td colspan=4>                       
                            <table cellSpacing="0" style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=100%	bgColor="#ffffff" border="1" bordercolor=gray>
				                <tr>
				                    <td>
				                        <asp:GridView ID="GridView1" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
                                           <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect1" runat="server" ></asp:CheckBox>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px"/>
                                        </asp:TemplateField>
								            <asp:TemplateField HeaderText="一、单选题">
									                <ItemTemplate>										               												               
													  <asp:Label id=Label2 runat="server" Text='<%# Eval("Title","{0}") %>'></asp:Label>
													 <asp:Label id=Label3 runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>													                
									                </ItemTemplate>
								                </asp:TemplateField>
							                </Columns>
                                            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                                        </asp:GridView>
                                        &nbsp;
                                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <asp:GridView ID="GridView2" runat="server" Width=100% AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
                                             <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect2" runat="server" ></asp:CheckBox>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px"/>
                                        </asp:TemplateField>
								                <asp:TemplateField HeaderText="二、多选题">
									                <ItemTemplate>										               
													   <asp:Label id=Label10 runat="server" Text='<%# Eval("Title","{0}") %>'></asp:Label>
													 <asp:Label id=Label6 runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
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
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect3" runat="server" ></asp:CheckBox>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px"/>
                                        </asp:TemplateField>
								                <asp:TemplateField HeaderText="三、判断题">
									                <ItemTemplate>										               
													   <asp:Label id="Label20" runat="server" Text='<%# Eval("Title","{0}") %>'></asp:Label>
													   <asp:Label id="Label7" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>													               
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
                                               <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect4" runat="server" ></asp:CheckBox>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px"/>
                                        </asp:TemplateField>
								                <asp:TemplateField HeaderText="四、填空题">
									                <ItemTemplate>										               
													<asp:Label id=Label17 runat="server" Text='<%# Eval("FrontTitle","{0}") %>'></asp:Label>
													<asp:TextBox id="TextBox1" runat="server" Width="100px" style="BORDER-BOTTOM:   gray   1px   solid" BorderStyle="None"></asp:TextBox>
													<asp:Label id=Label18 runat="server" Text='<%# Eval("BackTitle") %>'></asp:Label>
												<asp:Label id=Label8 runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
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
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect5" runat="server" ></asp:CheckBox>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px"/>
                                        </asp:TemplateField>
								                <asp:TemplateField HeaderText="五、问答题">
									                <ItemTemplate>
											         <asp:Label id=Label22 runat="server" Text='<%# Eval("Title","{0}") %>'></asp:Label>	<br />													             											               
													 <asp:TextBox id="txtAnswer" runat="server" Width="100%" TextMode="MultiLine"></asp:TextBox>													                
													 <asp:Label id=Label23 runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>	
									                </ItemTemplate>
								                </asp:TemplateField>
							                </Columns>
                                            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                                        </asp:GridView>
                                        <br /><br /><asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="true" 
                                            Text="全选/反选" Width="102px" OnCheckedChanged="chkSelectAll_CheckedChanged" />
				                    </td>
				                </tr>
				                
				                <tr>
				                    <td align=center style="height: 31px">
                                        <asp:Button ID="imgBtnSave" runat="server" OnClick="imgBtnSave_Click" SkinID="btnSkin"
                                            Text="试 卷 保 存" /></td>
				                </tr>
				            </table>                      
				    </td>
				</tr>
				
            </table>         
              
            </td>
        </tr>
    </table> 
            </ContentTemplate>
      </asp:UpdatePanel>
  
      </form>  
</body>
</html>