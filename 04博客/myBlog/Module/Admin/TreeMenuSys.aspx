<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreeMenuSys.aspx.cs" Inherits="Menu_TreeMenuSys" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style>body{margin-top:0px;margin-left:0px}</style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding-right: 0px; background-position: left top; margin-top: 0px; padding-left: 0px; margin-left: 0px; vertical-align: top; margin-right: 0px; padding-top: 0px; text-align: left; background-repeat: no-repeat;">
        <table  cellpadding="0" cellspacing="0" height="525" style="background-image: url(../Images/SysSkin/left.jpg); width: 104px;">
            <tr>
                <td style="width: 18px">
                </td>
                <td style="width: 100px">
                    <br />
        <asp:TreeView ID="TreeView1" runat="server" Height="241px" Font-Size="12pt" ForeColor="Black" Width="121px" style="left: 1px; position: relative; top: -64px" ImageSet="Faq" >
            <Nodes>
                <asp:TreeNode Text="博客后台管理" ToolTip="博客后台管理" Value="博客后台管理">
                   
               
               <asp:TreeNode Text="系统管理" ToolTip="系统管理" Value="系统管理">
                <asp:TreeNode Text="博客管理员" ToolTip="博客管理员" Value="博客管理员" Target="rightFrame" NavigateUrl="AdminManage.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="类型管理" ToolTip="类型管理" Value="类型管理" Target="rightFrame" 
                       NavigateUrl="~/Module/Admin/BlogType.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="链接管理" ToolTip="链接管理" Value="链接管理" Target="rightFrame" 
                       NavigateUrl="~/Module/Admin/LinkManage.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="博客管理" ToolTip="博客管理" Value="博客管理" Target="rightFrame" 
                       NavigateUrl="~/Module/Admin/BlogManage.aspx"></asp:TreeNode>
                       <asp:TreeNode Text="广告管理" ToolTip="广告管理" Value="广告管理" Target="rightFrame" 
                       NavigateUrl="~/Module/Admin/manage_AD.aspx"></asp:TreeNode>
                       <asp:TreeNode Text="评论管理" ToolTip="评论管理" Value="评论管理" Target="rightFrame" 
                       NavigateUrl="~/Module/Admin/ST_admin_replay.aspx"></asp:TreeNode>
                       <asp:TreeNode Text="留言管理" ToolTip="留言管理" Value="留言管理" Target="rightFrame" 
                       NavigateUrl="~/Module/Admin/ST_admin_message.aspx"></asp:TreeNode>
                 </asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/Module/Blog/LonginOut.aspx" Target="_top" Text="退出登录" Value="退出登录"></asp:TreeNode>
                </asp:TreeNode>
            </Nodes>
            <HoverNodeStyle ForeColor="Purple" Font-Underline="True" />
            <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" VerticalPadding="0px" />
            <ParentNodeStyle Font-Bold="False" />
            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="DarkBlue" HorizontalPadding="5px"
                NodeSpacing="0px" VerticalPadding="0px" />
        </asp:TreeView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
