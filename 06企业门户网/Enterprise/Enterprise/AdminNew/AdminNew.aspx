<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminNew.aspx.cs" Inherits="AdminNew" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; background-image: url(../image/后台页.jpg);
        width: 529px; height: 334px">
        <tr>
            <td align="center" colspan="3" style="height: 24px; text-align: center">
                新闻管理</td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click" ForeColor="Red">添加新闻>></asp:LinkButton>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3" style="vertical-align: top; height: 181px; text-align: center">
                <br />
                &nbsp;<asp:GridView ID="GvNew" runat="server" AllowPaging="True" AutoGenerateColumns="False" Font-Size="9pt" PageSize="5"
                        Width="499px" OnPageIndexChanging="GvNew_PageIndexChanging" SkinID="gvSkin1" OnRowDataBound="GvNew_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="编号" />
                            <asp:BoundField DataField="title" HeaderText="标题" />
                            <asp:BoundField DataField="PublishTime" HeaderText="发布时间" />
                            <asp:BoundField DataField="PublishPerson" HeaderText="发布人" />
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="AdminNew_update.aspx?id={0}"
                                HeaderImageUrl="~/image/xiugai.jpg" Text="修改" />
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="AdminNew_Delete.aspx?id={0}"
                                HeaderImageUrl="~/image/shanchu.jpg" Text="删除" />
                        </Columns>
                    </asp:GridView>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
</asp:Content>

