<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <TITLE>用户登录</TITLE><LINK 
	href="css/User_Login.css" type=text/css rel=stylesheet>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	
	<script type="text/javascript">
	function login(){
		document.getElementById("IbtnEnter").submit();
	}
	
	function key()
	{
		if(event.keyCode==13)
		{
		//alert("ENTER");
			login();
		}
	}
	</script>
  </head>
  
 <BODY id=userlogin_body>
 <s:form action="loginAction!login" method="post">
<DIV></DIV>

<DIV id=user_login>
<DL>
  <DD id=user_top>
  <UL>
    <LI class=user_top_l></LI>
    <LI class=user_top_c></LI>
    <LI class=user_top_r></LI></UL>
  <DD id=user_main>
  <UL>
    <LI class=user_main_l></LI>
    <LI class=user_main_c>
    <DIV class=user_main_box>
    <UL>
      <LI class=user_main_text >用户名： </LI>
      <LI class=user_main_input><INPUT class=TxtUserNameCssClass id=TxtUserName 
      maxLength=20 name="users.username"> </LI></UL>
    <UL>
      <LI class=user_main_text >密 码： </LI>
      <LI class=user_main_input><INPUT class=TxtPasswordCssClass id=TxtPassword 
      type=password name="users.userpassword"> </LI></UL>
    <UL>
      <LI class=user_main_text>Cookie： </LI>
      <LI class=user_main_input><SELECT id=DropExpiration name=DropExpiration> 
        <OPTION value=None selected>不保存</OPTION> <OPTION value=Day>保存一天</OPTION> 
        <OPTION value=Month>保存一月</OPTION> <OPTION 
      value=Year>保存一年</OPTION></SELECT> </LI></UL></DIV></LI>
    <LI class=user_main_r><INPUT class=IbtnEnterCssClass id=IbtnEnter 
    style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
    type=image src="images/user_botton.gif" name=IbtnEnter onclick="login();"> </LI></UL>
  <DD id=user_bottom>
  <UL>
    <LI class=user_bottom_l></LI>
    <LI class=user_bottom_c> </LI>
    <LI class=user_bottom_r></LI></UL></DD></DL></DIV><SPAN id=ValrUserName 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrPassword 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrValidateCode 
style="DISPLAY: none; COLOR: red"></SPAN>
<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>

<DIV></DIV>

</s:form></BODY>
</html>
