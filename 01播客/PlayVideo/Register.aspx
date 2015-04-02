<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register Src="webUser/Top.ascx" TagName="Top" TagPrefix="uc1" %>
<%@ Register Src="webUser/Search.ascx" TagName="Search" TagPrefix="uc2" %>
<%@ Register Src="webUser/WebUserControlUserLogin.ascx" TagName="WebUserControlUserLogin"
    TagPrefix="uc3" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    
             <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
                  .style1
                  {
                      height: 5px;
                      width: 79px;
                  }
                  .style2
                  {
                      height: 45px;
                      width: 79px;
                  }
                  .style3
                  {
                      height: 90px;
                      width: 79px;
                  }
                  .style4
                  {
                      width: 79px;
                  }
-->
</style>
    

</head>
<body style="text-align: center">
    <form id="form1" runat="server">
<table background="images/midbg_02.jpg"width="900" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="160"  rowspan="3"><img src="images/mrbkw.jpg"   style="width: 160px; height:77px" /></td>
    <td width="740" height="39" align="right" class="chengse">
        <uc3:WebUserControlUserLogin ID="WebUserControlUserLogin2" runat="server" />
    </td>
  </tr>
  <tr>
    <td   >  
        <uc2:Search ID="Search1" runat="server" />
    </td>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
</table>



<table width="900" height="67" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" >
        <uc1:Top ID="Top2" runat="server" />
    </td>
  </tr>
