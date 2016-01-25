<%@page import="com.campus.Class.Address,com.campus.Class.User"%>
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
    
    <title>我的个人中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/user.css">
	<script src="<%=basePath%>common/js/city.js"></script>
  </head>
  
  <body>
<jsp:include page="../index/header.jsp" ></jsp:include>
<div class="infoDetail">
	<div class="tabList">
		<a href="javascript:void(0)" class="active">个人信息</a>
		<a href="user/myOrders">我的订单</a>
		<a href="user/myCollections">我的收藏</a>
		<a href="user/myBooks">我发布的商品</a>
		<a href="javascript:void(0)">我的评价</a>
	</div>
	
	<div class="content">
		<h2>你好，${user.username }</h2>
		<form id="infoform">
			<table id="userinfo1">
				<thead>
					<tr><th colspan="3" style="text-align:center;font-weight:bold">个人信息</th></tr>
					<tr><th colspan="3" style="text-align:right;"><button class="btn" id="editbtn">修改个人信息</button></th></tr>
				</thead>
				<tr>
					<td>UID：</td>
					<td colspan="2">
						<label>${user.UID }</label>
						<input type="text" value="${user.UID }" name="UID"  hidden disabled>
					</td>
				</tr>
				<tr>
					<td>用户名：</td>
					<td colspan="2">
						<label>${user.username }</label>
						<input type="text" id="username" name="username" value="${user.username }" hidden>
					</td>
				</tr>
				<tr>
					<td>手机号：</td>
					<td colspan="2">
						<label>${user.phone }</label>
						<input type="text" id="phone" name="phone" value="${user.phone }" hidden>
					</td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td colspan="2"> 
						<label>${user.email }</label>
						<input type="email" id="email" name="email" value="${user.email }" hidden>
					</td>
				</tr>
				<tr hidden class="hidden">
					<td>原密码：</td>
					<td colspan="2">
						<input type="password" id="password" name="password"  hidden>
					</td>
				</tr>
				<tr hidden class="hidden">
					<td>新密码：</td>
					<td colspan="2">
						<input type="password" id="newpassword" name="newpassword" hidden>
					</td>
				</tr>
				<tr hidden class="hidden">
					<td>重复密码</td>
						<td colspan="2">
						<input type="password" id="repassword" name="repassword" hidden>
					</td>
				</tr>
				<tr hidden class="hidden"> 
					<td colspan="3" style="text-align:center"><button class="btn" id="submit">确认修改</button></td>
				</tr>
			</table>
		</form>

		<table id="addinfo">
			<thead>
				<tr><th colspan="6" style="text-align:center;font-weight:bold">
					收货人地址信息
					<button class="btn" id="addNew" style="float:right">增加新地址</button>
				</th></tr>
				<!-- <tr><th colspan="3" style="text-align:right;"><button class="btn" id="editbtn">添加收货人信息</button></th></tr> -->
				<tr>
					<th>收货人</th>
					<th>所在地区</th>
					<th>详细地址</th>
					<th>联系电话</th>
					<th>邮编</th>
					<th>
						操作
					</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.addresses" id="address">
					<tr data-id="${address.AID }">
						<td>${address.contact }</td>
						<td>${address.province } ${address.city } ${address.country }</td>
						<td>${address.detail }</td>
						<td>${address.phone }</td>
						<td>${address.postcode }</td>
						<td class="action" data-id="${address.AID }">
							<a href="javascript:void(0)" class="btn btn-small" data-action="edit">编辑</a>
							<a href="javascript:void(0)" class="btn btn-cancel btn-small" data-action="del">删除</a>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>
<div class="popup-mask">
	<div class="popup-box" id="addBox" style="width:500px;margin-left:-250px;">
		<div class="popup-title">
			<h2>添加新地址</h2>
		</div>
		<div class="popup-content">
		<form action="" id="addform">
			<table style="width:100%;border-collapse: separate;border-spacing: 5px 10px;">
				<tr style="width:100%;">
					<td>收货人：<font color="red">*</font></td>
					<td><input type="text" name="contact" style="width:100%;"></td>
				</tr>
				<tr>
					<td>所在城市：<font color="red">*</font></td>
					<td>
						<select name="province" id="province"></select>
						<select name="city" id="city"></select>
						<select name="country" id="country"></select>
					</td>
				</tr>
				<tr>
					<td>详细地址：<font color="red">*</font></td>
					<td><input type="text" name="detail" style="width:100%;"></td>
				</tr>
				<tr>
					<td>联系电话：<font color="red">*</font></td>
					<td><input type="text" name="phone" style="width:100%;"></td>
				</tr>
				<tr>
					<td>邮编：</td><td><input type="text" name="postcode" style="width:100%;"></td>
				</tr>
			</table>
			<input type="hidden" name="AID">
		</form>
		</div>
		<div class="popup-footer">
			<div class="btn-group">
				<button class="btn btn-cancel" data-toggle="cancel">取消</button>
				<button class="btn btn-ok"  data-toggle="add">确认</button>
			</div>
		</div>
	</div>
