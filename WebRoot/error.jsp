<%@ page language="java" import="java.util.*,com.campus.Class.Catalog,com.campus.Class.Book" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <style>
      .error h1,.error h2{text-align: center;}
      .error a{color: red;margin: 0 20px;text-decoration: underline;}
    </style>
</head>

<body>
    <jsp:include page="jsp/index/header.jsp"></jsp:include>
    <div class="error">
      <h1>您输入的地址有误。</h1>
      <h2><span class="num"></span>秒后自动跳转至首页，或<a href="index/index">点击这里</a>直接跳转</h2>
    </div>
    <script>
      $(document).ready(function() {
        var i = 5,$num = $('.num');
        function reload(){
          i--;
          if (i < 0) {
            location.href = "<%=basePath%>index/index";
          }else{
            $num.text(i);
            setTimeout(reload,1000);
          }
        }
        reload();
        setTimeout(reload,1000);
      });
    </script>
</body>
</html>