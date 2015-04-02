<%@ Page Language="C#" MasterPageFile="~/MasterPage/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ST_BlogIndex.aspx.cs" Inherits="Module_Admin_ST_type" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table style="width: 632px; height: 384px" cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td style="width: 84px; height: 432px;">
                <iframe src="TreeMenuSys.aspx"  name="leftFrame" width="200"  frameborder="no" scrolling="no" style="height: 478px; width: 157px; background-image: url(../../Images/Skin/left.jpg);" ></iframe>
            </td>
            <td style="width: 95px; height: 432px;">
                <iframe src="CommonPage.aspx" name="rightFrame" frameborder="no" scrolling="no" 
                    height="500" style="width: 760px; height: 483px;"></iframe>
            </td>
        </tr>
    </table>
</asp:Content>

