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
	<title>后台管理中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/admin.css">
	<style>
		.right table{    
			width: 100%;
			border-collapse: separate;
		    text-align: center;}
		td{text-align: center;border-top: 1px solid #666666;padding: 10px;}
		th{text-align: center;}
		.even{background-color: #F1EFBC ;}
		tbody tr:hover{background-color: #B5B5B5}
		thead tr{padding: 20px;}
		.orders{padding: 10px;padding-top:20px;}
		h2{padding:0 20px;text-align:center;line-height:2em;}
	</style>
</head>

<body>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="right">
		<div id="orders" class="orders">
			<h2>所有商品信息</h2>
			<table id="all-orders">
				<thead>
					<tr>
						<th>ID</th>
						<th>书名</th>
						<th>订单开始时间</th>
						<th>总价</th>
						<th>状态</th>
						<!--<th>注册时间</th>
						<th>上次登录时间</th>
						 <th>地址</th>
						<th>收藏</th> -->
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#request.allOrders" id="order">
						<tr data-id="${order.OID }">
							<td>${order.OID }</td>
							<td>${order.BID }</td>
							<td>${order.starttime }</td>
							<td>￥<span class="red">${order.amount }</span></td>
							<td>${order.statue }</td>
							<%-- <td>${user.registtime }</td>
							<td>${user.lastlogin }</td>
							<td class="address" data-data="${user.address}"></td>
							<td class="collection" data-data="${user.collection}"></td> --%>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		<div id="neworder" class="orders">
			<h2>新商品信息（一周内）</h2>
			<table id="all-orders">
				<thead>
					<tr>
						<th>ID</th>
						<th>书名</th>
						<th>订单开始时间</th>
						<th>总价</th>
						<th>状态</th>
						<!--<th>注册时间</th>
						<th>上次登录时间</th>
						 <th>地址</th>
						<th>收藏</th> -->
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#request.newOrders" id="order">
						<tr data-id="${order.OID }">
							<td>${order.OID }</td>
							<td>${order.BID }</td>
							<td>${order.starttime }</td>
							<td>￥<span class="red">${order.amount }</span></td>
							<td>${order.statue }</td>
							<%-- <td>${user.registtime }</td>
							<td>${user.lastlogin }</td>
							<td class="address" data-data="${user.address}"></td>
							<td class="collection" data-data="${user.collection}"></td> --%>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</div>
	<script src="<%=basePath%>common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script>
	$(document).ready(function() {
		$('.list').find('a').eq(3).addClass('active');
		$('body').scrollTop($('#${hash}').scrollTop());
		$('tbody tr').each(function(index, el) {
			var self = $(this);
			var $a = self.find('.isactive');

				/* $b = self.find('.address'),
				$c = self.find('.collection'); */
			/* var db = $b.data('data').split(',') || '',
				dc = $c.data('data').split(',') || '';
			console.log(index+":"+db+"-"+dc ); */
			$a.text($a.text() == '0' ? '未激活' : '已激活');
			/* $b.text(db.length);
			$c.text(dc.length); */
			if (index % 2 != 0) {self.addClass('even')};
		})
	});
	</script>
</body>
</html>