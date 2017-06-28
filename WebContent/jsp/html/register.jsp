<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>用户登录</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/css/login.css>
<style>
  .gotoIndex{
    position: absolute;
    color: #6C707A;
    font-size: 14px;
    right: 19px;
    text-decoration: none;
  }
  .login-body{
    background: url(${pageContext.request.contextPath}/jsp/images/login/bg-pixiu.png) no-repeat;
    background-size: 100% 100%;
    width: 383px;
    height: 383px;
    position: absolute;
    top: 0;
    right: 0;
    border-radius: 30px;
  }
  .login-wrap {

    background:url(${pageContext.request.contextPath}/jsp/images/register/bg.jpg);
    overflow: hidden;
    width: 100%;
    height: 100%;
    position: absolute;
    background-size: cover;
    background-position: center center;
    min-width: 1280px;
    background-repeat: no-repeat;
  }


  .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
  input[type="text"],input[type="password"]{padding-left:26px;}
  .checkbox{padding-left:21px;}
</style>
</head>
<body class = "register">
<div class="login-wrap">
  <div class="headerBox">

    <div class="row clearfix">

      <div class="col-md-2 column">
        <p style="color: white; font-size: 30px;">  &nbsp EasyHousing</p>
      </div>

      <div class="col-md-2 col-md-offset-8 column">
        <a href="http://www.lianjia.com" class="gotoIndex">
          <font color="white">返回EasyHousing首页  <span class="glyphicon glyphicon-arrow-right"></span> </font>
        </a>
      </div>
    </div>
  </div>
<div class="container">

  <div class="row clearfix">
    <div class="col-md-12 column">
      <br>
      <div class="col-md-4 column col-md-offset-7">
        <a href="./logIn.jsp" >
          <font color="white">已有账号？ </font>
        </a>
      </div>
      <br>
      <div class="row clearfix">

        <div class="col-md-4 column col-md-offset-4">



          <div class="row clearfix">


            <div class="login-body">

            <div class="col-md-12 column">



              <form action="register.do" class="form-horizontal col-md-12 " id="register_form" method="post">
                <br><br>
                <div class="form-group">

                  <div class="col-md-12">
                    <div class="input-group">
                      <input type="text" class="form-control input-lg" name="username" placeholder="请输入用户名">
                      <div class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="col-md-12">
                    <div class="input-group">
                      <input type="password" class="form-control input-lg" name="userPassword" placeholder="请输入密码（六位以上）">
                      <div class="input-group-addon">
                        <span class="glyphicon glyphicon-lock"></span>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="col-md-12">
                    <div class="input-group">
                      <input type="password" class="form-control input-lg" name="password" placeholder="确认密码">
                      <div class="input-group-addon">
                        <span class="glyphicon glyphicon-lock"></span>
                      </div>
                    </div>
                  </div>
                </div>


                <div class="form-group">

                  <div class="col-md-8">
                    <div class="input-group">
                      <input type="text" class="form-control input-lg" name="authcode" placeholder="请输入验证码">
                      <div class="input-group-addon">
                        <span class="glyphicon glyphicon-ok"></span>
                      </div>
                    </div>
                  </div>
                  <label id="x" class="control-label col-md-2" style="padding-top: 0px;">
                    <a class="btn btn-default" href="javascript:void(0)" onclick="document.getElementById('captcha_img').src='authcode.php?r'+Math.random()" title="换一个" ><img id="captcha_img" src="authcode.php?r=<?php echo rand();?>" alt="验证码"></a>
                  </label>
                </div>

                <label>
                  <input type="checkbox" class="check-agreed alwayCheck" validate="isChecked" validatename="协议">
                  <span>我已阅读并同意</span>
                  <a href="https://github.com/632team/Course-Selection-Guidance-in-CQU/blob/master/README.md" target="_blank">《EasyHousing使用协议》</a>
                </label><br>
                <font color="#FF0000">${requestScope.failuremessage}</font>
                <font color="#FF0000">${requestScope.successmessage}</font>  
                <br>


                <div class="row clearfix">
                  <div class="col-md-12 column">
                  <button class="btn btn-primary btn-block" type="submit">注册</button>
                  </div>


                </div>
              </form>
            </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 column">
        </div>
      </div>
      <div class="row clearfix">
        <div class="col-md-12 column">
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>
