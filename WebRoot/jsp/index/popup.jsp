<%@ page language="java"  pageEncoding="utf-8"%>
<div class="popup-mask">
	<div class="popup-box" id="loginBox">
		<div class="popup-title">
			<h2>登录</h2>
		</div>
		<div class="popup-content">
			<table style="width:100%;border-collapse: separate;border-spacing: 5px 10px;">
				<tr style="width:100%;">
					<td>用户名：</td><td><input type="text" id="username" style="width:100%;"></td>
				</tr>
				<tr>
					<td>密码：</td><td><input type="password" id="password" style="width:100%;"></td>
				</tr>
			</table>
		</div>
		<div class="popup-footer">
			<div class="btn-group">
				<button class="btn btn-cancel" data-toggle="cancel">Cancel</button>
				<button class="btn btn-ok"  data-toggle="login">OK</button>
			</div>
		</div>
	</div>
	<div class="popup-box" id="registBox">
		<div class="popup-title">
			<h2>注册新用户</h2>
		</div>
		<div class="popup-content">
			<table style="width:100%;border-collapse: separate;border-spacing: 5px 10px;">
				<tr style="width:100%;">
					<td>用户名：<font color="red">*</font></td><td><input type="text" id="username" style="width:100%;"></td>
				</tr>
				<tr>
					<td>密码：<font color="red">*</font></td><td><input type="password" id="password" style="width:100%;"></td>
				</tr>
				<tr>
					<td>重复密码：<font color="red">*</font></td><td><input type="password" id="Repassword" style="width:100%;"></td>
				</tr>
				<tr>
					<td>邮箱：<font color="red">*</font></td><td><input type="email" id="email" style="width:100%;"></td>
				</tr>
			</table>
		</div>
		<div class="popup-footer">
			<div class="btn-group">
				<button class="btn btn-cancel"  data-toggle="cancel">Cancel</button>
				<button class="btn btn-ok" data-toggle="regist">OK</button>
			</div>
		</div>
	</div>
</div>

