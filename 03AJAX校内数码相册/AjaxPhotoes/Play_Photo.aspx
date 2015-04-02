<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Play_Photo.aspx.cs" Inherits="Play_Photo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link href="userstyle.css" rel="Stylesheet" type="text/css" />

</head>
<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager> 
<script type="text/javascript" language="javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_initializeRequest(initializeRequest);
    prm.add_endRequest(endRequest);
    var postbackElement;
    function initializeRequest(sender, args) {
        document.body.style.cursor = "wait";
        if (prm.get_isInAsyncPostBack()) {
            args.set_cancel(true);
        }
    }
    function endRequest(sender, args) {
        document.body.style.cursor = "default";
    }
</script>
<asp:UpdatePanel ID="upList" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
 <div id="box">
  <div id="top"><table width="303" height="181" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="48" height="121">&nbsp;</td>
      <td width="255">
          <table cellpadding="0" cellspacing="0" >
              <tr>
                  <td align="right">
                      用户名：</td>
                  <td>
                      <asp:TextBox ID="txtUserName" runat="server" Width="98px">mr</asp:TextBox>
                      <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                          TargetControlID="txtUserName" WatermarkCssClass="watermark" 
                          WatermarkText="请输入用户名">
                      </cc1:TextBoxWatermarkExtender>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                          ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="不能为空">*</asp:RequiredFieldValidator>
                      <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender" 
                          runat="server" HighlightCssClass="Validator" 
                          TargetControlID="RequiredFieldValidator2">
                      </cc1:ValidatorCalloutExtender>
                  </td>
                  <td>
                      <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/images/zhuce_06.gif" 
                          NavigateUrl="~/UserRegister.aspx">HyperLink</asp:HyperLink>
                  </td>
              </tr>
              <tr>
                  <td align="right">
                      密码：</td>
                  <td>
                      <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="98px">mrsoft</asp:TextBox>
                  </td>
                  <td>
                      <asp:ImageButton ID="imgBtnLogin" runat="server" 
                          ImageUrl="~/images/zhuce_03.gif" onclick="imgBtnLogin_Click" />
                  </td>
              </tr>
              <tr>
                  <td colspan="3">
                      <label>
                      <asp:RadioButton ID="rdoBtnIndex" runat="server" Checked="True" 
                          GroupName="direction" Text="浏览相片" />
                      <label>
                      <asp:RadioButton ID="rdoBtnManage" runat="server" GroupName="direction" 
                          Text="管理图片" />
                      </label>
                      </label>
                  </td>
              </tr>
          </table>
        </td>
    </tr>
    <tr>
      <td height="33">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="27" colspan="2">&nbsp;</td>
      </tr>
  </table>
  </div>
  
  <div id="mid">
    <div id="left">
      <table width="165" height="600" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="165" height="504" align="left" valign="top">
          <a href="UserLogin.aspx"><img src="images/zhiye_06.gif" width="165" height="50" alt="相册首页" /></a>
          <a href='Photo_slide.aspx?CategoryID=<%=categoryID%>&CategoryName=<%=categoryName%>'><img src="images/ziye_06.gif" width="165" height="50" alt="播放幻灯" /></a>
          <a href="UserRegister.aspx"><img src="images/zhiye_11.gif" width="165" height="50" alt="用户注册" /></a>
          <a href="UserLogin.aspx"><img src="images/ziye_10.gif" width="165" height="50" alt="用户登录" /></a>
          </td>
        </tr>
        <tr>
          <td height="96"><img src="images/zhiye_20.gif" width="165" height="86" /></td>
        </tr>
      </table>
    </div>
    <div id="right01">
    <div id="m_right_img">
<div align="center" style="margin-top:15px">
    <div style="width:95%; margin-bottom:10px" align="left">
        <asp:HyperLink ID="hlkDefault" runat="server" NavigateUrl="~/ManageDefault.aspx" 
            Font-Bold="True" Font-Size="14px" ForeColor="#FF9900">返回首页</asp:HyperLink>-->><asp:Label 
            ID="lb_Cname" runat="server" Font-Bold="False" Font-Size="12px"></asp:Label>
    </div>  
    <img id="imgBig" alt="" src="" runat="server" /> 
    <div id="sTitle" runat="server" style="width:100%"></div>
    <div id="sDescription" runat="server" style="width:100%"></div>
</div>
</div>
<div id="m_bottom">
<div align="center">
    <a href="Photo_slide.aspx?CategoryID=<%=categoryID%>&CategoryName=<%=categoryName%>'><img alt="播放幻灯片" src="images/an_42.gif" /></a> 
    <div id="div1" style=" width:88%;height:5px"></div>
    <div> <asp:DataPager ID="AfterListDataPager" runat="server" 
            PagedControlID="lvPhoto" PageSize="4">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Image" FirstPageImageUrl="~/images/an_06.gif" 
                ShowFirstPageButton="true" ShowNextPageButton="False" LastPageImageUrl="~/images/an_12.gif" 
                NextPageImageUrl="~/images/an_10.gif" 
                PreviousPageImageUrl="~/images/an_08.gif" />
            <asp:NumericPagerField ButtonCount="10" />
            <asp:NextPreviousPagerField ButtonType="Image" LastPageImageUrl="~/images/an_12.gif" 
                ShowLastPageButton="true" 
                ShowPreviousPageButton="False" FirstPageImageUrl="~/images/an_06.gif" 
                NextPageImageUrl="~/images/an_10.gif" 
                PreviousPageImageUrl="~/images/an_08.gif" />
        </Fields>
    </asp:DataPager></div>
    <asp:ListView ID="lvPhoto" runat="server" GroupItemCount="4" DataKeyNames="ID" >
        <LayoutTemplate>
            <div ID="divPhoto" runat="server" align="center" 
                style="width:650px; height:0px; margin:8px 0px 2px 10px; padding:8px 0px 2px 10px; text-align:center">
                <div ID="groupPlaceholder" runat="server">
                </div>
            </div>            
        </LayoutTemplate>
        <GroupTemplate>
            <div ID="tr" style="width:100%;text-align:center">
                <div ID="itemPlaceholder" runat="server">
                </div>
            </div>
            <div ID="div1" style="height:5px"></div>
            <div ID="div2" style="height:20px; line-height:20px;"></div>
        </GroupTemplate>
        <ItemTemplate>
            <div style="width:158px;float:left">
                <div style="width:155px; height:119px; background-image:url(images/001_07.gif);">
                    <div style="width:100%; height:10px; line-height:10px;"></div>
                    <asp:LinkButton ID="lkbImg" runat="server" CommandArgument='<%# Eval("Url")%>' CommandName='<%# Eval("Descript")%>' oncommand="lkbImg_Command">
                        <img src='UpSmall/<%# Eval("Url")%>' alt='<%# Eval("Descript")%>' style="border-width:0px" width="133px" height="100px"/>
                    </asp:LinkButton> 
                </div>
                <div align="center" style="width:100%">
                    <%# Eval("Title")%>    
                    <br />                              
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <br />
   
