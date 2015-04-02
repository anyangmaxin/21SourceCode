<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminHeader.ascx.cs" Inherits="control_AdminHead" %>
<table border="0" cellpadding="0" cellspacing="0" style="width: 776px; height: 143px">
    <tr>
        <td align="center" colspan="2" style="height: 124px">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/admin_top.gif" /></td>
    </tr>
    <tr>
        <td align="center" colspan="2" style="background-color: #6699cc">
            <span style="font-size: 9pt">
            湃瑞思茅科技有限公司欢迎您！

                <script type="text/javascript"> 
 document.write("<span id=lblTime width='118px' height='11px' Font-Size='9pt'></span>") //输出显示日期的容器 
 //每1000毫秒(即1秒) 执行一次本段代码 
  setInterval("lblTime.innerText=new Date().toLocaleString()",1000)  
                </script>

            </span>

                <asp:Label ID="lblTime" runat="server"></asp:Label></td>
    </tr>
</table>
