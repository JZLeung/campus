<%@page import="com.campus.Class.Book"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Book> books = (ArrayList<Book>)request.getAttribute("books"); 
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的商品</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/user.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/index.css">
	<style>
		.bookList li.listItem{width:210px;}
	</style>
	<script src="<%=basePath%>common/js/city.js"></script>
  </head>
  
  <body>
<jsp:include page="../index/header.jsp" ></jsp:include>
<div class="infoDetail">
	<div class="tabList">
		<a href="user/index">个人信息</a>
		<a href="javascript:void(0)">我的订单</a>
		<a href="javascript:void(0)" class="active">我的收藏</a>
		<a href="user/myBooks">我发布的商品</a>
		<a href="javascript:void(0)">我的评价</a>
	</div>
	
	
</div>

<div class="content">
		      <div class="bookList">
      	<ul>
        <%	
        	if(books != null){
	        	int bookSize = books.size();
	        	for(int i = 0 ; i < bookSize ; i++){
	        		Book item = books.get(i);%>
	        		<li class="listItem">
	        			<a href="book/index?bid=<%=item.getBID()%>">
	        			<%if (item.getCover() == null || item.getCover().equals("")){ %>
	        			<img alt="" src="<%=basePath%>common/img/bookCover/default.png">
	        			
	        			<%}else{ %>
	        			<img alt="z<%=item.getCover() %>zs" src="<%=basePath%><%=item.getCover() %>">
	        			<%} %>
	        			<p class="itemDesc"><%=item.getSummary() %></p>
	        			<p class="itemTitle"><%=item.getName() %></p>
	        			<p class="itemPrice">￥<font color="red"><%=item.getPrice() %></font></p></a>
	        		</li>
	       	<%}
       		}
       	%>
        </ul>
      </div>
	</div>
<script src="<%=basePath%>common/js/validate.js"></script>


<script>

</script>
</body>
</html>
