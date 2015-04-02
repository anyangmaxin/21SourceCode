<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminUser.aspx.cs" Inherits="AdminUser_AdminUser" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; background-image: url(../image/后台页.jpg);
        width: 529px; height: 334px">
        <tr>
            <td align="center" colspan="3" style="height: 24px; text-align: center">
                    用户管理</td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center">
                &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:LinkButton ID="LinBtnAdd" runat="server" Font-Size="9pt" Height="21px" OnClick="LinBtnAdd_Click" ForeColor="Red" >添加新用户>></asp:LinkButton></td>
        </tr>
        <tr>
            <td colspan="3" style="vertical-align: top; height: 181px; text-align: center">
                <br />
                    <asp:GridView ID="GridUser" runat="server" AutoGenerateColumns="False"
                        Font-Size="9pt" Width="431px" PageSize="8" AllowPaging="True" OnPageIndexChanging="GridUser_PageIndexChanging" SkinID="gvSkin1">
                        <Columns>
                            <asp:BoundField DataField="UserId" HeaderText="编号" />
                            <asp:BoundField DataField="UserName" HeaderText="用户名" />
                            <asp:BoundField DataField="sex" HeaderText="性别" />
                            <asp:HyperLinkField DataNavigateUrlFields="Image" DataNavigateUrlFormatString="{0}"
                                DataTextField="Image" HeaderText="头像预览" />
                            <asp:HyperLinkField DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="AdminUser_Update.aspx?UserId={0}"
                                HeaderImageUrl="~/image/xiugai.jpg" Text="修改" />
                            <asp:HyperLinkField DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="AdminUser_Delete.aspx?UserId={0}"
                                HeaderImageUrl="~/image/shanchu.jpg" Text="删除" />
                        </Columns>
                    </asp:GridView>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

