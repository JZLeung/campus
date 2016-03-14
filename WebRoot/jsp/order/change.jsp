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
<form action="" hidden id="order">
<input type="hidden" name="order.statue" value="${order.statue}">
<input type="hidden" name="order.OID" value="${order.OID}">
</form>
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
			<tr>
				<td>
					<a href="javascript:void(0)" class="btn" id="send">发货</a>
				</td>
				<td>
					<a href="javascript:void(0)" class="btn" id="cancel">取消订单</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="popup-mask" id="mask1">
<div class="popup-box" id="sendBox">
	<form action="" id="order2">
		<div class="popup-title">
			<h2>发货</h2>
		</div>
		<div class="popup-content">
			<table style="width:100%;border-collapse: separate;border-spacing: 5px 10px;">
				<input type="hidden" name="order.OID" value="${order.OID}">
				<input type="hidden" name="order.statue" value="1">
				<tr style="width:100%;">
					<td><span class="red">*</span>快递公司：</td><td><input type="text" name="order.express" style="width:100%;"></td>
				</tr>
				<tr>
					<td><span class="red">*</span>运单号码：</td><td><input type="text" name="order.expressnum" style="width:100%;"></td>
				</tr>
				<tr>
					<td><span class="red">*</span>发货地址：</td><td><input type="text" name="order.senderadd" style="width:100%;"></td>
				</tr>
			</table>
		</div>
		<div class="popup-footer">
			<div class="btn-group">
				<button class="btn btn-cancel" data-toggle="cancel">取消</button>
				<button class="btn btn-ok"  data-toggle="confirm">确认发货</button>
			</div>
		</div>
	</form>
</div>
</div>
	<script>
	var statue = ${order.statue},
		statues = ['等待发货','等待收货','已完成','已关闭'];
	var $popup = $('#mask1'),
		$sendBox = $('#sendBox');
	$('#statue').text(statues[statue]);
	if (statue >= 1) {$('td a').each(function(i,v){$(this).remove();})};
	$(document).ready(function() {
		$('#cancel').click(function(e){
			e.preventDefault();
			if (!confirm('确认要取消订单吗？')) {return;};
			$('#order').find('[name="order.statue"]').val(flag ? 2 : 3);
			$.post('<%=basePath%>buy/change', $('#order').serialize(), function(data, textStatus, xhr) {
				if (data == 1) {
					alert('取消订单成功');
					$('#statue').text(statues[flag ? 2 : 3]);
					$('td a').each(function(i,v){$(this).remove();});
				}
			});
		});

		$('#send').click(function(event) {
			$popup.show();
			$sendBox.show();
		});

		$('.btn-group').on('click', 'button', function(event) {
			event.preventDefault();
			var toggle = $(this).data('toggle');
			if (toggle == 'cancel') {$popup.hide();}
			else{
				$sendBox.find('input').each(function(index, el) {
					if ($(this).val() == '') {
						alert($(this).parent().prev().text().substr(1,4)+"不能为空");
						return false;
					}
				});
				$.post('<%=basePath%>buy/change', $('#order2').serialize(), function(data, textStatus, xhr) {
					if (data == 1) {
						alert('发货成功');
						$popup.hide();
						$('#statue').text(statues[1]);
						$('td a').each(function(i,v){$(this).remove();});
					}
				});
			}
		});
	});
	</script>
</body>
</html>