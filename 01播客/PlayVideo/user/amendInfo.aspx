<%@ Page Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="amendInfo.aspx.cs" Inherits="user_amendInfo" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
   
      <table width="500" border="0" cellspacing="0" cellpadding="0" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
      <tr>
        <td height="36" align="left" valign="middle" background="../images/glsc1_05.jpg" class="b" style="width: 553px">　　　<span class="hongcu">修改个人信息</span></td>
      </tr>
      <tr>
        <td  valign="top"height="288" style="width: 553px">
            <table class="huise1" border="0" cellpadding="0" cellspacing="0" style="width: 420px; height: 318px; border-top-width: thin; border-left-width: thin; border-left-color: #66ccff; border-bottom-width: thin; border-bottom-color: #66ccff; border-top-color: #66ccff; border-right-width: thin; border-right-color: #66ccff;" id="TABLE1">
            <tr>
                <td style="width: 100px; height: 5px;">
                    昵称：</td>
                <td style="width: 122px; height: 5px;">
                    <asp:TextBox ID="txtNickname" runat="server"></asp:TextBox></td>
                <td style="width: 100px; height: 5px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 45px;">
                    性别：</td>
                <td style="width: 122px; height: 45px; text-align: left;">
                    <asp:RadioButtonList ID="rbtnlsSex" runat="server" RepeatDirection="Horizontal"
                        Width="42px">
                        <asp:ListItem Selected="True">男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td style="width: 100px; height: 45px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 90px;">
                    头像：</td>
                <td style="width: 122px; height: 90px;">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 254px; height: 146px">
                        <tr>
                            <td style="width: 100px">
                                <asp:FileUpload ID="fupImg" runat="server" /></td>
                        </tr>
                        <tr>
                            <td style="width: 100px; text-align: center;">
                                <asp:Button ID="btnUp" runat="server" Text="上　传" OnClick="btnUp_Click" /></td>
                        </tr>
                        <tr>
                            <td style="width: 100px; text-align: left">
                                <asp:Image ID="ImageHead" runat="server" Height="100px" Width="100px" />
                              
                                </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 100px; height: 90px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    所在城市：</td>
                <td style="width: 122px">
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    QQ：</td>
                <td style="width: 122px">
                    <asp:TextBox ID="txtQQ" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    个性留言：</td>
                <td style="width: 122px">
                    <asp:TextBox ID="txtSpeak" runat="server" Height="80px" TextMode="MultiLine" Width="249px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 24px">
                    <asp:Button ID="btnAmend" runat="server" Text="修　改" OnClick="btnAmend_Click" />
                </td>
            </tr>
        </table>
    
    </td> 
      </tr>
      <tr>
        <td height="22" align="center" style="width: 553px" ></td>
      </tr>
      <tr>
        <td height="4" style="width: 553px"></td>
      </tr>
      
      
    </table>
   
   
   
   
   
   

</asp:Content>

