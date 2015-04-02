<%@ Page Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="userIdea.aspx.cs" Inherits="user_userIdea" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
  
  
  
  
  
  
     <table width="500" border="0" cellspacing="0" cellpadding="0" style="border-right: #71add1 1px solid; border-top: #71add1 1px solid; border-left: #71add1 1px solid; border-bottom: #71add1 1px solid;">
      <tr>
        <td height="36" align="left" valign="middle" background="../images/glsc1_05.jpg" class="b" style="width: 553px">　　　<span class="hongcu" style="color: #000000">
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   视频的评论</span></td>
      </tr>
      <tr>
        <td  valign="top"height="288" style="width: 553px">
            <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
        <asp:GridView ID="gridViewName" runat="server" Height="19px" Width="491px" AutoGenerateColumns="False" OnRowDataBound="gridViewName_RowDataBound" OnSelectedIndexChanging="gridViewName_SelectedIndexChanging" AllowPaging="True" OnPageIndexChanging="gridViewName_PageIndexChanging" PageSize="2">
            <Columns>
                <asp:BoundField DataField="videoTitle" HeaderText="视频名称" >
                    <ItemStyle CssClass="huise1" />
                    <HeaderStyle CssClass="hongcu" />
                </asp:BoundField>
                <asp:BoundField DataField="videoDate" HeaderText="发布日期" >
                    <ItemStyle CssClass="huise1" />
                    <HeaderStyle CssClass="hongcu" />
                </asp:BoundField>
                <asp:BoundField HeaderText="评论人数" >
                    <ItemStyle CssClass="huise1" />
                    <HeaderStyle CssClass="hongcu" />
                </asp:BoundField>
                <asp:BoundField DataField="flower" HeaderImageUrl="~/img/flower.gif" HeaderText="顶" >
                    <ItemStyle CssClass="huise1" />
                </asp:BoundField>
                <asp:BoundField DataField="tile" HeaderImageUrl="~/img/tile.gif" HeaderText="踩" >
                    <ItemStyle CssClass="huise1" />
                </asp:BoundField>
                <asp:CommandField HeaderText="查看评论" ShowSelectButton="True" SelectText="查看" >
                    <ItemStyle Font-Underline="False" CssClass="shenhong" />
                    <ControlStyle Font-Underline="False" />
                    <HeaderStyle CssClass="hongcu" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Height="280px" Width="391px" Visible="False" ScrollBars="Vertical">
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
      <span class="shenhong"> <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" >返回</asp:LinkButton></span>  <br />
        <asp:DataList ID="DataList1" runat="server" OnDeleteCommand="DataList1_DeleteCommand" OnUpdateCommand="DataList1_UpdateCommand">
            <ItemTemplate>
                <div style="text-align: center">
                    <table border="0" cellpadding="0" cellspacing="0" style="border-right: #cccccc 1px solid;
                        border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; width: 480px;
                        border-bottom: #cccccc 1px solid; height: 129px">
                        <tr>
                            <td colspan="3" style="height: 1px; background-color: #ccccff; text-align: left" class="huise1">
                                <%#Eval("userName") %>在<%#Eval("issuanceDate") %>时发布的评论：</td>
                        </tr>
                        <tr>
                            <td class="huise1" colspan="3" style="height: 75px" align="left" valign="top"> 
                             <%#operateMethod.resumeHtml((string)Eval("Content"))%> 
                               </td>
                        </tr>
                        <tr>
                            <td style="width: 501px">
                         
                            </td>
                            <td class="shenhong" style="width: 88px">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="update" CssClass="shenhong">回复评论</asp:LinkButton></td>
                            <td class="shenhong"  style="width: 100px; text-align: right">
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CommandName="delete" CssClass="shenhong">删除评论</asp:LinkButton></td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>
        </asp:DataList></asp:Panel>
    
    </td> 
      </tr>
      <tr>
        <td height="22" align="center" style="width: 553px" ></td>
      </tr>
      <tr>
        <td height="4" style="width: 553px"></td>
      </tr>
      
      
    </table>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 
    
    <br />
</asp:Content>

