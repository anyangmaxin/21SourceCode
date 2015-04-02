<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminGongGao.aspx.cs" Inherits="AdminOpration_AdminGongGao" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; background-image: url(../image/后台页.jpg);
        width: 529px; height: 334px">
        <tr>
            <td align="center" colspan="3" style="height: 24px; text-align: center">
                公告管理</td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="text-align: center">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click" ForeColor="Red">添加公告>></asp:LinkButton>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3" style="vertical-align: top; height: 174px; text-align: center">
                <br />
                    <asp:GridView ID="GvGongGao" runat="server" AutoGenerateColumns="False"
                        Font-Size="9pt" Width="489px" AllowPaging="True" OnPageIndexChanging="GvGongGao_PageIndexChanging" PageSize="5" SkinID="gvSkin" OnRowDataBound="GvGongGao_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="公告编号" />
                            <asp:BoundField DataField="title" HeaderText="公告标题" />
                            <asp:BoundField DataField="GTime" HeaderText="发表时间" />
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="AdminGongGao_Update.aspx?id={0}"
                                HeaderImageUrl="~/image/xiugai.jpg" Text="修改" />
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="AdminGongGao_Delete.aspx?id={0}"
                                HeaderImageUrl="~/image/shanchu.jpg" HeaderText="删除" Text="删除" />
                        </Columns>
                    </asp:GridView>
                &nbsp;&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

