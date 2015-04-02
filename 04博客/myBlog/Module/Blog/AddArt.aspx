<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddArt.aspx.cs" Inherits="Module_Blog_AddArt" ValidateRequest="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加文章</title>
        <link href="../../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 75px;
        }
        .style2
        {
            height: 24px;
            width: 75px;
        }
    </style>
</head>
<body style="margin-top: 0px; padding-top: 0px">
    <form id="form1" runat="server">
    <div style="text-align: left">
        <table style="width: 550px" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td colspan="3" rowspan="2" style="vertical-align: middle; text-align: center; height: 468px;">
                    <table style="width: 542px" cellspacing="0" class="0">
                        <tr>
                            <td style="text-align: right" class="style1">
                                <span style="font-size: 9pt">标题:</span></td>
                            <td colspan="2" style="width: 368px; text-align: left">
                                <asp:TextBox ID="txtSubject" runat="server" Font-Size="9pt" Width="290px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
                                    ErrorMessage="标题不能为空">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="text-align: right" class="style1">
                                <span style="font-size: 9pt">作者:</span></td>
                            <td colspan="2" style="width: 368px; text-align: left">
                                <asp:TextBox ID="TextBox2" runat="server" Font-Size="9pt" Width="287px" 
                                    ReadOnly="True" Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                           <td style="text-align: right; " class="style2">
                                类别:</td>
                            <td colspan="2" style="width: 368px; text-align: left; height: 24px;">
                                <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="9pt">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="text-align: right" class="style1" align="left">
                                摘要:</td>
                            <td colspan="2" style="width: 368px; height: 14px; text-align: left">
                                <asp:TextBox ID="TextBox1" runat="server" Height="114px" TextMode="MultiLine" 
                                    Width="495px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="text-align: right" class="style1">
                                <span style="font-size: 9pt">内容:</span></td>
                            <td colspan="2" style="width: 368px; height: 26px">
                                    <FTB:FreeTextBox id="article_context" runat="Server" Language="zh-cn"  SupportFolder="../../aspnet_client/FreeTextBox/" Width="495" height="204" HtmlModeDefaultsToMonoSpaceFont="True" DownLevelCols="50" DownLevelRows="10" ButtonDownImage="False" GutterBackColor="LightSteelBlue" ToolbarBackgroundImage="True" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print" ToolbarStyleConfiguration="NotSet" />
            
                                    </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:CheckBox ID="CheckBox1" runat="server" Font-Size="11pt" OnCheckedChanged="CheckBox1_CheckedChanged"
                                    Text="推荐" Width="77px" style="font-size: small" Height="18px" /></td>
                            <td colspan="2" style="width: 368px; height: 24px;">
                                &nbsp;<asp:Button ID="btnAdd" CssClass="ButtonCss" runat="server" Font-Size="9pt" OnClick="btnAdd_Click" Text="添加" Width="44px" />
                                <asp:Button ID="Button1"  CssClass="ButtonCss" runat="server" Font-Size="9pt" 
                                    OnClick="Button1_Click" Text="重置" Width="41px" CausesValidation="False" />
                                <asp:Button ID="btnCancle" CssClass="ButtonCss" runat="server" Font-Size="9pt" Text="返回" OnClick="btnCancle_Click" CausesValidation="False" Width="47px" /></td>
                        </tr>
                    </table>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="9pt" ShowMessageBox="True" />
                </td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
