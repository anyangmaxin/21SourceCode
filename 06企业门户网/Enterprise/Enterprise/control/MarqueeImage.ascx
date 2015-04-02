<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MarqueeImage.ascx.cs" Inherits="GameImage" %>
<%--<Marquee onmouse="this.start()" onmouseover="this.stop()" scrollAmount="2" scrollDely="3" style="with:100%;" >--%><asp:DataList ID="DataList1" runat="server" RepeatColumns="100" RepeatDirection="Horizontal" Width="426px" Height="70px"  >
    <ItemTemplate>
        &nbsp;<table style="border-right: thin solid; border-top: thin solid; font-size: 12px;
            border-left: thin solid; width: 229px; border-bottom: thin solid; height: 207px">
            <tr>
                <td style="border-right: #99cccc thin solid; border-top: #99cccc thin solid; border-left: #99cccc thin solid;
                    width: 104px; border-bottom: #99cccc thin solid; height: 12px">
                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Black"
                        Text='<%# Eval("name") %>' Width="312px"></asp:Label></td>
            </tr>
            <tr>
                <td style="border-right: #99cccc thin solid; border-top: #99cccc thin solid; border-left: #99cccc thin solid;
                    width: 104px; border-bottom: #99cccc thin solid; height: 11px" valign="top">
                    <table style="width: 189px; height: 191px;">
                        <tr>
                            <td style="width: 100px; height: 111px" valign="top">
                    <asp:Image ID="Image1" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"Image") %>' runat="server" Width="214px" Height="152px" /></td>
                            <td align="center" style="width: 292px;
                                height: 111px; border-right: #99cccc thin solid; border-top: #99cccc thin solid; border-left: #99cccc thin solid; border-bottom: #99cccc thin solid;" valign="top">
                                <table>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="lblPri" runat="server" Font-Size="10pt" ForeColor="Red" Text="价格："></asp:Label>
                                            &nbsp;
                                            <asp:Label ID="lblPrice" runat="server" Font-Size="9pt" Text='<%# Eval("Price") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 100px; height: 21px">
                                            <asp:Label ID="LblState" runat="server" Font-Size="9pt" Text="类别："></asp:Label>&nbsp;
                                            <asp:Label ID="lblZt" runat="server" Font-Size="9pt" Text='<%# Eval("LeiBie") %>'
                                                Width="47px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="lblXb" runat="server" Font-Size="9pt" ForeColor="Red" Text="类型："></asp:Label>
                                            &nbsp;
                                            <asp:Label ID="lblType" runat="server" Font-Size="9pt" Text='<%# Eval("type") %>'
                                                Width="42px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px; height: 51px;">
                                            &nbsp;&nbsp;
                                            <div style="text-align: center">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="width: 100px">
                                            <asp:Label ID="lblPoint" runat="server" Font-Size="9pt" Text="下载次数：" Width="60px"></asp:Label></td>
                                                        <td style="width: 100px">
                                            <asp:Label ID="lblZw" runat="server" Font-Size="9pt" Text='<%# Eval("point") %>'
                                                Width="44px"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 100px">
                                            </td>
                                    </tr>
                                </table>
                                <a href='list_softdownload.aspx?ID=<%#Eval("id") %>'>查看</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList><%--</Marquee>--%>
<SCRIPT type="text/javascript">
var speed=0.0001 
demo2.innerHTML=demo1.innerHTML

function Marquee(){
if(demo1.offsetWidth-demo.scrollLeft<=0)
	demo.scrollLeft=0
	onmouse="this.start()" 
onmouseover="this.stop()"
scrollAmount="2"
 scrollDely="3" 
else
	demo.scrollLeft++
	onmouse="this.start()" 
    onmouseover="this.stop()"
    scrollAmount="2" 
    scrollDely="3" 

var MyMar=setInterval(Marquee,speed)


</SCRIPT>
