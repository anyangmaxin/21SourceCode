<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchList.aspx.cs" Inherits="searchList" %>

<%@ Register Src="webUser/WebUserControlVideoPlaySum.ascx" TagName="WebUserControlVideoPlaySum"
    TagPrefix="uc1" %>
<%@ Register Src="webUser/WebUserControlUserLogin.ascx" TagName="WebUserControlUserLogin"
    TagPrefix="uc2" %>
<%@ Register Src="webUser/Top.ascx" TagName="Top" TagPrefix="uc3" %>
<%@ Register Src="webUser/Search.ascx" TagName="Search" TagPrefix="uc4" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
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
    <div>
        <div style="text-align: center">
        
        <table background="images/midbg_02.jpg"width="900" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="160"  rowspan="3"><img src="images/mrbkw.jpg"   style="width: 160px; height:77px" /></td>
    <td width="740" height="39" align="right" class="chengse">
        <uc2:WebUserControlUserLogin ID="WebUserControlUserLogin1" runat="server" />
        </td>
  </tr>
  <tr>
    <td   >  <uc4:Search ID="Search1" runat="server" />
    </td>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
</table>
        
        <table width="900" height="67" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" >
       <uc3:Top ID="Top1" runat="server" />
    </td>
  </tr>
</table>
        
            <table border="0" cellpadding="0" cellspacing="0" style="width: 900px">  
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 69px" valign="top">
                        <asp:DataList ID="DataList1" runat="server" 
                             Style="vertical-align: middle">
                            <ItemTemplate>
                                <div style="text-align: center">
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-right: #71add1 1px solid;
                                        border-top: #71add1 1px solid; border-left: #71add1 1px solid; width: 409px;
                                        border-bottom: #71add1 1px solid; height: 71px; text-align: center">
                                        <tr>
                                            <td style="width: 129px; height: 121px; text-align: left">
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 96px; height: 118px">
                                                    <tr>
                                                        <td colspan="2">
                                                            <a href="play.aspx?id=<%#Eval("id") %>"> <img border="0" align="middle" alt='<%#Eval("videoTitle") %>' src='<%#Eval("videoPicture") %>'
                                                                style="float: left; vertical-align: middle; width: 120px; height: 101px" /></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Image ID="Image1" ToolTip="顶" runat="server" ImageUrl="~/img/flower.gif" /><%#Eval("flower") %></td>
                                                        <td style="width: 100px">
                                                            <asp:Image ID="Image2" ToolTip="踩" runat="server" ImageUrl="~/img/tile.gif" /><%#Eval("tile") %></td>
                                                    </tr>
                                                </table>                                               
                                            </td>
                                            <td colspan="3" rowspan="1" style="height: 121px; text-align: left" valign="top">
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 428px; height: 117px">
                                                    <tr>
                                                        <td colspan="2" style="height: 1px">
                                                       <a title='<%#Eval("videoTitle") %>' class="huise1" href="play.aspx?id=<%#Eval("id") %>"> <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %></a>   <%#Eval("videoDate") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 104px">发布人：<a class="huise1" title='<%#Eval("userName") %>' href='userInfo.aspx?userName=<%#Eval("userName")%>'><%#Eval("userName") %></a>
                                                        </td>
                                                        <td style="width: 100px">视频人气：<%#Eval("playSum") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="height: 91px" valign="top">
                                                        <%#Eval("videoContent") %>
                                                        </td>
                                                    </tr>
                                                </table>                                              
                                                
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <table id="TABLE1" cellpadding="0" cellspacing="0" style="width: 552px; height: 17px">
                            <tr>
                                <td style="font-size: 9pt; width: 579px; height: 17px; text-align: right">
                                    <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                                    [
                                    <asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                                    &nbsp;]
                                    <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                    [
                                    <asp:Label ID="labBackPage" runat="server"></asp:Label>
                                    &nbsp;]
                                    <asp:LinkButton ID="lnkbtnFirst" runat="server" Font-Underline="False" ForeColor="Blue"
                                        OnClick="lnkbtnFirst_Click">第一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnFront" runat="server" Font-Underline="False" ForeColor="Blue"
                                        OnClick="lnkbtnFront_Click">上一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Blue"
                                        OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                                    <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Underline="False" ForeColor="Blue"
                                        OnClick="lnkbtnLast_Click">最后一页</asp:LinkButton>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 100px">
                        <uc1:WebUserControlVideoPlaySum ID="WebUserControlVideoPlaySum1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 69px">
                    </td>
                    <td style="width: 100px">
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
