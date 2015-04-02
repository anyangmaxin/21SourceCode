<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Default2" Title="无标题页" Theme="tm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="right_01"></div>
<div id="right_02">
<div align="center">
<asp:UpdatePanel ID="upCategory" runat="server">
    <ContentTemplate>
        <table width="500" border="0" cellpadding="2" cellspacing="1">
            <tr>
                <td height="50"></td>
                <td height="50">&nbsp;</td>
            </tr>
            <tr>
                <td width="15%" align="right" valign="middle" 
                    style="height: 30px; text-align: left;">
                    分类名称：</td>
                <td align="left" valign="middle" style="height: 30px; text-align: left;">
                    <asp:TextBox ID="tbName" SkinID="tbSkin" runat="server" Width="260px" 
        MaxLength="50" Height="20px"></asp:TextBox>                    
                    <cc1:TextBoxWatermarkExtender ID="tbWExd" runat="server"
       TargetControlID="tbName" WatermarkText="请输入分类名称" 
        WatermarkCssClass="Watermark">
                    </cc1:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="rfName" runat="server" 
        ControlToValidate="tbName" Display="None" ErrorMessage="分类名称不能为空"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="VCExd" runat="server"
       TargetControlID="rfName" HighlightCssClass="Validator">
                    </cc1:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td width="15%" height="30" align="right" valign="middle" 
                    style="text-align: left">
                    分类状态：</td>
                <td height="30" align="left" valign="middle" style="text-align: left">
                    <asp:DropDownList ID="ddlStatus" runat="server" Width="80px" SkinID="ddlSkin">
                        <asp:ListItem Value="公开">公开</asp:ListItem>
                        <asp:ListItem Value="私有">私有</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="259px" align="center" valign="bottom" colspan="2">
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="imgBtn_sure" runat="server" ImageUrl="~/images/an_16.gif" 
                        onclick="imgBtn_sure_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="imgBtn_reset" runat="server" CausesValidation="False" 
                        ImageUrl="~/images/an_14.gif" onclick="imgBtn_reset_Click" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

