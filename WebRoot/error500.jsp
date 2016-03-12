<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.io.PrintStream"%>  
<%@page import="java.io.ByteArrayOutputStream"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>404-校园二手书交易网</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="jsp,campus,book,second-hand">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/index.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/popup.css">
    <style type="text/css">
    	h1,h2,h3,h4,h5,h6{text-align:center;}
    	hr{margin:10px 0;}
    	h4 a{text-decoration:underline !important;color: red}
    </style>
</head>

<body>
    <jsp:include page="jsp/index/header.jsp"></jsp:include>
	 <div class="ui-alert-panel">
		<h1>服务器内部错误</h1>
		<p>处理您的请求时发生错误！请确认您通过正确途径操作。</p>
	</div>
</body>
</html>