<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%=request.getAttribute("msg") %>
  	<%
  		String status=String.valueOf(request.getAttribute("status"));
  		Cookie[] coArray = request.getCookies();
  		String username="";
  		String userpwd="";
  		if(coArray!=null){
  			for(Cookie cookie:coArray){
	  			if("username".equals(cookie.getName())){
	  				username=cookie.getValue();
	  			}else if("userpwd".equals(cookie.getName())){
	  				userpwd=cookie.getValue();
	  			}
  			}
  		}
  		if(!status.equals("500")){
  			String url="serverLogin.jsp?logname="+username+"&logpwd="+userpwd;
  			request.getRequestDispatcher(url).forward(request, response);
  		}
  		
  	 %>
    <form action=serverLogin.jsp method="post">
    	<label>用户名：<input name="logName" ></label><br>
    	<label>密码：<input name="logPwd" type="password"></label><br>
    	<button type="submit">登录</button>
    	<button onclick="javascript:location.href='register.jsp'">注册</button>
	</form>
	</body>
	</html>
