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
</head>

<body>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="right">
		<div class="all-statue">
			<h1>总述：</h1>
			<div class="statue">
				<h2>总用户数量</h2>
				<div class="detail">
					<p>${counts[0] }</p>
				</div>
			</div>
			<div class="statue">
				<h2>商品总数</h2>
				<div class="detail">
					<p>${counts[1] }</p>
				</div>
			</div>
			<div class="statue">
				<h2>订单总数</h2>
				<div class="detail">
					<p>${counts[2] }</p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="all-statue">
			<h1>过去一周内：</h1>
			<div class="statue">
				<h2>新用户数量</h2>
				<div class="detail">
					<p>${news[0] }</p>
				</div>
			</div>
			<div class="statue">
				<h2>新商品数量</h2>
				<div class="detail">
					<p>${news[1] }</p>
				</div>
			</div>
			<div class="statue">
				<h2>新订单数</h2>
				<div class="detail">
					<p>${news[2] }</p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<script src="<%=basePath%>common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script>
	$(document).ready(function() {
		$('.list').find('a').eq(0).addClass('active');
	});
	</script>
</body>
</html>