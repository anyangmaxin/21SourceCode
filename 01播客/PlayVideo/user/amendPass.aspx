<%@ Page Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="amendPass.aspx.cs" Inherits="user_amendPass" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
    
    
       <table width="500" border="0" cellspacing="0" cellpadding="0" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
      <tr>
        <td height="36" align="left" valign="middle" background="../images/glsc1_05.jpg" class="b" style="width: 553px">　　　<span class="hongcu">修改个人密码</span></td>
      </tr>
      <tr>
        <td  valign="top"height="288" style="width: 553px">
             <table class="huise1" border="0" cellpadding="0" cellspacing="0" style="width: 428px; height: 173px; border-top-width: thin; border-left-width: thin; border-left-color: #66ccff; border-bottom-width: thin; border-bottom-color: #66ccff; border-top-color: #66ccff; border-right-width: thin; border-right-color: #66ccff;">
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                    原密码：</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtOldPass" runat="server" Width="101px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                    新密码：</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNewPass" runat="server" Width="101px" TextMode="Password"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                    确认密码：</td>
                <td style="width: 100px; height: 24px">
                    <asp:TextBox ID="txtNewQ" runat="server" Width="101px" TextMode="Password"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass"
                        ControlToValidate="txtNewQ" ErrorMessage="两次密码不一致" Width="150px"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Button ID="btnAmend" runat="server" Text="修 改" OnClick="btnAmend_Click" />
                    &nbsp; &nbsp;
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

