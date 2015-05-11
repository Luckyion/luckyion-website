<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<base href="<%=basePath%>">
<link href="css/skin.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /><style type="text/css">
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
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">欢迎界面</div></td>
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
        <td colspan="2" valign="top"><span class="left_bt"></span><br>
              <br>
            <span class="left_txt">&nbsp;<img src="images/ts.gif" width="16" height="16"> 提示：<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎登录Luckyion个人网站后台管理系统</span> <br>
</span></td>
        <td width="7%">&nbsp;</td>
        <td width="40%" valign="top"><table width="100%" height="144" border="0" cellpadding="0" cellspacing="0" class="line_table">
          <tr>
            <td width="7%" height="27" background="images/news-title-bg.gif"><img src="images/news-title-bg.gif" width="2" height="27"></td>
            <td width="93%" background="images/news-title-bg.gif" class="left_bt2">最新动态</td>
          </tr>
          <tr>
            <td height="102" valign="top">&nbsp;</td>
            <td height="102" valign="top"></td>
          </tr>
          <tr>
            <td height="5" colspan="2">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;></td>
      </tr>
      <tr>
        <td colspan="2" valign="top"><!--JavaScript部分-->
              <SCRIPT language=javascript>
function secBoard(n)
{
for(i=0;i<secTable.cells.length;i++)
secTable.cells[i].className="sec1";
secTable.cells[n].className="sec2";
for(i=0;i<mainTable.tBodies.length;i++)
mainTable.tBodies[i].style.display="none";
mainTable.tBodies[n].style.display="block";
}
          </SCRIPT>
          <TABLE class=main_tab id=mainTable cellSpacing=0
cellPadding=0 width=100% border=0>
                
                <!--关于cells集合-->
                <TBODY style="DISPLAY: none">
                  <TR>
                    <TD vAlign=top align=middle></TD>
                  </TR>
                </TBODY>
                <!--关于tBodies集合-->
                <TBODY style="DISPLAY: none">
                  <TR>
                    <TD vAlign=top align=middle><TABLE width=98% border=0 align="center" cellPadding=0 cellSpacing=0>
                    </TABLE></TD>
                  </TR>
                </TBODY>
                <!--关于display属性-->
                <TBODY style="DISPLAY: none">
                  <TR>
                    <TD vAlign=top align=middle><TABLE width=98% border=0 align="center" cellPadding=0 cellSpacing=0>
                    </TABLE></TD>
                  </TR>
                </TBODY>
            </TABLE></td>
        <td>&nbsp;</td>
        <td valign="top"></td>
      </tr>
      <tr>
        <td height="40" colspan="4"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
          <tr>
            <td></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="2%">&nbsp;</td>
        <td width="51%" class="left_txt"><img src="images/icon-mail2.gif" width="16" height="11"> 邮箱邮箱：<a href="mailto:772134112@qq.com" target="_black">772134112@qq.com</a><br>
              <img src="images/icon-phone.gif" width="17" height="14"> 网站首页：<a href="http://luckyion.oicp.net/WebSite" target=_black>luckyion.oicp.net</a></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>

