<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Web_Login" ValidateRequest="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>在线考试系统</title>
     <script language="javascript" type="text/javascript">
    function reloadcode()
    {
      document.getElementById('safecode').src='CreatePic.aspx?'+Math.random();
    }
    </script>
     <style type="text/css">
        div.RoundedCorner{background: #BAD4F7; width:350px;}
        b.rtop, b.rbottom{display:block;background: #FFF}
        b.rtop b, b.rbottom b{display:block;height: 1px;overflow: hidden; background: #BAD4F7}
        b.r1{margin: 0 5px}
        b.r2{margin: 0 3px}
        b.r3{margin: 0 2px}
        b.rtop b.r4, b.rbottom b.r4{margin: 0 1px;height: 17px
         }
        table.content{border:0px;height:100px; font-family:Tahoma; font-size:9.5pt;color:#363A36;}
         .style1
         {}
         </style>
    <link href="../Images/login.css" type="text/css" rel="stylesheet"/> 
   
</head>
<body leftmargin=0 rightmargin=0 topmargin=0>
    <form id="form1" runat="server" defaultbutton="imgBtnLogin">

    	<table width="100%" height="500" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="middle"><table width="100%" height="222" border="0" align="center" cellpadding="0" cellspacing="0" class="main_td">
                <tr>
                  <td width="45%" align="right" valign="bottom">
                      <asp:Image ID="Image1" runat="server" Height="152px" 
                          ImageUrl="../Images/login_logo.jpg" Width="206px" />
                    </td>
                  <td width="8"><img src="../Images/login_shadow.jpg" width="10" height="222" /></td>
                  <td align="right" background="images/login_right_bk.jpg"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="left" class="biaoti">在线考试模块登录窗口 | Login</td>
                      </tr>
                      <tr>
                        <td height="2" align="left" background="images/login_line_1.jpg"><img src="images/none.gif" width="1" height="1" /></td>
                      </tr>
                      <tr>
                        <td align="left"><table width="500" border="0" cellspacing="4" cellpadding="0">
                            <tr>
                              <td width="24%">考试号 | ID:</td>
                              <td width="76%">						
							<asp:TextBox id="txtUserID" runat="server" MaxLength="20" Width="150px"></asp:TextBox>   
                                        
                           <asp:CheckBox ID="cbxRemeberUser" runat="server" Text="记住用户名" Checked="true" /> 
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID"
                            ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                              <td>密　码 | PS:</td>
                              <td>
						<asp:TextBox id="txtPwd"  runat="server" MaxLength="20" TextMode="Password" Width="150px"></asp:TextBox>
                       
                                </td>
                            </tr>
                            <tr>
                              <td>验证码 | CODE:</td>
                              <td class="style1">
						<asp:TextBox ID="Validator" runat="server" Width="150px" ></asp:TextBox>                        
                      
                          <a href="javascript:reloadcode();" title="更换一张">
                         <img src="CreatePic.aspx" id="safecode" alt="更换一张验证"/>
                    看不清？</a><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                      ControlToValidate="txtPwd" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
                                  
                                </td>
                            </tr>
                            <tr>
                              <td colspan="2"><a href="javascript:location.replace('UserTest.aspx')">
						<asp:ImageButton ID="imgBtnLogin" runat="server" ImageUrl="~/Images/Login.GIF" 
                            OnClick="imgBtnLogin_Click" /></a>
					    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/RESET.GIF" 
                            onclick="ImageButton1_Click" CausesValidation="False" />
                                  <asp:Label ID="lblMessage" runat="server" ForeColor="red"></asp:Label>
                               
                              </td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="2" align="left" background="images/login_line_2.jpg"><img src="images/none.gif" width="1" height="1" /></td>
                      </tr>
                      <tr>
                        <td align="left" class="Copyright">Copyright © 2008 www.mrbccd.com All Rights 
                            MingriSoft</td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table>
    	
    </form>
</body>
</html>
