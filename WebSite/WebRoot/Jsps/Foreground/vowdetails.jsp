<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'vowdetails.jsp' starting page</title>
    
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
		 var div_s = "<div id='mesg' style='margin: 0 200'>";
		 var tab = "<table width='100%' height='1' border='0' cellpadding='0' cellspacing='0' bgcolor='#CCCCCC'><tr><td></td></tr></table>";
		 var span = "<span style='margin: 0 20' color='blue'>";
		 var span_ = "</span>";
		 var span_txt = "<span style='margin: 0 60' color='blue'>";
		 var span1 = "<span style='margin: 0 20' color='blank'>";
		 var br = "<br />";
		 var div = "<div id='oper_reply' style='margin: 10 20 display:none'>";
		 var div_ = "</div>";
		 var inp = "<a id='rybu' href='javascript:reply();'><span style='margin: 0 20'>回复</span></a>";
		 var txtar = "<textarea id='rymsg' rows='2' cols='20' name='messages.content'></textarea>";
		 var rebu = "<a id='rybu' href='javascript:reply_();'>回复</a>";
		 var cabu = "<a id='c_ry' href='javascript:c_ry();'>取消</a>";
		 $.ajax({
			 type:"post",              //提交方式
	  			url:"foreAction!allVows.action",  //要跳转到的action
	  			cache:false,
	  			//data:{"val":name,"pagecur":page_index+1,"usName":clasName,"tishi":zt,"gradData.gradId":1,"pageSize":items_per_page},
	  			dataType:"json",    //数据类型
	  			success:function(msg) //当ajax请求成功后显示的消息  msg为ajax返回的所有信息
	  			{
	  				
	  				var kk = msg.listMessages;
	  				var content = div_s;
	  				for(var i = 0; i < kk.length; i++){
	  					content += tab + span + kk[i].disname + span_ + br +
	  					span_txt + kk[i].topic + span_ + br + span_ + br +
	  					span_txt + kk[i].content + span_ + br + br +
	  					div + kk[i].distime;
	  				}
	  				content += div_;
	  			  	$("#con_start").after(content);
	  			},
          			error:function(msg) //当ajax请求失败后显示的消息
	  			{
	  				alert("失败");
	  					
	  			}
		 });
	 });
	 
	 function reply(){
		 alert("reply");
		 $("#oper_reply").show();
	 }
	 
	 function reply_(){
		alert("reply_"); 
		$("#oper_reply").hide();
	 }
	 function c_ry(){
		 alert("c_ry");
		 $("#oper_reply").hide();
	 }
	</script>
	

  </head>
  
  <body id="mainContent">
  	<div style="width:100%; height:100%; margin: 30 0; align: center">
  		<div id="con_start" style="width:100%; height: 10px"></div>
  	</div>
  		
  	</body>
  </html>