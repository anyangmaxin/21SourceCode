<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yuangongzhuce.aspx.cs" Inherits="yuangongzhuce" %>

<%@ Register Src="../userControl/syhead.ascx" TagName="syhead" TagPrefix="uc1" %>



<%@ Register Src="../userControl/foot.ascx" TagName="foot" TagPrefix="uc3" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ޱ���ҳ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a {
	font-size: 12px;
	color: #0000CC;
}
a:visited {
	color: #0000CC;
}
a:hover {
	color: #FF9600;
}
a:active {
	color: #FF9600;
}
-->
</style>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#FFFFFF" background="../image/index_03.jpg">
    <form id="form1" runat="server">
    <div>
        <div>
            <div>
                <div style="text-align: center">
                    <table border="1">
                        <tr>
                            <td colspan="3" valign="top" style="width: 843px">
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" valign="top" style="width: 843px">
                                <uc1:syhead ID="Syhead1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 26px; width: 843px;" valign="top">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="������κ" Font-Size="XX-Large"
                                    ForeColor="#FF8000" Text="��Աע��" Width="256px"></asp:Label>&nbsp;<table style="width: 80%">
                                    <tr>
                                        <td align="center" style="width: 144px; height: 6px;">
                                            </td>
                                        <td align="right" style="width: 84px; height: 6px;">
                                            <asp:Label ID="Label1" runat="server" Text="�û�����"></asp:Label></td>
                                        <td align="right" style="width: 83px; height: 6px;">
                                        </td>
                                        <td align="right" style="width: 100px; height: 6px;">
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            <asp:Button ID="btnYhm" runat="server" CausesValidation="False" Text="�����û���" OnClick="btnYhm_Click" /></td>
                                        <td align="left" style="width: 107px; height: 6px;">
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                                Display="Dynamic" ErrorMessage="�û�������Ϊ��" Font-Size="Small"></asp:RequiredFieldValidator>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 144px">
                                            </td>
                                        <td align="right" style="width: 84px">
                                            <asp:Label ID="Label2" runat="server" Text="�û����룺"></asp:Label></td>
                                        <td align="right" style="width: 83px">
                                        </td>
                                        <td align="right" style="width: 100px">
                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="147px"></asp:TextBox></td>
                                        <td align="left" style="width: 107px">
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                                Display="Dynamic" ErrorMessage="�û����벻��Ϊ��" Font-Size="Small"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 7px;">
                                        </td>
                                        <td style="width: 84px; height: 7px">
                                        </td>
                                        <td style="width: 83px; height: 7px">
                                        </td>
                                        <td style="width: 100px; height: 7px;">
                                        </td>
                                        <td style="width: 107px; height: 7px;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 24px">
                                            </td>
                                        <td style="width: 84px; height: 24px" align="right">
                                            <asp:Label ID="Label3" runat="server" Text="�Ա�"></asp:Label></td>
                                        <td style="width: 83px; height: 24px">
                                        </td>
                                        <td style="width: 100px; height: 24px">
                                            <asp:DropDownList ID="DropDownList2" runat="server" Width="106px" ForeColor="Red">
                                                <asp:ListItem Selected="True">��</asp:ListItem>
                                                <asp:ListItem>Ů</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td align="left" style="width: 107px; height: 24px">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px">
                                            </td>
                                        <td style="width: 84px">
                                            <asp:Label ID="Label4" runat="server" Text="�������ڣ�" Width="80px"></asp:Label></td>
                                        <td style="width: 83px">
                                        </td>
                                        <td style="width: 100px">
                                            &nbsp;<asp:TextBox ID="TextBox4" runat="server" Width="150px"></asp:TextBox><div style="text-align: center">
                                            </div>
                                        </td>
                                        <td align="left" style="width: 107px">
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4"
                                                ErrorMessage="�������ڲ���Ϊ��" Font-Size="Small" Width="110px"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox4"
                                                Display="Dynamic" ErrorMessage="�������ڸ�ʽ����ȷ" Font-Size="Smaller" Operator="DataTypeCheck"
                                                Type="Date" Width="150px"></asp:CompareValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 15px">
                                            </td>
                                        <td style="width: 84px; height: 15px" align="right">
                                            <asp:Label ID="Label5" runat="server" Text="���䣺"></asp:Label></td>
                                        <td style="width: 83px; height: 15px">
                                        </td>
                                        <td style="width: 100px; height: 15px">
                                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                                        <td align="left" style="width: 107px; height: 15px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5"
                                                Display="Dynamic" ErrorMessage="RequiredFieldValidator" Font-Size="Small">���䲻��Ϊ��</asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox5"
                                                Display="Dynamic" ErrorMessage="������������.��100>����>18" Font-Size="Small" MaximumValue="100"
                                                MinimumValue="18" Type="Integer" Width="186px"></asp:RangeValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 24px">
                                            </td>
                                        <td style="width: 84px; height: 24px">
                                            <asp:Label ID="Label6" runat="server" Text="����״����"></asp:Label></td>
                                        <td style="width: 83px; height: 24px">
                                        </td>
                                        <td style="width: 100px; height: 24px">
                                            <asp:DropDownList ID="DropDownList3" runat="server" Width="109px" ForeColor="Red">
                                                <asp:ListItem>δ��</asp:ListItem>
                                                <asp:ListItem Selected="True">�ѻ�</asp:ListItem>
                                                <asp:ListItem>���</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td align="left" style="width: 107px; height: 24px">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 21px">
                                            </td>
                                        <td style="width: 84px; height: 21px">
                                            <asp:Label ID="Label7" runat="server" Text="���֤�ţ�"></asp:Label></td>
                                        <td style="width: 83px; height: 21px">
                                        </td>
                                        <td style="width: 100px; height: 21px">
                                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                                        <td align="left" style="width: 107px; height: 21px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6"
                                                Display="Dynamic" ErrorMessage="���֤���벻��Ϊ��" Font-Names="����_GB2312" Font-Size="Small"
                                                Width="138px"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox6"
                                                Display="Dynamic" ErrorMessage="���֤��17λ����15λ" Font-Size="Small" ValidationExpression="\d{17}[\d|X]|\d{15}"
                                                Width="214px"></asp:RegularExpressionValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 23px">
                                            </td>
                                        <td style="width: 84px; height: 23px">
                                            <asp:Label ID="Label8" runat="server" Text="�ƶ��绰��"></asp:Label></td>
                                        <td style="width: 83px; height: 23px">
                                        </td>
                                        <td style="width: 100px; height: 23px">
                                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                                        <td align="left" style="width: 107px; height: 23px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7"
                                                Display="Dynamic" ErrorMessage="�ƶ��绰���벻��Ϊ��" Font-Size="Small" Width="136px"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 47px;">
                                            </td>
                                        <td style="width: 84px; height: 47px;">
                                            <asp:Label ID="Label9" runat="server" Text="��ϵ�绰��"></asp:Label></td>
                                        <td style="width: 83px; height: 47px">
                                        </td>
                                        <td style="width: 100px; height: 47px;">
                                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                                        <td align="left" style="width: 107px; height: 47px;">
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox8"
                                                Display="Dynamic" ErrorMessage="��ϵ�绰����Ϊ��" Font-Size="Small" Width="182px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 17px">
                                            </td>
                                        <td style="width: 84px; height: 17px">
                                            <asp:Label ID="Label10" runat="server" Text="���ڳ��У�"></asp:Label></td>
                                        <td style="width: 83px; height: 17px">
                                        </td>
                                        <td style="width: 100px; height: 17px">
                                            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
                                        <td align="left" style="width: 107px; height: 17px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox9"
                                                Display="Dynamic" ErrorMessage="���ڳ��в���Ϊ��" Font-Size="Small"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px">
                                            </td>
                                        <td style="width: 84px">
                                            <asp:Label ID="Label11" runat="server" Text="��ͥ��ַ��"></asp:Label></td>
                                        <td style="width: 83px">
                                        </td>
                                        <td style="width: 100px">
                                            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
                                        <td align="left" style="width: 107px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox10"
                                                Display="Dynamic" ErrorMessage="��ͥ��ַ����Ϊ��" Font-Size="Small"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px">
                                            </td>
                                        <td style="width: 84px" align="right">
                                            <asp:Label ID="Label12" runat="server" Text="���䣺"></asp:Label></td>
                                        <td style="width: 83px">
                                        </td>
                                        <td style="width: 100px">
                                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
                                        <td align="left" style="width: 107px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox11"
                                                Display="Dynamic" ErrorMessage="���䲻��Ϊ��" Font-Size="Small"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="�밴����ĸ�ʽ��д" runat="server" ControlToValidate="TextBox11"
                                                Display="Dynamic" Font-Size="Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                Width="143px" ErrorMessage="��ʽ����ȷ"></asp:RegularExpressionValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 18px;">
                                            </td>
                                        <td style="width: 84px; height: 18px;">
                                            <asp:Label ID="Label13" runat="server" Text="ְ�����ͣ�"></asp:Label></td>
                                        <td style="width: 83px; height: 18px">
                                        </td>
                                        <td style="width: 100px; height: 18px;">
                                            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
                                        <td align="left" style="width: 107px; height: 18px;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox12"
                                                Display="Dynamic" ErrorMessage="ְ�����Ͳ���Ϊ��" Font-Size="Small" Width="108px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px; height: 60px">
                                            </td>
                                        <td style="width: 84px; height: 60px" align="right">
                                            <asp:Label ID="Label14" runat="server" Text="��ע��"></asp:Label></td>
                                        <td style="width: 83px; height: 60px">
                                        </td>
                                        <td style="width: 100px; height: 60px">
                                            <asp:TextBox ID="TextBox13" runat="server" Height="79px" TextMode="MultiLine" Width="157px"></asp:TextBox></td>
                                        <td align="left" style="width: 107px; height: 60px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox13"
                                                Display="Dynamic" ErrorMessage="��ע����Ϊ��" Font-Size="Small"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 144px">
                                        </td>
                                        <td style="width: 84px">
                                        </td>
                                        <td style="width: 83px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 107px">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 25px; width: 843px;" valign="top">
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="ע��" />&nbsp;
                                <asp:Button ID="Button1" runat="server" Text="ȡ��" CausesValidation="False" OnClick="Button1_Click" /></td>
                        </tr>
                        <tr>
                            <td align="left" colspan="3" rowspan="1" valign="top" style="width: 843px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" valign="top" style="width: 843px">
                                &nbsp;
                                <uc3:foot ID="Foot1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
