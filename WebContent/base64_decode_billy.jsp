<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="sun.misc.BASE64Decoder"/>
<jsp:directive.page trimDirectiveWhitespaces="true"/>
<jsp:directive.page import="java.net.URLEncoder"/>
<jsp:directive.page import="java.net.URLDecoder"/>
<%
	// 清除输出
	out.clear();
	
	for(Cookie cookie : request.getCookies()){
		String cookieName=URLDecoder.decode(cookie.getName(),"UTF-8");
		if(cookieName.equals("file")){
		
			// 从 Cookie 中取二进制数据
			String cookieValue=URLDecoder.decode(cookie.getValue(),"UTF-8");
			byte[] binary = BASE64Decoder.class.newInstance().decodeBuffer(cookieValue.replace(" ", ""));
			
			// 设置内容类型为 gif 图片
			response.setHeader("Content-Type", "image/gif");
			response.setHeader("Content-Disposition", "inline;filename=cookie.gif");
			response.setHeader("Connection", "close");
			
			// 设置长度
			response.setContentLength(binary.length);
			
			// 输出到客户端
			response.getOutputStream().write(binary);
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
			return;
		}
	}
	
%>