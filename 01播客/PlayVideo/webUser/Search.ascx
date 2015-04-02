<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="search" %>
<table width="284" align="right">
      <tr>
        <td width="15"><img src="../images/xiaos.GIF" width="15" height="15" /></td>
        <td width="187"><asp:TextBox  CssClass="shenlan" ID="txtKeys" runat="server" Width="167px"></asp:TextBox></td>
        <td width="66"><asp:Button ID="btnSearch" runat="server" Text="搜索视频" OnClick="btnSearch_Click" /></td>
      </tr>
</table>
