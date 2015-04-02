<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserScore.aspx.cs" Inherits="Web_UserScore" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>成绩管理</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
 <%--   <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" /> --%>    
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
    <table border="0" cellpadding="0" cellspacing="0"  width="100%">
      
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
            <td  valign="top" align="left" width="750px">
           
                                      <h4>&gt;&gt;成绩管理<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/导出EXCEL}.gif" 
                                          OnClick="ImageButton2_Click" />
                                      </h4>  
                      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                          OnRowDataBound="GridView1_RowDataBound" 
                                          OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="12" 
                                          AutoGenerateColumns="False" DataKeyNames="ID" Font-Size="13px" Width="100%"  
                                          OnRowDeleting="GridView1_RowDeleting" SkinID="gvSkin" Height="100%" >
                    <Columns>                       
                        <asp:TemplateField HeaderText="成绩编号" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server"><%# Eval("ID") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="用户ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserID" runat="server"><%# Eval("UserID") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                           
                            <asp:BoundField DataField="UserName" HeaderText="姓名" />
                            <asp:TemplateField HeaderText="试卷">
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("PaperName") %>'></asp:Label>
                                    <asp:Label ID="lblPaperID" runat="server" Text='<%# Eval("PaperID") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                                                    
                            <asp:TemplateField HeaderText="成绩">                                
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server"><%# Eval("Score") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="考试时间">                                
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server"><%# Eval("ExamTime") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>                                
                           <asp:TemplateField HeaderText="评卷时间">                                
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server"><%# Eval("JudgeTime") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>                                                    
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" >
                            <HeaderStyle Wrap="False" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
              <br /> 
            </td>
        </tr>
     
    </table>  
      </form>  
</body>
</html>
