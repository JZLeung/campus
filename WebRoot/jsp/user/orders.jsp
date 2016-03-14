<%@page import="com.campus.Class.Address,com.campus.Class.User,com.campus.Class.Order"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int page1, page2 , pageCount , allPage = ((List<Order>)request.getAttribute("orders")).size();
System.out.println(allPage);
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
	pageCount = 4;
}
//处理分页参数
if(page1 * pageCount > allPage){
	page1 = 0;
}
if(page2 * pageCount > allPage){
	page2 = 0;
}

System.out.println(page1+"  "+page2+"   "+pageCount+"  "+allPage);
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>我的订单</title>
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
		<a href="user/index">个人信息</a>
		<a href="javascript:void(0)" class="active">我的订单</a>
		<a href="user/myCollections">我的收藏</a>
		<a href="user/myBooks">我发布的商品</a>
		<a href="user/mySales">我已卖出的</a>
	</div>
	<div class="orders">
	<s:iterator value="#request.orders" id="order" status="st">
		<div class="order" data-id="${st.index}">
			<span class="statue" data-statue="${order.statue}">${order.statue}</span>
			<div class="left">
				<img src="<%=basePath%>common/img/bookCover/default.png" alt="">
			</div>
			<div class="right">
				
				<a href="buy/toOrder?oid=${order.OID}"><p class="bookname"></p></a>
				<p class="publisher" data-uid2="${order.UID2}"></p>
				<p class="amount">${order.amount }</p>
			</div>
			<div class="clearfix"></div>
			
		</div>
	</s:iterator>
	</div>
</div>
	<script>
		var publishers = JSON.parse('${json_pulishers}'),
			books = JSON.parse('${json_books}'),
			statues = ['等待发货','等待收货','已完成','已关闭'];
		$(document).ready(function() {
			$('.order').each(function(index, el) {
			console.log('===============================');
			console.log(publishers[index]['username']);
			console.log(books[index]['name']);
			//console.log(adds[index]['detail']);
			var $p = $(this).find('.publisher'),
				$i = $(this).find('.left img'),
				$b = $(this).find('.bookname'),
				$s = $(this).find('.statue');
			$p.text(publishers[index]['username']);
			$b.text(books[index]['name']);
			$s.text(statues[$s.data('statue')]);
			console.log($p.data());
			if (books[index]['cover'] != undefined &&books[index]['cover'] != '') {
				$i.attr('src', '<%=basePath%>'+books[index]['cover']);
			}
		});
		});
	</script>
</body>
</html>