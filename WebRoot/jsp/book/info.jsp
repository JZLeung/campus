<%@ page language="java" import="java.util.*,com.campus.Class.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>商品已下架</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/index.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/popup.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/jquery.carousel.css">
</head>

<body>
	<jsp:include page="../index/header.jsp" ></jsp:include>
	<h1>非常抱歉，你的操作不合法。</h1>
	<h3>${error }</h3>
</body>
</html>