</table>
<table width="900" height="166" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="484" valign="top"><table width="704" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><table width="698" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="29" background="images/mizh_t.jpg" style="text-align: left"><table width="150" >
              <tr>
                <td style="width: 29px">&nbsp;</td>
                <td valign="middle" width="123"  style="height: 29px" class="hongcu">
                    用户注册</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="14"><table width="700" height="400" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#999999">
                <tr>
                  <td width="367" valign="middle" bgcolor="#FFFFFF" style="text-align: center">
                   <div align="center">
                       <table border="0" cellpadding="0" cellspacing="0" 
                           style="width: 625px; height: 370px;" align="center">
                           <tr>
                               <td style="width: 100px">
                                   &nbsp;</td>
                               <td style="width: 100px" align="center" valign="top">
                               
                               <asp:Panel ID="PanelRegister" runat="server" Height="50px" Width="125px">
                                   <table  border="0" cellpadding="0" cellspacing="0" 
                                       style="width: 409px; height: 204px;text-align: top">
                                       <tr>
                                           <td style="width: 123px; text-align: right">
                                               用户名：</td>
                                           <td style="width: 14px; text-align: left">
                                               <asp:TextBox ID="txtName" runat="server" Width="99px"></asp:TextBox>
                                               <span style="color: #ff0000">*</span>
                                           </td>
                                           <td style="width: 134px; text-align: left">
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                        ErrorMessage="必填"></asp:RequiredFieldValidator>
                                               <asp:Button ID="btnSelectName" runat="server" OnClick="btnSelectName_Click" Text="检测用户名"
                        Width="93px" />
                                           </td>
                                       </tr>
                                       <tr>
                                           <td style="width: 123px; height: 24px; text-align: right">
                                               <span style="color: #000033">密码：</span></td>
                                           <td style="width: 14px; height: 24px; text-align: left; color: #ff0000;">
                                               <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="99px"></asp:TextBox>
                                               <span>*</span></td>
                                           <td style="width: 134px; height: 24px; text-align: left; color: #000000;">
                                           </td>
                                       </tr>
                                       <tr style="color: #000000">
                                           <td style="width: 123px; height: 26px; text-align: right">
                                               <span style="color: #000033">确认密码：</span></td>
                                           <td style="width: 14px; height: 26px; text-align: left; color: #ff0000;">
                                               <asp:TextBox ID="txtValidatePass" runat="server" TextMode="Password" 
                        Width="99px"></asp:TextBox>
                                               <span>*</span></td>
                                           <td style="width: 134px; height: 26px; text-align: left; color: #000000;">
                                               <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
                        ControlToValidate="txtValidatePass" ErrorMessage="两次密码不一致"></asp:CompareValidator>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td style="width: 123px; height: 24px; text-align: right">
                                               密码提示问题：</td>
                                           <td style="width: 14px; height: 24px; text-align: left">
                                               <asp:TextBox ID="txtPassQuestion" runat="server" Width="99px"></asp:TextBox>
                                               <span
                        style="color: #ff0000">*</span></td>
                                           <td style="width: 134px; height: 24px; text-align: left">
                                           </td>
                                       </tr>
                                       <tr>
                                           <td style="width: 123px; height: 24px; text-align: right">
                                               密码提示答案：</td>
                                           <td style="width: 14px; height: 24px; text-align: left">
                                               <asp:TextBox ID="txtPassAnswer" runat="server" Width="99px"></asp:TextBox>
                                               <span style="color: #ff0000">*</span></td>
                                           <td style="width: 134px; height: 24px; text-align: left">
                                           </td>
                                       </tr>
                                       <tr>
                                           <td style="width: 123px; height: 25px; text-align: right">
                                               E-mail：</td>
                                           <td style="width: 14px; height: 25px; text-align: left">
                                               <asp:TextBox ID="txtEmail" runat="server" Width="99px"></asp:TextBox>
                                               <span style="color: #ff0000">*</span></td>
                                           <td style="width: 134px; height: 25px; text-align: left">
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="格式不正确" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td colspan="3" style="height: 21px; text-align: center">
                                               <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" 
                        Text="注　册" />
                                               &nbsp;
                                               <asp:Button ID="btnRegisterReturn" runat="server" Text="返  回" 
                        PostBackUrl="~/index.aspx" CausesValidation="False" />
                                           </td>
                                       </tr>
                                   </table>
        </asp:Panel><asp:Panel ID="PanelInfo" runat="server" Height="50px" Width="125px" Visible="False">
                                       <table id="TABLE1" border="0" cellpadding="0" cellspacing="0" style="border-right: #66ccff thin solid;
                border-top: #66ccff thin solid; border-left: #66ccff thin solid; width: 420px;
                border-bottom: #66ccff thin solid; height: 200px">
                                           <tr>
                                               <td style="width: 100px; height: 5px">
                                                   昵称：</td>
                                               <td style="width: 122px; height: 5px">
                                                   <asp:TextBox ID="txtNickname" runat="server"></asp:TextBox>
                                               </td>
                                               <td class="style1">
                                               </td>
                                           </tr>
                                           <tr>
                                               <td style="width: 100px; height: 45px">
                                                   性别：</td>
                                               <td style="width: 122px; height: 45px; text-align: left">
                                                   <asp:RadioButtonList ID="rbtnlsSex" runat="server" RepeatDirection="Horizontal" 
                            Width="43px" Height="40px">
                                                       <asp:ListItem Selected="True">男</asp:ListItem>
                                                       <asp:ListItem>女</asp:ListItem>
                                                   </asp:RadioButtonList>
                                               </td>
                                               <td class="style2">
                                               </td>
                                           </tr>
                                           <tr>
                                               <td style="width: 100px; height: 90px">
                                                   头像：</td>
                                               <td style="width: 122px; height: 90px">
                                                   <table border="0" cellpadding="0" cellspacing="0" 
                            style="width: 254px; height: 146px">
                                                       <tr>
                                                           <td style="width: 100px">
                                                               <asp:FileUpload ID="fupImg" runat="server" />
                                                           </td>
                                                       </tr>
                                                       <tr>
                                                           <td style="width: 100px; text-align: center">
                                                               <asp:Button ID="btnUp" runat="server"  Text="上　传" OnClick="btnUp_Click" />
                                                           </td>
                                                       </tr>
                                                       <tr>
                                                           <td style="width: 100px; text-align: left">
                                                               <asp:Image ID="ImageHead" runat="server" Height="100px" Width="100px" />
                                                           </td>
                                                       </tr>
                                                   </table>
                                               </td>
                                               <td class="style3">
                                               </td>
                                           </tr>
                                           <tr>
                                               <td style="width: 100px">
                                                   所在城市：</td>
                                               <td style="width: 122px">
                                                   <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                               </td>
                                               <td class="style4">
                                               </td>
                                           </tr>
                                           <tr>
                                               <td style="width: 100px">
                                                   QQ：</td>
                                               <td style="width: 122px">
                                                   <asp:TextBox ID="txtQQ" runat="server"></asp:TextBox>
                                               </td>
                                               <td class="style4">
                                               </td>
                                           </tr>
                                           <tr>
                                               <td style="width: 100px">
                                                   个性留言：</td>
                                               <td style="width: 122px">
                                                   <asp:TextBox ID="txtSpeak" runat="server" Height="80px" TextMode="MultiLine" 
                            Width="249px"></asp:TextBox>
                                               </td>
                                               <td class="style4">
                                               </td>
                                           </tr>
                                           <tr>
                                               <td colspan="3">
                                                   <asp:Button ID="btnEnd" runat="server" OnClick="btnEnd_Click" Text="完  成" />
                                                   &nbsp;
                                                   <asp:Button ID="btnInfoReturn" runat="server" Text="返  回" 
                            PostBackUrl="~/index.aspx" />
                                               </td>
                                           </tr>
                                       </table>
        </asp:Panel>
                               </td>
                           </tr>
                       </table>
                  
        
        
        
        
        
        
                  </div>
                  </td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        </tr>
    </table>
      <table width="704" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="5"></td>
        </tr>
      </table>
      </td>
    <td width="414" valign="top"><table width="189" height="25" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="5"></td>
      </tr>
    </table>
    <table width="189" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="5" align="center"><img src="images/line.gif" width="174" height="360" border="0" usemap="#Map2" /></td>
        </tr>
      </table></td>
  </tr>
</table>



<table width="900" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="2" align="center" bgcolor="#C7CED4"></td>
  </tr>
  <tr>
    <td height="25" width="900" align="left" valign="middle" background="images/end1_08.jpg" bgcolor="#F9FAFC">　　　　　　　　　　　　　　　　明日主站|明日图书|明日软件|明日编程词典网|明日论坛|招贤纳士|<asp:LinkButton ID="LinkButton1"  runat="server" PostBackUrl="~/manage/manage_login.aspx" Font-Underline="False">后台登录</asp:LinkButton></td>
  </tr>
  <tr>
    <td height="80"><img src="images/end2_09.jpg" width="900" height="80" /></td>
  </tr>
</table>
<map name="Map2" id="Map2">
  <area shape="rect" coords="6,321,170,357" href="http://www.mingrisoft.com" />
  <area shape="rect" coords="5,269,169,305" href="http://www.mingrisoft.com" />
  <area shape="rect" coords="7,218,171,254" href="http://www.mingrisoft.com" />
  <area shape="rect" coords="7,149,168,202" href="http://www.mingrisoft.com" />
  <area shape="rect" coords="9,76,170,129" href="http://www.mingrisoft.com" /><area shape="rect" coords="7,2,168,55" href="http://www.mingrisoft.com" />
</map>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
      
    </form>
</body>
</html>
