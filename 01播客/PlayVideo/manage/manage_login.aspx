<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_login.aspx.cs" Inherits="manage_manage_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    
    
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F0F0F0;
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {font-size: 12px; line-height: 22px; color: #000000; font-family: "宋体";}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
    <br />
<br />
<br />
<br />
<br />
<br />
<table width="491" height="129" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="497" height="329" valign="bottom" background="../images/htdl.jpg">
        <br />
        <br />
        <table height="190" style="width: 573px">
      <tr>
        <td style="width: 219px; height: 71px">&nbsp;</td>
        <td width="260" style="height: 71px" valign="top"><table width="239" height="69" class="huise1">
          <tr>
            <td class="huise1" style="width: 82px; text-align: right">用户名:</td>
            <td style="width: 177px; text-align: left;">
                    <asp:TextBox ID="txtName" runat="server" Width="93px"></asp:TextBox></td>
          </tr>
          <tr>
            <td class="huise1" style="width: 82px; text-align: right">密&nbsp;&nbsp; 码:</td>
            <td style="width: 177px; text-align: left;">
                    <asp:TextBox ID="txtPass" runat="server" Width="93px" TextMode="Password"></asp:TextBox></td>
          </tr>
          <tr>
            <td colspan="2">
                <asp:ImageButton ID="imgBtnLogin" runat="server" ImageUrl="~/images/ksdl_dl.jpg"
                    OnClick="imgBtnLogin_Click" />&nbsp;<asp:ImageButton ID="imgBtnReturn" runat="server"
                        ImageUrl="~/images/ksdl_fh.jpg" PostBackUrl="~/index.aspx" />
                &nbsp;
            </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30" colspan="2">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
    
    </div>
    </form>
</body>
</html>
