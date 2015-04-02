<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" Title="无标题页" Theme="tm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="right_01_gl">
    </div>
<div id="right_02_gl">
   <div align="center">
        <asp:UpdatePanel ID="upManager" runat="server">
            <ContentTemplate>
                 分页导航：<asp:Label ID="labCurrentPage" runat="server"></asp:Label>
                 /
                 <asp:Label ID="labPageCount" runat="server"></asp:Label>
                <asp:LinkButton ID="lnkbtnFirst" runat="server" Font-Underline="False" 
                    onclick="lnkbtnFirst_Click">首页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" 
                    onclick="lnkbtnUp_Click">上一页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnDown" runat="server" Font-Underline="False" 
                    onclick="lnkbtnDown_Click">下一页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnBottom" runat="server" Font-Underline="False" 
                    onclick="lnkbtnBottom_Click">尾页</asp:LinkButton>
                <asp:GridView ID="gvCategory" runat="server" 
            AutoGenerateColumns="False" Width="90%" 
            onrowupdating="gvCategory_RowUpdating" 
            onrowediting="gvCategory_RowEditing" 
            onrowcancelingedit="gvCategory_RowCancelingEdit" DataKeyNames="ID"
            onrowdeleting="gvCategory_RowDeleting" 
            onrowdatabound="gvCategory_RowDataBound" PageSize="6" Height="360px" 
                    ShowFooter="True" AllowPaging="True">
                    <PagerSettings FirstPageImageUrl="~/images/an_06.gif" 
                        LastPageImageUrl="~/images/an_12.gif" NextPageImageUrl="~/images/an_10.gif" 
                        PreviousPageImageUrl="~/images/an_08.gif" FirstPageText="第一页" 
                        LastPageText="末尾页" Mode="NextPreviousFirstLast" NextPageText="下一页" 
                        PreviousPageText="上一页" />                     
                    <FooterStyle Height="130px" VerticalAlign="Bottom" />
                    <RowStyle Height="30px" />
                    <Columns>
                        <asp:TemplateField HeaderText="相册分类">
                            <ItemTemplate>
                                <a href='Photo_list.aspx?CategoryID=<%# Eval("ID") %>&CategoryName=<%# Eval("C_Name") %>'><asp:Label ID="Label1" runat="server" Text='<%# Bind("C_Name") %>'></asp:Label>
                                (<asp:Label ID="Label2" runat="server" Text='<%# Bind("pNum") %> '></asp:Label>)</a>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tbName" SkinID="tbSkin" runat="server" 
                            Text='<%# Bind("C_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle CssClass="bottomLine" />
                            <HeaderStyle CssClass="bottomLine" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="分类状态">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server" SkinID="ddlSkin" Width="80px" AutoPostBack="true">
                                    <asp:ListItem Value="公开" Selected="True">公开</asp:ListItem>
                                    <asp:ListItem Value="私有">私有</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle CssClass="bottomLine" />
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("C_Status") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="bottomLine" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="编辑">
                            <ItemTemplate>
                                <asp:ImageButton ID="modify" runat="server" 
                            ImageUrl="~/images/an_28.gif" CausesValidation="false" CommandName="Edit" />
                                &nbsp;
                                <asp:ImageButton ID="del" runat="server" 
                            ImageUrl="~/images/an_40.gif" CausesValidation="false" 
                            CommandName="Delete" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server"
                            CommandName="Update" Text="更新"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="取消"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemStyle CssClass="bottomLine" />
                            <HeaderStyle CssClass="bottomLine" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                       <asp:HyperLink ID="hlk_Flag" runat="server" NavigateUrl="~/Category.aspx">相册分类为空，单击此处创建相册分类！</asp:HyperLink>
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#D378A4" ForeColor="White" Height="24px" 
                        VerticalAlign="Middle"/>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
</asp:Content>

