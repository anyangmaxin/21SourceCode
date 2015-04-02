<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body style="margin:0">
    <form id="form1" runat="server">
    <div>
        <SCRIPT type=text/javascript>
    <!--
    
    var focus_width=180
    var focus_height=160
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
</SCRIPT>

        &nbsp;
        </div>
    </form>
</body>
</html>
