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
        <table bordercolor="silver" cellpadding="0" cellspacing="0" style="width: 182px; height: 407px;">
            <tr>
                <td style="width: 111px; height: 498px;">
                    <br />
        <asp:TreeView ID="TreeView1" runat="server" Height="301px" Font-Size="12pt" ForeColor="Black" Width="131px" style="left: 1px; position: relative; top: 27px" ImageSet="Faq" >
            <Nodes>
                <asp:TreeNode Text="博客后台管理" ToolTip="博客后台管理" Value="博客后台管理">
                   
                <asp:TreeNode Text="个人博客管理" ToolTip="个人博客管理" Value="个人博客管理">
                    <asp:TreeNode Text="文章管理" ToolTip="文章管理" Value="文章管理" Target="rightFrame" NavigateUrl="ArticleManage.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="文章添加" ToolTip="文章添加" Value="文章添加" Target="rightFrame" NavigateUrl="~/Module/Blog/AddArt.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="个人通讯录" ToolTip="个人通讯录" Value="个人通讯录" Target="rightFrame" NavigateUrl="LinkManManage.aspx"></asp:TreeNode>
                </asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/Module/Blog/LonginOut.aspx" Target="_top" ToolTip="退出登录" Text="退出登录" Value="退出登录"></asp:TreeNode>
               
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
