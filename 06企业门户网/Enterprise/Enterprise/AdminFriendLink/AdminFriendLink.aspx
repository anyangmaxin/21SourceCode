<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminFriendLink.aspx.cs" Inherits="AdminFriendLink" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        &nbsp;</div>
    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt;
        width: 529px; height: 334px; background-color: #ddf1f8;">
        <tr>
            <td align="center" colspan="3" style="height: 24px; text-align: center">
                友情链接管理</td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: right">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span
                    style="color: #ff3333; "><a href="AdminFriendLink_AddImage.aspx"></a></span>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" Width="110px" OnClick="LinkButton1_Click" ForeColor="Red">添加友情链接>></asp:LinkButton>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size: 10pt; color: #0000ff;
                    text-decoration: underline"></span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3" style="vertical-align: top; height: 181px; text-align: center">
                <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Font-Size="9pt" PageSize="4" Width="513px" OnPageIndexChanging="GridView1_PageIndexChanging1" SkinID="gvSkin" ForeColor="Red">
                        <Columns>
                            <asp:ImageField DataImageUrlField="LinkImage" HeaderText="链接图片">
                            </asp:ImageField>
                            <asp:BoundField DataField="LinkAddress" HeaderText="链接地址" />
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="../AdminFriendLink/AdminFriendLink_Update.aspx?id={0}" HeaderImageUrl="~/image/xiugai.jpg" Text="修改" />
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="../AdminFriendLink/AdminFriendLink_Delete.aspx?id={0}" HeaderImageUrl="~/image/shanchu.jpg" Text="删除" />
                        </Columns>
                    </asp:GridView>
                &nbsp; &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

