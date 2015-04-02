<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaperLists.aspx.cs" Inherits="Web_PaperLists" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>试卷管理</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
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
            <td  valign="top" align="left" width="860">
           
                                      <h4>&gt;&gt;试卷管理</h4>  
                                        <hr/><asp:Label runat="server" ID="lblMessage" Text=""></asp:Label>
                       <asp:GridView ID="GridView1" runat="server"　AllowPaging="True" 
                                          OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="12" 
                                          OnRowDataBound="GridView1_RowDataBound" Width=100% AutoGenerateColumns="False" 
                                          DataKeyNames="PaperID" Font-Size="13px" 
                                          OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                                          OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" 
                                          OnRowUpdating="GridView1_RowUpdating" SkinID="gvSkin" >
                    <Columns>
                        <asp:TemplateField HeaderText="编号" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("PaperID") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="考试科目">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("Name") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="试卷名称">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("PaperName") %></asp:Label>
                            </ItemTemplate>                            
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="试卷状态">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("state") %></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>   
                            <asp:DropDownList ID="ddlPaperState" AutoPostBack="true" runat="server"><asp:ListItem Value="1">可用</asp:ListItem><asp:ListItem Value="0">不可用</asp:ListItem></asp:DropDownList>                         
                               
                            </EditItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>                                                              
                        <asp:HyperLinkField DataNavigateUrlFields="PaperID" DataNavigateUrlFormatString="PaperDetail.aspx?PaperID={0}" HeaderText="查看..." Text="查看..." >
                            <HeaderStyle Wrap="False" />
                        </asp:HyperLinkField>                                           
                        <asp:CommandField ShowEditButton="True" HeaderText="编辑" >
                            <HeaderStyle Wrap="False" />
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" >
                            <HeaderStyle Wrap="False" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                     
              
            </td>
        </tr>
    </table>  
      </form>  
</body>
</html>
