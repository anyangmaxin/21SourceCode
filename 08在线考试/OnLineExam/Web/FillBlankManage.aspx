<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FillBlankManage.aspx.cs" Inherits="Web_FillBlankManage" StylesheetTheme="MRSOFTASPNET"%>
<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>填空题管理</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
<%--    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />   --%>  
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      
    <tr>
      <td style="height:4px;" colspan="3">
            <img src="../Images/top-01.jpg" style="border: 0px; left: 0px; position: relative; top: 0px;" title="" width ="100%"/>
         </td>
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
           
                                      <h4>&gt;&gt;填空题管理</h4>  
                                        <hr/> <p align="left"><asp:DropDownList ID="ddlCourse" runat="server" 
                                              AutoPostBack="True" Width="130px" 
                                              OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" SkinID="ddlSkin"></asp:DropDownList></p>
                      <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" 
                                          AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" 
                                          PageSize="12" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="ID" 
                                          Font-Size="13px" OnRowDeleting="GridView1_RowDeleting" SkinID="gvSkin">
                    <Columns>                       
                        <asp:TemplateField HeaderText="编号" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("ID") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
                         <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                 <center><asp:Label id="Label10" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label></center>
                            </ItemTemplate>
                        </asp:TemplateField> 
                        <asp:BoundField DataField="FrontTitle" HeaderText="题目前部分" />
                         <asp:BoundField DataField="BackTitle" HeaderText="题目后部分" />                                                                                  
                        <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="FillBlankAdd.aspx?ID={0}" HeaderText="查看..." Text="查看..." />                                           
                        
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" />
                    </Columns>
                </asp:GridView>
                      
                                      <asp:Button ID="btnFillBlank" runat="server" SkinID="btnSkin" 
                                          Text="&gt;&gt;填空题添加&lt;&lt;" onclick="btnFillBlank_Click" />
              
            </td>
        </tr>
    </table>  
      </form>  
</body>
</html>
