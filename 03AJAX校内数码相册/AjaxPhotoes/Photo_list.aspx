<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Photo_list.aspx.cs" Inherits="Photo_list" StylesheetTheme="tm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="Stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager> 
<script type="text/javascript" language="javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_initializeRequest(initializeRequest);
    prm.add_endRequest(endRequest);
    var postbackElement;
    function initializeRequest(sender, args) {
        document.body.style.cursor = "wait";
        if (prm.get_isInAsyncPostBack()) {
            args.set_cancel(true);
        }
    }
    function endRequest(sender, args) {
        document.body.style.cursor = "default";
    }
</script>
<asp:UpdatePanel ID="upList" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
<div id="box">
<div id="top"></div>
<div id="main_img">
<div id="m_left_img">
  <div id="an01"><a href="ManageDefault.aspx"><img src="images/an_03.gif" width="160" height="57" border="0" alt="" /></a></div>
  <div id="an02"><a href="Photo_load.aspx"><img src="images/an_21.gif" width="160" height="58" border="0" alt=""/></a></div>
  <div id="an03"><a href="Category.aspx"><img src="images/an_b_32.gif" width="160" height="57" border="0" alt=""/></a></div>
  <div id="an04"><a href="Manage.aspx"><img src="images/an_b_41.gif" width="160" height="58" border="0" alt=""/></a></div>
</div>
<div id="m_right_img">
<div align="center" style="margin-top:15px">
    <div style="width:95%; margin-bottom:10px" align="left">
        <asp:HyperLink ID="hlkDefault" runat="server" NavigateUrl="~/ManageDefault.aspx" 
            Font-Bold="True" Font-Size="14px" ForeColor="#FF9900">返回首页</asp:HyperLink>-->><asp:Label 
            ID="lb_Cname" runat="server" Font-Bold="False" Font-Size="12px"></asp:Label>
    </div>  
    &nbsp;<img ID="imgBig" runat="server" alt="" src="" /><div id="sTitle" 
        runat="server" style="width:97%"></div>
    <div id="sDescription" runat="server" style="width:100%"></div>
</div>
</div>
<div id="m_bottom">
<div align="center">
    <div id="div1" class="bottomLine" style=" width:88%;height:5px"></div>
    <asp:ListView ID="lvPhoto" runat="server" GroupItemCount="5" 
        onitemediting="lvPhoto_ItemEditing" 
        onitemcanceling="lvPhoto_ItemCanceling" 
        onitemupdating="lvPhoto_ItemUpdating" DataKeyNames="ID" 
        onitemdatabound="lvPhoto_ItemDataBound" 
        onitemdeleting="lvPhoto_ItemDeleting">
        <LayoutTemplate>
            <div ID="divPhoto" runat="server" align="center" 
                style="width:800px; height:400px; margin:8px 0px 2px 10px; padding:8px 0px 2px 10px; text-align:center">
                <div ID="groupPlaceholder" runat="server">
                </div>
            </div>            
        </LayoutTemplate>
        <GroupTemplate>
            <div ID="tr" style="width:100%;text-align:center">
                <div ID="itemPlaceholder" runat="server">
                </div>
            </div>
            <div ID="div1" class="bottomLine" style="height:5px"></div>
            <div ID="div2" style="height:20px; line-height:20px;"></div>
        </GroupTemplate>
        <ItemTemplate>
            <div style="width:158px;float:left">
                <div style="width:155px; height:119px; background-image:url(images/001_07.gif);">
                    <div style="width:100%; height:10px; line-height:10px;"></div>
                    <asp:LinkButton ID="lkbImg" runat="server" CommandArgument='<%# Eval("Url")%>' CommandName='<%# Eval("Descript")%>' oncommand="lkbImg_Command">
                        <img src='UpSmall/<%# Eval("Url")%>' alt='<%# Eval("Descript")%>' style="border-width:0px" width="133px" height="100px"/>
                    </asp:LinkButton> 
                </div>
                <div align="center" style="width:100%">
                   描述： <%# Eval("Title")%>    
                    <br />                              
                    <asp:LinkButton ID="lkbEdit" runat="server" CommandName="Edit" Text="编辑"/>
                </div>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div style="width:160px;float:left">                
                <div style="width:155px; height:119px; background-image:url(images/001_07.gif);">
                    <div style="width:100%; height:10px; line-height:10px;"></div>
                    <asp:LinkButton ID="lkbImg" runat="server" CommandArgument='<%# Eval("Url")%>' CommandName='<%# Eval("Descript")%>' oncommand="lkbImg_Command">
                        <img src='UpSmall/<%# Eval("Url")%>' alt='<%# Eval("Descript")%>' style="border-width:0px" width="133px" height="100px"/>
                    </asp:LinkButton> 
                </div>
                <div align="center" style="width:100%">
                    名称：<asp:TextBox ID="tbName" SkinID="tbSkin" runat="server" MaxLength="50" Width="100%" Text='<%# Eval("Title")%> '></asp:TextBox>
                    描述：<asp:TextBox ID="tbDescript" SkinID="tbSkin" runat="server" MaxLength="100" 
        TextMode="MultiLine" Width="100%" Text='<%# Eval("Descript")%>'></asp:TextBox>
                    <br />                                 
                    <asp:LinkButton ID="lkbUpdate" runat="server" CommandName="Update" Text="更新"/>
                    <asp:LinkButton ID="lkbCancel" runat="server" CommandName="Cancel" Text="取消"/>
                    <asp:LinkButton ID="lkbDelete" runat="server" CommandName="Delete" Text="删除"/>
                </div>
            </div>
        </EditItemTemplate>
    </asp:ListView>
    <br />
    <asp:DataPager ID="AfterListDataPager" runat="server" PagedControlID="lvPhoto">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Image" FirstPageImageUrl="~/images/an_06.gif" 
                ShowFirstPageButton="true" ShowNextPageButton="False" LastPageImageUrl="~/images/an_12.gif" 
                NextPageImageUrl="~/images/an_10.gif" 
                PreviousPageImageUrl="~/images/an_08.gif" />
            <asp:NumericPagerField ButtonCount="10" />
            <asp:NextPreviousPagerField ButtonType="Image" LastPageImageUrl="~/images/an_12.gif" 
                ShowLastPageButton="true" 
                ShowPreviousPageButton="False" FirstPageImageUrl="~/images/an_06.gif" 
                NextPageImageUrl="~/images/an_10.gif" 
                PreviousPageImageUrl="~/images/an_08.gif" />
        </Fields>
    </asp:DataPager>
</div>
</div>
<div id="foot"></div>
</div>
    </ContentTemplate>
</asp:UpdatePanel>
</form>
</body>
</html>
