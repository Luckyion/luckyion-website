<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<base href="<%=basePath%>">
<link href="css/skin.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script src="js/jquery.js" type=text/javascript></script>
<script src="js/jquery.corner.js" type=text/javascript></script>
<script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="js/jquery.unobtrusive-ajax.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/table.css" type="text/css" id="" media="print, projection, screen" />
<style type="text/css">

<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
<script type=text/javascript> 
		$(function()
		{	
        $('div.demo').each(function()
        {
             eval($('span', this).text());
        });
	});
	</script>
	<script type="text/javascript">
<!--
	//验证用户名
		function checkName()
		{
			url = "userAction!findByName.action?users.username=" + $("#userName").val();
			jQuery.ajax({ 
				url:url,  //要跳转到的action
				type:"post",
				success:function(msg) //当ajax请求成功后显示的消息  msg为ajax返回的所有信息
				{
					$("#userNametxt").attr("innerHTML","<img src='images/ok.gif'><font color='green'>&nbsp;恭喜,此用户名可使用</font>");
				},
				error:function(msg) //当ajax请求失败后显示的消息
				{
					$("#userNametxt").attr("innerHTML","<img src='images/X.gif.gif'><font color='red'>&nbsp;此用户名已经存在</font>");
				}
			});
		}
		function ckuserName()
		{

			if($("#userName").val()=="")
			{
				$("#userNametxt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;用户名不能为空</font>");
			}
			else
			{
				if(($("#userName").val()).length <3 || ($("#userName").val()).length>18)
				{
					$("#userNametxt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;用户名长度为3~18个字符 </font>");
				}
				else if(($("#userName").val()).match('^[a-zA-Z]')==null)
				{
					$("#userNametxt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;用户名必须以字母开头 </font>");
				}
				else if(($("#userName").val()).match('[a-zA-Z0-9]$')==null)
				{
					$("#userNametxt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;用户名必须以字母或数字结尾 </font>");
				}
				else if(($("#userName").val()).match('^[a-zA-Z][a-zA-Z0-9_\-]{1,16}[a-zA-Z0-9]$')==null)
				{
					$("#userNametxt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;用户名由字母/数字/下划线/减号组成 </font>");
				}
				else
				{
					checkName();
				}
			}
		}
		function userNameFocus()
		{
			$("#userNametxt").attr("innerHTML","");
		}
		//密码
		function ckuserPassword1()
		{
			if($("#userPassword1").val()=="")
			{
				$("#userPassword1txt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;密码不能为空 </font>");
			}
			else
			{
				if(($("#userPassword1").val()).length<6)
				{
					$("#userPassword1txt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;您输入的密码过短,密码长度为6~16</font>");
				}
				else if (($("#userPassword1").val()).length.length>16)
				{
					$("#userPassword1txt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;您输入的密码过长,密码长度为6~16</font>");
				}
				else if(($("#userPassword1").val()).match('^[0-9]{6,16}$')!= null)
				{
					$("#userPassword1txt").attr("innerHTML","<img src='images/ok.gif'><font color='green'>&nbsp;密码强度：弱</font>");
				}
				else if(($("#userPassword1").val()).match('^[a-zA-Z]{6,20}$')!= null)
				{
					$("#userPassword1txt").attr("innerHTML","<img src='images/ok.gif'><font color='green'>&nbsp;密码强度： 中</font>");
				}
				else
				{
					$("#userPassword1txt").attr("innerHTML","<img src='images/ok.gif'><font color='green'>&nbsp;密码强度： 强</font>");
				}
			}
		}
		function userPassword1Focus()
		{
			$("#userPassword1txt").attr("innerHTML","");
		}
		//确认密码
		function ckuserPassword2()
		{
			if($("#userPassword2").val()=="")
			{
				$("#userPassword2txt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;确认密码不能为空 </font>");
			}
			else
			{
				if(($("#userPassword1").val())!=($("#userPassword2").val()))
				{
					$("#userPassword2txt").attr("innerHTML","<img src='images/X.gif'><font color='red'>&nbsp;密码不一致</font>");
				}
				else
				{
					$("#userPassword2txt").attr("innerHTML","<img src='images/ok.gif'><font color='green'>&nbsp;密码一致</font>");
					
				}
			}
		}
		//提交验证
		function submitCheck()
		{
			if($("#userName").val()=="")
			{
				alert("用户名不能为空");
				return false;
			}
			else if($("#userPassword1").val()=="")
			{
				alert("密码不能为空");
				return false;
			}
			else if($("#userPassword2").val()=="")
			{
				alert("确认 密码不能为空");
				return false;
			}
			document.getElementById("AddForm").submit();
		}
		function changimg()
		{
			var ip = new ImagePreview( $$("idFile"), $$("idImg"), {
				maxWidth: 120, maxHeight: 120, action: "viewImg.jsp"
			});
			ip.img.src = ImagePreview.TRANSPARENT;
			ip.file.onchange = function(){ ip.preview(); };
		}
		//样式
		function onover(obj)
		{
			obj.style.borderColor='lightgreen';
			obj.style.backgroundColor='lightcyan';
		}
		function onout(obj)
		{
			obj.style.borderColor='silver';
			obj.style.backgroundColor='white';
		}
