<%@page import="com.demo1.User"%>
<%@page import="com.demo1.UserInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'serverLogin.jsp' starting page</title>
    
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
    <%
    	String logName=request.getParameter("logName");
    	String logPwd=request.getParameter("logPwd");
    	boolean isOk=UserInfo.findUser(logName, logPwd);
    	if(isOk==false){
    		String msg="<script>alert('用户名或密码错误！');</script>";
    		request.setAttribute("msg",msg);
    		request.setAttribute("status", "500");
  			request.getRequestDispatcher("login.jsp").forward(request,response);
    	}else{
    		User user=new User(logName,logPwd);
    		session.setAttribute("user", user);
    		
    		Integer num=Integer.valueOf(application.getAttribute("num")==null?"0":application.getAttribute("num").toString());
    		num++;
    		application.setAttribute("num", num++);
    		
    		Cookie co_logname=new Cookie("username",logName);
    		co_logname.setMaxAge(3600);
    		Cookie co_logpwd=new Cookie("userpwd",logPwd);
    		co_logpwd.setMaxAge(3600);
    		response.addCookie(co_logname);
    		response.addCookie(co_logpwd);
    		response.sendRedirect("index.jsp");
    	}
     %>
  </body>
</html>
