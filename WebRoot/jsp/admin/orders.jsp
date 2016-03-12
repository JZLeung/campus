<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.campus.Class.Address,com.campus.Class.User,com.campus.Class.Order"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int page1, page2 , pageCount , allPage = ((List<Order>)request.getAttribute("allOrders")).size();
//获取分页参数
try{
	page1 = Integer.parseInt((String) request.getParameter("page1")) -1 ;
}catch(Exception e){
	page1 = 0;
}

try{
	page2 = Integer.parseInt((String) request.getParameter("page2")) -1 ;
}catch(Exception e){
	page2 = 0;
}

try{
	pageCount = Integer.parseInt((String) request.getParameter("pageCount"));
}catch(Exception e){
	pageCount = 5;
}
//处理分页参数
if(page1 * pageCount > allPage){
	page1 = 0;
}
if(page2 * pageCount > allPage){
	page2 = 0;
}

System.out.println(page1+"-"+page2+"-"+pageCount+"-"+allPage);
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
		h2{padding:0 20px;text-align:center;line-height:2em;margin: auto;width: 20em;}
		.book:hover,.user:hover{cursor: pointer;color: #fff;}
	</style>
</head>

<body>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="right">
		<div id="orders" class="orders">
			<h2>所有订单信息</h2>
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
					<s:iterator value="#request.allOrders" id="order" status="st">
						<tr data-id="${order.OID }">
							<td>${order.OID }</td>
							<td data-id="${order.BID }" class="book">${order.BID }</td>
							<td data-id="${order.UID1 }" class="allbuyer buyer user">${order.UID1 }</td>
							<td data-id="${order.UID2 }" class="allsaler saler user">${order.UID2 }</td>
							<td>${order.starttime }</td>
							<td>￥<span class="red">${order.amount }</span></td>
							<td data-id="${order.statue }" class="statue"></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<div class="page page-all">
				<ul class="page-list">
				</ul>
			</div>
		</div>
		<div id="neworder" class="orders">
			<h2>新订单信息（一周内）</h2>
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
			<div class="page page-new">
				<ul class="page-list">
				</ul>
			</div>
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

		var page1 = ${page1} , page2 = ${page2} ,
			allPage1 = ${allPage1} ,allPage2 = ${allPage2},
			maxPages = 5, j;

		var $popup = $('#detail'),
			$mask = $('#mask');
		$(document).ready(function() {
			
			var statue = ['等待发货','等待收货','已完成','已关闭'];
			$.get('admin/getPublishers',{page1:page1,page2:page2}, function(data) {
				//console.log(data);
				data = $.parseJSON(data);
				allPublishers = data['all'];
				newPublishers = data['new'];
				pf = true;
				checkIsOK();
			});
			$.get('admin/getCustomers',{page1:page1,page2:page2}, function(data) {
				//console.log(data);
				data = $.parseJSON(data);
				allBuyers = data['all'];
				newBuyers = data['new'];
				bf1 = true;
				checkIsOK();
			});
			$.get('admin/getBooks',{page1:page1,page2:page2}, function(data) {
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


			console.log(allPage1+":"+allPage2);
			function setPage(curPage, allSize, type) {
				var html='' , t = type == 1 ? 'page1' : 'page2' , pageCount = 5;
				var allPage = allSize / pageCount;
				for(j = 0 ; j < allPage && j < maxPages ; j++){
					if (j != page1) {
						html += '<li><a href="admin/orders?'+t+'='+j+'">'+(j+1)+'</a></li>';
					}else{
						html += '<li class="current">'+(j+1)+'</li>';
					}
				}
				if(j < allPage){
		   			html += '<li>...</li>';
		   			html += '<li><a href="admin/books?'+t+'='+(allPage-1)+'">尾页</a></li>';
		      	}
		      	return html;
			}
			var ul1 = setPage(page1, allPage1,1);
	      	$('.page-all').find('ul.page-list').html(ul1);
	      	var ul2 = setPage(page2, allPage2,2);
	      	$('.page-new').find('ul.page-list').html(ul2);
		});
	</script>
</body>
</html>