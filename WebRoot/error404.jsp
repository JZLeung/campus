<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
	<h1>你访问的页面不存在:(</h1>
	<hr>
	<h4><a href="<%=basePath%>index/index">返回首页</a></h4>
</body>
</html>