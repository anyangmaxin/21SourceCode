<%@ Page Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Photo_slide.aspx.cs" Inherits="Photo_slide" Title="无标题页" Theme="tm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <asp:UpdatePanel ID="upSilde" runat="server">
        <ContentTemplate>
            <div style="width:600px;" align="center">
                <div style="width:100%; height:350px">
                    <div style="width:25%; float:left">
                        <div style="width:100%; margin-top:5px; margin-bottom:3px; height:100px" align="left">
                            <asp:HyperLink ID="hlkDefault" runat="server" NavigateUrl="~/UserLogin.aspx" 
                                Font-Bold="True" Font-Size="14px" ForeColor="#FF9900">返回首页</asp:HyperLink>-->><asp:HyperLink
                                    ID="hlk_cname" runat="server"></asp:HyperLink>
                        </div> 
                        <div style="width:100%; height:50px; line-height:50px">
                            图片标题：<asp:Label ID="lbTitle" runat="server" CssClass="Title"></asp:Label>
                        </div>
                        <div style="width:100%; height:20px; line-height:20px">
                            图片描述：<asp:Label ID="lbDescript" runat="server" CssClass="Title"></asp:Label>
                        </div>
                    </div>
                    <div>                        
                        <div>
                                        <div>
                    <asp:Button ID="btnPre" runat="server" SkinID="btnSkin" Text="上一张" 
                        Height="25px" Width="85px" />
                    &nbsp;<asp:Button ID="btnStart" runat="server" SkinID="btnSkin" Text="开始播放" 
                        Height="25px" Width="76px" />
                    &nbsp;<asp:Button ID="btnNext" runat="server" SkinID="btnSkin" Text="下一张" 
                        Height="28px" Width="71px" />
                </div>
                            <asp:Image ID="imgShow" runat="server" ImageUrl="~/images/none.jpg"/>
                        </div>
                    </div>
                </div>
    
            </div>
            <cc1:SlideShowExtender ID="ssePhoto" runat="server" UseContextKey="true" AutoPlay="true"
               Loop="true" TargetControlID="imgShow" ImageTitleLabelID="lbTitle" ImageDescriptionLabelID="lbDescript"
               NextButtonID="btnNext" PreviousButtonID="btnPre" PlayButtonID="btnStart" PlayInterval="3000"
               PlayButtonText="开始播放" StopButtonText="停止播放" SlideShowServicePath="PlayPhoto.asmx" SlideShowServiceMethod="GetPhotos" BehaviorID="slideShowBehavior">
            </cc1:SlideShowExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>

