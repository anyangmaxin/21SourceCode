<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAdd.aspx.cs" Inherits="Web_UserAdd" StylesheetTheme="MRSOFTASPNET" %>
<%@ Register Src="../Controls/lefttree.ascx" TagName="lefttree" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>用户添加</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
    <%--<link href="../CSS/CSS.css" rel="stylesheet" type="text/css" /> --%>    
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
                &nbsp;&nbsp;&nbsp;欢迎您：<asp:Label ID="labUser" runat="server" Text="Label" Width="70px"></asp:Label>&nbsp;&nbsp;
                                <script type="text/javascript">getDate();</script>

                <span id="ShowTime"></span></td>         
        </tr>


          <tr>
            <td  style="width: 120px" align="center" valign="top" >
                <uc1:lefttree ID="Lefttree1" runat="server" />
           </td>          
              <td  style="width: 4px;  background: url(../Images/line.gif) repeat-y;"> 
            </td>   
            <td  valign="top" align="left" width="960px">
            
           
                       <table cellpadding="0" cellspacing="0" border="1"  bordercolor="#cccccc" style="border-collapse:collapse" width="100%" frame="below">
               <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;width:100%;" colspan="2"> <div class="title" align="left"><h4>添加用户</h4></div></td>                    
                </tr>
                <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">
                        编号或用户名：</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtUserID"  runat="server" MaxLength="20"></asp:TextBox>                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="标注：此处如果添加的用户为考生则为编号即考生考试号；教师或管理员则为用户名"></asp:Label></div>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">
                        真实姓名：</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtUserName" runat="server" MaxLength="20"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName"
                                ErrorMessage="不能为空！"></asp:RequiredFieldValidator></div></td>
                </tr>
                <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">密码：</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtUserPwd"  runat="server" MaxLength="20" TextMode=password Width="149px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserPwd"
                            ErrorMessage="不能为空！"></asp:RequiredFieldValidator></div></td>
                </tr>
                 <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">
                        &nbsp;系别：</td>
                    <td >&nbsp;<div align="left"><asp:DropDownList id="ddlDepartment" runat="server" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentId" Width="83px"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mrOnLineExamConnectionString %>"
                                SelectCommand="SELECT * FROM [Departmentmr]" 
                            ConflictDetection="CompareAllValues" 
                            DeleteCommand="DELETE FROM [Departmentmr] WHERE [DepartmentId] = @original_DepartmentId AND [DepartmentName] = @original_DepartmentName" 
                            InsertCommand="INSERT INTO [Departmentmr] ([DepartmentId], [DepartmentName]) VALUES (@DepartmentId, @DepartmentName)" 
                            OldValuesParameterFormatString="original_{0}" 
                            UpdateCommand="UPDATE [Departmentmr] SET [DepartmentName] = @DepartmentName WHERE [DepartmentId] = @original_DepartmentId AND [DepartmentName] = @original_DepartmentName">
                        <DeleteParameters>
                            <asp:Parameter Name="original_DepartmentId" Type="Int32" />
                            <asp:Parameter Name="original_DepartmentName" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DepartmentName" Type="String" />
                            <asp:Parameter Name="original_DepartmentId" Type="Int32" />
                            <asp:Parameter Name="original_DepartmentName" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DepartmentId" Type="Int32" />
                            <asp:Parameter Name="DepartmentName" Type="String" />
                        </InsertParameters>
                        </asp:SqlDataSource></div></td>
                </tr>
                 <tr>
                    <td bgcolor="#f6dda4" style="text-align:right;">角色：</td>
                    <td >&nbsp;<div align="left"><asp:DropDownList id="ddlRole" runat="server" DataSourceID="SqlDataSource2" DataTextField="RoleName" DataValueField="RoleId"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mrOnLineExamConnectionString2 %>"
                                SelectCommand="SELECT * FROM [Rolemr]" 
                            ConflictDetection="CompareAllValues" 
                            DeleteCommand="DELETE FROM [Rolemr] WHERE [RoleId] = @original_RoleId AND [RoleName] = @original_RoleName AND [HasDuty_DepartmentManage] = @original_HasDuty_DepartmentManage AND [HasDuty_UserManage] = @original_HasDuty_UserManage AND [HasDuty_RoleManage] = @original_HasDuty_RoleManage AND [HasDuty_Role] = @original_HasDuty_Role AND [HasDuty_CourseManage] = @original_HasDuty_CourseManage AND [HasDuty_PaperSetup] = @original_HasDuty_PaperSetup AND [HasDuty_PaperLists] = @original_HasDuty_PaperLists AND [HasDuty_UserPaperList] = @original_HasDuty_UserPaperList AND [HasDuty_UserScore] = @original_HasDuty_UserScore AND [HasDuty_SingleSelectManage] = @original_HasDuty_SingleSelectManage AND [HasDuty_MultiSelectManage] = @original_HasDuty_MultiSelectManage AND [HasDuty_FillBlankManage] = @original_HasDuty_FillBlankManage AND [HasDuty_JudgeManage] = @original_HasDuty_JudgeManage AND [HasDuty_QuestionManage] = @original_HasDuty_QuestionManage" 
                            InsertCommand="INSERT INTO [Rolemr] ([RoleName], [HasDuty_DepartmentManage], [HasDuty_UserManage], [HasDuty_RoleManage], [HasDuty_Role], [HasDuty_CourseManage], [HasDuty_PaperSetup], [HasDuty_PaperLists], [HasDuty_UserPaperList], [HasDuty_UserScore], [HasDuty_SingleSelectManage], [HasDuty_MultiSelectManage], [HasDuty_FillBlankManage], [HasDuty_JudgeManage], [HasDuty_QuestionManage]) VALUES (@RoleName, @HasDuty_DepartmentManage, @HasDuty_UserManage, @HasDuty_RoleManage, @HasDuty_Role, @HasDuty_CourseManage, @HasDuty_PaperSetup, @HasDuty_PaperLists, @HasDuty_UserPaperList, @HasDuty_UserScore, @HasDuty_SingleSelectManage, @HasDuty_MultiSelectManage, @HasDuty_FillBlankManage, @HasDuty_JudgeManage, @HasDuty_QuestionManage)" 
                            OldValuesParameterFormatString="original_{0}" 
                            UpdateCommand="UPDATE [Rolemr] SET [RoleName] = @RoleName, [HasDuty_DepartmentManage] = @HasDuty_DepartmentManage, [HasDuty_UserManage] = @HasDuty_UserManage, [HasDuty_RoleManage] = @HasDuty_RoleManage, [HasDuty_Role] = @HasDuty_Role, [HasDuty_CourseManage] = @HasDuty_CourseManage, [HasDuty_PaperSetup] = @HasDuty_PaperSetup, [HasDuty_PaperLists] = @HasDuty_PaperLists, [HasDuty_UserPaperList] = @HasDuty_UserPaperList, [HasDuty_UserScore] = @HasDuty_UserScore, [HasDuty_SingleSelectManage] = @HasDuty_SingleSelectManage, [HasDuty_MultiSelectManage] = @HasDuty_MultiSelectManage, [HasDuty_FillBlankManage] = @HasDuty_FillBlankManage, [HasDuty_JudgeManage] = @HasDuty_JudgeManage, [HasDuty_QuestionManage] = @HasDuty_QuestionManage WHERE [RoleId] = @original_RoleId AND [RoleName] = @original_RoleName AND [HasDuty_DepartmentManage] = @original_HasDuty_DepartmentManage AND [HasDuty_UserManage] = @original_HasDuty_UserManage AND [HasDuty_RoleManage] = @original_HasDuty_RoleManage AND [HasDuty_Role] = @original_HasDuty_Role AND [HasDuty_CourseManage] = @original_HasDuty_CourseManage AND [HasDuty_PaperSetup] = @original_HasDuty_PaperSetup AND [HasDuty_PaperLists] = @original_HasDuty_PaperLists AND [HasDuty_UserPaperList] = @original_HasDuty_UserPaperList AND [HasDuty_UserScore] = @original_HasDuty_UserScore AND [HasDuty_SingleSelectManage] = @original_HasDuty_SingleSelectManage AND [HasDuty_MultiSelectManage] = @original_HasDuty_MultiSelectManage AND [HasDuty_FillBlankManage] = @original_HasDuty_FillBlankManage AND [HasDuty_JudgeManage] = @original_HasDuty_JudgeManage AND [HasDuty_QuestionManage] = @original_HasDuty_QuestionManage">
                        <DeleteParameters>
                            <asp:Parameter Name="original_RoleId" Type="Int32" />
                            <asp:Parameter Name="original_RoleName" Type="String" />
                            <asp:Parameter Name="original_HasDuty_DepartmentManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_UserManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_RoleManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_Role" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_CourseManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_PaperSetup" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_PaperLists" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_UserPaperList" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_UserScore" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_SingleSelectManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_MultiSelectManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_FillBlankManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_JudgeManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_QuestionManage" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="RoleName" Type="String" />
                            <asp:Parameter Name="HasDuty_DepartmentManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_UserManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_RoleManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_Role" Type="Int32" />
                            <asp:Parameter Name="HasDuty_CourseManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_PaperSetup" Type="Int32" />
                            <asp:Parameter Name="HasDuty_PaperLists" Type="Int32" />
                            <asp:Parameter Name="HasDuty_UserPaperList" Type="Int32" />
                            <asp:Parameter Name="HasDuty_UserScore" Type="Int32" />
                            <asp:Parameter Name="HasDuty_SingleSelectManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_MultiSelectManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_FillBlankManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_JudgeManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_QuestionManage" Type="Int32" />
                            <asp:Parameter Name="original_RoleId" Type="Int32" />
                            <asp:Parameter Name="original_RoleName" Type="String" />
                            <asp:Parameter Name="original_HasDuty_DepartmentManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_UserManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_RoleManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_Role" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_CourseManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_PaperSetup" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_PaperLists" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_UserPaperList" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_UserScore" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_SingleSelectManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_MultiSelectManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_FillBlankManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_JudgeManage" Type="Int32" />
                            <asp:Parameter Name="original_HasDuty_QuestionManage" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="RoleName" Type="String" />
                            <asp:Parameter Name="HasDuty_DepartmentManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_UserManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_RoleManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_Role" Type="Int32" />
                            <asp:Parameter Name="HasDuty_CourseManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_PaperSetup" Type="Int32" />
                            <asp:Parameter Name="HasDuty_PaperLists" Type="Int32" />
                            <asp:Parameter Name="HasDuty_UserPaperList" Type="Int32" />
                            <asp:Parameter Name="HasDuty_UserScore" Type="Int32" />
                            <asp:Parameter Name="HasDuty_SingleSelectManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_MultiSelectManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_FillBlankManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_JudgeManage" Type="Int32" />
                            <asp:Parameter Name="HasDuty_QuestionManage" Type="Int32" />
                        </InsertParameters>
                        </asp:SqlDataSource></div></td>
                </tr>
                <tr>
                    <td></td>
                    <td >&nbsp; <asp:Label ID="lblMessage" runat="server" ForeColor=red></asp:Label><br />
                       <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="../Images/Save.GIF" OnClick="imgBtnSave_Click" />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					   <asp:ImageButton ID="imgBtnReturn" runat="server" CausesValidation="false" ImageUrl="../Images/Return.GIF" OnClick="imgBtnReturn_Click" /></td>
                </tr>
            </table>         
              
            </td>
        </tr>
    </table>  
      </form>  
</body>
</html>
