<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="sun.misc.BASE64Encoder"/>
<jsp:directive.page import="java.io.InputStream"/>
<jsp:directive.page import="java.io.File"/>
<jsp:directive.page import="java.net.URLEncoder"/>
<jsp:directive.page import="java.net.URLDecoder"/>
<%
	File file=new File(this.getServletContext().getRealPath("cookie.gif"));
	byte[] binary=new byte[(int)file.length()];
	InputStream ins=this.getServletContext().getResourceAsStream(file.getName());
	ins.read(binary);
	ins.close();
	String content=BASE64Encoder.class.newInstance().encode(binary);
	Cookie cookie=new Cookie(URLEncoder.encode("file","UTF-8"),URLEncoder.encode(content,"UTF-8"));
	response.addCookie(cookie);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>base64</title>
</head>
<body>
从 Cookie 中获取到的二进制图片：<img src="base64_decode.jsp" /> <br/>
<textarea id='cookieArea' style='width:100%; height:200px; '></textarea>
<script type="text/javascript">cookieArea.value=document.cookie;</script>
</body>
</html>