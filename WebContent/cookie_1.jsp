<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="login.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String username="";
	int visitTime=0;
	Cookie[] cookies=request.getCookies();
	for(int i=0;cookies!=null&&i<cookies.length;i++){
		Cookie cookie= cookies[i];
		if("username".equals(cookie.getName())){
			username=cookie.getValue();
		}else if("visitTime".equals(cookie.getName()))
		{
			visitTime=Integer.parseInt(cookie.getValue());
			cookie.setValue(""+ ++visitTime);
		}
	}
	if(username==null||username.trim()==""){
		throw new Exception("你还没有登陆，请先登录");
	}
	Cookie visitTimeCookie=new Cookie("visitTime",Integer.toString(++visitTime));
	response.addCookie(visitTimeCookie);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cookie</title>
</head>
<body>
	<div align="center" style="margin:10px;">
		<fieldset>
			<legend>登录信息</legend>
			<form action="login.jsp" method="post">
				<table>
					<tr>
						<td>您的账号：</td>
						<td><%=username %></td>
					</tr>
					<tr>
						<td>登陆次数</td>
						<td><%=visitTime %></td>
					</tr>
					<tr>
						<td></td>
						<td>
						<input type="button" value="刷新" onclick="location='<%=request.getRequestURI()%>?ts='+new Date().getTime();" class="button">
						</td>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
</body>
</html>