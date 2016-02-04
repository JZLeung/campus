<%@ page language="java" import="java.util.*,com.campus.Class.Catalog,com.campus.Class.Book" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<ArrayList<Catalog>> catalogList = (ArrayList<ArrayList<Catalog>>)request.getAttribute("catalogList");
ArrayList<Book> books = (ArrayList<Book>)request.getAttribute("bookList"); 
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
    <div class="left">
       <nav id="main-nav">
       
      <%
      int catalogSize = catalogList.size();
      for(int i = 0; i < catalogSize; i++){
        ArrayList<Catalog>
        list2 = catalogList.get(i);
        Catalog parentNode = list2.get(0);
      %>
        <li class="parentNode">
          <%=parentNode.getName() %>
          <ul>
            <%
        for(int j = 1; j < list2.size(); j++){
          Catalog childNode = list2.get(j);
      %>
            <a href="book/books?cid=<%=childNode.getCID() %>" >
              <%=childNode.getName() %></a>
            <%  } %></ul>
        </li>
        <%}%>
        </nav>
    </div>
    <div class="right">
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
       	<%}%>
        </ul>
      </div>
    </div>
  <script src="<%=basePath%>common/js/slideBox.js" type="text/javascript"></script>
  
  <script type="text/javascript">
   $(document).ready(function() {
      var carousel = $('.carouselPanel').slideBox({
        carousel:'.imgList'
      });
   });
    </script>
    <script>

  
</script>
</body>
</html>