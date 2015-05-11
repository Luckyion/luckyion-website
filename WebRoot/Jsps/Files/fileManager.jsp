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
	KindEditor.ready(function(K) {
		var editor = K.editor({
			uploadJson: 'fileUpload.action',
			allowFileManager : true
		});
		K('#image3').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#url3').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#url3').val(url);
						editor.hideDialog();
						updatetype();
					}
				});
			});
		});
	});
	-->
	</script>
	<script type="text/javascript">
<!--
		//删除
		function del(ss)
		{
			if(ss!="")
			{
				if(confirm("确定要删除?删除后将无法恢复"))
				{
					location.href="fileManager!deleteFile.action?files.fileid="+ss;
				}
			}
		}
		//查询
		function selectUsers()
		{
			if($("#selectUser").val()=="")
			{
				alert("请选择查询条件");
			}
			else if($("#selectUser").val()==0)
			{
				$("form:first").submit();  //提交表单
			}
			else
			{
				if( $("#valuetxt").val()=="")
				{
					alert("请输入信息");
				}
				else
				{
					$("form:first").submit();  //提交表单
				}
			}
		}
		
		function updatetype(){
			var type = $("#typeList").val();
			var url3 = $("#url3").val();
			alert(type + "_ " + url3);
			location.href = "fileManager!updateType.action?files.filename=" + url3
					+ "&files.ftype=" + type;
		}
//-->
</script>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">文件上传</div></td>
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
     						<!-- <input type="text" style="width: 80px" id="valuetxt" name="infomations"/>
     							<a href="javaScript:selectUsers()"><img style="border-style: none;" src="images/vie.gif"/></a>&nbsp;&nbsp; -->
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
        <td width="30%">
        	<input type="text" id="url3" value="" /> <input type="button" id="image3" value="选择" />（本地上传）
        	        	
        </td>
        <td width="20%">
        	类型选择：<select id="typeList" name="files.ftype" style="height:22px;width:120px;">
        				<option selected="selected" value="0">-请选择-</option>
						<option value="3">娱乐和游戏</option>
						<option value="4">学生时代</option>
						<option value="5">生活时光</option>
						<option value="6">时光轴</option>
						<option value="7">自由贴</option>
						<option value="1">左侧画廊</option>
						<option value="2">中间画廊</option>
						<option value="8">文件下载</option>
					</select>
        </td>
        </tr>
      <tr>
        <td colspan="2">
        <table class="show" cellspacing="1">         
     					<thead>
     					<tr bgcolor="#EEF2FB" style="text-align: left">
     						<th>文件名称</th>
  							<th>文件类型</th>
  							<th>显示位置</th>  											
     						<th>操作</th>
     					</tr>
     					</thead>
     					<tbody>
     					<s:iterator value="listFiles" id="e">
     						<tr>
     							<td>
     							<input type="hidden" value="<s:property value="#e.fileid"/>">
     							<s:property value="#e.filename"/></td>
     							<td><s:property value="#e.fileformat"/></td>
     							<td><s:property value="#e.ftype"/></td>
     							<td >
     								<a href="javascript:del(<s:property value="#e.fileid"/>);"><img style="border-style: none;" src="images/delete.gif"/></a>
     							</td>
     						</tr>
     					</s:iterator>
     					</tbody>
     				</table>
     				<div>
      <table width="800px" style="color:#3366FF;font-size:14px;font-weight: bold">
     		<tr>
     			<td align="left">
     			&nbsp;&nbsp;&nbsp;&nbsp;共有   ${totalCounts} 条记录,当前第    ${pagecur} / ${totalPages} 页
     			</td>
     			<td align="right" id="fenye">
     					<a href="javascript:fenye(1)"><img  style="border-style: none;" src="images/icons/firstPage.gif"/></a>&nbsp;&nbsp;
     						<s:if test="%{pagecur>1}">
     							<a href="javascript:fenye(${requestScope.pagecur}-1)"><img style="border-style: none;" src="images/icons/prePage.gif"/></a>&nbsp;&nbsp;
     						</s:if>
     						<s:else>
     							<a><img style="border-style: none;" src="images/icons/prePage.gif"/></a>&nbsp;&nbsp;
     						</s:else>
     						<s:if test="%{pagecur < totalPages}">
     							<a href="javascript:fenye(${requestScope.pagecur}+1)"><img  style="border-style: none;" src="images/icons/nextPage.gif"/></a>&nbsp;&nbsp;
     						</s:if>	
     						<s:else>
     							<a><img  style="border-style: none;" src="images/icons/nextPage.gif"/></a>&nbsp;&nbsp;
     						</s:else>	
     						<a href="javascript:fenye(${requestScope.totalPages})"><img  style="border-style: none;" src="images/icons/endPage.gif"/></a>&nbsp;&nbsp;
     						转到第<input type="text" style="width:30px" id="jumppage"/>页<a href="javascript:jump()"><img style="border-style: none;" src="images/icons/go.gif"/></a>
     				<input type="hidden" name="pagecur">
     			</td>
     		</tr>
     	</table>
    </div>
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
        </table>
        </td>
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
    </table>
    </td>
  </tr>  
</table>
</body>

