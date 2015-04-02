<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RoleManage.aspx.cs" Inherits="Web_RoleManage" StylesheetTheme="MRSOFTASPNET" %>

<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>权限管理</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
    <%--<link href="../CSS/CSS.css" rel="stylesheet" type="text/css" /> --%>    
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
           
                                      <h4>&gt;&gt;权限管理</h4>  
                                        <hr/>
                       <asp:GridView ID="GV" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="12"
                                            OnPageIndexChanging="GV_PageIndexChanging" 
                                          OnRowDataBound="GV_RowDataBound" Font-Size="13px" Width="100%" SkinID="gvSkin">
                           <Columns>
                             <asp:BoundField DataField="RoleId" HeaderText="编号" />
                             <asp:BoundField DataField="RoleName" HeaderText="角色" />
                                              <asp:TemplateField HeaderText="教师系别管理">
                                               <ItemTemplate>
                                                <asp:CheckBox ID="chkDepartmentManage" Visible="True" runat="server"></asp:CheckBox></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="用户信息管理">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkUserManage" Visible="True" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>                                                
                                                <asp:TemplateField HeaderText="考试科目管理">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkCourseManage" Visible="True" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="试卷定制维护">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkPaperSetup" Visible="True" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="用户试卷管理">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkUserPaperList" Visible="True" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="试卷题型管理">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkTypeManage" Visible="True" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                    </Columns>
                </asp:GridView>
                                      <asp:ImageButton ID="ImageButtonGiant" runat="server" ImageUrl="~/Images/授权}.gif" 
                                              OnClick="ImageButtonGiant_Click"></asp:ImageButton>
                                      <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" 
                                          Text="注意：管理员权限请不要随意改动！否则相应的功能将不能进行管理！"></asp:Label>
                <br /><p align="center">&nbsp;</p>
                      
            </td>
        </tr>
    </table>  
      </form>  
</body>
</html>