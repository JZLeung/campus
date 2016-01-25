<%@page import="com.campus.Class.Address,com.campus.Class.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>我的个人中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/user.css">
	<script src="<%=basePath%>common/js/city.js"></script>
	<style>
		
	</style>
</head>

<body>
	<jsp:include page="../index/header.jsp" ></jsp:include>
	<div class="orders">
	<s:iterator value="#request.orders" id="order">
		<div class="order">
			<p class="publisher" data-uid2="${order.UID2}"></p>
			<span class="statue" data-statue="${order.statue}"></span>
			<div class="left">
				<img src="" alt="" data-bid="${order.bid}">
			</div>
			<div class="right">
				<p class="title" data-bid="${order.bid }"></p>
			</div>
			<p class="amount">${order.amount }</p>
		</div>
	</s:iterator>
	</div>
	<script>
		var publishers = '${json_publishers}',
			books = '${json_books}';
	</script>
</body>
</html>