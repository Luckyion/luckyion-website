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
	-->
	</script>
	<script type="text/javascript">
<!--
		//删除
		function dele()
		{
			var cbs=document.getElementsByName("cbox");
			var ss="";			
			for(var i =0 ; i<cbs.length;i++)
			{
				if(cbs[i].checked)
				{
					ss=cbs[i].value;
				}
			}
			if(ss!="")
			{
				if(confirm("确定要删除?删除后将无法恢复"))
				{
					location.href="delUser?regUsers.username="+ss;
				}
			}
			else
			{
				alert("请至少选择一条要删除的记录");
			}
		}
		
		function msgdistribute(){						
			location.href="Jsps/Messages/msgdistribute.jsp";
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
     						<td width="60%" align="left"><a style="cursor: pointer" onclick="window.history.go(-1);"><img alt="返回" width="15px" height="15px" style="border-style: none;" src="images/pic25.gif" /></a>
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
            <td>
            </td>
          </tr>
        </table></td>
      </tr>
       <tr>
        <td> 
        	<div style=" float:right; width:28%; text-align:right;">
                       <input type="button" name="btnSave" value="发 布" id="btnSave" class="button" onclick="msgdistribute();"/>                            
                     </div>         	   	
        </td>
        </tr>
      <tr>
        <td colspan="2">
        <table class="show" cellspacing="1">         
     					<thead>
     					<tr bgcolor="#EEF2FB" style="text-align: left">
     						<th>消息类别</th>
  							<th>标题</th>
  							<th>发布时间</th>				
     						<th>操作</th>
     					</tr>
     					</thead>
     					<tbody>
     					<s:iterator value="listMessages" id="e">
     						<tr>
     							<td><input type="hidden" value="<s:property value="#e.id"/>">
     							<s:property value="#e.msgtype"/></td>
     							<td><s:property value="#e.topic"/></td>
     							<td><s:property value="#e.distime"/></td>
     							<td >
     							<a href="messageDistribute!editMessage.action?messages.id=<s:property value="#e.id"/>"><img style="border-style: none;" src="images/edit.gif"/></a>
     							<a href="messageDistribute!deleteMessage.action?messages.id=<s:property value="#e.id"/>"><img style="border-style: none;" src="images/delete.gif"/></a>
     							</td>
     						</tr>
     					</s:iterator>
     					</tbody>
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
</body>

