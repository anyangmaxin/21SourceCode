<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="Web_UserManage" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>用户管理</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>  
    <script type="text/javascript">

</script>
 
    <style type="text/css">
        #table1
        {
            width: 214px;
        }
    </style>
 
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      
    <tr>
      <td style="height:4px;" colspan="3">
            <img src="../Images/top-01.jpg"style="border: 0px; left: 0px; position: relative; top: 0px;" title="" width ="100%"/>
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
            <td  valign="top" align="left" width="960px">
           
                         
                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                              <ContentTemplate>
                                   <h4>&gt;&gt;用户管理</h4>  编号或用户名：
                <asp:TextBox ID="tbxUserID" runat="server" Width="66px" SkinID="tbSkin"></asp:TextBox>
                真实姓名：
                <asp:TextBox ID="tbxUserName" runat="server" Width="66px" 
                              SkinID="tbSkin"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonQuery" runat="server" 
                              ImageUrl="~/Images/查询}.gif" OnClick="ImageButtonQuery_Click" 
                              style="height: 20px"></asp:ImageButton>
                                         <asp:ImageButton ID="ImageButton1" runat="server" 
                              ImageUrl="~/Images/返回}.gif" OnClick="ImageButtonBack_Click"></asp:ImageButton>&nbsp;
                                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                              AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" 
                              PageSize="6" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                              OnRowDataBound="GridView1_RowDataBound"  OnRowDeleting="GridView1_RowDeleting" 
                              OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                              DataKeyNames="UserID" Font-Size="13px" 
    Width="100%" SkinID="gvSkin" BackColor="#DEBA84" BorderColor="#DEBA84" 
    BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                                      <Columns>
                                          <asp:TemplateField>
                                              <ItemTemplate>
                                                  <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" />
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="ID">
                                              <ItemTemplate>
                                                  <%# Container.DataItemIndex+1 %>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="编号（或用户名）">
                                              <ItemTemplate>
                                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="真实姓名">
                                              <EditItemTemplate>
                                                  <asp:TextBox ID="tbxName" Width="70px" runat="server" 
                                    Text='<%# Eval("UserName") %>'></asp:TextBox>
                                              </EditItemTemplate>
                                              <ItemTemplate>
                                                  <asp:Label ID="Label2" runat="server"><%# Eval("UserName") %></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="系别">
                                              <EditItemTemplate>
                                                  <asp:DropDownList ID="ddlDepartment" runat="server" Width="80px" />
                                              </EditItemTemplate>
                                              <ItemTemplate>
                                                  <asp:Label ID="Label4" runat="server"><%# Eval("DepartmentName") %></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="角色">
                                              <EditItemTemplate>
                                                  <asp:DropDownList ID="ddlRole" runat="server" Width="80px" />
                                              </EditItemTemplate>
                                              <ItemTemplate>
                                                  <asp:Label ID="Label3" runat="server"><%# Eval("RoleName") %></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:CommandField ShowEditButton="True" HeaderText="编辑" />
                                          <asp:CommandField ShowDeleteButton="True" HeaderText="删除" />
                                      </Columns>
                                      <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                      <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                      <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                      <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                      <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                  </asp:GridView>
                              </ContentTemplate>
                          </asp:UpdatePanel>
                          <br />
                                        
                 <asp:Label ID="LabelPageInfo" runat="server"></asp:Label>
                          <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                              AssociatedUpdatePanelID="UpdatePanel1">
                              <ProgressTemplate>
                                  <table border="0" id="table1">
                                        <tr>
                                            <td style="width: 269px">
                                                查询中，请稍候。
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 269px">
                                                <img alt="" src="wait.gif" />
                                            </td>
                                        </tr>
                                    </table>
                              </ProgressTemplate>
                          </asp:UpdateProgress>
                <br /><asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="true" Text="全选" Width="54px" OnCheckedChanged="chkSelectAll_CheckedChanged" />
                <asp:HyperLink ID="HyperLinkAdd" runat="server" ImageUrl="~/Images/添加}.gif" 
                              NavigateUrl="~/Web/UserAdd.aspx">HyperLink</asp:HyperLink>
                   <asp:ImageButton ID="ImageButtonResetPassword" runat="server" 
                              ImageUrl="~/Images/重密码.gif" OnClick="ImageButtonResetPassword_Click">
                  
                 </asp:ImageButton>&nbsp;<asp:ImageButton ID="ImageButtonDelete" runat="server" 
                              ImageUrl="~/Images/删除}.gif" OnClick="ImageButtonDelete_Click"></asp:ImageButton>
                                  
              
            </td>
        </tr>
       
    </table>  
      </form>  
</body>
</html>
