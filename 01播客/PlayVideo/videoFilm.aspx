<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoFilm.aspx.cs" Inherits="videoilm" %>

<%@ Register Src="webUser/WebUserControlVideoPlaySum.ascx" TagName="WebUserControlVideoPlaySum"
    TagPrefix="uc5" %>
<%@ Register Src="webUser/Search.ascx" TagName="Search" TagPrefix="uc6" %>
<%@ Register Src="webUser/Top.ascx" TagName="Top" TagPrefix="uc7" %>
<%@ Register Src="webUser/WebUserControlUserLogin.ascx" TagName="WebUserControlUserLogin"
    TagPrefix="uc8" %>


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
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
<table background="images/midbg_02.jpg"width="900" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="160"  rowspan="3"><img src="images/mrbkw.jpg"   style="width: 160px; height:77px" /></td>
    <td width="740" height="39" align="right" class="chengse">
        <uc8:WebUserControlUserLogin ID="WebUserControlUserLogin1" runat="server" />
       </td>
  </tr>
  <tr>
    <td   > <uc6:Search ID="Search1" runat="server" />
    </td>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
</table>



<table width="900" height="67" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" >
       <uc7:Top ID="Top1" runat="server" />
    </td>
  </tr>
</table>


<table height="166" align="center" cellpadding="0" cellspacing="0" style="width: 844px">
  <tr>
    <td width="484" valign="top"><table width="894" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="540" valign="top"><table width="546" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="29" colspan="2" background="images/ghh.jpg" style="text-align: left"><table width="150">
              <tr>
                <td width="15">&nbsp;</td>
                <td width="123"  class="hongcu">
                    电影视频</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="14" valign="top" style="width: 469px">
                        <asp:DataList ID="dlFilm" runat="server" Style="vertical-align: middle">
                            <ItemTemplate>
                                <div style="text-align: center">
                    
                    <table width="522" height="116" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="152"><table width="33" height="76" cellpadding="0" cellspacing="0">
                        <tr>
                          <td colspan="2"><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#999999">
                              <tr>
                                <td width="367" align="center" valign="middle" bgcolor="#FFFFFF"><a href='play.aspx?id=<%#Eval("id") %>'>
                                                    <img align="middle" border="0" alt='<%#Eval("videoTitle") %>' src='<%#Eval("videoPicture") %>'
                                                        style="float: left; vertical-align: middle; width: 120px; height: 101px" /></a></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td width="61" align="center" class="shenhong"><table width="35" cellpadding="0" cellspacing="0">
                            <tr>
                              <td><img alt="顶" src="images/shou.gif" width="17" height="17" /></td>
                              <td class="chengse"><%#Eval("flower") %></td>
                            </tr>
                          </table></td>
                          <td width="63" align="center" class="shenhong"><table width="35" cellpadding="0" cellspacing="0">
                            <tr>
                              <td><img alt="踩" src="images/jiao.gif" width="17" height="17" /></td>
                              <td class="chengse"><%#Eval("tile") %></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                      <td width="320"><span class="shenhong"> <a href='play.aspx?id=<%#Eval("id") %>'>
                                                    <%#Eval("videoTitle") %>
                                                </a>&nbsp; &nbsp; &nbsp; &nbsp;<span class="huise1"><%#Eval("videoDate") %></span><br />
                                                
                                               <span class="huise1"> 发布人：</span><a href='userInfo.aspx?userName=<%#Eval("userName")%>'><%#Eval("userName") %></a>
                                                &nbsp; &nbsp; &nbsp; &nbsp;
                                               <span class="huise1"> 视频人气：<%#Eval("playSum") %></span><br />
                                                  <span class="huise1"><%#Eval("videoContent") %></span>
                                                
                                                
                                                </span>
                     </td>
                    </tr>
                  </table>
          
                    <table width="507" height="4" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><table width="500
						
						40" height="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
                            <tr>
                              <td height="1" bgcolor="#666666"></td>
                            </tr>
                        </table></td>
                      </tr>
                    </table>
                           
                    </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <table id="TABLE1" cellpadding="0" cellspacing="0" style="width: 510px; height: 17px">
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
                                &nbsp;</td>
            <td width="6" align="right" valign="top">&nbsp;</td>
          </tr>
        </table>
                </td>
        <td width="331" valign="top">
            <uc5:WebUserControlVideoPlaySum ID="WebUserControlVideoPlaySum2" runat="server" />
  
        </td>
      </tr>
    </table>
 
      </td>
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
