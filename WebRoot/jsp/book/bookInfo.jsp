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
    <base href="<%=basePath%>">
    
    <title>${book.name } 详情页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/book.css">

  </head>
  
  <body>
  	<jsp:include page="../index/header.jsp" ></jsp:include>
    <div class="bookInfo">
		<div class="bookHead">
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
				<p><span class="left">发布者</span><span class="saler">${publisher.username }</span></p>
				<p><span class="left">价格</span><span class="price">¥${book.price }</span></p>
				<p><span class="left">发布时间</span><span class="time">${book.publishtime}</span></p>
				
				<a class="btn btn-remove" href="javascript:void(0)" data-action="remove" hidden>取消收藏</a>
				
				
				<a class="btn btn-collect" href="javascript:void(0)" data-action="collect" hidden>收藏</a>
				
				<a class="btn btn-buy" href="javascript:void(0)" data-action="buy">购买</a>
				
			</div>
		</div>
		<div class="bookDesc">
			<p class="topDesc">详细信息</p>
			<div class="detail">
				<s:if test="book.detail == null || book.detail == ''">
					${publisher.username} 这个家伙很懒，什么都没有留下
				</s:if>
				<s:else>
					${book.detail}
				</s:else>
			</div>
		</div>
	</div>
	<script>
	var bid = ${book.BID} , flag = '${collected }' , issold = ${statue};
	$(document).ready(function() {
		if (issold == '1') {$('.btn-buy').addClass('btn-disabled').removeClass('btn-buy').text('已售出');}
		var $collect = $('.btn-collect'),
			$remove = $('.btn-remove'),
			$buy = $('.btn-buy');
		if (flag == 'true') {$remove.show();}
		else{$collect.show();}
		
		$collect.on('click', function(event) {
			event.preventDefault();
			$.post('collect/add', {bid: bid}, function(data, textStatus, xhr) {
				/*optional stuff to do after success */
				data2 = data;
				if (data == "1") {
					alert("收藏成功");
					$collect.hide();
					$remove.show();
				}else if (data == "0") {
					alert("已收藏");
					$collect.hide();
					$remove.show();
				}else{
					alert("请先登录再收藏");
				}
			});
		});
		
		$remove.on('click', function(event) {
			event.preventDefault();
			$.post('collect/cancel', {bid: bid}, function(data, textStatus, xhr) {
				/*optional stuff to do after success */
				data2 = data;
				if (data == "1") {
					alert("取消收藏成功");
					$remove.hide();
					$collect.show();
				}else if (data == "0") {
					alert("你没有收藏该书本");
					$remove.hide();
					$collect.show();
				}else{
					alert("请先登录再收藏");
				}
			});
		});

		$buy.on('click', function(event) {
			event.preventDefault();
			$.get('buy/iscanbuy', {'bid':bid} ,function(data) {
				//alert(data);
				if (data == "-1") {
					alert("请先登录再操作");
				}else if(data == "0"){
					alert("该书已出售");
				}else{
					location.href = "buy/tobuybook?bid="+bid;
				}
			});
		});
	});
	</script>
  </body>
</html>
