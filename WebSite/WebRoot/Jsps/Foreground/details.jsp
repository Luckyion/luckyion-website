<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'newsdetails.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/layout.css" rel="stylesheet" type="text/css" />
	<meta name="Keywords" content="标准之路,www.aa25.cn,网页标准布局,DIV+CSS" />
	<meta name="" content="标准之路,www.aa25.cn,网页标准布局,DIV+CSS" />
	<meta name="Description" content="本套网页标准布局模板是由标准之路（www.aa25.cn）制作完成 "/>
	<script type="text/javascript" src="js/imageshow/jquery.js"></script>
	<script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
	$(document).ready(function(){
        $("#contentlist").attr("src","Jsps/Foreground/newsdetails.jsp");
	     //点击相应按钮载入相应页面
	     $("#a1").click(function(){
	    	 location.href="index.jsp";
	      // $("#contentlist").attr("src","index.jsp", "_blank");
	     });
	     $("#a2").click(function(){
	       $("#contentlist").attr("src","Jsps/Foreground/newsdetails.jsp");
	     });
	     $("#a3").click(function(){
	       $("#contentlist").attr("src","Jsps/Foreground/vowdetails.jsp");
	     });	
	     $("#a4").click(function(){
		       $("#contentlist").attr("src","Jsps/Foreground/gamedetails.jsp");
		 });
	     $("#a5").click(function(){
		       $("#contentlist").attr("src","Jsps/Foreground/resources.jsp");
		 });
      });
	</script>

  </head>
  
  <body>
<div id="container">
  <div id="header">
  	<div style="width: 500px; height:50px; margin: 0 0">
  		<table style="width:300px; height:100px; border: 2px">
  			<tr height="50px">
  			<td style="margin: 0 20">
  				<img style="margin: 0 20" alt="" src="images/freedom.jpg" width="50px" height="50px" >
  			</td>
  			<td>
  			<div>
  			<table>
  			<tr>
  			<td>ジ⊙_⊙む </td></tr>
  			<tr>
  			<td>欢迎来到ジ⊙_⊙む 的世界</td></tr>
  			</table>
  			</div>
  			</td></tr>
  		</table>
  	</div>
  	<div style=""></div>
  <div style="margin: 30px 30px">
  	<a id="a1"><span style="margin: 0 15px; color: yellow; border: 2px; 
  	font-weight:bold; cursor:pointer; ">主页</span></a>
  	<a id="a2"><span style="margin: 0 15px; color: yellow; font-weight:bold; 
  	cursor:pointer;">动态</span></a>
  	<a id="a3"><span style="margin: 0 15px; color: yellow; font-weight:bold;
  	cursor:pointer; ">许愿</span></a>
  	<a id="a4"><span style="margin: 0 15px; color: yellow; font-weight:bold;
  	cursor:pointer; ">游戏人生</span></a>
  	<a id="a5"><span style="margin: 0 15px; color: yellow; font-weight:bold;
  	cursor:pointer; ">资源下载</span></a>
  </div>  
  </div>
  <div id="mainContent"> 
  		<iframe id="contentlist" height="100%" width="100%" frameborder="0">
  		</iframe>   
    
  </div>
</div>
</body>
</html>
