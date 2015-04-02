<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserPaperList.aspx.cs" Inherits="Web_UserPaperList" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>成绩管理</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
  <%--  <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" /> --%>    
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      
    <tr>
      <td style="height:4px;" colspan="3">
            &nbsp;<img alt="" src="../Images/top-01.jpg" style="width: 1003px; height: 137px" /></td>
    </tr>
        <tr style="background: url(../Images/lineS.jpg) repeat-x;">
            <td style="height:25;" colspan="3">
                &nbsp;&nbsp;&nbsp;欢迎您：<asp:Label ID="labUser" runat="server" Text="Label" Width="70px"></asp:Label>&nbsp;&nbsp;
                                <script type="text/javascript">getDate();</script>

                <span id="ShowTime"></span></td>         
        </tr>


          <tr>
            <td  style="width: 130px" align="center" valign="top">
                <uc1:lefttree ID="Lefttree1" runat="server" />
           </td>          
              <td  style="width: 4px;  background: url(../Images/line.gif) repeat-y;"> 
            </td>   
            <td  valign="top" align="left"  width="960px">
           
                                      <h4>&gt;&gt;用户试卷评阅</h4>  
                      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataKeyNames ="UserID,PaperID" 
                                          OnRowDataBound="GridView1_RowDataBound" 
                                          OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="8" 
                                          AutoGenerateColumns="False" Font-Size="13px" Width="100%" 
                                          OnRowDeleting="GridView1_RowDeleting" SkinID="gvSkin">
                    <Columns> 
                           <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True"/>
                            <asp:BoundField DataField="PaperID" Visible=False HeaderText="PaperID" ReadOnly="True"/>
                            <asp:TemplateField HeaderText="用户姓名">                               
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"><%# Eval("UserName") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="所在部门">                               
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server"><%# Eval("DepartmentName")%></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                             <asp:HyperLinkField DataNavigateUrlFields="UserID,PaperID" 
                               DataNavigateUrlFormatString="UserPaper.aspx?UserID={0}&PaperID={1}" 
                               DataTextField="PaperName" HeaderText="试卷(点击查看)" ItemStyle-Font-Bold="true">                       
<ItemStyle Font-Bold="True"></ItemStyle>
                           </asp:HyperLinkField>
                            <asp:TemplateField HeaderText="考试时间">                                
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server"><%# Eval("ExamTime") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>    
                            <asp:BoundField HeaderText="是否评阅" DataField="state" /> 
                               <asp:CommandField ShowDeleteButton="True" HeaderText="删除" />
                    </Columns>
                </asp:GridView>                      
               <asp:Label ID="LabelPageInfo" runat="server"></asp:Label>
                <br />
            </td>
        </tr>
     
    </table>  
      </form>  
</body>
</html>