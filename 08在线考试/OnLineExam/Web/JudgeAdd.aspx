<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JudgeAdd.aspx.cs" Inherits="Web_JudgeAdd" StylesheetTheme="MRSOFTASPNET" %>
<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>判断题</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
<%--    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />  --%>   
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
            <td  valign="top" align="left" width ="87%">
            
           
                       <table cellpadding="0" cellspacing="0" border="1"  bordercolor="#cccccc" style="border-collapse:collapse" width="100%" >
               <tr>
                    <td bgcolor="#f6dda4" colspan="2"> <div class="title" align="left"><h4>
                        判断题</h4></div></td>                    
                </tr>
                <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;" width="80px">科目：</td>
                    <td >&nbsp;<div align="left"><asp:dropdownlist id="ddlCourse" runat="server" 
                            Font-Size="9pt" Width="88px" SkinID="ddlSkin"></asp:dropdownlist></div>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">题目：</td>
                    <td >&nbsp;<div align="left"><asp:textbox id="txtTitle"  runat="server" 
                            Width="100%" TextMode="MultiLine"	Height="60px" SkinID="tbSkin"></asp:textbox>
						 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTitle"
                            ErrorMessage="不能为空！"></asp:RequiredFieldValidator></div></td>
                </tr>
                
                  <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">答案</td>
                    <td >&nbsp;<div align="left"><asp:RadioButtonList ID="rblAnswer" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="true">正确</asp:ListItem>
                            <asp:ListItem Value="false">错误</asp:ListItem>
                        </asp:RadioButtonList></div></td>
                </tr>
                <tr>
                    <td></td>
                    <td ><asp:Label ID="lblMessage" runat="server" ForeColor=red></asp:Label><br />
                       <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="../Images/Save.GIF" OnClick="imgBtnSave_Click" />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					   <asp:ImageButton ID="imgBtnReturn" runat="server" CausesValidation="false" ImageUrl="../Images/Return.GIF" OnClick="imgBtnReturn_Click" /></td>
                </tr>
            </table>         
              
            </td>
        </tr>
    </table>  
      </form>  
</body>
</html>
