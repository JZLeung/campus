<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>后台登录-校园二手书交易网</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/index.css">
	<style>
		*{padding: 0;margin: 0;}
		body{background: url(<%=basePath%>common/img/adminbg.jpg) no-repeat center center;background-size: 100%;text-align: center;padding-top: 100px;}
		.box{width: 500px;margin: auto;text-align: center;background: rgba(0,0,0,0.5);color: #fff;padding: 20px 30px;}
		h2{line-height: 3em;}
		.box .field{margin-top: 25px;}
		.box .field label{width: 100px;display: inline-block;}
		.box .field input{width: 390px;}
	</style>
</head>

<body>
	
	<div class="box">
		<h2>校园二手书后台管理系统</h2>
		<form action="admin/login" id="form">
			<div class="field">
				<label for="username">用户名：</label>
				<input type="text" id="username" name="adminUser.username" placeholder="请输入用户名" class="input">
			</div>
			<div class="field">
				<label for="password">密码：</label>
				<input type="password" id="password" name="adminUser.password" placeholder="请输入密码" class="input">
			</div>
			<div class="field" style="margin-top:60px;">
				<input type="submit" value="登录" class="btn" style="color:#fff;" id="submit">
			</div>
		</form>
	</div>
	<script src="<%=basePath%>common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script>
	$(document).ready(function() {
		$('#submit').click(function(event) {
			event.preventDefault();
			$.post('admin/login2', $('#form').serialize(), function(data, textStatus, xhr) {
				data = JSON.parse(data);
				console.log(data);
				if (data.code == 1) {
					location.href = '<%=basePath%>admin/index';
				}else{
					alert(data.msg);
				}
			});
		});
	});
	</script>
</body>
</html>