<%@ page language="java" import="java.util.*,com.campus.Class.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>
	">
	<title>我要卖书</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/index.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/popup.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/jquery.carousel.css">
</head>

<body>
	<jsp:include page="../index/header.jsp" ></jsp:include>
	<h2>我要卖书</h2>
	<p>请填写书本的详细信息。带<span class="red">*</span>为必填项</p>
	<form action="book/addBook" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>书名</td>
			<td><input type="text" name="book.name" ></td>
		</tr>
		<tr>
			<td>类别</td>
			<td>
				<select name="" id="parent" onchange="setChildNodes(this)"></select>
				<select name="book.CID" id="child">
					<option value="">请选择</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>价格</td>
			<td><input type="text" name="book.price" ></td>
		</tr>
		<tr>
			<td>简介</td>
			<td><input type="text" name="book.summary" ></td>
		</tr>
		<tr>
			<td>描述</td>
			<td><input type="text" name="book.detail" ></td>
		</tr>
		<tr>
			<td>上传封面图片</td>
			<form action="book/addBook" method="post" enctype="multipart/form-data" id="uploadForm">
			<td>
				<input type="file" name="myFile" id="upload">
				<input type="hidden" name="book.cover">
			</td>
			</form>
		</tr>
		<tr>
			<td><input type="submit" class="btn btn-ok" value="发布"></td>
		</tr>
	</table>
	</form>
	<script src="<%=basePath%>common/js/ajaxfileupload.js"></script>
	<script>
	var catalog = JSON.parse('${catalogs}'),
		childNode = [];
	var parent = document.getElementById('parent'),
		child = document.getElementById('child');
	function setChildNodes(obj){
		var v = obj.value;
		var tmpArray = childNode[v];
		for (var i = 0; i < tmpArray.length; i++) {
			child.options[i] = new Option(tmpArray[i]['name'],tmpArray[i]['CID']);
		};
	}
	function upload(obj){
		$.ajaxFileUpload({
			'type':'post',
			dataType:'text',
			'url':'upload/index',
			fileElementId : 'upload',
			success:function(data){
				console.log(data);
				$("input[name='book.cover']").val(data);
				$('#upload').replaceWith('<input type="file" name="myFile" id="upload">'); 
			}
		});
	}
	$('#upload').on('change', function(event) {
		event.preventDefault();
		upload();
	});
	for (var i = 0; i < catalog.length; i++) {
		var tmpdata = catalog[i] , 
			tmpArray = [];
		parent.options[i] = new Option(tmpdata[0]['name'],i);
		for (var j = 1; j < tmpdata.length; j++) {
			tmpArray.push(tmpdata[j]);
		}
		childNode.push(tmpArray);
	}
	parent.options[0].selected = true;
	$(parent).change();
	child.options[0].selected = true;
	</script>
</body>
</html>