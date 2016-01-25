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
<form action="buy/buy" id="form">
	<input type="text" name="BID" hidden value="${bid}">
	<table class="saler table">
		<thead>
			<th>卖家信息</th>
		</thead>
		<tbody>
			<tr>
				<td>UID:</td>
				<td>
					${saler.UID}
					<input type="text" name="order.UID2" hidden value="${saler.UID}">
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
				<td>${user.UID}<input type="text" name="order.UID1" hidden value="${user.UID}"></td>
			</tr>
			<tr>
				<td>用户名:</td>
				<td>${user.username}</td>
			</tr>
			<tr>
				<td>请选择你的收货地址:</td>
				<td>
					<select name="order.AID" id="address">
						<s:iterator value="#request.addresses" id="address">
							<option value="${address.AID}" data-phone="${address.phone}" data-pos="${address.province } ${address.city } ${address.country }" data-contact="${address.contact}">
								${address.detail}
							</option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td>收件人：</td>
				<td><span id="contact"></span></td>
			</tr>
			<tr>
				<td>联系方式：</td>
				<td><span id="phone"></span></td>
			</tr>
			<tr>
				<td>详细地址：</td>
				<td><span id="detail"></span></td>
			</tr>
			<tr>
				<td><h3 class="red">总价：</h3></td>
				<td><h3 class="red">¥${book.price }</h3></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="确认购买" id="btn" class="btn">
					<input type="text" name="order.BID" hidden value="${book.BID}">
				</td>
			</tr>
		</tbody>
	</table>
</form>
<script>
	var $contact = $('#contact'),
		$phone = $('#phone'),
		$detail = $('#detail');
	$(document).ready(function() {

		$('#address').on('change' ,function(event) {
			event.preventDefault();
			var data = $(this).find('option:selected').data();
			var contact = data.contact,
				phone = data.phone,
				detail = data.pos+" , "+$(this).find('option:selected').text();
			$contact.text(contact);
			$phone.text(phone);
			$detail.text(detail);
		}).change();
	});
</script>
</body>
</html>