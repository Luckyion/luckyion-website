<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>Luckyion's HomePage</title>
    
	<meta http-equiv="pragma" content="no-cache,must-revalidate">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<META http-equiv=Content-Language content=zh-cn>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<LINK href="css/enter.css" type=text/css rel=stylesheet>
	<link type="text/css" rel="stylesheet" href="css/jquery_dialog.css" />
	<script type="text/javascript" src="js/jquery_dialog.js"></script>
	<!-- Imageshow1 -->
	<link rel="stylesheet" href="css/imageshow/visuallightbox.css" type="text/css" />
	<link rel="stylesheet" href="css/imageshow/vlightbox.css" type="text/css" />
	<script type="text/javascript" src="js/imageshow/jquery.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		$(document).ready(function(){
			loadHeartWords();
			loadNews();
			loadStuTimes(0);
			//loadStuTimes(1);
			loadStuTimes(2);
			loadGames();
			//alert("网页加载了");
		});
		//加载心情寄语
		function loadHeartWords(){
			var span0 = "<span style='margin: 0 30'>";
			var span_ = "</span>";
			 $.ajax({ 
		  			type:"post",              //提交方式
		  			url:"foreAction.action",  //要跳转到的action
		  			cache:false,
		  			//data:{"val":name,"pagecur":page_index+1,"usName":clasName,"tishi":zt,"gradData.gradId":1,"pageSize":items_per_page},
		  			dataType:"json",    //数据类型
		  			success:function(msg) //当ajax请求成功后显示的消息  msg为ajax返回的所有信息
		  			{
		  			  $("p").after(span0 + msg.messages.content + span_);
		  			},
                 error:function(msg) //当ajax请求失败后显示的消息
		  			{
		  				alert("失败");
		  					
		  			}
		  		});
		}
		//加载动态
		function loadNews(){
			var div0 = "<div id='news' style='align:left; margin-left:5px'>";
			var div1 = "</div>";
			var span0 = "<span>";
			var span1 = "</span>";
			var br = "<br/>";
			$.ajax({ 
	  			type:"post",              //提交方式
	  			url:"foreAction!loadNews.action",  //要跳转到的action
	  			cache:false,
	  			//data:{"val":name,"pagecur":page_index+1,"usName":clasName,"tishi":zt,"gradData.gradId":1,"pageSize":items_per_page},
	  			dataType:"json",    //数据类型
	  			success:function(msg) //当ajax请求成功后显示的消息  msg为ajax返回的所有信息
	  			{
	  			  var messages = msg.listMessages;
	  			  for(var i = 0; i < messages.length; i++){
	  				  var content = div0 + span0 + messages[i].topic 
	  				  + span1 + br + div1;
	  				  $("#news").after(content);
	  			  }	  			  
	  			},
             error:function(msg) //当ajax请求失败后显示的消息
	  			{
	  				alert("失败");
	  					
	  			}
	  		});
		}
		
		//加载学生时代照片数据
		function loadStuTimes(param){
			var div0 = "<div id='vlightbox'>";
			var div1 = "</div>";
			var id0 = "id='firstImage'";
			var title0 = " title='image 1' ";
			var a0 = "<a ";
			var hrefs = "images/20054616104170383.gif";
			var href0 = "href='";
			var cla = "' class='vlightbox'>";
			var cla1 = "' class='vlightbox vlightbox_hidden'";
			var img0 = "<img alt='img' src='";
			var img1 = "'/>";
			var a1 = "</a>";
			var sct = "<script type='text/javascript'>";
			var v = "var $VisualLightBoxParams$ = {autoPlay:true,borderSize:21," +
					"enableSlideshow:true,overlayOpacity:0.4,startZoom:true};</";
			var vnd = "script><script type='text/javascript' src='js/imageshow/visuallightbox.js'></";
			var end = "script>";
			
			var url = "";
			if(param == "0"){
				url = "foreAction!loadStuTimes.action";
			}
			if(param == "1"){
				url = "foreAction!loadLifeTimes.action";
			}
			if(param == "2"){
				url = "foreAction!loadTinyTimes.action";
			}
			
			$.ajax({ 
	  			type:"post",              //提交方式
	  			url:url,  //要跳转到的action
	  			cache:false,
	  			//data:{"val":name,"pagecur":page_index+1,"usName":clasName,"tishi":zt,"gradData.gradId":1,"pageSize":items_per_page},
	  			dataType:"json",    //数据类型
	  			success:function(msg) //当ajax请求成功后显示的消息  msg为ajax返回的所有信息
	  			{	  	
	  			  var messages = msg.listFiles;
	  			  var content = div0;
	  			  for(var i = 0; i < messages.length; i++){	  
	  				  
	  				  if(i == 0){
	  					  content += a0 + id0 + title0 + href0 + messages[0].filepath + cla 
	  					  + img0 + messages[0].filepath 
		  				  + img1 + a1;
	  					  //$("vlight0").after(content);
	  				  }else{
	  					  content += a0 + href0 + messages[i].filepath + cla1 + img0 + messages[i].filepath 
		  				  + img1 + a1;		  				  
	  				  }					  
	  			  }
	  			  content += div1 + sct + v + vnd + end;
	  			  if(param == "0"){//学生时代
	  				$("#vlight0").after(content);	
	  			  }
	  			  if(param == "1"){//生活时光
	  				$("#lifeTimes").after(content);	  				
	  			  }
	  			  if(param == "2"){ //时光轴
	  				$("#tinyTimes").after(content);
	  			  }	  			  	  			  
	  			},
             error:function(msg) //当ajax请求失败后显示的消息
	  			{
	  				alert("失败");
	  					
	  			}
	  		});
		}
		
		function loadGames(){			
            var div0 = "<div id='demo'>";
            var div1 = "<div id='indemo'>";
            var div2 = "<div id='demo1'>";
            var div3 = "<div id='demo2'>";
            var a = "<a href='#'><img src='";
            var a_ = "'/></a>";
            var div_ = "</div>";
            var sct = "<script src='js/jspersonal/rollimg.js'></";
            var sct_ = "script>";
			$.ajax({ 
	  			type:"post",              //提交方式
	  			url:"foreAction!loadGames.action",  //要跳转到的action
	  			cache:false,
	  			//data:{"val":name,"pagecur":page_index+1,"usName":clasName,"tishi":zt,"gradData.gradId":1,"pageSize":items_per_page},
	  			dataType:"json",    //数据类型
	  			success:function(msg) //当ajax请求成功后显示的消息  msg为ajax返回的所有信息
	  			{
	  			  var messages = msg.listFiles;
	  			  var content = div0 + div1 + div2;
	  			  for(var i = 0; i < messages.length; i++){
	  				  content += a + messages[i].filepath
	  				  + a_;
	  				  
	  			  }	  
	  			  content += div_ + div3 + div_ + div_ + div_ + sct + sct_;
	  			  //alert(content);
	  			  $("#gameShow").after(content);
	  			},
             error:function(msg) //当ajax请求失败后显示的消息
	  			{
	  				alert("失败");
	  					
	  			}
	  		});
		}
		
		function ShowLeaveMsg() {
			JqueryDialog.Open('留言', '/Jsps/Foreground/leavemsg.jsp', 210, 200);
	    }
		
		function showVowPool(){
			JqueryDialog.Open('许愿', '/Jsps/Foreground/vowpool.jsp', 210, 200);
		}
		
		function closeMsg(){
			JqueryDialog.Close();
		}
		
		function AddFavorite(sURL, sTitle)
		{
		    try
		    {
		        window.external.addFavorite(sURL, sTitle);
		    }
		    catch (e)
		    {
		        try
		        {
		            window.sidebar.addPanel(sTitle, sURL, "");
		        }
		        catch (e)
		        {
		            alert("加入收藏失败，请使用Ctrl+D进行添加");
		        }
		    }
		}
		
		function SetHome(obj,vrl){
	        try{
	                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
	        }
	        catch(e){
	                if(window.netscape) {
	                        try {
	                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
	                        }
	                        catch (e) {
	                                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
	                        }
	                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
	                        prefs.setCharPref('browser.startup.homepage',vrl);
	                 }
	        }
	}
	
		function more(){
			location.href="/Jsps/Foreground/details.jsp";
		}
		
	</script>
	<style type="text/css">
	#demo {
      	  background: #FFF;
          overflow:hidden;
          border: 0px dashed #CCC;
          width: 173px;
          }
          #demo img {
          border: 2px solid #F2F2F2;
          }
          #indemo {
          float: left;
          width: 800%;
          }
          #demo1 
          {
          float: left;
          }
          #demo2 
          {                                	
          float: left;
          }
	</style>

  </head>
  
 <BODY style="BACKGROUND-IMAGE: url(images/2e_bg.jpg)" onclick="">
