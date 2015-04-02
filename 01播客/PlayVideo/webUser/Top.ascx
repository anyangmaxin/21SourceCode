<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top.ascx.cs" Inherits="WebUserControl" %>
<%@ Register Src="Search.ascx" TagName="Search" TagPrefix="uc1" %>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    #stop_top{
        margin:0px;padding:0px;       
    }
    #stop_top ul{
        list-style:none;
        padding:0px;margin:0px;
    }
    #stop_top li{
        float:left;
        text-algn:center;
        width:100px;
        cursor: hand;
        background-color:transparent ;
    }
    /*隐藏div*/
    #stop_div2{
        display:none;
    }
    
    
    /*设置选择项*/
    #stop_div1,#stop_div2{
       margin:0px;padding:0px;
    }
    #stop_div1 ul,#stop_div2 ul{
        list-style:none;
        padding:0px;margin:0px;
    }
    #stop_div1 li,#stop_div2 li{
        float:left;
        text-algn:center;
        width:100px;
        cursor: hand;
     
    }    

</style>
<script>
    function so()
    {
      document.getElementById('stop_div1').style.display='block';
      document.getElementById('stop_div2').style.display='none';
    

    }
       function shi()
    {
      document.getElementById('stop_div1').style.display='none';
      document.getElementById('stop_div2').style.display='block';
    

    }
          function z()
    {
      document.getElementById('stop_div1').style.display='none';
      document.getElementById('stop_div2').style.display='none';
      
      
    }
 
</script>


<div align="center" >
<table  background="../images/sy_05.jpg" width="900" height="61" align="center" cellpadding="0" cellspacing="0">
      <tr style="width: 60px; background-image: url(../images/sy_03.jpg);" >
        <td style="width: 37px; background-image: url(../images/sy_03.jpg);">&nbsp;</td>        
        <td style="width: 502px">
        <div  id="stop_top">
    <ul>
    </ul>
    <ul>
        <li class="cubai"  onmousemove="so()"><span style="color:White; font-size: 16px; font-weight: bold;">&gt;</span> <a   href ="../index.aspx" >首页 </a></li>
        <li class="cubai" onmousemove="shi()" ><span style="color:White; font-size: 16px; font-weight: bold;">&gt;</span> <a href="#">视频</a></li>
        <li class="cubai" ><span style="color:White; font-size: 16px; font-weight: bold;">&gt;</span> <a href ="../userPage.aspx"  >会员 </a></li>
        <li class="cubai" ><span style="color:White; font-size: 16px; font-weight: bold;">&gt;</span> <a href ="../videoTaxis.aspx" >排行榜 </a></li>
           <li class="cubai"><span style="color:White; font-size: 16px; font-weight: bold;">&gt;</span> <a href ="../user/userIndex.aspx"  >个人管理 </a></li>
    </ul>    
 </div>
        
        </td>
        <td width="285" valign="top"><img src="/images/sy_04.jpg" width="310" height="40" border="0" usemap="#Map" />
           <map name="Map" id="Map">
            <area shape="rect" coords="7,6,87,28" href="http://www.mingrisoft.com" />
            <area shape="rect" coords="103,6,200,25" href="http://www.mrbccd.com" />
            <area shape="rect" coords="218,6,298,26" href="#" />
          </map>
           
           </td>
        <td width="9">&nbsp;</td>
      </tr>
      <tr>
        <td style="width: 37px">&nbsp;</td>
        <td style="width: 502px">
        <div id="stop_div1" align="left" >   
    <ul>     
        <li class="shenhong" id="LI1"><img src="../images/sanjiao.gif" width="9" height="11" /><a href="../videoNew.aspx">最新视频</a></li>
        <li class="shenhong"><img src="../images/sanjiao.gif" width="9" height="11" /><a href="../videoPlaySum.aspx">人气视频</a></li>
        <li></li>
        <li></li>        
    </ul>   
    </div>
    
<div id="stop_div2" align="left" >
     <ul>
        <li class="shenhong"><img src="../images/sanjiao.gif" width="9" height="11" /><a href="../videoHumour.aspx">搞笑</a></li>
        <li class="shenhong"><img src="../images/sanjiao.gif" width="9" height="11" /><a href="../videoSport.aspx">体育</a></li>
        <li class="shenhong"><img src="../images/sanjiao.gif" width="9" height="11" /><a href="../videoFilm.aspx">电影</a></li>
        <li class="shenhong"><img src="../images/sanjiao.gif" width="9" height="11" /><a href="../videoCartoon.aspx">动漫</a></li>        
    </ul>   
    </div>
        
        
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>





 </div>



    


