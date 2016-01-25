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
<div class="infoDetail">
	<div class="tabList">
		<a href="user/index" class="active">个人信息</a>
		<a href="javascript:void(0)">我的订单</a>
		<a href="user/myCollections">我的收藏</a>
		<a href="user/myBooks">我发布的商品</a>
		<a href="javascript:void(0)">我的评价</a>
	</div>
	<div class="orders">
	<s:iterator value="#request.orders" id="order" status="st">
		<div class="order">
			<p class="publisher" data-uid2="${order.UID2}" data-id="${st.index}"></p>
			<span class="statue" data-statue="${order.statue}">${order.statue}</span>
			<div class="left">
				<img src="<%=basePath%>common/img/bookCover/default.png" alt="" data-bid="${order.BID}" data-id="${st.index}">
			</div>
			<div class="right">
				<p class="title" data-bid="${order.BID }"  data-id="${st.index} "></p>
			</div>
			<div class="clearfix"></div>
			<p class="amount">${order.amount }</p>
		</div>
	</s:iterator>
	</div>
</div>
	<script>
		var publishers = JSON.parse('${json_pulishers}'),
			books = JSON.parse('${json_books}'),
			adds = JSON.parse('${json_addresses}');
		$('.order').each(function(index, el) {
			var $p = $(this).find('.publisher'),
				$i = $(this).find('.left img');
			$p.text(publishers[$p.data('id')]['username']);
			console.log($p.data());
			if (books[$i.data('id')]['cover'] != '') {
				$i.attr('src', '<%=basePath%>'+books[$i.data('id')]['cover']);
			}
		});
	</script>
</body>
</html>