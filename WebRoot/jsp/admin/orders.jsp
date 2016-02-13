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
		.book:hover,.user:hover{cursor: pointer;color: #fff;}
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
						<th>买家</th>
						<th>卖家</th>
						<th>订单开始时间</th>
						<th>总价</th>
						<th>状态</th>
						
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#request.allOrders" id="order">
						<tr data-id="${order.OID }">
							<td>${order.OID }</td>
							<td data-id="${order.BID }" class="book">${order.BID }</td>
							<td data-id="${order.UID1 }" class="allbuyer buyer user">${order.UID1 }</td>
							<td data-id="${order.UID2 }" class="allsaler saler user">${order.UID2 }</td>
							<td>${order.starttime }</td>
							<td>￥<span class="red">${order.amount }</span></td>
							<td data-id="${order.statue }" class="statue"></td>
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
			<table id="new-orders">
				<thead>
					<tr>
						<th>ID</th>
						<th>书名</th>
						<th>买家</th>
						<th>卖家</th>
						<th>订单开始时间</th>
						<th>总价</th>
						<th>状态</th>
						
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#request.newOrders" id="order">
						<tr data-id="${order.OID }">
							<td>${order.OID }</td>
							<td data-id="${order.BID }" class="book">${order.BID }</td>
							<td data-id="${order.UID1 }" class="newbuyer buyer user">${order.UID1 }</td>
							<td data-id="${order.UID2 }" class="newsaler saler user">${order.UID2 }</td>
							<td>${order.starttime }</td>
							<td>￥<span class="red">${order.amount }</span></td>
							<td data-id="${order.statue }" class="statue"></td>
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
	<div class="mask" id="mask"></div>
	<div class="detail2" id="detail">
		<div class="close">关闭</div>
		<h2 class="username"></h2>
		<h4 class="uid"></h4>
		<p class="lastlogin"></p>
		<p class="registtime"></p>
	</div>
	<script src="<%=basePath%>common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script>
		var allPublishers, newPublishers, pf = false,
			allBuyers, newBuyers, bf1 = false,
			allBooks, newBooks, bf2 = false; 
		var $popup = $('#detail'),
			$mask = $('#mask');
		$(document).ready(function() {
			
			var statue = ['等待发货','等待收货','已完成','已关闭'];
			$.get('admin/getPublishers', function(data) {
				//console.log(data);
				data = $.parseJSON(data);
				allPublishers = data['all'];
				newPublishers = data['new'];
				pf = true;
				checkIsOK();
			});
			$.get('admin/getCustomers', function(data) {
				//console.log(data);
				data = $.parseJSON(data);
				allBuyers = data['all'];
				newBuyers = data['new'];
				bf1 = true;
				checkIsOK();
			});
			$.get('admin/getBooks', function(data) {
				//console.log(data);
				data = $.parseJSON(data);
				allBooks = data['all'];
				newBooks = data['new'];
				bf2 = true;
				checkIsOK();
			});
			$('.list').find('a').eq(3).addClass('active');
			$('body').scrollTop($('#${hash}').scrollTop());

			function checkIsOK () {
				if (pf && bf1 && bf2) {
					setDatas();
				}
			}
			//setTimeout(500,checkIsOK());
			function setDatas () {
				$('#all-orders').find('tbody tr').each(function(index, el) {
					var self = $(this);
					var $a = self.find('.book'),
						$b = self.find('.buyer'),
						$c = self.find('.saler'),
						$d = self.find('.statue');
					$a.text(allBooks[index]['name']);
					$b.text(allBuyers[index]['username']);
					$c.text(allPublishers[index]['username']);
					$d.html('<b>'+statue[$d.data('id')]+'</b>');
					if (index % 2 != 0) {self.addClass('even')};
				});
				$('#new-orders').find('tbody tr').each(function(index, el) {
					var self = $(this);
					var $a = self.find('.book'),
						$b = self.find('.buyer'),
						$c = self.find('.saler'),
						$d = self.find('.statue');
					$a.text(newBooks[index]['name']);
					$b.text(newBuyers[index]['username']);
					$c.text(newPublishers[index]['username']);
					$d.html('<b>'+statue[$d.data('id')]+'</b>');
					if (index % 2 != 0) {self.addClass('even')};
				})
			}

			$('tr').on('click', 'td', function(event) {
				event.preventDefault();
				console.log(this.className);
				var classname = this.className;
				if (classname == 'book') {
					console.log($(this).data('id'));
					window.open("<%=basePath%>book/index?bid="+$(this).data('id'));
				}else if ($.contains(classname,'user')) {
					
					var i = $(this).parent().index();
					var data = getDetails(classname.split(' ')[0], i);
					console.log(classname.split(' ')[0]+" "+i);
					console.log(data);
					$popup.find('.username').text(data['username']);
					$popup.find('.uid').text("UID："+data['UID']);
					$popup.find('.lastlogin').text("注册时间："+data['lastlogin']);
					$popup.find('.registtime').text("上次登录时间："+data['registtime']);
					$mask.show();
					$popup.show();
				}
			});

			$mask.click(function(event) {
				$(this).hide();
				$popup.hide();
			});

			function getDetails (type , index) {
				var data;
				if (type.indexOf('all') > -1) {
					data = type == 'allbuyer' ? allBuyers[index] : allPublishers[index];
				}else{
					data = type == 'newbuyer' ? newBuyers[index] : newPublishers[index];
				}
				return data;
			}
		});
	</script>
</body>
</html>