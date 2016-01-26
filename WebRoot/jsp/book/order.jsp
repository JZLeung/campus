<%@page import="java.text.SimpleDateFormat,com.campus.Class.User,com.campus.Class.Book"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购买</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/book.css">
<style>
	.red{color: red;}
	.bold{font-weight: bold;}
	th{font-size:1.2em;font-weight:bold;}
	.status{
		border-left: 6px solid #626262;
		margin-top: 10px;
		padding: 5px 10px;
		position:absolute;
		top: 10px;
		right: 10px;
	}
	.order-detail{position:relative}
	
</style>
</head>

<body>
<jsp:include page="../index/header.jsp" ></jsp:include>
	<div class="bookInfo">
	<div class="bookHead2">
		<div class="leftCover">
			<s:if test="book.cover == null || book.cover.equals('')">
				<img alt="" src="<%=basePath%>common/img/bookCover/default.png">
   			</s:if>
   			<s:else>
   				<img alt="" src="<%=basePath%>${book.cover}">
   			</s:else>
		</div>
		<div class="rightDetail">
			<h1 class="title">${book.name }</h1>
			<p><span class="summary">${book.summary }</span></p>
			<p><span class="left">发布者</span><span class="saler">${saler.username }</span></p>
			<p><span class="left">价格</span><span class="price">¥${book.price }</span></p>
			<p><span class="left">发布时间</span><span class="time">${book.publishtime}</span></p>
		</div>
	</div>
</div>
<div class="order-detail">
	<p class="status bold">
		订单状态：<span class="red" id="statue"></span>
	</p>
	<table class="saler table">
		<thead>
			<th>卖家信息</th>
		</thead>
		<tbody>
			<tr>
				<td>UID:</td>
				<td>
					${saler.UID}
				</td>
			</tr>
			<tr>
				<td>用户名:</td>
				<td>${saler.username}</td>
			</tr>
		</tbody>
	</table>
	<table class="buyer table">
		<thead>
			<th>买家信息</th>
		</thead>
		<tbody>
			<tr>
				<td>UID:</td>
				<td>${user.UID}</td>
			</tr>
			<tr>
				<td>用户名:</td>
				<td>${user.username}</td>
			</tr>
			<tr>
				<td>收货地址:</td>
				<td>
					${address.province} ${address.city} ${address.country},${address.detail}
				</td>
			</tr>
			<tr>
				<td>联系人：</td>
				<td>
					${address.contact}
				</td>
			</tr>
			<tr>
				<td>联系方式：</td>
				<td>
					${address.phone}
				</td>
			</tr>
			<tr>
				<td><h3 class="red">总价：</h3></td>
				<td><h3 class="red">¥${book.price }</h3></td>
			</tr>
		</tbody>
	</table>
</div>
	<script>
	var statue = ${order.statue},
		statues = ['等待发货','等待收货','已完成','已关闭'];
	$('#statue').text(statues[statue]);
	</script>
</body>
</html>