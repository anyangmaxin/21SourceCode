<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLeibie.aspx.cs" Inherits="AdminLeibie_AdminLeibie" Title="Untitled Page" StylesheetTheme="MRSOFTASPNET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: right">
        &nbsp;</div>
    <table align="center" cellpadding="0" cellspacing="0" style="font-size: 9pt; background-image: url(../image/后台页.jpg);
        width: 529px; height: 334px">
        <tr>
            <td align="center" colspan="3" style="height: 24px; text-align: center">
                    产品类别管理</td>
        </tr>
        <tr>
            <td align="right" colspan="3" style="text-align: center">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:LinkButton ID="LinBtnADD" runat="server" Font-Size="9pt" OnClick="LinBtnADD_Click" ForeColor="Red">添加类别>></asp:LinkButton></td>
        </tr>
        <tr>
            <td colspan="3" style="vertical-align: top; height: 174px; text-align: center">
                <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Font-Size="9pt" Height="133px" Width="502px" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="6" SkinID="gvSkin" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="类别编号" />
                            <asp:BoundField DataField="name" HeaderText="类别名称" />
                            <asp:BoundField DataField="ADDTime" HeaderText="添加时间" />
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="AdminLeibie_Update.aspx?id={0}"
                                HeaderImageUrl="~/image/xiugai.jpg" Text="修改" />
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="AdminLeibie_Delete.aspx?id={0}"
                                HeaderImageUrl="~/image/shanchu.jpg" Text="删除" />
                        </Columns>
                    </asp:GridView>
                &nbsp; &nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>

