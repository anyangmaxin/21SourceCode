<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoTaxis.aspx.cs" Inherits="videoTaxis" %>

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
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />

</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>
    
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
        <td valign="top"><table width="710" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="350" valign="top" style="height: 279px; text-align: center;">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 350px; height: 240px; text-align: center; border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid;">
                                    <tr>
                                        <td height="28" style="text-align: left;  center; background-image: url(images/phbg_01.jpg); background-repeat: no-repeat;" colspan="3">
                                            &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <strong><span style="color: #006699">上月搞笑视频排行榜</span></strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="height: 167px" valign="top">
                                            <asp:GridView ID="gvHumourTaxis" runat="server" AutoGenerateColumns="False" Height="191px" Width="350px">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="排名">
                                                        <ItemTemplate>
                                                              <%#gvHumourTaxis.PageIndex*gvHumourTaxis.PageSize+gvHumourTaxis.Rows.Count+1 %>
                                                        </ItemTemplate>
                                                             <ItemStyle CssClass="huise1" />
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField HeaderText="视频名称">
                                                        <ItemTemplate>
                                                           <a target="_blank" title='<%#Eval("videoTitle") %>' href="play.aspx?id=<%#Eval("videoId") %>"><%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %></a>
                                                        </ItemTemplate>
                                                          <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="发布日期" DataField="videoDate" DataFormatString="{0:d}" HtmlEncode="False" >
                                                       <ItemStyle CssClass="huise1" />
                                                </asp:BoundField>
                                                    <asp:TemplateField HeaderText="发布人">
                                                        <ItemTemplate>
                                                           <a  title='<%#Eval("userName")%> ' href ='userInfo.aspx?userName=<%#Eval("userName")%>' ><%#Eval("userName") %></a>
                                                        </ItemTemplate>
                                                         <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                                    </asp:TemplateField>
                                                         
                                                    <asp:BoundField HeaderText="上月人气" DataField="playSum" >
                                                        <ItemStyle CssClass="huise1" />
                                                </asp:BoundField>
                                                </Columns>
                                                 <HeaderStyle BackColor="#DFF0F8" CssClass="chengse" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
            <td width="351" align="right" valign="top" style="text-align: center; height: 279px;">
                            
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 350px; height: 240px; text-align: center; border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid;">
                                <tr>
                                    <td height="28" style="text-align: left; background-image: url(images/phbg_01.jpg); background-repeat: no-repeat;" colspan="3">
                                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<strong><span style="color: #006699">上月电影视频排行榜</span></strong></td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="height: 167px" valign="top">
                                        <asp:GridView ID="gvFilmTaxis" runat="server" AutoGenerateColumns="False" Height="191px" Width="350px">
                                            <Columns>
                                                <asp:TemplateField HeaderText="排名">
                                                    <ItemTemplate>
                                                        <%#gvFilmTaxis.PageIndex * gvFilmTaxis.PageSize + gvFilmTaxis.Rows.Count + 1%>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="huise1" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="视频名称">
                                                    <ItemTemplate>
                                                        <a target="_blank" title='<%#Eval("videoTitle") %>' href="play.aspx?id=<%#Eval("videoId") %>">
                                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                        </a>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                                  
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="发布日期" DataField="videoDate" DataFormatString="{0:d}" HtmlEncode="False" >
                                                    <ItemStyle CssClass="huise1" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="发布人">
                                                    <ItemTemplate>
                                                        <a  title='<%#Eval("userName")%> ' href ='userInfo.aspx?userName=<%#Eval("userName")%>' >
                                                            <%#Eval("userName") %>
                                                        </a>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="上月人气" DataField="playSum" >
                                                    <ItemStyle CssClass="huise1" />
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle BackColor="#DFF0F8" CssClass="chengse" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                            &nbsp;</td>
          </tr>
        </table></td>
        </tr>
    </table>
      <table width="704" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="2"></td>
        </tr>
      </table>
      <table width="710" cellpadding="0" cellspacing="0" style="text-align: center">

        <tr>
          <td width="357" height="14" valign="top" style="text-align: center">
                            
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 350px; height: 240px; border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid; text-align: center;">
                                <tr>
                                    <td height="28" style="text-align: left; background-image: url(images/phbg_01.jpg); background-repeat: no-repeat;" colspan="3">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong><span style="color: #006699">上月体育视频排行榜</span></strong></td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="height: 167px" valign="top">
                                        <asp:GridView ID="gvSportTaxis" runat="server" AutoGenerateColumns="False" Height="191px" Width="350px" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="排名">
                                                    <ItemTemplate>
                                                        <%#gvSportTaxis.PageIndex * gvSportTaxis.PageSize + gvSportTaxis.Rows.Count + 1%>
                                                    </ItemTemplate>
                                                        <ItemStyle CssClass="huise1" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="视频名称">
                                                    <ItemTemplate>
                                                        <a target="_blank" title='<%#Eval("videoTitle") %>' href="play.aspx?id=<%#Eval("videoId") %>">
                                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                        </a>
                                                    </ItemTemplate>
                                                      <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="发布日期" DataField="videoDate" DataFormatString="{0:d}" HtmlEncode="False" >
                                                  <ItemStyle CssClass="huise1" />
                                                     </asp:BoundField>
                                                <asp:TemplateField HeaderText="发布人">
                                                    <ItemTemplate>
                                                        <a  title='<%#Eval("userName")%> ' href ='userInfo.aspx?userName=<%#Eval("userName")%>' >
                                                            <%#Eval("userName") %>
                                                        </a>
                                                    </ItemTemplate>
                                                            <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="上月人气" DataField="playSum" >
                                                <ItemStyle CssClass="huise1" />
                                                   </asp:BoundField>
                                            </Columns>
                                            
                                            <HeaderStyle BackColor="#DFF0F8" CssClass="chengse" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                            </td>
          <td width="351" align="right" valign="top" style="text-align: center"><table border="0" cellpadding="0" cellspacing="0" style="width: 350px; height: 240px; border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid;">
                                <tr>
                                    <td height="28" style="text-align: left; background-image: url(images/phbg_01.jpg); background-repeat: no-repeat;" colspan="3">
                                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<strong><span style="color: #006699">上月动漫视频排行榜</span></strong></td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="height: 167px" valign="top">
                                        <asp:GridView ID="gvCartoonTaxis" runat="server" AutoGenerateColumns="False" Height="191px" Width="350px">
                                            <Columns>
                                                <asp:TemplateField HeaderText="排名">
                                                    <ItemTemplate>
                                                        <%#gvCartoonTaxis.PageIndex * gvCartoonTaxis.PageSize + gvCartoonTaxis.Rows.Count + 1%>
                                                    </ItemTemplate>
                                                     <ItemStyle CssClass="huise1" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="视频名称">
                                                    <ItemTemplate>
                                                        <a target="_blank" title='<%#Eval("videoTitle") %>' href="play.aspx?id=<%#Eval("videoId") %>">
                                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                        </a>
                                                    </ItemTemplate>
                                                     <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="发布日期" DataField="videoDate" DataFormatString="{0:d}" HtmlEncode="False" >
                                                    <ItemStyle CssClass="huise1" />
                                                     </asp:BoundField>
                                                <asp:TemplateField HeaderText="发布人">
                                                    <ItemTemplate>
                                                        <a  title='<%#Eval("userName")%> ' href ='userInfo.aspx?userName=<%#Eval("userName")%>' >
                                                            <%#Eval("userName") %>
                                                        </a>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                                </asp:TemplateField>                                    
                                                <asp:BoundField HeaderText="上月人气" DataField="playSum" >
                                                    <ItemStyle CssClass="huise1" />
                                                </asp:BoundField>
                                                 
                                                
                                            </Columns>
                                             <HeaderStyle BackColor="#DFF0F8" CssClass="chengse" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                            &nbsp;</td>
        </tr>
      </table></td>
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
    </div>
    </form>
</body>
</html>
