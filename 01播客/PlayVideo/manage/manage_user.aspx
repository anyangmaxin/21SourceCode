<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_user.aspx.cs" Inherits="manage_manage_user" %>

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
	background-image: url(images/bg.gif);
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {font-size: 12px; line-height: 22px; color: #000000; font-family: "宋体";}
-->
</style>
    
</head>
<body scroll="no" bgcolor="#FFFFFF">
    <form id="form1" runat="server">
    <div style="text-align: center">
       <table align="center" cellpadding="0" cellspacing="0" style="width: 619px; height: 25px">
            <tr>
                <td  background="../images/htgl_wz.jpg" style="width: 613px; text-align: left;">
                   &nbsp; &nbsp; &nbsp; &nbsp;&gt;&gt; 当前位置：用户管理</td>
            </tr>
        </table>

        <asp:GridView ID="gvUser" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" OnRowDeleting="gvUser_RowDeleting" OnSelectedIndexChanging="gvUser_SelectedIndexChanging" Width="502px">
            <Columns>
                <asp:BoundField DataField="userName" HeaderText="用户名" />
                <asp:BoundField DataField="nickName" HeaderText="昵称" />
                <asp:BoundField DataField="sumMark" HeaderText="积分" />
                <asp:BoundField DataField="registerDate" HeaderText="注册日期" />
                <asp:BoundField DataField="lock" HeaderText="状态" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href ='../userInfo.aspx?userName=<%#Eval("userName") %>' target="_blank"   >查看</a>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="操作" SelectText="锁定/解锁" ShowSelectButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
            <RowStyle CssClass="huise1" />
                        <HeaderStyle BackColor="#E0EEF3" CssClass="hongcu" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
