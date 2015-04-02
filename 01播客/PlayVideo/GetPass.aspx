<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetPass.aspx.cs" Inherits="GetPass" %>

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
-->
</style>

</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
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
            <td height="29"  background="images/mizh_t.jpg"style="text-align: left"><table width="150" >
              <tr>
                <td style="width: 29px">&nbsp;</td>
                <td valign="middle" width="123"  style="height: 29px" class="hongcu">
                    密码找回</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td   height="14">
            <table width="700"  height="400" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#71add1" style="background-repeat: no-repeat">
                <tr>
                  <td width="367" valign="middle" bgcolor="#FFFFFF">
                  
                  
                  
                  
                  <table border="0" cellpadding="0" cellspacing="0" style="width: 625px">
                           <tr>
                               <td style="width: 100px">
                               </td>
                               <td style="width: 100px">
                                   <asp:Panel ID="PanelInputName" runat="server" Height="50px" Width="125px">
                                       <table border="0" cellpadding="0" cellspacing="0" style="width: 222px; height: 81px">
                                           <tr>
                                               <td colspan="2" style="height: 35px">
                                                   <span><span><span style="color: #ff0000"><strong><span style="color: #ff0033">输</span>入需要找回密码的用户名</strong></span></span></span></td>
                                           </tr>
                                           <tr>
                                               <td style="width: 100px; height: 35px; text-align: right">
                                                   用户名：</td>
                                               <td style="width: 100px; height: 35px; text-align: left">
                                                   <asp:TextBox ID="txtName" runat="server" Width="103px"></asp:TextBox></td>
                                           </tr>
                                           <tr>
                                               <td colspan="2" style="height: 29px; text-align: center">
                                                   <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="下一步" />&nbsp;
                                                   <asp:Button ID="btnOReturn" runat="server" PostBackUrl="~/index.aspx" Text="返　回" /></td>
                                           </tr>
                                       </table>
                                   </asp:Panel>
                                   <asp:Panel ID="PanelGetPass" runat="server" Height="124px" Visible="False" Width="311px">
                                       <div style="text-align: center">
                                           <table border="0" cellpadding="0" cellspacing="0" style="width: 284px; height: 117px">
                                               <tr>
                                                   <td style="width: 125px; text-align: right">
                                                       密码提示问题：</td>
                                                   <td style="width: 100px">
                                                       <asp:TextBox ID="txtQuestion" runat="server" ReadOnly="True" Width="125px"></asp:TextBox></td>
                                               </tr>
                                               <tr>
                                                   <td style="width: 125px; text-align: right">
                                                       密码提示答案：</td>
                                                   <td style="width: 100px">
                                                       <asp:TextBox ID="txtAnswer" runat="server" Width="125px"></asp:TextBox></td>
                                               </tr>
                                               <tr>
                                                   <td style="width: 125px; text-align: right">
                                                       找回的密码：</td>
                                                   <td style="width: 100px">
                                                       <asp:TextBox ID="txtPass" runat="server" ReadOnly="True" Width="125px"></asp:TextBox></td>
                                               </tr>
                                               <tr>
                                                   <td colspan="2" style="height: 19px">
                                                       <asp:Button ID="btnGet" runat="server" OnClick="btnGet_Click" Text="查　找" />
                                                       &nbsp;
                                                       <asp:Button ID="btnReturn" runat="server" PostBackUrl="~/index.aspx" Text="返　回" /></td>
                                               </tr>
                                           </table>
                                       </div>
                                   </asp:Panel>
                               
                            
                            
                            
                            
                            
                               </td>
                           </tr>
                       </table>
                  
                  
                  
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