//-->
</script>
<body>
<s:form id="AddForm" action="userAction!updateUser.action" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">添加用户</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">
        <table width="800px"  align="center" border="0px"  cellpadding="5px" cellspacing="0px"> 
     					<tr>
     						<th width="190px" align="right">用户名</th>							
     						<td width="170px">
     						<input class="input2" type="hidden" name="users.userid" id="userId" value="<s:property value="users.userid"/>">
     						<input class="input2" type="text" name="users.username" id="userName" value="<s:property value="users.username"/>" readonly="readonly"/></td>
     						<td align="left" width="340px" id="userNametxt" style="font-size: 12px">&nbsp;</td>
     					</tr>
     					<tr>
     						<th align="right">密码</th>
     						<td><input class="input2" type="password" name="users.userpassword" id="userPassword1" onblur="ckuserPassword1();onout(this)" onfocus="userPassword1Focus();onover(this)"  /></td>
     						<td id="userPassword1txt" align="left" style="font-size: 12px">&nbsp;</td>
     					</tr>
     					<tr>
     						<th align="right">确认密码</th>
     						<td><input class="input2" type="password" id="userPassword2" onblur="ckuserPassword2();onout(this)" onfocus="userPassword2Focus();onover(this)" /></td>
     						
     						<td id="userPassword2txt" align="left" style="font-size: 12px">&nbsp;</td>
     					</tr>
     					<tr>
     						<th align="right">真实姓名</th>
     						<td><input class="input2" type="text" name="users.userrealname" id="userRealName" onblur="onout(this)" onfocus="onover(this)"/></td>
     						<td id="userRealNametxt" align="left" style="font-size: 12px">&nbsp;</td>
     					</tr>
     					<tr>
     						<th align="right">Email</th>
     						<td colspan="2"><input class="input1" type="text"  name="users.email" id="userEmail" onblur="ckuserEmail();onout(this)" onfocus="userEmailFocus();onover(this)" />
     						</td>
     						<td id="userEmailtxt" align="left" style="font-size: 12px">&nbsp;</td>
     					</tr>
     					<tr>
     						<td></td>
     					    <td colspan="2" align="left">
     					    	<input type="submit"  border="0px" style="cursor:pointer; background:url(images/bootnbg.jpg); width:70px;height: 30px;border-style:none; " value="修改" onclick="return submitCheck()" /></td>
     						<td></td>
     					</tr>
     				</table>
        </td>
      </tr>
      <tr>
      <td width="60%">      	
      </td>
      </tr>
      <tr>
        <td height="40" colspan="4"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
          <tr>
            <td></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="2%">
        <img src="images/icon-mail2.gif" width="16" height="11"> 邮箱邮箱：<a href="mailto:772134112@qq.com" target="_black">772134112@qq.com</a><br>
              <img src="images/title.gif" width="17" height="14"> 网站首页：<a href="http://luckyion.oicp.net/WebSite" target=_black>luckyion.oicp.net</a>
        </td>
        <td width="51%" class="left_txt"></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</s:form>
</body>