</div>
<script src="<%=basePath%>common/js/validate.js"></script>
<script>
	window.uid = '${user.UID }';
	function dataToObj (datas) {
		var data = {};
		for (var i = 0; i < datas.length; i++) {
			var name = datas[i]['name'],
				value = datas[i]['value'];
			data[name] = value;
		}
		return data;
	}

	function setDataNames (datas, preText) {
		var data = {};
		for (var name in datas) {
			data[preText+"."+name] = datas[name];
		}
		return data;
	}

	var validates = {'contact':'name','phone':'phone','email':'email'},
		tip = {'username':'用户名','phone':'手机号','email':'邮箱','password':'密码','detail':'详细地址'},
		edit = ['contact', '', 'detail', 'phone', 'postcode'],
		$form = $('#userinfo1'),
		$addform = $('#addform'),
		$addinfo = $('#addinfo'),
		$popup = $('.popup-mask'),
		$popupBox = $('.popup-box');
	$(document).ready(function() {
		var editable = false;
			
		setup();
		//提交修改内容
		$('#submit').on('click', function(event) {
			event.preventDefault();
			
			var data = dataToObj($('#infoform').serializeArray());
			//console.log(data);
			if (data.password == undefined || data.password == ''){
				alert("请先输入原密码");return;
			}else if (data.newpassword != data.repassword) {
				alert("新密码两次输入不正确。");return;
			}

			data = setDataNames(data, "updateUser");
			data['newPass'] = $('#newpassword').val();
			$.post('<%=basePath%>user/update',data , function(data2, textStatus, xhr) {
				var d = JSON.parse(data2);
				console.log(d);
				if (d.code == '1'){alert("修改成功");location.reload();}
				else{alert(d.msg);}
			});
		});
		//打开、关闭编辑状态
		$('#editbtn').on('click', function(event) {
			event.preventDefault();
			editable = !editable;
			if (editable) {
				$form.find('input').each(function(index, el) {
					$(this).removeProp('hidden');
				});
				$form.find('label').each(function(index, el) {
					$(this).attr('hidden', 'hidden');
				});
				$form.find('.hidden').removeProp('hidden');
			}else{
				$form.find('label').each(function(index, el) {
					$(this).removeProp('hidden');
				});
				$form.find('input').each(function(index, el) {
					$(this).attr('hidden', 'hidden');
				});
				$form.find('.hidden').attr('hidden', 'hidden');
			}
		});
		//打开添加新地址模态框
		$('#addNew').on('click', function(event) {
			event.preventDefault();
			$popup.find('.btn-ok').data('toggle','add');
			$popup.show().find('.popup-title h2').text('增加新地址');
			$popupBox.show();
		});
		//处理事务
		$popup.on('click', '.btn', function(event) {
			event.preventDefault();
			var action = $(this).data('toggle');
			if (action != 'cancel') {
				var datas = $('#addform').serializeArray(),
					data = dataToObj(datas),
					res;
				if (data.province == '请选择' || data.city == '请选择' || data.country == '请选择') {
					alert('请选择你所在的城市');return;
				}
				//console.log(data);
				for(var i in data){
					if (i != 'postcode' && data[i] == '' && i != 'AID') {alert(tip[i]+'不能为空');return};
					if (validates[i] != undefined) {
						res = eval('Validate.'+validates[i]+'(data.'+i+')');
						//res = new Function('alertdata(data.contact)');
						//console.log(res);
						if (res != true) {
							alert(res);return;
						};
					};
				}
				if (action == 'add') {
					data['UID'] = window.uid;
					datas = setDataNames(data, "newAdd");
					console.log(datas);
					$.post('<%=basePath%>address/add', datas, function(data, textStatus, xhr) {
						console.log(data);
						if(data == 1){
							alert('增加新地址成功');location.reload();
						}else{
							alert('增加新地址失败，请尝试一遍');
						}
							
					});
				}else if(action == 'update'){
					datas = setDataNames(data, "updateAdd");
					console.log(datas);
					$.post('address/update', datas, function(data, textStatus, xhr) {
						console.log(data);
						if(data == 1){
							alert('修改地址成功');location.reload();
						}else{
							alert('修改地址失败，请尝试一遍');
						}
							
					});
				}
			}else{
				$popup.hide();
			}
		});

		//绑定编辑、删除事件
		$('.action').on('click', 'a', function(event) {
			event.preventDefault();
			var index = $(this).parent().data('id'),
				dataAdd = [],
				action = $(this).data('action');
			//console.log(index);
			if (action == 'edit') {
				$addinfo.find('tbody tr[data-id='+index+']').find('td').each(function() {
					//console.log($(this).text())
					dataAdd.push($(this).text());
				});
				console.log(dataAdd);
				for (var i = 0; i < dataAdd.length; i++) {
					var v = dataAdd[i];
					//console.log(edit[i]);
					if (i == 1) {
						v = v.split(' ');
						//console.log(v);
						$addform.find('[name=province]').val(v[0]).change();;
						$addform.find('[name=city]').val(v[1]).change();;
						$addform.find('[name=country]').val(v[2]);;
					}else{
						$addform.find('[name='+edit[i]+']').val(v);
					}
				}
				$popup.find('[name=AID]').val(index);
				$popup.find('.btn-ok').data('toggle','update');
				$popup.show().find('.popup-title h2').text('编辑地址');
				$popupBox.show();
			}else{
				if (confirm('确认要删除该地址吗？')) {
					$.get('<%=basePath%>address/del', {'delAdd.AID':index} ,function(data) {
						console.log(data);
						if(data == 1){
							alert('删除地址成功');location.reload();
						}else{
							alert('删除地址失败，请尝试一遍');
						}
					});
				}
			}
		});
	});
</script>
 </body>
</html>
