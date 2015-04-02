<%@ Page Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserRegister.aspx.cs" Inherits="UserRegister" Title="无标题页" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 889px;
        }
        .style2
        {
            height: 30px;
            width: 889px;
        }
          .textIndicator_1
    {
         background-color: Gray;
         color: White;
         font-family: 标楷体, 楷体;
         font-style: italic;
         padding: 2px 3px 2px 3px;
         font-weight: bold;
    }
    .textIndicator_2
    {
         background-color: Gray;
         color: Yellow;
         font-family: 标楷体, 楷体;
         font-style: italic;
         padding: 2px 3px 2px 3px;
         font-weight: bold;
    }
    .textIndicator_3
    {
         background-color: Gray;
         color: #FFCAAF;
         font-family: 标楷体, 楷体;
         font-style: italic;
         padding: 4px 6px 4px 6px;
         font-weight: bold;
    }
    .textIndicator_4
    {
         background-color: Gray;
         color: Aqua;
         font-family: 标楷体, 楷体;
         font-style: italic;
         padding: 4px 6px 4px 4px;
         font-weight: bold;
    }
    .textIndicator_5
    {
         background-color: Gray;
         color: #93FF9E;
         font-family: 标楷体, 楷体;
         font-style: italic;
         padding: 4px 6px 4px 6px;
         font-weight: bold;
    }

    .barborder_weak
    {
        color: Red;
        background-color: Red;
        margin-top: 16px;        
    }
    .barborder_average
    {
        color: Blue;
        background-color: Blue;
        margin-top: 16px;        
    }
    .barborder_good
    {
        color: Green;
        background-color: Green;
        margin-top: 16px;        
    }

    .barBorder
    {
        border: double;
        width: 255px;
        margin-top: 15px;
    }
        .watermark
    {
       BORDER-RIGHT: #bebebe 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #bebebe 1px solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 0px; BORDER-LEFT: #bebebe 1px solid; WIDTH: 150px; COLOR: gray; PADDING-TOP: 2px; BORDER-BOTTOM: #bebebe 1px solid; HEIGHT: 20px; BACKGROUND-COLOR: #f0f8ff
    }
            
        .style3
        {
            width: 160px;
        }
            
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="left" border="1" bordercolor="#daeeee" cellpadding="2" 
        cellspacing="0">
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="注册内容如下："></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3" height="30" valign="middle">
                用户名称：</td>
                                    <td align="left" valign="middle">
                                        <asp:TextBox ID="tbUserName" runat="server" Width="89px"></asp:TextBox>
                                        <cc1:TextBoxWatermarkExtender
                                ID="TextBoxWatermarkExtender1" runat="server" 
                                TargetControlID="tbUserName" WatermarkText="请输入用户名" WatermarkCssClass="watermark">
                            </cc1:TextBoxWatermarkExtender>
                                        <asp:ImageButton ID="imgbtnCheck" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/zhuce_12.gif" onclick="imgbtnCheck_Click" />
                                        <asp:RequiredFieldValidator ID="rfUN" runat="server" 
                                            ControlToValidate="tbUserName" Display="Dynamic" ErrorMessage="不能为空。"></asp:RequiredFieldValidator>
                                        <asp:Label ID="labIsName" runat="server" Font-Size="12px"></asp:Label>
                                        <br />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="限制只能输入由数字、字母、汉字或下划线组成的6到9位字符串"  ControlToValidate="tbUserName" ValidationExpression="[\w\u4e00-\u9fa5]{3,8}"></asp:RegularExpressionValidator>
                                        <br />
                                        用户名称 
                <asp:Label ID="labUser" runat="server" Font-Size="12px" ForeColor="#FF3300" 
                    Text="限制只能输入由数字、字母、汉字或下划线组成的6到9位字符串" Width="342px"></asp:Label>
                ！</td>
        </tr>
        <tr>
            <td align="right" class="style3" height="30" valign="middle">
                用户呢称：</td>
            <td align="left" valign="middle">
                <asp:TextBox ID="txtNickName" runat="server" Height="16px" Width="150px"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender
                                ID="TextBoxWatermarkExtender2" runat="server" 
                                TargetControlID="txtNickName" WatermarkText="请输呢称,如：小布丁" WatermarkCssClass="watermark">
                            </cc1:TextBoxWatermarkExtender>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3" height="30" valign="middle">
                &nbsp;用户密码：</td>
            <td align="left" class="style1" valign="middle">
                <asp:TextBox ID="tbPassword" runat="server" MaxLength="255" 
                    SkinID="tbSkin" TextMode="Password" Width="150px"  CssClass="watermark"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfPwd" runat="server" 
                    ControlToValidate="tbPassword" Display="Dynamic" ErrorMessage="不能为空。">*</asp:RequiredFieldValidator>
                <cc1:PasswordStrength
                        ID="PasswordStrength1" runat="server" TargetControlID="tbPassword" MinimumNumericCharacters="1" 
                        MinimumSymbolCharacters="1" 
                        PrefixText="密码强度：" 
                        TextStrengthDescriptions="很差;差;一般;好;很好" 
                        StrengthStyles="textIndicator_1;textIndicator_2;textIndicator_3;textIndicator_4;textIndicator_5">
                    </cc1:PasswordStrength>
                <br />
            </td>
        </tr>
        <tr>
            <td align="right" class="style3" height="30" valign="middle">
                确认密码：</td>
            <td align="left" class="style1" valign="middle">
                <asp:TextBox ID="tbPasswordStr" runat="server"  
                    MaxLength="255" SkinID="tbSkin" TextMode="Password" Width="150px" CssClass="watermark"></asp:TextBox>
                <asp:CompareValidator ID="cvPwd" runat="server" ControlToCompare="tbPassword" 
                    ControlToValidate="tbPasswordStr" Display="Dynamic" ErrorMessage="两次输入的密码不相同！"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3" height="30" valign="middle">
                用户性别：</td>
            <td align="left" class="style1" valign="middle">
                <asp:RadioButtonList ID="radlistSex" runat="server" Font-Size="12px" 
                    RepeatDirection="Horizontal" Width="95px">
                    <asp:ListItem Selected="True"> 男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3" height="30" valign="middle">
                电子邮件：</td>
            <td align="left" class="style1" valign="middle">
                <asp:TextBox ID="tbEmail" runat="server" CssClass="TextBox" MaxLength="255" 
                    SkinID="tbSkin" Width="294px"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender
                                ID="TextBoxWatermarkExtender3" runat="server" 
                                TargetControlID="tbEmail" WatermarkText="格式如:gulili@yeah.net" WatermarkCssClass="watermark">
                            </cc1:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="rfEmail" runat="server" 
                    ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="不能为空。">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reEmail" runat="server" 
                    ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="电子邮件格式不正确。" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3" valign="middle">
                所在城市：</td>
            <td align="left" class="style1" valign="middle">
                <asp:TextBox ID="txtCity" runat="server" Width="294px"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender
                                ID="TextBoxWatermarkExtender4" runat="server" 
                                TargetControlID="txtCity" WatermarkText="如:吉林省长春市" WatermarkCssClass="watermark">
                            </cc1:TextBoxWatermarkExtender>
            </td>
        </tr>
        <tr>
            <td align="left" valign="middle">
                <asp:Label ID="Label4" runat="server" Width="124px" Height="16px"></asp:Label>
            </td>
            <td align="left" class="style2" valign="middle">
                <asp:Label ID="Label2" runat="server" ForeColor="#CC3399" 
                    Text="温馨提示：注册成本站会员后就可以创建自己的相册并上传精美的照片！"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="LeftTD" colspan="2" valign="middle">
                <asp:ImageButton ID="imgbtnRegister" runat="server" 
                    ImageUrl="~/images/zhuce_16.gif" onclick="imgbtnRegister_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

