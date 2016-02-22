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
	<style>
		.right table{    
			width: 100%;
			border-collapse: separate;
		    text-align: center;}
		td{text-align: center;padding: 10px;}
		th{text-align: center;}
		.even{background-color: #F1EFBC ;}
		tbody tr:hover{background-color: #B5B5B5}
		thead tr{padding: 20px;}
		.books{padding: 10px;padding-top:20px;}
		h2{padding:0 20px;text-align:center;line-height:2em;}
		.one{padding: 20px;border-bottom: 2px solid;}
		.carsoul{float: left;width: 400px;margin:0 auto;position: relative;min-height: 150px}
		.carsoul .carsoulPanel{padding: 5px 10px;position: absolute;left: 0;right: 0;bottom: 0;background: rgba(0,0,0,0.6);color: #fff;}
		.form{width: 600px;float: left;padding: 5px 20px;}

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
		.btn {
		    border: 1px solid #7a7a7a;
		    background: transparent;
		    color: black;
		    padding: 5px 25px;
		    cursor: pointer;
		}
		.fileupload input[type=file] {
		    position: absolute;
		    font-size: 160px;
		    right: 0;
		    top: 0;
		    opacity: 0;
		}
		input[type="text"] {
		    width: 80%;
		}
	</style>
</head>

<body>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="right">
		<div class="all-carsouls">
			<div class="one">
				<div class="carsoul">
					<img src="" alt="" id="carsoulImg">
					<div class="carsoulPanel">
						<h3 class="title">i am a title</h3>
						<p class="content">i am a content</p>
					</div>
				</div>
				<form action="" id="add" class="form">
				<table>
					<tr>
						<td>图片</td>
						<td>
							<a href="javascript:void(0)" class="fileupload btn">
								<span class="upload-holdplace">选择文件</span>
								<input type="file" id="uploadfile" name="myFile">
							</a>
							<input type="hidden" name="hotsell.img" id="img">
						</td>
						<td>
							跳转链接
						</td>
						<td>
							<input type="text" name="hotsell.url" id="url">
						</td>
					</tr>
					<tr>
						<td>标题</td>
						<td colspan="3"><input type="text" name="hotsell.title" id="title"></td>
					</tr>
					<tr>
						<td>描述</td>
						<td colspan="3"><input type="text" name="hotsell.content" id="content"></td>
					</tr>
				</table>
				<button id="submit">新增热销</button>
				</form>
				<div class="clearfix"></div>
			</div>
			
		</div>
	</div>
	<script src="<%=basePath%>common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>common/js/ajaxfileupload.js"></script>
	<script>
	$(document).ready(function() {
		var $img = $('#carsoulImg');
		$('.fileupload').on('change','input[type=file]',function(event) {
			$.ajaxFileUpload({
				type:'post',
				secureuri:false,
				url:'upload/index',
				fileElementId : 'uploadfile',
				success:function(data){
					
					var url = $(data).find('body').text();
					console.log(url);
					$img.attr('src', '<%=basePath%>'+url).css('width', '100%');
					$("#add").find("#img").val(url);
					//$('#upload').replaceWith('<input type="file" name="myFile" id="upload">'); 
				}
			});
		});
		var valid = {'img':'图片', 'url':'跳转地址', 'title':'标题'};
		var $add = $('#add');
		
		$('#submit').on('click', function(event) {
			event.preventDefault();
			$.each(valid, function(index, val) {
				if ($add.find('#'+index).val() == '') {alert(val+"不能为空");return;}
			});
			$.post('admin/hotsell-add', $add.serialize(), function(data, textStatus, xhr) {
				
			});
		});
	});
	</script>
</body>
</html>