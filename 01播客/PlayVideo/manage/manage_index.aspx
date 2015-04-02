<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_index.aspx.cs" Inherits="manage_manage_index" %>

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
}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <img src="../images/htgl_top.jpg" width="779" height="100" />
    <table border="0" cellpadding="0" cellspacing="0" style="width: 779px; height: 500px;
            text-align: center" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td style="width: 160px;">
               <iframe frameborder="no" name="leftFrame" scrolling="no" src="manage_leftMenu.aspx" style="width: 166px;
                        height: 500px" width="160"></iframe>
                </td>
                <td style="width: 620px; height: 500px">
                    <iframe frameborder="no" height="500" name="rightFrame" src="manage_rightMenu.aspx" style="width: 608px;
                        height: 500px"  id="a"></iframe>
                </td>
            </tr>
         
        </table>
        
     
        <hr  bgcolor="#000033" width="779" style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;" />
      
         <table border="0" cellpadding="0" cellspacing="0" style="width: 779px; 
            text-align: center; height: 67px;" id="TABLE2" onclick="return TABLE1_onclick()">
            <tr>
                <td background="../images/htgl_bom.jpg"></td>
            </tr>
         
        </table>
    </div>
    </form>
</body>
</html>
