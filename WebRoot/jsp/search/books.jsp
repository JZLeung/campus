<%@ page language="java" import="java.util.*,com.campus.Class.Catalog,com.campus.Class.Book" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Book> books = (ArrayList<Book>)request.getAttribute("books");
%>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <html>
<head>
    <base href="<%=basePath%>">
    <title>校园二手书交易网</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="jsp,campus,book,second-hand">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/index.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/popup.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/jquery.carousel.css">
</head>

<body>
    <jsp:include page="../index/header.jsp"></jsp:include>
    <p style="border-bottom: 4px solid #555;">根据关键字“ <span class="red">${name}</span>” 搜索结果如下：</p>
	<div class="bookList">
        <ul>
            <%	
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
       		if(bookSize == 0){%>
       			
       			<p style="text-align:center;margin-top:20px;font-size:20px;font-weight:bold">查无此书</p>
       	<% }
       	%>
        </ul>
    </div>
    <script>
    	var input = document.getElementById('search-input');
    	input.value = "${name}";
    </script>
</body>
</html>