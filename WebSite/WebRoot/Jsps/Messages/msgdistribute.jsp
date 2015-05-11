<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<base href="<%=basePath%>">
<link href="css/skin.css" rel="stylesheet" type="text/css" />
<link href="css/table.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script src="js/jquery.js" type=text/javascript></script>
<script src="js/jquery.corner.js" type=text/javascript></script>
<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
<script charset="utf-8" src="kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
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
	<!--
		$(function()
		{	
        $('div.demo').each(function()
        {
             eval($('span', this).text());
        });
	});	
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			resizeType : 1,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link'],
				afterBlur:function(){this.sync();}
		});
	});

	-->		
	</script>
	<script type="text/javascript">
<!--
		//添加
		function save()
		{
			var text = $("#text_w").val();
			if(text == ""){
				alert("请输入内容!");
				return;
			}
			var topic = $("#topic").val();
			if(topic == ""){
				alert("请输入标题!");
				return;
			}
			var type = $("#typeList").val();
			if(type == "0"){
				alert("请选择类别！");
				return;
			}
			alert(text);
			location.href="messageDistribute!saveMessage.action?messages.content=" 
					+ text + "&messages.msgtype=" + type + "&messages.topic=" + topic;
		}
//-->
</script>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">消息发布</div></td>
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
        <td colspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
     					<tr>
     						<td width="60%" align="left">当前位置：栏目分类管理 > 消息发布
     						</td>
     						<td>
     						</td>
     					</tr>
     		</table>
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
        <td>
        	<strong>标题：</strong><input name="messages.topic" type="text" id="topic" style="width:300px;" />
        	 类型选择：<select id="typeList" style="height:22px;width:120px;">
        				<option selected="selected" value="0">-请选择-</option>
						<option value="M0">动态</option>
						<option value="M1">心情</option>
						<option value="M2">展望</option>
						</select>   	
        </td>
        </tr>
        <tr>
        <td>
        	<div style=" float:left; width:60%;"><strong>内容：</strong>
                      <span class="font_text1"></span>
                     </div>
                     <div style=" float:right; width:28%; text-align:right;">
                       <input type="button" name="btnSave" value="发 布" id="btnSave" class="button" onclick="save();"/>                            
                     </div>                	
        </td>
        </tr>
      <tr>
        <td colspan="2">
        <form>
			<textarea id="text_w" name="content" style="width:700px;height:200px;visibility:hidden;"></textarea>
		</form>
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
</body>

