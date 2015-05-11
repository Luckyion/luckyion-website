<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'details.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/layout.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/imageshow/jquery.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
	 $(document).ready(function(){
		 loadmsg();
	 });
	 
	 //<a href="<s:url action="userAction.action"></s:url>" target="main">基本设置</a>
	 function loadmsg(){
		 var div_s = "<div id='mesg' style='margin: 0 200'>";
		 var tab = "<table width='100%' height='1' border='0' cellpadding='0' cellspacing='0' bgcolor='#CCCCCC'><tr><td></td></tr></table>";
		 var span = "<span style='margin: 0 20' color='blue'>";
		 var span_ = "</span>";
		 var span_txt = "<span style='margin: 0 60' color='blue'>";
		 var br = "<br />";
		 var div = "<div id='oper_reply' style='margin: 10 20 display:none'>";
		 var div_ = "</div>";
		 var a = "<a href='fileDownload.action?fileName=";
		 var a_ = "'>";
		 var a__ = "</a>";
		 $.ajax({
			 type:"post",              //提交方式
	  			url:"foreAction!downloadResources.action",  //要跳转到的action
	  			cache:false,
	  			//data:{"val":name,"pagecur":page_index+1,"usName":clasName,"tishi":zt,"gradData.gradId":1,"pageSize":items_per_page},
	  			dataType:"json",    //数据类型
	  			success:function(msg) //当ajax请求成功后显示的消息  msg为ajax返回的所有信息
	  			{
	  				var kk = msg.listFiles;
	  				var content = div_s;
	  				for(var i = 0; i < kk.length; i++){
	  					content += tab + span + a + kk[i].filepath + a_ + kk[i].filename 
	  					+ a__ + span_ + br + div_;
	  				}
	  				content += div_;
	  				alert(content);
	  			  	$("#con_start").after(content);
	  			},
          			error:function(msg) //当ajax请求失败后显示的消息
	  			{
	  				alert("失败");
	  					
	  			}
		 });
	 }

	</script>
	

  </head>
  
  <body id="mainContent">
  	<div style="width:100%; height:100%; margin: 30 0; align: center">
  		<div id="con_start" style="width:100%; height: 10px">
  		<span style='margin: 0 20' color='blue'><a href='../usersimages/image/20140809/使用说明.txt'>使用说明</a></span><br />
  		</div>
  	</div>
  		
  	</body>
  </html>