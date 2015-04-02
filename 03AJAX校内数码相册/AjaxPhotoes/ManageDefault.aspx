<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageDefault.aspx.cs" Inherits="_Default" Title="无标题页"  Theme="tm"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <br/>    
    <asp:UpdatePanel ID="upView" runat="server">
        <ContentTemplate>  
            <div id="divFlag" style="width:100%; display:none" runat="server">
                <asp:HyperLink ID="hlk_Flag01" runat="server"></asp:HyperLink>
                <br />
                <br />
                <asp:Label ID="lbFlag" runat="server" Text="或"></asp:Label>
                <br />
                <br />
                <asp:HyperLink ID="hlk_Flag02" runat="server"></asp:HyperLink>
            </div>         
            <div style=" width:100%; height:375px;">
                
                <asp:ListView ID="lvCategory" GroupItemCount="3" runat="server">
                    <LayoutTemplate>
                        <div align="center" style="width:600px; height:375px;">
                            <div ID="groupPlaceholder" runat="server">
                            </div>
                        </div>  
                    </LayoutTemplate>
                    <GroupTemplate>
                        <div style="width:100%">                    
                            <div ID="itemPlaceholder" runat="server">
                            </div>                    
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div style="width:200px; height:180px; float:left">
                        <div style="width:160px; height:125px; float:left; background-image:url(images/001_06.gif);">  
                            <div class="div_padding"></div>    
                            <a href='Photo_list.aspx?CategoryID=<%# Eval("ID") %>&CategoryName=<%# Eval("C_Name") %>'><img alt='<%# Eval("C_Name")%>' src='UpSmall/<%# Eval("url") %>' style="border-width:0px" width="133px" height="100px" /></a>
                            <br/>  
                            <br/>                      
                            <a href='Photo_list.aspx?CategoryID=<%# Eval("ID")%>&CategoryName=<%# Eval("C_Name") %>'><%# Eval("C_Name").ToString().Length > 5 ? Eval("C_Name").ToString().Substring(0, 5) + "..." : Eval("C_Name")%>(共<%# Eval("p_num")%>张)</a>
                        </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <asp:DataPager ID="dpCategory" runat="server" PagedControlID="lvCategory" 
                PageSize="6">
                <Fields>
                    <asp:NextPreviousPagerField FirstPageImageUrl="~/images/an_06.gif" 
                        PreviousPageImageUrl="~/images/an_08.gif" ShowFirstPageButton="True" 
                        ShowNextPageButton="False" ButtonType="Image" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField LastPageImageUrl="~/images/an_12.gif" 
                        NextPageImageUrl="~/images/an_10.gif" ShowLastPageButton="True" 
                        ShowPreviousPageButton="False" ButtonType="Image" />
                </Fields>
            </asp:DataPager>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>

