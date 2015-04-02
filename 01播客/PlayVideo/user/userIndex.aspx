<%@ Page Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="userIndex.aspx.cs" Inherits="user_userIndex" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
   
   <table width="500" border="0" cellspacing="0" cellpadding="0" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
      <tr>
        <td height="36" align="left" valign="middle" background="../images/glsc1_05.jpg" class="b" style="width: 553px">　　　<span class="hongcu">我上传的视频</span></td>
      </tr>
      <tr>
        <td  valign="top"height="288" style="width: 553px">
            <asp:GridView ID="gvVideo" runat="server" AutoGenerateColumns="False" Width="493px" AllowPaging="True" OnPageIndexChanging="gvVideo_PageIndexChanging" OnRowDeleting="gvVideo_RowDeleting" OnSelectedIndexChanging="gvVideo_SelectedIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="视频名称">
                        <ItemTemplate>
                            <a  target="_blank" href='../play.aspx?id=<%#Eval("id") %>' title='<%#Eval("videoTitle") %>' >  <%#Eval("videoTitle") %>  </a>
                        </ItemTemplate>
                        <ControlStyle Font-Underline="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="视频类型" DataField="videoType" />
                    <asp:BoundField HeaderText="发布日期" DataField="videoDate" />
                    <asp:BoundField HeaderText="人气" DataField="playSum" />
                    <asp:CommandField HeaderText="修改信息" ShowSelectButton="True">
                        <ControlStyle Font-Underline="False" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                        <ControlStyle Font-Underline="False" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <br />
    
    </td> 
      </tr>
      <tr>
        <td height="22" align="center" style="width: 553px" ></td>
      </tr>
      <tr>
        <td height="4" style="width: 553px"></td>
      </tr>
      
      
    </table>
  
   

 
</asp:Content>

