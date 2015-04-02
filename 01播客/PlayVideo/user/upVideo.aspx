<%@ Page Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="upVideo.aspx.cs" Inherits="user_upVideo" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





   <table width="500" border="0" cellspacing="0" cellpadding="0" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
      <tr>
        <td height="36" align="left" valign="middle" background="../images/glsc1_05.jpg" class="b" style="width: 553px">　　　<span class="hongcu">视频上传</span></td>
      </tr>
      <tr>
        <td  valign="top" style="width: 553px; height: 288px;">
    <table class="huise1" border="0" cellpadding="0" cellspacing="0" style="width: 490px; height: 218px">
        <tr>
            <td colspan="2">
                </td>
            <td colspan="1" style="width: 154px">
            </td>
        </tr>
        <tr>
            <td style="width: 127px; text-align: center">
                视频标题：</td>
            <td style="width: 26px">
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td>
            <td style="width: 154px; text-align: left;">
                <span style="color: #ff0000">*</span></td>
        </tr>
        <tr>
            <td style="width: 127px; text-align: center">
                视频内容：</td>
            <td style="width: 26px">
                <asp:TextBox ID="txtContent" runat="server" Height="104px" TextMode="MultiLine" Width="207px"></asp:TextBox></td>
            <td style="width: 154px; text-align: left;" valign="top">
            </td>
        </tr>
        <tr>
            <td style="width: 127px">
                上传视频：</td>
            <td style="width: 26px; text-align: left">
                <asp:FileUpload ID="fileupVideo" runat="server" /></td>
            <td style="width: 154px; text-align: left">
                <span style="color: #ff0033">
                主能上传.flv .avi.wmv</span></td>
        </tr>
        <tr>
            <td style="width: 127px; height: 29px">
                视频类型：</td>
            <td style="width: 26px; height: 29px; text-align: left">
                <asp:RadioButtonList ID="radBtnListType" runat="server" Height="21px" RepeatDirection="Horizontal"
                    Width="228px">
                    <asp:ListItem Selected="True">搞笑</asp:ListItem>
                    <asp:ListItem>体育</asp:ListItem>
                    <asp:ListItem>电影</asp:ListItem>
                    <asp:ListItem>动漫</asp:ListItem>
                </asp:RadioButtonList></td>
            <td style="width: 154px; height: 29px; text-align: left">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                </td>
            <td colspan="1" style="width: 154px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 24px">
                <asp:Button ID="btnUpVideo" runat="server" OnClick="btnUpVideo_Click" Text="上  传" />
                <asp:Button ID="btnReturn" runat="server" Text="返　回" PostBackUrl="~/user/userIndex.aspx" />
            </td>
            <td colspan="1" style="width: 154px; height: 24px;">
            </td>
        </tr>
    </table>
    
    </td> 
      </tr>
      <tr>
        <td align="center" style="width: 553px; height: 22px;" ></td>
      </tr>
      <tr>
        <td height="4" style="width: 553px"></td>
      </tr>
      
      
    </table>
    
    
    



</asp:Content>

