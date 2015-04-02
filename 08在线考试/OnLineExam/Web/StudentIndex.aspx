<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentIndex.aspx.cs" Inherits="Web_StudentIndex" StylesheetTheme="MRSOFTASPNET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>在线考试系统</title>  
    <script src="../Controls/javascript/js_MouthTime.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
function deal(){
window.opener=null;
window.close();
window.open('UserTest.aspx','','width=580,height=510');
}
</script>
</head>
<body style="margin: 0px" onload="showTime();">
  <form id="Form1" method="post" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
      
    <tr>
      <td style="height:4px;" colspan="3">
            <img src="../Images/top-01.jpg"style="border: 0px; left: 0px; position: relative; top: 0px;" title="" width ="100%" />
         </td>
    </tr>
        <tr style="background: url(../Images/lineS.jpg) repeat-x;">
            <td style="height:25;" colspan="3">
                &nbsp;&nbsp;&nbsp;欢迎您：<asp:Label ID="labUser" runat="server" Text="Label" Width="70px"></asp:Label>&nbsp;&nbsp;姓名：<asp:Label ID="lblName" runat="server" Text="Label" Width="70px"></asp:Label>
                                <script type="text/javascript">getDate();</script>
                <span id="ShowTime"></span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:LinkButton ID="exit" runat="server" CausesValidation="false" 
                    OnClick="exit_Click" style="font-size: small" >退出系统</asp:LinkButton></td>         
        </tr>


          <tr>
              <td align="left" colspan="3" valign="top">
            
           
                       <table cellpadding="0" cellspacing="0" border="1"  bordercolor="#cccccc" style="border-collapse:collapse" width="100%" frame="below">
               
               <tr>
                    <td bgcolor="#EDF1F6" style="text-align:right;width:100%;" colspan="2"> <div class="title" align="left"><h4>
                        考试：</h4></div></td>                    
                </tr>
                <tr>
                    <td bgcolor="#EDF1F6" style="text-align:right;">
                        考试试题：</td>
                    <td ><div align="left"><asp:DropDownList id="ddlPaper" runat="server" Width="127px"></asp:DropDownList>
                     <asp:Label ID="lblMessage" runat="server" ForeColor=red></asp:Label>
                       </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;" colspan="2">
                       <div align="center"><br /><a href="javasricpt:location.replace('UserTest.aspx')">
                           <asp:ImageButton ID="ImgStartExam" runat="server" Height="21px" 
                               ImageUrl="~/Images/kcks_03.jpg" onclick="ImgStartExam_Click" Width="85px" 
                               CausesValidation="False" />
                           </a></div></td>
                </tr>
                <tr>
                    <td bgcolor="#EDF1F6" style="text-align:right;width:100%;" colspan="2"> <div class="title" align="left"><h4>修改密码
                                           </h4></div></td>                    
                </tr>
                <tr>
                    <td bgcolor="#EDF1F6" style="text-align:right;">原密码：</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtOldPwd" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPwd" ErrorMessage="不能为空！"></asp:RequiredFieldValidator></div>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#EDF1F6" style="text-align:right;">新密码：</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtNewPwd" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPwd"
                                ErrorMessage="不能为空！"></asp:RequiredFieldValidator></div></td>
                </tr>
                <tr>
                    <td bgcolor="#EDF1F6" style="text-align:right;">确认密码：</td>
                    <td >&nbsp;<div align="left"><asp:TextBox id="txtConfirmPwd"  runat="server" MaxLength="20" TextMode=password Width="168px"></asp:TextBox>
                       <asp:CompareValidator id="cpv_newpassword" runat="server" ErrorMessage="确认密码不一致" ControlToValidate="txtConfirmPwd" ControlToCompare="txtNewPwd"></asp:CompareValidator></div></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td >&nbsp; <asp:Label ID="lblPwd" runat="server" ForeColor=red></asp:Label><br />
                       <asp:ImageButton ID="imgBtnModifyPwd" runat="server" ImageUrl="../Images/Update.GIF" OnClick="imgBtnModifyPwd_Click1"/>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					   <asp:ImageButton ID="imgBtnReset" runat="server" CausesValidation="false" ImageUrl="../Images/RESET.GIF" OnClick="imgBtnReset_Click"  /></td>
                </tr>
                 <tr>
                    <td bgcolor="#EDF1F6" style="text-align:right;width:100%;" colspan="2"> <div class="title" align="left"><h4>
                        考试记录：<asp:Label ID="lblScore" runat="server" Text="" Width="126px"></asp:Label></h4></div></td>                    
                </tr>
                <tr>
                    <td  style="text-align:right;" colspan="2">
                        <div align="left">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                OnRowDataBound="GridView1_RowDataBound" 
                                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="8" 
                                AutoGenerateColumns="False" DataKeyNames="ID" Font-Size="13px" Width="100%" 
                                SkinID="gvSkin">
                    <Columns>                       
                        <asp:TemplateField HeaderText="成绩编号" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server"><%# Eval("ID") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="姓名">                               
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"><%# Eval("UserName") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="试卷">                                
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server"><%# Eval("PaperName") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
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
                            <asp:BoundField DataField="JudgeTime" HeaderText="评卷时间" />                     
                            <asp:BoundField DataField="PingYu" HeaderText="评语" />
                    </Columns>
                </asp:GridView>
                       </div>
                        </td>
                </tr>
            </table>         
              </td>
        </tr>
    </table>  
      </form>  
</body>
</html>