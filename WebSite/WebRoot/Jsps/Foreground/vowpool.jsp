<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'vowpool.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/imageshow/jquery.js"></script>
	<script type="text/javascript" src="js/jquery_dialog.js"></script>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<link href="css/layout.css" rel="stylesheet" type="text/css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	
		
		function lmsg(){
			var txt = $("#vow").val();
			var who = $("#who").val();
			var url = "foreAction!saveVowMsg.action?messages.content=" + txt + "&messages.disname=" + who;
			alert(url);
			$.ajax({ 
	  			type:"post",              //提交方式
	  			url:url,  //要跳转到的action
	  			cache:false,
	  			//data:{"val":name,"pagecur":page_index+1,"usName":clasName,"tishi":zt,"gradData.gradId":1,"pageSize":items_per_page},
	  			dataType:"json",    //数据类型
	  			success:function(msg) //当ajax请求成功后显示的消息  msg为ajax返回的所有信息
	  			{
	  				window.parent.closeMsg();
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
    <div style="width:250; height:100; margin: 0 8">
  	<textarea id="vow" rows="5" cols="20" name="message.content"></textarea><br/>
  	昵称：<input style="width:60px;height:20px" id="who" type="text" name="messages.disname"><br/>
  	<input type="button" name="提交" value="提交" onclick="lmsg();">
    <br>
    </div>
  </body>
</html>
