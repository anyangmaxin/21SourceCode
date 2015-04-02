<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
        <link href="userstyle.css" rel="Stylesheet" type="text/css" />
     <style type="text/css">
    .txt
    {
        border-style:solid;
        border-color:#666666;
        border-width:1px 2px 2px 1px;
        margin:2px;    
    }
    .watermark
    {
       BORDER-RIGHT: #bebebe 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #bebebe 1px solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 0px; BORDER-LEFT: #bebebe 1px solid; WIDTH: 150px; COLOR: gray; PADDING-TOP: 2px; BORDER-BOTTOM: #bebebe 1px solid; HEIGHT: 20px; BACKGROUND-COLOR: #f0f8ff
    }
        .Validator
        {
	background-color:Red;
	}
         .style1
         {
             width: 100%;
         }
         .style2
         {
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
    <div id="box">
  <div id="top"><table width="303" height="181" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="48" height="121">&nbsp;</td>
      <td width="255">
          <table cellpadding="0" class="style1">
              <tr>
                  <td align="right" class="style2">
                      <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                  </td>
                  <td>
                            <asp:TextBox ID="txtUserName" runat="server" Width="98px">mr</asp:TextBox> 
                              <cc1:TextBoxWatermarkExtender
                                ID="TextBoxWatermarkExtender1" runat="server" 
                                TargetControlID="txtUserName" WatermarkText="请输入用户名" WatermarkCssClass="watermark">
                            </cc1:TextBoxWatermarkExtender>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtUserName" Display="Dynamic" 
                          ErrorMessage="不能为空">*</asp:RequiredFieldValidator>
                           <cc1:ValidatorCalloutExtender
                                    ID="RequiredFieldValidator2_ValidatorCalloutExtender" runat="server" 
                                HighlightCssClass="Validator" 
                          TargetControlID="RequiredFieldValidator2">
                                </cc1:ValidatorCalloutExtender>
                        </td>
                  <td>
                      <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/images/zhuce_06.gif" 
                          NavigateUrl="~/UserRegister.aspx">HyperLink</asp:HyperLink>
                  </td>
              </tr>
              <tr>
                  <td align="right" class="style2">
                      <asp:Label ID="Label2" runat="server" Text="密   码："></asp:Label>
                  </td>
                  <td>
                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="98px" CssClass="watermark">mrsoft</asp:TextBox>
                        </td>
                  <td>
                      <asp:ImageButton ID="imgBtnLogin" runat="server" 
                          ImageUrl="~/images/zhuce_03.gif" onclick="imgBtnLogin_Click" />
                  </td>
              </tr>
              <tr>
                  <td class="style2" colspan="3">
                      <label><asp:RadioButton ID="rdoBtnIndex" runat="server" Checked="True" GroupName="direction"
                                Text="浏览相片" /><asp:RadioButton ID="rdoBtnManage" runat="server" GroupName="direction"
                                    Text="管理图片" />
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
      <td height="27" colspan="2"><img src="images/zhuce_08.gif" width="159" height="27" /></td>
      </tr>
  </table>
  </div>
  
  <div id="mid"><asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                     <table width="95%" height="95%" border="0" 
    cellpadding="0" cellspacing="1" bgcolor="#74a248">
                                        <tr>
                                            <td width="33%" align="center" bgcolor="#FFFFFF">
                                                <asp:DataList ID="dlPictrue" runat="server" RepeatColumns="3"
                                            RepeatDirection="Horizontal" onitemcommand="dlPictrue_ItemCommand" 
                                            onitemdatabound="dlPictrue_ItemDataBound" DataKeyField="ID"> 
                                                    <ItemTemplate>
                                        
                                                                 <table style="width: 116px">
                                                            <tr>
                                                                <td>
                                                                     <a href='Play_Photo.aspx?CategoryID=<%# Eval("ID") %>&CategoryName=<%# Eval("C_Name") %>'>
                                                                     <img alt='<%# Eval("C_Name")%>' src='UpSmall/<%# Eval("url") %>' 
                                                                         style="border-width:0px; width: 289px; height: 224px;"/></a>                                                               </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" class="a">
                                                                   <a href='Play_Photo.aspx?CategoryID=<%# Eval("ID")%>&CategoryName=<%# Eval("C_Name") %>'>相册名称：<%# Eval("C_Name").ToString().Length > 5 ? Eval("C_Name").ToString().Substring(0, 5) + "..." : Eval("C_Name")%>(共<%# Eval("p_num")%>张)</a>
                                                                    <br />
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="进入并浏览" CommandName="Delete"
                                                                ImageUrl="~/images/index01_08.gif" CausesValidation="False" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <table ID="Page" border="1" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="labCurrentPage" runat="server"></asp:Label>
                                                                    /
                                                                    <asp:Label ID="labPageCount" runat="server"></asp:Label>
                                                                    <asp:LinkButton ID="lnkbtnFirst" runat="server" CommandName="first" 
                                                                        Font-Underline="False" ForeColor="Black" CausesValidation="False">首页</asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkbtnFront" runat="server" CommandName="pre" 
                                                                        Font-Underline="False" ForeColor="Black" CausesValidation="False">上一页</asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkbtnNext" runat="server" CommandName="next" 
                                                                        Font-Underline="False" ForeColor="Black" CausesValidation="False">下一页</asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkbtnLast" runat="server" CommandName="last" 
                                                                        Font-Underline="False" ForeColor="Black" CausesValidation="False">尾页</asp:LinkButton>
                                                                    &nbsp;&nbsp; 跳转至：<asp:TextBox ID="txtPage" runat="server" Height="21px" Width="35px" CssClass="watermark"></asp:TextBox>
                                                                    <asp:Button ID="Button1" runat="server" CommandName="search" Height="23px" 
                                                                        Text="GO" Width="46px" CausesValidation="False" />
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:DataList>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="imgBtnLogin" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel></div>
  <div id="foot">
            </div>
</div>
    
    </form>
</body>
</html>
