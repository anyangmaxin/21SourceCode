<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<%@ Register Src="webUser/Top.ascx" TagName="Top" TagPrefix="uc1" %>
<%@ Register Src="webUser/Search.ascx" TagName="Search" TagPrefix="uc2" %>
<%@ Register Src="webUser/WebUserControlUserLogin.ascx" TagName="WebUserControlUserLogin"
    TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
   <%-- <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>--%>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <%--<style type="text/css">
<!--
.STYLE1 {font-size: 12px; line-height: 22px; color: #000000; font-family: "宋体";}
-->
</style>--%>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
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

            <table width="587" height="375" align="center">
                <tr>
                    <td height="100%">
                        <table align="center" cellpadding="0" cellspacing="0" style="width: 386px; height: 171px">
                            <tr>
                                <td width="314" height="266" valign="middle" style="background-image: url(images/ksdl.jpg); background-repeat: no-repeat" >
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="height: 38px">
                                                <table width="249" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="huise1" style="width: 1315px; height: 19px">
                                                        </td>
                                                        <td class="huise1" style="width: 287px; height: 19px">
                                                        </td>
                                                        <td style="height: 19px; text-align: left" width="165">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="huise1" style="width: 1315px; height: 30px">
                                                        </td>
                                                        <td class="huise1" style="width: 287px; height: 30px">
                                                            &nbsp; 用户名:</td>
                                                        <td width="165" style="height: 30px; text-align: left">
                                                            <asp:TextBox ID="txtName" runat="server" Width="87px"></asp:TextBox></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="huise1" height="30" style="width: 1315px">
                                                        </td>
                                                        <td height="30" class="huise1" style="width: 287px">
                                                            &nbsp; 密&nbsp; 码:</td>
                                                        <td height="30" style="text-align: left">
                                                            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="89px"></asp:TextBox></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="1" height="30" style="width: 1315px">
                                                        </td>
                                                        <td height="30" colspan="2">
                                                            <table align="center" cellpadding="0" cellspacing="0" style="width: 141px">
                                                                <tr>
                                                                    <td style="width: 120px">
                                                                        <asp:ImageButton ID="imgBtnLogin" runat="server" ImageUrl="~/images/ksdl_dl.jpg"
                                                                            OnClick="imgBtnLogin_Click" />&nbsp;<a href="#"></a></td>
                                                                    <td align="center" style="width: 9px">
                                                                        <asp:ImageButton ID="imgBtnReturn" runat="server" ImageUrl="~/images/ksdl_fh.jpg"
                                                                            PostBackUrl="~/index.aspx" /><a
                                                                            href="#"></a></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 11px">
                                                
                                                <table align="center" style="width: 292px">
                                                    <tr>
                                                        <td style="width: 131px; height: 29px">
                                                        </td>
                                                        <td style="width: 237px; height: 29px">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 131px; height: 24px">
                                                        </td>
                                                        <td style="width: 237px; height: 24px;">
                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/ksdl_mlzh.jpg" PostBackUrl="~/GetPass.aspx" />
                                                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/ksdl_xyhzc.jpg" PostBackUrl="~/Register.aspx" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
     <table width="900" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
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
        </div>
    </form>
</body>
</html>
