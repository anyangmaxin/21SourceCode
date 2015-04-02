<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userPage.aspx.cs" Inherits="userPage" %>

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


<table width="900" height="166" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="484" valign="top"><table width="704" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" style="height: 335px"><table width="710" align="center" cellpadding="0" cellspacing="0">
       
          <tr>
            <td valign="top" style="width: 469px; height: 314px;"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#999999" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid; width: 464px; height: 311px;">
                <tr>
                  <td width="479" height="28" background="images/hy1_02.jpg" valign="bottom" bgcolor="#DFF0F8">
                      <table border="0" cellpadding="0" cellspacing="0" style="width: 411px;" height="100%">
                          <tr>
                              <td style="width: 42px; height: 28px;">
                              </td>
                              <td style="width: 186px; height: 28px; text-align: left;">
                                  <strong><span style="font-size: 14pt; color: #ff0000; background-image: url(images/hyBg_1.jpg);">积分排名第一的会员</span></strong></td>
                          </tr>
                      </table>
                  </td>
                </tr>
                <tr>
                  <td valign="top" bgcolor="#FFFFFF" style="height: 255px"><table width="432" align="center" cellpadding="0" cellspacing="0" style="height: 247px">
                      <tr>
                          <td colspan="2">
                              <span style="font-size: 12pt; color: #ff0000"></span></td>
                      </tr>
                            <tr>
                                <td>
                                    <table width="150" height="168" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF"
                                        bgcolor="#999999">
                                        <tr>
                                            <td width="141" height="166" valign="top" bgcolor="#FFFFFF">
                                                <img src="<%=img %>" alt="" name="uy" width="141" height="166" id="Img1" /></td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="huise1" style="text-align: left">
                                    会员名：<%=userName%> 当前积分：<span class="chengse"><%=sumMark %> </span>
                                    <br />
                                    昵称：<%=nickName %>
                                    <br />
                                    性别：  <%=sex %>
                                    <br />
                                    QQ：<%=qq %>
                                    <br />
                                    所在城市：<%=city%>
                                    <br />
                                    注册时间：<%=registerDate %>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="huise1">
                                    <span class="hongcu">个人说明：</span><%=speak%></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table></td>
            <td width="239" align="right" valign="top" style="text-align: center; height: 314px;">
                        
                        <table width="245" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="36" align="left" valign="middle" background="images/hy5_05.jpg" class="b"> 　　　
            <span style="color: #ff0000"><strong>积分排行榜</strong></span></td>
      </tr>
      <tr>
        <td align="center" valign="top" background="images/hy6_13.jpg" style="height: 200px">
                        <asp:GridView ID="gvUserTop" runat="server" AutoGenerateColumns="False" Height="75px"
                            Width="237px" BackColor="#F3F4F8">
                            <Columns>
                                <asp:TemplateField HeaderText="排名">
                                    <ItemTemplate>
                                        <%#this.gvUserTop.PageIndex*gvUserTop.PageSize+gvUserTop.Rows.Count+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="用户名">
                                    <ItemTemplate>
                                        <a href='userInfo.aspx?userName=<%#Eval("userName") %>'>
                                            <%#Eval("userName") %>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="shenhong" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="sumMark" HeaderText="积分" />
                            </Columns>
                            <RowStyle CssClass="huise1" />
                            <HeaderStyle BackColor="#F2F8EE" CssClass="hongcu" />
                        </asp:GridView>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
                        
                        </td>
      </tr>
      <tr>
        <td style="height: 10px"><img src="images/hy7_16.jpg" width="245" height="11" /></td>
      </tr>
    </table>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    </td>
          </tr>
        </table></td>
        </tr>
    </table>
      <table width="708" height="168" border="0" cellpadding="0" cellspacing="0" bgcolor="#999999" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid">
        <tr>
          <td width="141" valign="top" bgcolor="#FFFFFF" style="height: 166px">
                        <asp:DataList ID="dlUserHaving" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                            Width="690px">
                            <ItemTemplate>
                                <table align="center" cellpadding="0" cellspacing="0" style="width: 219px">
                                    <tr>
                                        <td height="38" style="width: 9px">
                                            <table width="99" height="108" border="0" cellpadding="0" cellspacing="0" 
                                                bgcolor="#999999">
                                                <tr>
                                                    <td width="141" height="104" align="center" valign="middle" bgcolor="#ffffff">
                                                        <img src="<%#Eval("img") %>" alt="" name="uy" width="90" height="100" id="uy" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="shenhong"  style="width: 120px; text-align: left">
                                            <span class="hongcu">用户名：</span><a title="<%#Eval("userName") %>"  href="userInfo.aspx?userName=<%#Eval("userName") %>"><%#Eval("userName") %></a><br />
                                            <span class="hongcu">昵称：</span><span class="huise1" >  <%#Eval("nickName") %> </span>  
                                            <br />
                                            <span class="hongcu">性别：</span><span class="huise1" > <%#Eval("Sex") %><br /></span>
                                            <span class="hongcu">城市：</span><span class="huise1" > <%#Eval("city") %></span>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <table id="TABLE1" cellpadding="0" cellspacing="0" style="width: 604px; height: 17px">
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
    </form>
</body>
</html>
