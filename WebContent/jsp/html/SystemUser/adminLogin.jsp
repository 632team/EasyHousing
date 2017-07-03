<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>用户登录</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
    *{
      margin: 0;padding: 0;
    }
    body{
      font-size:62.5%;font: 500 1.5em/1.8 PingFang SC, Lantinghei SC, Microsoft Yahei, Hiragino Sans GB, Microsoft Sans Serif, WenQuanYi Micro Hei, sans;
    }
    .login-wrap {
      background: url(${pageContext.request.contextPath}/jsp/images/login/login-background.jpg);
      overflow: hidden;
      width: 100%;
      height: 100%;
      position: absolute;
      background-size: cover;
      background-position: center center;
      min-width: 1280px;
      background-repeat: no-repeat;
    }
    .login-logo{
      width: 215px;
      height: 60px;
      position: absolute;
      top: -102px;
      left: 50%;
      margin-left: -108px;
    }
    .login-body{
      background: url(${pageContext.request.contextPath}/jsp/images/login/bg-pixiu.png) no-repeat;
      background-size: 100% 100%;
      width: 383px;
      height: 383px;
      position: absolute;
      top: 0;
      right: 0;
      border-radius: 3px;
    }
    .form-group{
      margin-bottom: 12px;
    }
    #signupForm{
      margin: 0 auto;
      width: 80%;
    }
    #signupForm .input-lg{

    }
    .input-lg{
      height: 46px;
      padding: 10px 16px;
      font-size: 18px;
      line-height: 1.3333333;
      border-radius: 6px;
    }
    .login-body h1{
      color: #999;
      text-align: center;
      font-size: 16px;
      font-weight: normal;
      margin-top: 52px;
      margin-bottom: 22px;
      letter-spacing: 0.25em;
    }
    .btn.form-btn.login-btn {
      background-color: #507bea;
      color: #fff;
    }
    .btn.form-btn {
      width: 100%;
      border-radius: 2px;
      margin-bottom: 1em;
      display: block;
      padding-top: 0.8em;
      padding-bottom: 0.8em;
      border: 2px solid #507bea;
      color: #4064c2;
      background-color: #fff;
    }
  </style>
</head>
<body class = "login">
<div class="login-wrap">
  <div class="login-container" style="position: relative;width: 700px;height: 485px;left: 50%;top: 50%;margin-left: -350px;margin-top: -182px;opacity: 1;transform: matrix(1, 0, 0, 1, 0, 0);">
    <div class = "login-logo">
      <p style="color: white; font-size: 50px;">EasyHousing</p>
    </div>
    <div class="swiper-container swiper-container-horizontal">
      <div class="swiper-wrapper" >
        <div class="swiper-slide">
          <img src=${pageContext.request.contextPath}/jsp/images/login/login-swiper01.jpg>
        </div>
      </div>
    </div>
    <div class="login-body">
      <form action=${pageContext.request.contextPath}/adminLogin.do class="cmxform" id="signupForm" method="post">
        <h1>快来这里看房吧</h1>
        <div class="form-group">
          <input id="mobile" class="form-control input-lg"  name="administratorName" type="text"  placeholder="请输入用户名或邮箱或手机号" value="">
        </div>
        <div class="form-group">
          <input id="password" class="form-control input-lg"  name="administratorIdPassword" type="password"  placeholder="请输入密码" value="">
        </div>
        <div class="form-group" style="margin-top:24px;">
          <button class="btn form-btn login-btn" type="submit">登 录</button>
        </div>
        <font color="#FF0000">${requestScope.message}</font> 
      </form>
    </div>
  </div>
</div>


</body>
</html>
