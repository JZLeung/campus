<%@ page language="java" import="java.util.*,com.campus.Class.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user = (User)request.getSession().getAttribute("user");
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/popup.css">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<div class="container">
  <header id="main-header">
    <ul class="right-part" id="user-part">
      <%
      if(user == null){
    %>
      <li>
        <a href="javascrip:void(0)" class="user-login" id="loginBtn">登录</a>
      </li>
      <li>
        <a href="javascrip:void(0)" class="user-regist" id="registBtn">注册</a>
      </li>
      <%
    }else{
    %>
      <li>
        <a href="user/index" class="user-info">
          <%=user.getUsername() %></a>
      </li>
      
      <li>
        <a href="javascrip:void(0)" class="user-logout">退出</a>
      </li>
      <li>
        <a href="user/myOrders" class="user-order">我是买家</a>
      </li>
      <%} %>
      <!-- </ul>
      <ul class="right-part">
        -->
        <li>
          <a href="book/add" class="user-add">我要卖书</a>
        </li>
      </ul>
      <div class="clearfix"></div>
    </header>
    <div class="logo-search">
      <a href="<%=basePath%>index/index">
        <img src="<%=basePath%>common/img/campus_logo.jpg" class="campus-logo" alt="Logo"></a>
      <section id="search-box">
		<form action="<%=basePath%>book/search" id="s-form" method="post">
        	<input type="text" id="search-input" name="name">
        	<button class="btn btn-search" id="submit">找书</button>
        </form>
      </section>
      <div class="clearfix"></div>
    </div>
    <jsp:include page="popup.jsp"></jsp:include>
    <script src="<%=basePath%>common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>common/js/validate.js" type="text/javascript"></script>
    <script>
  function login(){
    var $lBox = $('#loginBox');
    var name = $lBox.find('#username').val(), pass = $lBox.find('#password').val();
    if(name == ''){alert('请输入用户名');return ;}
    if(pass == ''){alert('请输入密码');return ;}
    $.ajax({
      url: 'user/Login',
      type:'post',
      dataType:'text',
      data: {'user.username': name,'user.password': pass},
      success: function(data){
        console.log(data);
        if(data == 1){
          alert("登录成功");
          location.reload();
          //var li = '<li><a href=""></a></li><li><a href="">退出</a></li>';
        }else{
          alert("登录失败，请检查用户名密码");
        }
      }
    });
  }

  function regist(){
    var $rBox = $('#registBox');
    var name = $rBox.find('#username').val(), 
        pass = $rBox.find('#password').val(),
        repass = $rBox.find('#Repassword').val(),
        email = $rBox.find('#email').val();
    if (name == '') {alert("用户名不能为空");return;}
    if (pass == '') {alert("密码不能为空");return;}
    if (repass == '') {alert("请再次填写密码");return;}
    if (pass != repass) {alert("两次密码不一致");return;}
    if (email == '') {alert("邮箱不能为空");return;}
    var res = Validate.email(email);
    if (res != true){alert(res);return;}
    
    $.ajax({
      url: 'user/Regist',
      type:'post',
      dataType:'text',
      data: {'addUser.username': name,'addUser.password': pass,'addUser.email':email},
      success: function(data){
        data = $.parseJSON(data);
        console.log(data.msg);
        if(data.code == 1){
          alert("注册成功");
          location.reload();
        }else{
          alert(data.msg);
        }
      }
    });  
  }

  $(document).ready(function() {
    $(".popup-mask").on('click', '.btn', function(event) {
      event.preventDefault();
      var action = $(this).data('toggle');
      if (action == 'cancel') {$('.popup-mask').children().hide();$('.popup-mask').hide();}
      else if(action == 'login'){
        login();
      }else if(action == 'regist'){
        regist();
      }
    });

    $('#user-part').on('click', 'a', function(event) {
      event.preventDefault();
      var action = this.className.split('-')[1];
      switch(action){
        case 'login':
          $('.popup-mask').show();
          $("#loginBox").show();
          break;
        case 'regist':
          $('.popup-mask').show();$("#registBox").show();
          break;
        case 'logout':
          if (confirm('确认退出？')) {
            $.ajax({
              url: '<%=basePath%>user/Logout',
              type: 'get',
              success:function(data){
                if (data == 1) {
                  alert("退出成功");
                  location.href="<%=basePath%>index/index";
                }
              }
            });
          };
          break;
        <%-- case 'info':
          location.href="<%=basePath%>user/index";
          break;
        case 'add':
          location.href="<%=basePath%>book/add";
          break; --%>
        default:
        	location.href='<%=basePath%>'+$(this).attr('href');
          break;
      }
    });
    
    $("#submit").click(function(e){
    	$('#s-form').submit();
    });
  });
</script>