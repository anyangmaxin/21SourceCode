<%@ Page Language="C#" MasterPageFile="~/MasterPage/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ST_BlogIndex.aspx.cs" Inherits="Module_Admin_ST_type" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function IFRAME1_onclick() {

}

// ]]>
</script>

   
 <table>
        <tr>
            <td cellpadding="0" cellspacing="0" class="style1" style="width: 161px; height: 467px;">
                <iframe src="TreeMenuSys.aspx"  name="leftFrame" width="200"  frameborder="0" scrolling="no" style="height: 465px; width: 157px; background-image: url(../../Images/Skin/left.jpg);" ></iframe>
            </td>
            <td style="width: 101px; height: 467px;">
                <iframe src="CommonPage.aspx" name="rightFrame" frameborder="0" 
                    scrolling="auto" height="500" 
                    
                    style="width: 739px; height: 465px; background-image: url('../../Images/Skin/right.jpg');" 
                    id="IFRAME1" onclick="return IFRAME1_onclick()"></iframe>
            </td>
        </tr>
    </table>
   
</asp:Content>

