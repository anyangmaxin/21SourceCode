<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PwdModify.aspx.cs" Inherits="Web_PwdModify" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>修改密码</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>    
    <%--<link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />  --%>   
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width ="100%">
      
    <tr>
      <td style="height:4px;" colspan="3">
            <img src="../Images/top-01.jpg" style="border: 0px; left: 0px; position: relative; top: 0px;" title="" width ="100%"/>
         </td>
    </tr>
        <tr style="background: url(../Images/lineS.jpg) repeat-x;">
            <td style="height:25;" colspan="3">
                &nbsp;&nbsp;&nbsp;欢迎您：<asp:Label ID="labUser" runat="server" Text="Label" Width="70px"></asp:Label>&nbsp;&nbsp;
                                <script type="text/javascript">getDate();</script>
              <span id="ShowTime"></span>  </td>         
        </tr>


          <tr>
            <td  style="width: 130px" align="center" valign="top">
                <uc1:lefttree ID="Lefttree1" runat="server" />
           </td>          
              <td  style="width: 4px;background: url(../Images/line.gif) repeat-y;"> 
            </td>   
            <td  valign="top" align="left" width="960px">
            
           
                       <table cellpadding="0" cellspacing="0" border="1"  bordercolor="#cccccc" style="border-collapse:collapse" width="100%" frame="below">
               <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;width:100%;" colspan="2"> <div class="title" align="left"><h4>修改密码</h4></div></td>                    
                </tr>
                <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">原密码：</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtOldPwd" runat="server" TextMode="Password" Width="170px"></asp:TextBox>                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPwd" ErrorMessage="不能为空！"></asp:RequiredFieldValidator></div>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">新密码：</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtNewPwd" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPwd"
                                ErrorMessage="不能为空！"></asp:RequiredFieldValidator></div></td>
                </tr>
                <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">确认密码：</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtConfirmPwd"  runat="server" MaxLength="20" TextMode=password Width="168px"></asp:TextBox>
                       <asp:CompareValidator id="cpv_newpassword" runat="server" ErrorMessage="确认密码不一致" ControlToValidate="txtConfirmPwd" ControlToCompare="txtNewPwd"></asp:CompareValidator></div></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td >&nbsp; <asp:Label ID="lblMessage" runat="server" ForeColor=red></asp:Label><br />
                       <asp:ImageButton ID="imgBtnModifyPwd" runat="server" ImageUrl="../Images/Update.GIF" OnClick="imgBtnModifyPwd_Click1"/>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					   <asp:ImageButton ID="imgBtnReset" runat="server" CausesValidation="false" ImageUrl="../Images/RESET.GIF" OnClick="imgBtnReset_Click"  /></td>
                </tr>
            </table>         
              
            </td>
        </tr>
    </table>  
      </form>  
</body>
</html>
