<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_amendLoopAd.aspx.cs" Inherits="manage_amendLoopAd" %>

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
                   &nbsp; &nbsp; &nbsp; &nbsp;&gt;&gt; 当前位置：修改循环广告</td>
            </tr>
        </table>

        <asp:GridView ID="gvImg" runat="server" AutoGenerateColumns="False" Height="182px"
                            Width="401px" AllowPaging="True" OnPageIndexChanging="gvImg_PageIndexChanging" PageSize="3" OnSelectedIndexChanging="gvImg_SelectedIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="图片">
                                    <ItemTemplate>
                                        <img align="middle" border="1"  src='../<%#Eval("videoPicture") %>' style="height: 127px;" width="150" />
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="图片名">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="48px">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField HeaderText="保存" SelectText="保存" ShowSelectButton="True" />
                            </Columns>
                            <RowStyle CssClass="huise1" />
                       
                        <HeaderStyle BackColor="#E0EEF3" CssClass="hongcu" />
                        </asp:GridView>
                    <br />
    
    </div>
    </form>
</body>
</html>
