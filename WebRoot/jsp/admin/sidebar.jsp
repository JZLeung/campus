<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat;" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd EEEE");//设置日期格式
%>
<div class="sidebar">
	<div class="portrail">
		<img src="<%=basePath%>common/img/admin.png" alt="">
		<p>Administrator</p>
	</div>
	<ul class="list">
		<li><a href="admin/index">首页</a></li>
		<li><a href="admin/users">用户管理</a></li>
		<li><a href="admin/books">书本管理</a></li>
		<li><a href="admin/orders">订单管理</a></li>
	</ul>
	<p class="time"><%=df.format(new Date()) %></p>
</div>