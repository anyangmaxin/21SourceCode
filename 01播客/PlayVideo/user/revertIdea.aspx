<%@ Page Language="C#" AutoEventWireup="true" CodeFile="revertIdea.aspx.cs" Inherits="user_revertIdea" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>

  
</head>
<body>
    <form id="form1" runat="server" >
    <div>
        <div style="text-align: center">
            <table id="TABLE1" border="0" cellpadding="0" cellspacing="0" style="width: 316px; height: 153px">
                <tr>
                    <td style="width: 102px">
                        回复内容：</td>
                    <td style="width: 104px">
                        <asp:TextBox ID="txtContent" runat="server" Height="82px" MaxLength="2" TextMode="MultiLine"
                            Width="211px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnRevert" runat="server" OnClick="btnRevert_Click" Text="回 复" />
                        &nbsp;&nbsp;&nbsp;<input id="Button1" onclick="window.close();" type="button" value="关　闭" />
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
