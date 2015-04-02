<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControlVideoPlaySum.ascx.cs" Inherits="WebUserControlVideoPlaySum" %>



<table width="350" height="203" border="0" cellpadding="0" cellspacing="0"  bgcolor="#999999" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
          <tr>
            <td width="224" height="25" align="left" background="images/renqi.jpg" valign="bottom"bgcolor="#DFF0F8"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 人气排行</strong></td>
          </tr>
          <tr>
            <td valign="top" bgcolor="#FFFFFF" style="text-align: left; height: 1008px;">
            
            <asp:DataList ID="dlplaySum" runat="server" Width="305px">
                <ItemTemplate>
                    
                    <table width="290" height="116" cellpadding="0" cellspacing="0">
              <tr>
                <td width="152"><table width="33" height="76" cellpadding="0" cellspacing="0">
                    <tr>
                      <td colspan="2"><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#999999">
                          <tr>
                            <td width="367" align="center" valign="middle" bgcolor="#ffffff">
                                
                           
                                        
                                  <a href='play.aspx?id=<%#Eval("id") %>'><img align="middle" border="0" alt='<%#Eval("videoTitle") %>' src='<%#Eval("videoPicture") %>'
                                        style=" float: left; vertical-align: middle; width: 132px; height: 111px" /></a>
                                        
                                        </td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td width="61" align="center" class="shenhong"><table width="35" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><img src="images/shou.gif" width="17" height="17" /></td>
                            <td class="chengse"><%#Eval("flower") %></td>
                          </tr>
                      </table></td>
                      <td width="63" align="center" class="shenhong"><table width="35" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><img src="images/jiao.gif" width="17" height="17" /></td>
                            <td class="chengse"><%#Eval("tile") %></td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
                <td width="320"><span class="huise1">视频名称：</span><span class="shenhong"><a href='play.aspx?id=<%#Eval("id") %>' title='<%#Eval("videoTitle") %>'><%#operateMethod.interceptStr((string)Eval("videoTitle"),5) %></a><br /></span><span class="huise1">
                
                
                  发布人：</span><span class="shenhong"><a  href='userInfo.aspx?userName=<%#Eval("userName")%>' title='<%#Eval("userName") %>'><%#Eval("userName") %></a><br /></span><span class="chengse"> 类型：<%#Eval("videoType") %></span> </td>
              </tr>
            </table>
                    
             
                    
                    
                    
                    
                </ItemTemplate>
            </asp:DataList>
                        
            </td>
          </tr>
        </table>





















