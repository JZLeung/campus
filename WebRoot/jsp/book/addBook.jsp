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
    <style>
    textarea{resize: none}
	.red{color: red;}
	.img{width: 200px;float: left;}
	.img img{width: 100%;}
	.table{float: left;border-collapse: separate;border-spacing: 5px;width: 600px}
	table.table td:nth-child(1){width: 8em;}
	.fileupload {
		position: relative;
		display: inline-block;
		border-radius: 0;
		padding: 4px 12px;
		font-size: 16px;
		overflow: hidden;
		color: #000;
		text-decoration: none;
		text-indent: 0;
	}
	.fileupload input[type=file] {
	    position: absolute;
	    font-size: 160px;
	    right: 0;
	    top: 0;
	    opacity: 0;
	}
    </style>
</head>

<body>
	<jsp:include page="../index/header.jsp" ></jsp:include>
	<h2>我要卖书</h2>
	
	<div class="img">
		<img src="<%=basePath%>common/img/bookCover/default.png" alt="">
	</div>
	<form action="book/addBook" method="post" enctype="multipart/form-data">
	<table class="table">
		<thead>
			<th><p>请填写书本的详细信息。带<span class="red">*</span>为必填项</p></th>
		</thead>
		<tr>
			<td><span class="red">*</span>书名</td>
			<td><input type="text" name="book.name" ></td>
		</tr>
		<tr>
			<td><span class="red">*</span>类别</td>
			<td>
				<select name="" id="parent" onchange="setChildNodes(this)"></select>
				<select name="book.CID" id="child">
					<option value="">请选择</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><span class="red">*</span>价格</td>
			<td><input type="text" name="book.price" ></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;简介</td>
			<td><input type="text" name="book.summary" ></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;描述</td>
			<td>
				<textarea name="book.detail" id="" cols="30" rows="5"></textarea>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;上传封面图片</td>
			<form action="book/addBook" method="post" enctype="multipart/form-data" id="uploadForm">
			<td>
				<a href="javascript:void(0)" class="fileupload btn">
					<span class="upload-holdplace">选择文件</span>
					<input type="file" id="uploadfile" name="myFile">
				</a>
				<!-- <input type="file" name="myFile" id="upload"> -->
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
		childNode = [],
		$img = $('.img img');
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
			type:'post',
			secureuri:false,
			url:'upload/index',
			fileElementId : 'uploadfile',
			dataType:'JSON',
			success:function(data){
				console.log(data);
				
				$("input[name='book.cover']").val(data);
				//$('#upload').replaceWith('<input type="file" name="myFile" id="upload">'); 
			}
		});
	}
	$('.fileupload').on('change','input[type=file]',function(event) {
		$.ajaxFileUpload({
			type:'post',
			secureuri:false,
			url:'upload/index',
			fileElementId : 'uploadfile',
			success:function(data){
				console.log(data);
				var url = $(data).find('body').text();
				$img.attr('src', '<%=basePath%>'+url);
				$("input[name='book.cover']").val(url);
				//$('#upload').replaceWith('<input type="file" name="myFile" id="upload">'); 
			}
		});
	});
	/*$('#upload').on('change', function(event) {
		event.preventDefault();
		upload();
	});*/
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