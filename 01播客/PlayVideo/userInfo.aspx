<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userInfo.aspx.cs" Inherits="userInfo" %>

<%@ Register Src="webUser/Top.ascx" TagName="Top" TagPrefix="uc1" %>
<%@ Register Src="webUser/Search.ascx" TagName="Search" TagPrefix="uc2" %>
<%@ Register Src="webUser/WebUserControlUserLogin.ascx" TagName="WebUserControlUserLogin"
    TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        <div>
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
        <uc1:Top ID="Top1" runat="server" />
        </td>
  </tr>
</table>
                
                
                
                <table width="900" height="166" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" style="width: 484px">
                            <table width="894" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="540" valign="top">
                                        <table width="431" height="278" border="0" cellpadding="0" cellspacing="0"
                                            bgcolor="#999999" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid">
                                            <tr>
                                                <td width="463" height="28" valign="top" bgcolor="#DFF0F8" class="hongcu">
                                                    &nbsp; 会员详细信息</td>
                                            </tr>
                                            <tr>
                                                <td valign="top" bgcolor="#FFFFFF" style="height: 241px">
                                                    <table align="center" cellpadding="0" cellspacing="0" height="95" width="381">
                                                        <tr>
                                                            <td>
                                                                <table bgcolor="#999999" border="1" bordercolor="#ffffff" cellpadding="1" cellspacing="1"
                                                                    height="168" width="150">
                                                                    <tr>
                                                                        <td bgcolor="#ffffff" height="166" valign="top" width="141">
                                                                            <img id="uy" alt="" height="166" name="uy" src="<%=img %>" width="141" /></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td class="huise1" style="text-align: left">
                                                                会员名：<%=userName%>
                                                                当前积分：<span class="chengse"><%=sumMark%>
                                                                </span>
                                                                <br />
                                                                昵称：<%=nickName %>
                                                                <br />
                                                                性别：
                                                                <%=sex %>
                                                                <br />
                                                                QQ：<%=qq %>
                                                                <br />
                                                                所在城市：<%=city%>
                                                                <br />
                                                                注册时间：<%=registerDate %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="huise1" colspan="2">
                                                                <span class="hongcu">个人说明：</span><%=speak %></td>
                                                        </tr>
                                                    </table>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="331" valign="top">
                            <asp:DataList ID="dlVideo" runat="server" CellPadding="4" ForeColor="#333333" Style="vertical-align: middle">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <ItemTemplate>
                                    <div style="text-align: center">
                                        <table cellpadding="0" cellspacing="0" height="116" width="458">
                                            <tr>
                                                <td width="152" style="height: 170px">
                                                    <table cellpadding="0" cellspacing="0" height="76" width="33">
                                                        <tr>
                                                            <td colspan="2">
                                                                <table align="center"  border="0"  cellpadding="0"
                                                                    cellspacing="0" height="94" width="124">
                                                                    <tr>
                                                                        <td align="center"  valign="middle" width="367">
                                                                            <a href='play.aspx?id=<%#Eval("id") %>'>
                                                                                <img border="0" id="xiaotu" alt='<%#Eval("videoTitle") %>' src='<%#Eval("videoPicture") %>'
                                                                                    height="85" name="xiaotu" width="114" /></a></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" class="shenhong" width="61">
                                                                <table cellpadding="0" cellspacing="0" width="35">
                                                                    <tr>
                                                                        <td>
                                                                            <img height="17" alt="顶" src="images/shou.gif" width="17" /></td>
                                                                        <td class="chengse">
                                                                            <%#Eval("flower") %>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="center" class="shenhong" width="63">
                                                                <table cellpadding="0" cellspacing="0" width="35">
                                                                    <tr>
                                                                        <td>
                                                                            <img height="17" alt="踩" src="images/jiao.gif" width="17" /></td>
                                                                        <td class="chengse">
                                                                            <%#Eval("tile") %>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="font-size: 12pt; height: 170px;" width="320">
                                                    <span class="shenhong"><span style="color: #0000ff; text-decoration: underline">
                                                        <a title='<%#Eval("videoTitle") %>' href='play.aspx?id=<%#Eval("id") %>'>
                                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                        </a></span>
                                                        <br />
                                                        
                                                        </span>
                                                        <span class="huise1">
                                                       
                                                        <span style="huise1"><%#Eval("videoDate") %> &nbsp; </span>
                                                        
                                                        <span style="huise1">发布人：</span>
                                                        
                                                        <span class="chengse" >
                                                        <%#Eval("userName") %></span>   
                                                                                                             
                                                      
                                                        <span style="huise1">
                                                                            &nbsp; 视频人气：</span>
                                                                         
                                                          <span class="chengse" ><%#Eval("playSum") %></span></span>
                                                                                <span class="huise1">
                                                                                    <br />
                                                                                   <%#Eval("videoContent") %></span>
                                                </td>
                                            </tr>
                                        </table>
                                        
                                    </div>
                                </ItemTemplate>
                                <AlternatingItemStyle BackColor="White" />
                                <ItemStyle BackColor="#EFF3FB" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataList>
                            <table id="Table2" cellpadding="0" cellspacing="0" style="width: 456px; height: 17px">
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
                                </tr>
                            </table>
                            <table width="704" align="center" cellpadding="0" cellspacing="0" style="font-size: 12pt">
                                <tr>
                                    <td height="5">
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
        </div>
    </form>
</body>
</html>
