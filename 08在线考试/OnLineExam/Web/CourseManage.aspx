<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseManage.aspx.cs" Inherits="Web_CourseManage" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>���Կ�Ŀ����</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
<%--    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />  --%>   
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      
    <tr>
      <td style="height:4px;" colspan="3">
            &nbsp;<img src="../Images/top-01.jpg" style="width: 1003px; height: 137px" /></td>
    </tr>
        <tr style="background: url(../Images/lineS.jpg) repeat-x;">
            <td style="height:25;" colspan="3">
                &nbsp;&nbsp;&nbsp;��ӭ����<asp:Label ID="labUser" runat="server" Text="Label" Width="70px"></asp:Label>&nbsp;&nbsp;
                                <script type="text/javascript">getDate();</script>

                <span id="ShowTime"></span></td>         
        </tr>


          <tr>
            <td  style="width:20%" align="center" valign="top">
                <uc1:lefttree ID="Lefttree1" runat="server" />
                </td>          
              <td  style="width: 4px;  background: url(../Images/line.gif) repeat-y;"> 
            </td>   
            <td  valign="top" align="left">
           
                                      <h4>&gt;&gt;���Կ�Ŀ����</h4>  
                                        <hr/>
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" 
                                          OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="12" 
                                          OnRowDataBound="GridView1_RowDataBound"��BackColor="White" Font-Size="13px" 
                                          Width="541px" DataKeyNames="ID"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" 
                                          OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                                          SkinID="gvSkin" >
                        <Columns>
                            <asp:TemplateField HeaderText="���">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server"><%# Eval("ID") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="���Կ�Ŀ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' Width="80"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"><%# Eval("Name") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                                                     
                            <asp:CommandField HeaderText="�༭" ShowEditButton="True" />
                            <asp:TemplateField HeaderText="ɾ��" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('ȷ��Ҫɾ����');" 
                                        Text="ɾ��"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                     
                                      <asp:Button ID="btnAddCource" runat="server" onclick="btnAddCource_Click" 
                                          SkinID="btnSkin" Text="&gt;&gt;���Կ�Ŀ���&lt;&lt;" />
              
            </td>
        </tr>
    </table>  
      </form>  
</body>
</html>
