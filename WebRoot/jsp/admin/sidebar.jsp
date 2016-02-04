<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="sidebar">
	<div class="portrail">
		<img src="<%=basePath%>common/img/admin.png" alt="">
		<p>Administrator</p>
	</div>
	<ul class="list">
		<li><a href="javascript:void(0)">首页</a></li>
		<li><a href="javascript:void(0)">用户管理</a></li>
		<li><a href="javascript:void(0)">书本管理</a></li>
		<li><a href="javascript:void(0)">订单管理</a></li>
		<li><a href="javascript:void(0)">xx管理</a></li>
	</ul>
</div>