<DIV align=center>
<TABLE style="BORDER-COLLAPSE: collapse" height=576 cellPadding=0 width=990 border=0>
  <TR>
    <TD width=230>
      <DIV align=center>
      <TABLE style="BORDER-COLLAPSE: collapse" height=585 cellPadding=0 
      width=225 border=0>
        <TR>
          <TD height=16>
            <DIV align=left>
            <TABLE style="BORDER-COLLAPSE: collapse" cellPadding=0 width=206 border=0>
              <TR>
                <TD width=13>　</TD>
                <TD><IMG height=23 src="images/22_top.jpg" width=188 border=0></TD></TR></TABLE></DIV></TD></TR>
        <TR>
          <TD>
            <DIV align=center>
            <TABLE style="BORDER-COLLAPSE: collapse" height=577 cellPadding=0 width=147 border=0>
              <TR>
                <TD height=582>
                  <DIV align=center>
                  <TABLE style="BORDER-COLLAPSE: collapse" height=320 cellPadding=0 width=230 border=0>
                    <TR>
                      <TD width=14><IMG height=582 src="images/2e_left.jpg" width=14 border=0></TD>
                      <TD>
                        <DIV align=center>
                        <TABLE style="BORDER-COLLAPSE: collapse" height=582 cellPadding=0 width=188 border=0>
                          <TR>
                            <TD width=188 
                            background="images/2e_top.jpg" 
                            height=434>
                              <DIV align=center>
                              <TABLE id=table18 style="BORDER-COLLAPSE: collapse" height=417 cellPadding=0 width=178 border=0>
                                <TR>
                                <TD align="center" colSpan=2 height=42>
                                <OBJECT id=obj5 
                                codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0 
                                height=28 width=133 border=0 
                                classid=clsid:D27CDB6E-AE6D-11CF-96B8-444553540000>
								<PARAM NAME="movie" VALUE=""><PARAM NAME="menu" VALUE="false">
								<PARAM NAME="quality" VALUE="High"><PARAM NAME="wmode" VALUE="transparent">
                                <embed src="" 
                                pluginspage="http://www.macromedia.com/go/getflashplayer" 
                                type="application/x-shockwave-flash" name="obj5" 
                                width="133" height="28" quality="High" 
                                wmode="transparent"></OBJECT></TD></TR>
                                <TR>
                                <TD align=left width=31 height=333>　</TD>
                                <TD align=left width=147 height=333>
                                </TD></TR>
                                <TR>
                                <TD align="center" colSpan=2>
                                <TABLE id=table19 
                                style="BORDER-COLLAPSE: collapse" height=37 
                                cellPadding=0 width="100%" border=0>
                                
                                <TR>
                                <TD align="center"><FONT 
                                color=#ffffff><B></B></FONT></TD></TR>
                                <TR>
                                <TD align="center"><B><FONT 
                                color=#ffffff></FONT></B></TD></TR></TABLE></TD></TR></TABLE></DIV></TD></TR>
                          <TR>
                            <TD width=188 height=148><IMG height=148 
                              src="images/2e_down.jpg" width=188 
                              border=0></TD></TR></TABLE></DIV></TD>
                      <TD width=28><IMG height=582 
                        src="images/2e_right.jpg" width=28 
                        border=0></TD></TR></TABLE></DIV></TD></TR></TABLE></DIV></TD></TR></TABLE></DIV></TD>
    <TD>
      <DIV align=center>
      <TABLE style="BORDER-COLLAPSE: collapse" height=604 cellPadding=0 width=677 border=0>
        <TR>
          <TD>
            <DIV align=center>
            <TABLE style="BORDER-COLLAPSE: collapse" height=584 cellPadding=0 width=644 border=0>
              <TR>
                <TD vAlign=top align="center" width=656 
                background="images/33e_top1.jpg" colSpan=3 
                height=17>　</TD></TR>
              <TR>
                <TD vAlign=bottom align="center" width=656 
                background="images/33e_top11.jpg" colSpan=3 
                height=34>
              <TR>
                <TD width=13><IMG height=519 src="images/33e_left.jpg" width=13 border=0></TD>
                <TD width=622 bgColor=#ffffff>
                  <DIV align=center>
                  <TABLE style="BORDER-COLLAPSE: collapse" height=518 cellPadding=0 width=600 border=0>
                    <TR>
                      <TD width=600 background="" height=209>
                        <DIV align=center>
                        <TABLE style="BORDER-COLLAPSE: collapse" height=240 
                        cellPadding=0 width=600 border=0>
                          <TR>
                            <TD background="images/green.jpg">
                              <OBJECT id=obj3 
                              codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0 
                              height=240 width=600 border=0 
                              classid=clsid:D27CDB6E-AE6D-11CF-96B8-444553540000>
							  <PARAM NAME="movie" VALUE="flashes/green.swf"><PARAM NAME="quality" VALUE="High">
							  <PARAM NAME="wmode" VALUE="transparent">
                              <embed src="flashes/green.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="obj3" width="600" height="240" quality="High" wmode="transparent">
							  </OBJECT></TD></TR></TABLE></DIV></TD></TR>
                    <TR>
                      <TD>
                        <TABLE id=table2 style="BORDER-COLLAPSE: collapse"  height=275 cellPadding=0 width="100%" border=0>
                          <TR>
                            <TD width=15>　</TD>
                            <TD>
                              <TABLE id=table10 
                              		 style="BORDER-COLLAPSE: collapse" height=279 
                              		 cellPadding=0 width=600 border=0>                                
                                <TR>
                                	<TD width=350 height=11></TD>
                                	<TD width=250 height=11></TD></TR>
                                <TR>
                                	<TD width=350 height=18><!-- 心情寄语 -->
                                	<IMG height=15 
                                		src="images/icons/7.ico" width=15 
                                		border=0>
                                		<span style="font-weight:bold;	color:#ff9955;0">心情寄语</span>
                                		<a style="margin: 0 20" href="javascript:more();">more</a>
                                		</TD>
                                	<TD width=250 height=268 rowSpan=6>
                                <DIV align=center>
                                	<TABLE id=table31 
                                		style="BORDER-COLLAPSE: collapse" height=264 
                                		cellPadding=0 width=232 border=0>                                
                                <TR>
                                	<TD vAlign=top height=88>
                                    	</TD></TR>
                                	<TR>
                                	<TD height=18>
                                <TABLE id=table41 
                                style="BORDER-COLLAPSE: collapse" cellPadding=0 
                                width="91%" border=0>                                
                                <TR>
                                <TD width=28>　</TD><!-- 我的动态 -->
                                <TD><IMG height= 15
                                src="images/icons/24.ico" width=15 
                                border=0>
                                <span style="font-weight:bold;	color:#ff9955;">动态</span>
                                <a style="margin: 0 20" href="javascript:more();">more</a>
                                </TD></TR></TABLE></TD></TR>
                                <TR>
                                <TD>
                                <TABLE id=table40 
                                style="BORDER-COLLAPSE: collapse" height=60 
                                cellPadding=0 width="99%" border=0>                                
                                <TR>
                                <TD id="news" width=24 align="left">
                                	<div id="news" style="align:left; margin-left:30px">
                                		<!--<span>&nbsp;&nbsp;&nbsp;&nbsp;test
                                		</span>-->  
                                	</div>　
                                                      	
                                </TD>
                                <TD>                       	
                                	
                                </TD></TR></TABLE></TD></TR>
                                <TR>
                                <TD height=15>
                                <TABLE id=table39 
                                style="BORDER-COLLAPSE: collapse" cellPadding=0 
                                width="103%" border=0>
                                
                                <TR>
                                <TD width=28>　</TD>
                                <TD><!-- 娱乐和游戏 -->
                                <IMG height=15 
                                	src="images/icons/11.ico" width=15 
                                	border=0>
                                	<span style="font-weight:bold;	color:#ff9955;">娱乐和游戏</span>
                                	<a style="margin: 0 20" href="javascript:more();">more</a>
                                	</TD></TR></TABLE></TD></TR>
                                <TR>
                                <TD height=64>
                                <TABLE id=table38 
                                	style="BORDER-COLLAPSE: collapse" height=76 
                                	cellPadding=0 width=237 border=0>
                                
                                <TR>
                                <TD width=27 height=56>　</TD>
                                <TD id="gameShow" align="center" width=173 height=50>
                                <!-- 
                             		  下面是滚动图片的js程序
                                -->
                                
                                <!--
                                
                                -->
                                
                                </TD>
                                <TD width=37 height=56>　</TD></TR>
                                <TR>
                                <TD width=27>　</TD>
                                <TD align="center" width=173></TD>
                                <TD 
                                	width=37>　</TD></TR></TABLE></TD></TR></TABLE></DIV></TD></TR>
                                <TR>
                                <TD width=350 height=79>
                                <TABLE class=x cellSpacing=0 cellPadding=0 
                                	width="100%" border=0>
                                	<tr>
                                		<td><p id="xqjy_text"></p></td>
                                	</tr>
                                </TABLE>
                                <TABLE cellSpacing=0 cellPadding=0 width="100%" 
                                	border=0>
                                
                                <TR align="center">
                                <TD width="100%" height=2></TD></TR>
                                <TR>
                                <TD height=0></TR></TABLE></TD></TR>
                                <TR>
                                <TD width=350 height=17><!-- 成长历程 -->
                                <IMG height=15 
                                	src="images/icons/13.ico" width=15 
                                	border=0><span style="font-weight:bold;	color:#ff9955;">时光轴</span>
                                	</TD></TR>
                                <TR>
                                <TD width=350 height=79>
                                <TABLE class=x cellSpacing=0 cellPadding=0 
                                	width="100%" border=0>
                                </TABLE>
                                <TABLE cellSpacing=0 cellPadding=0 width="100%" 
                                	border=0>
                                
                                <TR align="center">
                                <TD width="25%" height=2>
                                <TABLE class=bk1 cellSpacing=0 cellPadding=0 
                                	align=center border=0>                                
                                <TR>
                                <TD id="lifeTimes" height=20 width="25%">
                                <img height="58px" width="88px" alt="image 1" src="images/notebook.jpg" 
                               		onclick="JqueryDialog.Open('心情日记', '/Jsps/Foreground/notebook.jsp', 900, 500);"
                                />
                                </TD></TR></TABLE><A 
                                	href="javascript:JqueryDialog.Open('心情日记', '/Jsps/Foreground/notebook.jsp', 900, 500);" 
                                ><FONT 
                                	color=#000>心情日记</FONT></A></TD>
                                <TD width="25%" height=2>
                                <TABLE class=bk1 cellSpacing=0 cellPadding=0 
                                	align=center border=0>                                
                                <TR>
                                <TD id="tinyTimes" height=20>
                                </TD></TR></TABLE><A 
                                	href="foreAction!loadFreedom.action?val=2" 
                                	target=_blank><FONT 
                                	color=#000>时光轴</FONT></A></TD>
                                <TD width="25%" height=2>
                                <TABLE class=bk1 cellSpacing=0 cellPadding=0 
                                	align=center border=0>
                                
                                <TR>
                                <TD height=20>
                                <div id="vlightbox">
        						<a href="foreAction!loadFreedom.action?val=3" target=_blank><img alt="image 1" src="images/freedom.jpg" /></a>
    							</div>
                                </TD></TR></TABLE><A 
                                	href="foreAction!loadFreedom.action" 
                                	target=_blank><FONT 
                                	color=#000>自由贴</FONT></A></TD></TR>
                                <TR>
                                <TD height=0></TR></TABLE></TD></TR>
                                <TR>
                                <TD width=350 height=15><!-- 音乐 -->
                                <IMG height=15
                                	src="images/icons/9.ico" width=15
                                	border=0>
                                	<span style="font-weight:bold;	color:#ff9955;">
                                	音乐</span>
                                	</TD></TR>
                                <TR>
                                <TD width=350 height=57>                                
                                <IMG height=18 
                                	src="images/2e-m-yy.gif" width=88
                                	border=0 onclick="JqueryDialog.Open('音乐播放器', '/Jsps/Foreground/musictool.jsp', 530, 500);">
                                </TD>
                                </TR>
                                </TABLE>
                                </TD>
                                </TR>
                                </TABLE>
                                </TD></TR>
                                </TABLE>
                                </DIV>
                                </TD>
                <TD width=7><IMG height=519 
                  src="images/33e_right.jpg" width=21 
              border=0></TD></TR>
              <TR>
                <TD width=644 colSpan=3 height=14><IMG height=15 
                  src="images/33e_down.jpg" width=656 
              border=0></TD></TR></TABLE></DIV></TD></TR>
        <TR>
          <TD height=3></TD></TR></TABLE></DIV></TD>
    <TD width=85>
      <DIV align=center>
      <TABLE id=table23 style="BORDER-COLLAPSE: collapse" height=603 
      cellPadding=0 width=66 border=0>
        
        <TR>
          <TD width=82 height=46><IMG height=46 
            src="images/top.jpg" width=82 border=0></TD></TR>
        <TR>
          <TD width=82 background="images/down.jpg" height=289>
            <DIV align=center>
            <TABLE id=table24 style="BORDER-COLLAPSE: collapse" height=260 
            cellPadding=0 width=53 border=0>
              
              <TR>
                <TD 
                style="BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM: #e6e7e2 1px solid; BORDER-RIGHT-WIDTH: 1px" 
                height=66><A 
                  onclick="SetHome(this,window.location);" 
                  href="#"><IMG height=51 
                  src="images/home.gif" width=51 
              border=0></A></TD></TR>
              <TR>
                <TD 
                style="BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM: #e6e7e2 1px solid; BORDER-RIGHT-WIDTH: 1px" 
                height=66><A title="喜欢的话就记下我吧 "
                  href="javascript:AddFavorite('http://luckyion.oicp.net','唐会旗的个人主页');"><IMG 
                  height=51 src="images/shou.gif" width=51 
                  border=0></A></TD></TR>
              <TR>
                <TD 
                style="BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM: #e6e7e2 1px solid; BORDER-RIGHT-WIDTH: 1px" 
                height=66><A title="为自己许一个愿望，明天一定会更加美好"
                  href="javascript:showVowPool();"><IMG height=54 src="images/qi.gif" 
                  width=51 border=0></A></TD></TR>
              <TR>
                <TD height=66>
                  <A title="既然来了，就留下句话吧~ "
                  href="javascript:ShowLeaveMsg();" style="width: 80px"><IMG 
                  height=54 src="images/liu.gif" width=51 
                  border=0></A>
                  </TD></TR>
              <TR>
                <TD height=17></TD></TR></TABLE></DIV></TD></TR>
        <TR>
          <TD>　</TD></TR></TABLE></DIV></TD></TR></TABLE></DIV>
<DIV align=center>
<TABLE id=table1 style="BORDER-COLLAPSE: collapse" cellpadding=0 width=990 
border=0>
  
  <TR>
    <TD align="center" width=252>　</TD>
    <TD vAlign=top align="center" width=212></TD>
    <TD align="center">欢迎来信-->alinvince@126.com<a href="/login.jsp"></a></TD>
    <TD align="center" width=317>　</TD></TR>
  <TR>
    <TD align="center" width=252 height=14></TD>
    <TD align="center" width=212 height=14></TD>
    <TD align="center" height=14></TD>
    <TD align="center" width=317 height=14></TD></TR></TABLE></DIV>
</BODY>
</html>
