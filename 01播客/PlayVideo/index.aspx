<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="index.aspx.cs" Inherits="_Default" %>

<%@ Register Src="webUser/Top.ascx" TagName="Top" TagPrefix="uc1" %>
<%@ Register Src="webUser/Search.ascx" TagName="Search" TagPrefix="uc2" %>
<%@ Register Src="webUser/WebUserControlUserLogin.ascx" TagName="WebUserControlUserLogin"
    TagPrefix="uc3" %>
<%@ Register Src="webUser/WebUserControlLoopAD.ascx" TagName="WebUserControlLoopAD"
    TagPrefix="uc4" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="pragma" content="no-Cache" />
    <meta http-equiv="Cache-Control" content="no-Cache" />
    <meta http-equiv="Expires" content="0" />


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
        <td width="293" style="height: 309px"><table cellpadding="0" cellspacing="0" style="width: 296px; height: 299px; border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
            <tr>
              <td>
                  <uc4:WebUserControlLoopAD ID="WebUserControlLoopAD1" runat="server" />
              </td>
            </tr>
        </table></td>
        <td style="height: 309px"><table width="400" height="267"  align="center" cellpadding="0" cellspacing="0" bgcolor="#999999" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
           <tr>
            <td width="400" height="30" align="left" valign="middle" background="images/tou1.jpg" > &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;<span class="hongcu" >  最新视频</span></td>
           </tr>
           <tr>
              <td width="367" valign="middle" bgcolor="#FFFFFF" style="height: 265px"> <asp:DataList ID="dlNewVideo" runat="server" RepeatColumns="3"  Width="367px" Height="265px" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div style="text-align: center">
                               
                               <table width="33" height="76" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#999999">
                              <tr>
                                <td width="367" align="center" valign="middle" bgcolor="#FFFFFF">  <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                    <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td align="center" class="shenhong"><a class="shenhong"  title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                    <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                </a></td>
                        </tr>
                    </table>
                               
                               
                               
                              
                              
                                
                            </div>
                        </ItemTemplate>
                    </asp:DataList></td>
            </tr>
        </table></td>
      </tr>
    </table>
      <table width="704" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td style="height: 1px"></td>
        </tr>
      </table>
      <table width="698" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="29" background="images/gaoxiao.jpg" style="text-align: left">
          <table width="150" style="text-align: left">
              <tr>
                  <td width="15" style="height: 24px">
                      &nbsp;</td>
                  <td  class="hongcu" style="width: 77px; text-align: left; height: 24px;">
                      搞笑视频</td>
              </tr>
          </table>
          
          </td>
        </tr>
        <tr>
          <td height="14"><table width="700" height="267"  cellpadding="0" cellspacing="0"  bgcolor="#999999" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
              <tr>
                <td width="367" valign="middle" bgcolor="#FFFFFF"><asp:DataList ID="dlHumour" runat="server" RepeatColumns="5"  Width="692px" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <div style="text-align: center">
                                                        
                                                        
                                                        <table width="33" height="76" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#999999">
                                <tr>
                                  <td width="367" align="center" valign="middle" bgcolor="#FFFFFF"><a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td align="center" class="shenhong"> <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                               <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                            </a></td>
                          </tr>
                      </table>
                                                        
                                                        
                                                            
                                                           
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="698" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td background="images/gaoxiao.jpg" style="text-align: left; height: 29px;"><table width="150" style="text-align: left">
              <tr>
                  <td width="15" style="height: 24px">
                      &nbsp;</td>
                  <td  class="hongcu" style="width: 77px; text-align: left; height: 24px;">
                      体育视频</td>
              </tr>
          </table>
          </td>
        </tr>
        <tr>
          <td height="14"><table width="700" height="267"  cellpadding="0" cellspacing="0" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;" bgcolor="#999999">
              <tr>
                <td width="367" valign="middle" bgcolor="#FFFFFF">
                
                    <asp:DataList ID="dlSport" runat="server" RepeatColumns="5"  Width="692px" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <div style="text-align: center">
                                                        
                                                        
                                                           <table width="33" height="76" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#999999">
                                <tr>
                                  <td width="367" align="center" valign="middle" bgcolor="#FFFFFF"><a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td align="center" class="shenhong"> <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                               <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                            </a></td>
                          </tr>
                      </table>
                                                        
                                                        
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                
                </td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="698" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="29" background="images/gaoxiao.jpg" style="text-align: left"><table width="150">
            <tr>
                <td  class="hongcu" colspan="1" style="width: 21px">
                </td>
                <td  class="hongcu" colspan="2">
                    &nbsp;电影欣赏</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="14"><table width="700" height="267" cellpadding="0" cellspacing="0" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;" bgcolor="#999999">
              <tr>
                <td width="367" valign="middle" bgcolor="#FFFFFF">
                <asp:DataList ID="dlFilm" runat="server" RepeatColumns="5"  Width="692px" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <div style="text-align: center">
                                                            <table width="33" height="76" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#999999">
                                <tr>
                                  <td width="367" align="center" valign="middle" bgcolor="#FFFFFF"><a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td align="center" class="shenhong"> <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                               <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                            </a></td>
                          </tr>
                      </table>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                
                </td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="698" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td background="images/gaoxiao.jpg" style="text-align: left; height: 19px;"><table width="150">
            <tr>
              <td style="height: 15px; width: 50px;">&nbsp;</td>
              <td class="hongcu" style="width: 123px; height: 15px;">卡通动漫</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="14"><table width="700" height="267"  cellpadding="0" cellspacing="0" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;" bgcolor="#999999">
              <tr>
                <td width="367" valign="middle" bgcolor="#FFFFFF">
                 <asp:DataList ID="dlCartoon" runat="server" RepeatColumns="5"  Width="692px" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <div style="text-align: center">
                                                              <table width="33" height="76" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#999999">
                                <tr>
                                  <td width="367" align="center" valign="middle" bgcolor="#FFFFFF"><a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td align="center" class="shenhong"> <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                               <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                            </a></td>
                          </tr>
                      </table>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                
                </td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    <td valign="top" style="width: 414px">
     <table width="189" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td style="height: 3px"></td>
        </tr>
      </table>
    <table width="189" height="105"  align="center" cellpadding="0" cellspacing="0" bgcolor="#999999" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
      <tr>
        <td width="367" height="22" align="left" valign="middle" bgcolor="#DFF0F8"><img src="images/gonggao.jpg" height="34px" style="width: 190px" /></td>
      </tr>
      <tr>
        <td valign="middle" bgcolor="#FFFFFF" class="huise1">
         <marquee direction="up"  scrollamount="3"
                                                >
                                             <span class="hongcu"> <div align="center"><%=title %></div></span> 
                                               <div align="left"><%=content %></div>
                                               <div align="right"><%=issuanceDate%></div>
                                              </marquee> 
        </td>
      </tr>
    </table>
      <table width="189" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td style="height: 5px"></td>
        </tr>
      </table>
      
      
      
      
      
      
                    <table height="175" width="189" border="0" cellpadding="0" cellspacing="0" background="images/dlbg_13.jpg" style="width: 194px">
               <tr>
                  <td height="46" colspan="5">&nbsp;</td>
                </tr>
                <tr>
                  <td height="25" colspan="2" align="right" style="width: 80px">用户名：</td>
                  <td colspan="3" style="text-align: left;width: 100px"><label>
                  <asp:TextBox ID="txtUserName" runat="server" Width="75px"></asp:TextBox></label></td>
                </tr>
                <tr>
                  <td colspan="2" align="right" style="width: 80px; height: 25px">密码：</td>
                  <td colspan="3" style="height: 25px; text-align: left;width: 100px">
                  <asp:TextBox ID="txtUserPass" runat="server" Width="77px" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                  <td height="28" colspan="2" align="right" valign="top" style="width: 80px">
                      <asp:ImageButton ID="imgBtnEntry" runat="server" ImageUrl="images/dle.jpg" OnClick="imgBtnEntry_Click" /></td>
                  <td height="28" align="center">&nbsp;</td>
                  <td align="left"><label></label></td>
                  <td align="left" valign="top">
                      <img src="images/zc.jpg" border="0" style="width: 41px; height: 21px" /></td>
                </tr>
                <tr>
                    <td align="right" colspan="3" style="width: 90px" valign="top">
                        <img src="images/wjmm.jpg" width="13" height="13" />
                        <asp:LinkButton ID="linkBtnGetPass" runat="server" Font-Underline="False" PostBackUrl="~/GetPass.aspx">忘记密码</asp:LinkButton>&nbsp;</td>
                  <td width="22" align="center" valign="top">
                  
                  <img src="images/xyhzc.jpg" width="13" height="13" /></td>
                  <td width="84" align="left" valign="middle">
                      <asp:LinkButton ID="linkBtnRegister" runat="server" Font-Underline="False" PostBackUrl="~/Register.aspx">用户注册</asp:LinkButton></td>
                </tr>
                <tr>
                  <td colspan="3" align="center">&nbsp;</td>
                  <td colspan="2" align="center">&nbsp;</td>
                </tr>
              </table>
        
      
      
      
      
      

      <table width="189" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="5"></td>
        </tr>
      </table>
      <br />
      <table width="189" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="5" align="center"><img src="images/line.gif" width="174" height="360" border="0" usemap="#Map2" /></td>
        </tr>
      </table>
      <br />
      <br />
      <img src="images/bbanner.jpg" width="174" height="450" border="0" usemap="#Map2" />
     
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
