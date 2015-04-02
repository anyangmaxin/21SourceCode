<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="BlogIndex.aspx.cs" Inherits="BlogIndex" Title="Untitled Page" %>

<%@ Register src="UserControl/Login.ascx" tagname="Login" tagprefix="uc1" %>

<%@ Register src="UserControl/Items.ascx" tagname="Items" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language="javascript" type="text/javascript">
<!--

function TABLE2_onclick() {

}

// -->
</script>

    <table align="center" bgcolor="<%#ST_tcolor%>" border="0" cellpadding="0" 
        cellspacing="1" id="TABLE2" language="javascript" 
        onclick="return TABLE2_onclick()" style="height: 162px; width: 873px;">
        <tbody>
            <tr bgcolor="#ffffff">
                <td style="background-image: url(Images/Skin/04.jpg); width: 216px; height: 755px" valign="top">
                    <font face="宋体">
                    <table align="center" border="0" bgcolor="<%#ST_bgcolor%>" cellpadding="0" cellspacing="1"
                        style="font-size: 9pt; color: #000000; background-image: url(Images/Skin/);" width="200">
                        <tr>
                            <td height="25">
                                <div align="center">
                                    <span style="font-size: 11pt">
                                    <img alt="" src="Images/Skin/rili.gif" style="width: 212px; height: 33px" /></span></div>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="background-image: url(images/1294850_472733.gif); height: 211px;">
                                        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" 
                                            BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                                            ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="201px">
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                                                VerticalAlign="Bottom" />
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                                                Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                        </asp:Calendar>
                                    </td>
                        </tr>
                    </table>
                    </font>
                    <table align="center" bgcolor="<%#ST_bgcolor%>" border="0" cellpadding="0" cellspacing="1"
                        style="font-size: 9pt; color: #000000; background-image: url(Images/Skin/); height: 153px;" width="200">
                        <tr>
                            <td height="25">
                                <div align="center">
                                    <img src="Images/Skin/newclass0.jpg" 
                                        style="width: 210px; height: 33px" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="background-image: url(images/); height: 120px;" align="center">
                                <asp:DataList ID="ClassList" runat="server" Font-Size="11pt" Width="119px" 
                                    style="font-size: small">
                                    <HeaderTemplate>
                                        <font color="red" size="2">★</font><a href="BlogIndex.aspx"> 博客首页</a>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Skin/titleindex.GIF" />
                                        <a href='BlogIndex_<%# DataBinder.Eval(Container.DataItem, "ST_c_name")%>_<%# DataBinder.Eval(Container.DataItem, "ST_c_id") %>.aspx '>
                                            &nbsp;<%# DataBinder.Eval(Container.DataItem, "ST_c_name") %>
                                        </a>
                                    </ItemTemplate>
                                </asp:DataList>
                                
                        </tr>
                    </table>
                                            <table align="center" border="0" cellpadding="0" cellspacing="1" 
                                                style="background-image: url('Images/Skin/'); width: 209px;">
                        <tr>
                            <td style="height: 24px">
                                <div align="center">
                                    <strong><span style="font-size: 11pt"></span></strong>&nbsp;<img src="Images/Skin/newclass1.jpg" style="width: 210px; height: 33px" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="background-image: url(images/1294850_472733.gif)" align="center">
                                <asp:DataList ID="CmdList" runat="server" Font-Size="11pt" Width="120px" 
                                    style="font-size: small">
                                    <ItemTemplate>
                                        <a href='<%# DataBinder.Eval(Container.DataItem, "ST_n_id") %>.aspx'>
                                            <%# DataBinder.Eval(Container.DataItem, "ST_n_title") %>
                                        </a>
                                    </ItemTemplate>
                                </asp:DataList></td>
                        </tr>
                    </table>
                    
                    <table align="center" bgcolor="<%#ST_bgcolor%>" border="0" cellpadding="0" cellspacing="1"
                        width="200" style="background-image: url(Images/Skin/)">
                        <tr>
                            <td height="25">
                                <img alt="" src="Images/Skin/wangyouhuiying.gif" 
                                    style="width: 212px; height: 34px" /></td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="background-image: url(images/1294850_472733.gif); height: 19px;">
                                <%ST_get_Replay();%>
                            </td>
                        </tr>
                    </table>
                    <table align="center" bgcolor="<%#ST_bgcolor%>" border="0" cellpadding="0" cellspacing="1"
                        width="200" style="background-image: url(Images/Skin/)">
                        <tr>
                            <td style="height: 25px">
                                <img src="Images/Skin/youqing%20lianjie.gif" 
                                    style="width: 212px; height: 34px" /></td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="background-image: url(images/1294850_472733.gif)">
                                <%get_Link();%>
                            </td>
                        </tr>
                    </table>
                    <table id="Table1" align="center" bgcolor="<%#ST_bgcolor%>" border="0" cellpadding="0"
                        cellspacing="1" width="200" style="background-image: url(Images/Skin/)">
                        <tr>
                            <td height="25" style="width: 198px">
                                <div align="center">
                                    <strong><span style="font-size: 11pt"></span></strong>
                                    <img alt="" src="Images/Skin/boke%20zhu%20ren.gif" 
                                        style="width: 212px; height: 34px" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#ffffff" style="background-image: url(images/1294850_472733.gif);
                                width: 198px">
                                <br />
                                <a href="ST_message.aspx"><font size="3">[给我留言]</font></a></td>
                        </tr>
                        </table>
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <p class="left">
                    <td bgcolor="#ffffff" style="background-image: url(Images/Skin/); height: 755px"
                        valign="top" width="540" align="left">
                        <asp:GridView ID="NewsList" runat="server" AutoGenerateColumns="False" 
                            Width="486px" AllowPaging="True" 
                            OnPageIndexChanging="NewsList_PageIndexChanging" BorderStyle="None" 
                            BorderColor="White" onselectedindexchanged="vvbvv">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                            <table align="center" border="0" cellpadding="0" cellspacing="0" valign="top" width="98%">
                                                <tr>                                 
                                                    <td bgcolor="<%#ST_bgcolor%>" colspan="2" height="25">
                                                        <div align="left">
                                                            <font face="宋体"></font><font face="宋体"></font><a href='<%# DataBinder.Eval(Container.DataItem, "ST_n_id") %>.aspx'>
                                                                <font style="font-size: 14px"><b>
                                                                    <%# DataBinder.Eval(Container.DataItem, "ST_n_title") %>
                                                                </b></font></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <span style="color: #646060; font-weight: bold"><font size="-1">摘要</font></span>: &nbsp;<font style="font-size: 12px;"><%# DataBinder.Eval(Container.DataItem, "ST_n_key") %><br>
                                                        </font>
                                                    </td>
                                                </tr>
                                                <tr bgcolor="#f8f8f8">
                                                    <td align="right" colspan="2" width="69%">
                                                        [<a href='<%# DataBinder.Eval(Container.DataItem, "ST_n_id") %>.aspx'><span 
                                                            style="color: #8EAEC2; font-weight: bold">点击阅读全文</span></a>]
                                                        <font style="font-size: 12px"><font color="#7c7c7c">阅读</font>:[<%# DataBinder.Eval(Container.DataItem, "ST_n_hit") %>]
                                                            <font color="#7c7c7c">评论</font>:[<%# DataBinder.Eval(Container.DataItem, "ST_n_re") %>]
                                                            <font color="#7c7c7c">时间</font>:[<%# DataBinder.Eval(Container.DataItem, "ST_n_date") %>]</font></td>
                                                </tr>
                                            </table>
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        
                                        <table cellpadding="0" cellspacing="0" style="width: 100%; height: 34px;">
                                            <tr>
                                                <td style="background-image: url('Images/Skin/weizhi.gif')" align="left">
                                                    <a href="BlogIndex.aspx">
                                                    <span style="color: #333333; font-size: small; font-weight: bold;">首页</span></a><span 
                                                        style="color: #333333; font-size: small; font-weight: bold;">-&gt;</span><a href="#"><span 
                                                        style="color: #333333"><span style="font-size: small"><b><%=Request.QueryString["name"]%>：全部文章列表</b></span></span></a></td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemStyle BackColor="" />
                                    <HeaderStyle BackColor="#DEE5E9" />
                                    <FooterStyle BackColor="#E0E6EB" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                     <td style="background-image: url(Images/Skin/04.jpg); width: 216px; height: 755px" valign="top">
                         <font face="宋体">
                    <table align="center" border="0" bgcolor="<%#ST_bgcolor%>" cellpadding="0" cellspacing="1"
                        style="font-size: 9pt; color: #000000; background-image: url(Images/Skin/);" width="200">
                        <tr>
                            <td height="25">
                                <div align="center">
                                    <span style="font-size: 11pt">
                                    <img src="Images/Skin/denglu.gif" style="width: 207px; height: 33px" /></span></div>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="background-image: url(images/1294850_472733.gif); height: 211px;">
                                        <uc1:Login ID="Login1" runat="server" />
                                    </td>
                        </tr>
                    </table>
                    </font>
                    <table align="center" border="0" cellpadding="0" cellspacing="1" 
                             style="background-image: url('Images/Skin/'); width: 210px;">
                        <tr>
                            <td style="height: 24px">
                                <div align="center" 
                                    
                                    style="background-image: url('Images/Skin/redian%20wenzhang.gif'); height: 32px;">
                                    <strong><span style="font-size: 11pt"></span></strong>&nbsp;
                                &nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="background-image: url(images/1294850_472733.gif)">
                                <asp:DataList ID="TopList" runat="server" Font-Size="11pt" Width="160px" 
                                    style="font-size: small">
                                    <ItemTemplate>
                                        <a href='<%# DataBinder.Eval(Container.DataItem, "ST_n_id") %>.aspx'>
                                            <%# DataBinder.Eval(Container.DataItem, "ST_n_title") %></a>
                                        <font style="font-size: 12px"><font color="#0000ff">点击率</font>:[<%# DataBinder.Eval(Container.DataItem, "ST_n_hit") %>]
                                        </font>
                                    </ItemTemplate>
                                </asp:DataList></td>
                        </tr>
                    </table>
                    <table align="center" bgcolor="<%#ST_bgcolor%>" border="0" cellpadding="0" cellspacing="1"
                        style="font-size: 9pt; color: #000000; background-image: url(Images/Skin/); height: 153px;" width="200">
                        <tr>
                            <td height="25">
                                <div align="left">
                                    <img src="Images/Skin/boyou%20wen%20zhang.gif" 
                                        style="width: 207px; height: 33px" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="background-image: url(images/1294850_472733.gif); height: 120px;">
                                <asp:DataList ID="ClassList0" runat="server" Font-Size="11pt" Width="195px" 
                                    style="font-size: small" Height="114px">
                                    <HeaderTemplate>
                                       
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Skin/new.gif" />
                                    <font style="font-size: 12px">[<%# Eval("ST_n_title").ToString().Length > 10 ? Eval("ST_n_title").ToString().Substring(0, 10) + "..." : Eval("ST_n_title")%>]
                                        </font>
                                        <font color="red" size="2">作者：</font><a href='BlogIndex_<%# DataBinder.Eval(Container.DataItem, "ST_n_author")%>.aspx '>
                                            <%# DataBinder.Eval(Container.DataItem, "ST_n_author")%>
                                        </a>
                                    </ItemTemplate>
                                </asp:DataList>
                                
                            </tr>
                    </table>
                    
                    <table align="center" bgcolor="<%#ST_bgcolor%>" border="0" cellpadding="0" cellspacing="1"
                        style="font-size: 9pt; color: #000000; background-image: url(Images/Skin/); height: 153px;" width="200">
                        <tr>
                            <td height="25">
                                <div align="left">
                                    <span style="font-size: 11pt;">
                                        &nbsp;</span>&nbsp;<img src="Images/Skin/zai%20xian%20tou%20piao.gif" 
                                        style="width: 207px; height: 33px" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" align="center" style="background-image: url(images/1294850_472733.gif); height: 120px;">
                                   <div>
        <script type="text/javascript">
    <!--
    
    var focus_width=200
    var focus_height=180
    var text_height=0
    var swf_height = focus_height+text_height
    
    var pics='<%=str %>'
    var links='<%=loopId %>'
    var texts=''
	var banner='<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="imgFile/banner.swf"><param name="quality" value="high"><param name="bgcolor" value="#DADADA">' 
    document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"  width="'+ focus_width +'" height="'+ swf_height +'">');
    document.write(banner);
    document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
    document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
    document.write('</object>');  
    //-->
</script>
        </div>
                             </td>   </tr>
                    </table>
                 
                </td>
                </p>
            </tr>
        </tbody>
    </table>



</asp:Content>

