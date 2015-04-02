<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Photo_load.aspx.cs" Inherits="Photo_load" Title="无标题页" Theme="tm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style type="text/css">
    #preView
    {
        filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod = scale);
    }
</style>
<script language="javascript" type="text/javascript">
    //显示图片
    function showImg(ImageUrl){
        if (ImageUrl != "")
        {
            var preView= document.getElementById("preView");
            preView.innerHTML =  "";
            preView.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = ImageUrl;
            preView.style.width = "120px";
            preView.style.height = "120px";
        }
    }      
</script>
<div id="right_01_sc"></div>
<div id="right_02_sc">
<div align="center">
    <asp:HyperLink ID="hlkMessage" runat="server"></asp:HyperLink>
    <asp:Panel ID="pShow" runat="server" Width="100%" 
        HorizontalAlign="Center">  
    <div id="divOne" style="width:530px" align="left">
        <div id="Item_01" style="height:35px; line-height:35px">选择相册： 
            <asp:DropDownList ID="ddlCategory" SkinID="ddlSkin" runat="server">
            </asp:DropDownList>
        </div>
        <div id="Item_02" style="height:35px; line-height:35px">照片名称： 
            <asp:TextBox ID="tbName" SkinID="tbSkin" runat="server" MaxLength="50" Width="260px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" Display="Dynamic" 
                ErrorMessage="照片名称不能为空！" ControlToValidate="tbName"></asp:RequiredFieldValidator>
            <cc1:textboxwatermarkextender ID="tbWExdName" runat="server"
               TargetControlID="tbName" WatermarkText="请输入照片名称" WatermarkCssClass="Watermark">
            </cc1:textboxwatermarkextender>
        </div>
        <div id="Item_03" style="height:45px; line-height:45px">照片描述： 
            <asp:TextBox ID="tbDescript" SkinID="tbSkin" runat="server" MaxLength="100" 
            TextMode="MultiLine" Width="260px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" Display="Dynamic" 
                ErrorMessage="照片描述不能为空！" ControlToValidate="tbDescript"></asp:RequiredFieldValidator>
            <cc1:TextBoxWatermarkExtender ID="tbWExdDescription" runat="server"
               TargetControlID="tbDescript" WatermarkText="请输入照片描述" WatermarkCssClass="Watermark">
            </cc1:TextBoxWatermarkExtender>
        </div>
        <div id="Item_04" style="height:35px; line-height:35px">选择照片： 
            <asp:FileUpload ID="fulPhoto" SkinID="fulSkin" runat="server" 
                onpropertychange="showImg(this.value)" Width="260px"/>
            <asp:RequiredFieldValidator ID="rfvPhoto" runat="server" 
                ControlToValidate="fulPhoto" ErrorMessage="请选择上传图片！" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>   
        <div id="Item_05" style="height:35px; line-height:35px">
            图片预览：<asp:Label ID="lbMessage" runat="server" ForeColor="Red">（注意！允许上传gif，jpg，bmp，png格式的图片文件！）</asp:Label>
        </div>                   
        <div style="border:solid 1px #EEB7D1; width:88%; height:125px; float:right" align=center>
            <div style="width:100%; height:125px; line-height:125px; vertical-align:middle; background-color:#ffffff; ">
                <div id="preView">图片预览</div> 
            </div>
        </div>
        <br/>
        <div style=" width:100%;height:45px; line-height:45px; vertical-align:bottom; padding:25px 0px 0px 0px" align="center">
            &nbsp;&nbsp;&nbsp;                        
            <asp:ImageButton ID="imgBtnLoad" runat="server" ImageUrl="~/images/an_16.gif" 
                onclick="imgBtnLoad_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="imgBtnReset" runat="server" CausesValidation="False" 
                ImageUrl="~/images/an_14.gif" onclick="imgBtnReset_Click" />
        </div>                 
    </div> 
    </asp:Panel>               
</div>
</div>
</asp:Content>

