<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="UseControls_Header" %>
<%@ Register Src="VisitorNav.ascx" TagName="VisitorNav" TagPrefix="uc2" %>
<table align="center" 
    style="width: 924px; height: 127px; background-image: url('Images/Skin/head.jpg');" 
    cellpadding="0" cellspacing="0">
    <tr>
        <td style="width: 716px; text-align: right; height: 8px;">
        </td>
    </tr>
    <tr>
        <td style="width: 716px; height: 1px; text-align: right">
            <uc2:VisitorNav ID="VisitorNav1" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 716px; text-align: right; height: 59px;">
            &nbsp;
            &nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 28px; text-align: center; width: 716px;">
            &nbsp;</td>
    </tr>
    </table>
