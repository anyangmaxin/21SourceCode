<%@ Page Language="C#" AutoEventWireup="true" CodeFile="play.aspx.cs" Inherits="play" %>

<%@ Register Src="webUser/WebUserControlVideoPlaySum.ascx" TagName="WebUserControlVideoPlaySum"
    TagPrefix="uc4" %>





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
    
   <style>
    td{word-break:break-all;word-wrap:break-word}
   </style>
     <script language="javascript"> 
        function change()
        {
        //获取评论文本框中的值
            var str=document.getElementById('txtContent').value;
            //获取当前还可以输入的字符数量
            var sum=500-str.length;
            //判读是否还可以输入字符
            if(sum<=0)
            {
            //设置Label控件显示文本为红色
              document.getElementById('labCount').style.color="Red";
              //截取文本框中的字符串，从0位置开始截取，截取到500位
             document.getElementById('txtContent').value=document.getElementById('txtContent').value.substring(0,500);
             //显示可以输入的字符数量
            document.getElementById('labCount').innerHTML=sum;  
         
            }else
            {
            //显示可以输入的字符数量
                document.getElementById('labCount').innerHTML=sum;     
                //设置Label控件的文本颜色
            document.getElementById('labCount').style.color="#006FC3";    
            }           
        }  
    </script>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div style="z-index:1" align=center>  
    <form id="form1" runat="server">
    
    <table width="900" height="166" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="484" valign="top">
    
    <table width="894" align="center" cellpadding="0" cellspacing="0" style="height: 900px">
      <tr>
        <td width="540" valign="top" style="height: 900px"><table width="546" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="29" colspan="2" style="text-align: left; background-image: url(images/play_b.jpg); background-repeat: no-repeat;"><table width="150">
              <tr>
                <td width="15">&nbsp;</td>
                <td height="29" width="123" class="hongcu">
                    播放视频</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td width="469" height="14" valign="top"><table width="538" height="245" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#999999">
                <tr>
                  <td width="538" height="241" valign="top" bgcolor="#FFFFFF"><table width="537" height="203" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#999999">
                    <tr>
                      <td width="529" height="28" valign="middle" bgcolor="#DFF0F8"><table width="159" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="63" class="shenlancu">人气:<%=playSum%></td>
                          <td width="39"><table width="35" cellpadding="0" cellspacing="0">
                            <tr>
                              <td></td>
                              <td class="chengse"><%=flower %>
                                  <asp:ImageButton ID="imgbtnD" runat="server" ImageUrl="~/images/shou.gif" OnClick="imgbtnD_Click" /></td>
                            </tr>
                          </table></td>
                          <td width="55"><table width="35" cellpadding="0" cellspacing="0">
                            <tr>
                              <td>
                                  <asp:ImageButton ID="imgbtnC" runat="server" ImageUrl="~/images/jiao.gif" OnClick="imgbtnC_Click" /></td>
                              <td class="chengse"><%=tile%></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td valign="top" bgcolor="#FFFFFF"><table width="460" height="377" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                           <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                          </td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
                </tr>
            </table></td>
            <td width="6" align="right" valign="top">&nbsp;</td>
          </tr>
        </table>
          <table width="538" align="center"  cellpadding="0" cellspacing="0" style="height: 761px">

            <tr>
              <td width="469" valign="top" style="height: 568px"><table width="538" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#999999" style="height: 300px">
                  <tr  valign="top">
                    <td height="241" valign="top" bgcolor="#FFFFFF" style="width: 538px" align="left">
                        <asp:Panel ID="PanelIdea" runat="server" Height="504px" Width="125px" ScrollBars="Vertical">
           
                
        <asp:DataList ID="dlIdea" runat="server" Width="429px">
            <ItemTemplate>
            
            <table  width="538" height="88" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#999999">
                        <tr>
                          <td width="538" height="28" valign="middle" bgcolor="#DFF0F8" class="shenlancu"> <asp:Label ID="Label1" runat="server" Text='<%#Eval("userName") %>'></asp:Label>在<%#getIsDate(Convert.ToString(Eval("issuanceDate")))%>发布的评论：</td>
                        </tr>
                        <tr>
                          <td valign="top" width="538"   align="left" height="60" bgcolor="#FFFFFF" class="huise1"><asp:Label ID="Label2"  runat="server" Text='<%#operateMethod.resumeHtml((string)Eval("content"))%>'></asp:Label></td>
                        </tr>
                    </table>              
            
                
            </ItemTemplate>
        </asp:DataList>
              
              
        </asp:Panel>
          <table width="537" height="88" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#9BD0EA">
            <tr>
              <td width="529" valign="middle" bgcolor="#FFFFFF" class="shenlancu" style="height: 28px">
                  <table border="0" cellpadding="0" cellspacing="0" style="width: 518px">
                      <tr>
                          <td style="width: 78px; height: 31px">
                              <img height="31" src="images/pinglun.gif" width="119" /></td>
                          <td style="width: 358px; height: 31px">
                          </td>
                          <td style="width: 186px; height: 31px">
                              &nbsp; 您还可以输入<asp:Label ID="labCount" runat="server" Text="500"></asp:Label>字符</td>
                      </tr>
                  </table>
              </td>
            </tr>
            <tr>
              <td align="center" valign="top" bgcolor="#FFFFFF" class="huise1">
                    <asp:TextBox ID="txtContent" onKeyUp="change()" runat="server" Height="94px" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr>
              <td align="center" valign="top" bgcolor="#FFFFFF" class="huise1" style="height: 84px"><table width="353" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="240" class="huise1">
                      <asp:Panel ID="PanelHello" runat="server" Height="0px" Width="200px">
                          欢迎<asp:Label ID="lbeUserName" runat="server" Text="Label"></asp:Label>发表评论</asp:Panel>
                      <asp:Panel ID="PanelLogin" runat="server" Height="0" Width="260px">
                          您当前是游客身份：<span class="shenhong">  <asp:LinkButton ID="lkbtnLogin" runat="server" PostBackUrl="~/login.aspx" >登　录</asp:LinkButton></span>
                       <span class="shenhong" > <asp:LinkButton ID="lkbtnRegister" runat="server" PostBackUrl="~/Register.aspx" >注　册</asp:LinkButton></span></asp:Panel>
                      </td>
                  <td width="111">
                    <asp:Button ID="btnIdea" runat="server" Text="发表评论" OnClick="btnIdea_Click" /></td>
                </tr>
              </table></td>
            </tr>
          </table>
        </td>
                  </tr>
              </table></td>
              <td width="6" align="right" valign="top" style="height: 568px">&nbsp;</td>
            </tr>
          </table>
          </td>
        <td width="331" valign="top" style="height: 900px"><table height="100" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#999999" style="width: 348px">
          <tr>
            <td align="left" width="356" valign="middle" bgcolor="#FFFFFF" class="huise1">&nbsp;<%=videoTitle %> <br />
              &nbsp;视频内容：<%=videoContent %> <br />
              &nbsp; 发布人：<%=Name %><br />
              &nbsp;发布日期：<%=videoDate %> </td>
          </tr>
        </table>
            <uc4:WebUserControlVideoPlaySum ID="WebUserControlVideoPlaySum2" runat="server" />
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


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
       </form>
       </div>

  
</body>
</html>
