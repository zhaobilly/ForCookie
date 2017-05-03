<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="java.net.URLEncoder"/>
<jsp:directive.page import="java.net.URLDecoder"/>
<%
	Cookie cookie=new Cookie(URLEncoder.encode("姓名","UTF-8"),URLEncoder.encode("上帝","UTF-8"));
	response.addCookie(cookie);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Encoding</title>
</head>
<body>
	<%
		if(request.getCookies()!=null){
			for(Cookie cc:request.getCookies()){
				String cookieName=URLDecoder.decode(cc.getName(),"UTF-8");
				String cookieValue=URLDecoder.decode(cc.getValue(),"UTF-8");
				out.println(cookieName+"=");
				out.println(cookieValue+";<br/>");
			}
		}else{
			out.println("Cookie 已经写入客户端，请刷新");
		}
	%>
</body>
</html>