</div>
    </div>
  </div>
  <div id="foot"></div>
</div> 
    
    
    
    
    
<%--<div id="box">
<div id="top"></div>
<div id="main_img">
<div id="m_left_img">
  <div id="an01"><a href="UserLogin.aspx"><img src="images/an_03.gif" width="160" height="57" border="0" alt="" /></a></div>
  <div id="an02"> <a href='Photo_slide.aspx?CategoryID=<%=categoryID%>&CategoryName=<%=categoryName%>'><img alt="播放幻灯片" src="images/an_42.gif" /></a></div>
  <div id="an03"><a href="UserRegister.aspx"><img src="images/an_b_32.gif" width="160" height="57" border="0" alt=""/></a></div>
  <div id="an04"><a href="UserLogin.aspx"><img src="images/an_b_41.gif" width="160" height="58" border="0" alt=""/></a></div>
</div>
<div id="m_right_img">
<div align="center" style="margin-top:15px">
    <div style="width:95%; margin-bottom:10px" align="left">
        <asp:HyperLink ID="hlkDefault" runat="server" NavigateUrl="~/ManageDefault.aspx" 
            Font-Bold="True" Font-Size="14px" ForeColor="#FF9900">返回首页</asp:HyperLink>-->><asp:Label 
            ID="lb_Cname" runat="server" Font-Bold="False" Font-Size="12px"></asp:Label>
    </div>  
    <img id="imgBig" alt="" src="" runat="server" /> 
    <div id="sTitle" runat="server" style="width:100%"></div>
    <div id="sDescription" runat="server" style="width:100%"></div>
</div>
</div>
<div id="m_bottom">
<div align="center">
    <a href="Photo_slide.aspx?CategoryID=<%=categoryID%>&CategoryName=<%=categoryName%>'><img alt="播放幻灯片" src="images/an_42.gif" /></a> 
    <div id="div1" class="bottomLine" style=" width:88%;height:5px"></div>
    <asp:ListView ID="lvPhoto" runat="server" GroupItemCount="5" DataKeyNames="ID" >
        <LayoutTemplate>
            <div ID="divPhoto" runat="server" align="center" 
                style="width:800px; height:400px; margin:8px 0px 2px 10px; padding:8px 0px 2px 10px; text-align:center">
                <div ID="groupPlaceholder" runat="server">
                </div>
            </div>            
        </LayoutTemplate>
        <GroupTemplate>
            <div ID="tr" style="width:100%;text-align:center">
                <div ID="itemPlaceholder" runat="server">
                </div>
            </div>
            <div ID="div1" class="bottomLine" style="height:5px"></div>
            <div ID="div2" style="height:20px; line-height:20px;"></div>
        </GroupTemplate>
        <ItemTemplate>
            <div style="width:158px;float:left">
                <div style="width:155px; height:119px; background-image:url(images/001_07.gif);">
                    <div style="width:100%; height:10px; line-height:10px;"></div>
                    <asp:LinkButton ID="lkbImg" runat="server" CommandArgument='<%# Eval("Url")%>' CommandName='<%# Eval("Descript")%>' oncommand="lkbImg_Command">
                        <img src='UpSmall/<%# Eval("Url")%>' alt='<%# Eval("Descript")%>' style="border-width:0px" width="133px" height="100px"/>
                    </asp:LinkButton> 
                </div>
                <div align="center" style="width:100%">
                    <%# Eval("Title")%>    
                    <br />                              
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <br />
    <asp:DataPager ID="AfterListDataPager" runat="server" PagedControlID="lvPhoto">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Image" FirstPageImageUrl="~/images/an_06.gif" 
                ShowFirstPageButton="true" ShowNextPageButton="False" LastPageImageUrl="~/images/an_12.gif" 
                NextPageImageUrl="~/images/an_10.gif" 
                PreviousPageImageUrl="~/images/an_08.gif" />
            <asp:NumericPagerField ButtonCount="10" />
            <asp:NextPreviousPagerField ButtonType="Image" LastPageImageUrl="~/images/an_12.gif" 
                ShowLastPageButton="true" 
                ShowPreviousPageButton="False" FirstPageImageUrl="~/images/an_06.gif" 
                NextPageImageUrl="~/images/an_10.gif" 
                PreviousPageImageUrl="~/images/an_08.gif" />
        </Fields>
    </asp:DataPager>
</div>
</div>
<div id="foot"></div>
</div>--%>




    </ContentTemplate>
</asp:UpdatePanel>
</form>
</body>
</html>
