<%@page import="com.easyhousing.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
  HttpSession s = request.getSession(); 
  User user = (User)s.getAttribute("user");
%>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="./cropper/cropper.min.css" rel="stylesheet">
  <link href="./sitelogo/sitelogo.css" rel="stylesheet">

  <script src="./cropper/cropper.min.js"></script>
  <script src="./sitelogo/sitelogo.js"></script>
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="js/cropbox.js"></script>

  <style>
    .container p {
      line-height: 12px;
      line-height: 0px;
      height: 0px;
      margin: 10px;
      color: #bbb
    }

    .action {
      width: 400px;
      height: 30px;
      margin: 10px 0;
    }

    .cropped {
      position: absolute;
      right: -230px;

      top: 0px;
      width: 200px;
      border: 1px #ddd solid;
      height: 460px;
      padding: 4px;
      box-shadow: 0px 0px 12px #ddd;
      text-align: center;
    }

    .imageBox {
      position: relative;
      height: 400px;
      width: 400px;
      border: 1px solid #aaa;
      background: #fff;
      overflow: hidden;
      background-repeat: no-repeat;
      cursor: move;
      box-shadow: 4px 4px 12px #B0B0B0;
    }

    .imageBox .thumbBox {
      position: absolute;
      top: 50%;
      left: 50%;
      width: 200px;
      height: 200px;
      margin-top: -100px;
      margin-left: -100px;
      box-sizing: border-box;
      border: 1px solid rgb(102, 102, 102);
      box-shadow: 0 0 0 1000px rgba(0, 0, 0, 0.5);
      background: none repeat scroll 0% 0% transparent;
    }

    .imageBox .spinner {
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      text-align: center;
      line-height: 400px;
      background: rgba(0, 0, 0, 0.7);
    }

    .Btnsty_peyton {
      float: left;
      width: 66px;
      display: inline-block;
      margin-bottom: 10px;
      height: 57px;
      line-height: 57px;
      font-size: 20px;
      color: #FFFFFF;
      margin: 0px 2px;
      background-color: #f38e81;
      border-radius: 3px;
      text-decoration: none;
      cursor: pointer;
      box-shadow: 0px 0px 5px #B0B0B0;
      border: 0px #fff solid;
    }

    /*选择文件上传*/
    .new-contentarea {
      width: 120px;
      overflow: hidden;
      margin: 0 auto;
      position: relative;
      float: left;
    }

    .new-contentarea label {
      width: 100%;
      height: 100%;
      display: block;
    }

    .new-contentarea input[type=file] {
      width: 120px;
      height: 60px;
      background: #333;
      margin: 0 auto;
      position: absolute;
      right: 50%;
      margin-right: -74px;
      top: 0;
      right /*\**/: 0px \9;
      margin-right /*\**/: 0px \9;
      width /*\**/: 10px \9;
      opacity: 0;
      filter: alpha(opacity=0);
      z-index: 2;
    }

    a.upload-img {
      width: 120px;
      display: inline-block;
      margin-bottom: 10px;
      height: 57px;
      line-height: 57px;
      font-size: 20px;
      color: #FFFFFF;
      background-color: #f38e81;
      border-radius: 3px;
      text-decoration: none;
      cursor: pointer;
      border: 0px #fff solid;
      box-shadow: 0px 0px 5px #B0B0B0;
    }

    a.upload-img:hover {
      background-color: #ec7e70;
    }
    
    .name {
      width: 100px;
      height: 100px;
      position: relative;
      background: transparent url(<%out.print(user.getUserPhoto());%>) no-repeat scroll;
      background-size: cover;

      margin: 25px;
    }

    .user-main .main-right .change-pwd {
      width: 350px;
      margin: 10px auto;
    }

    .main-right li {
      clear: both;
      padding-top: 30px;
    }

    .main-left {
      width: 150px;
      border: 1px solid #E6E5E5;
      padding: 35px 0px;
      background-color: #FFF;
      box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.15);
    }

    .user-main {
      width: 1000px;
      margin: 0 auto;
      padding: 30px 0;
    }

    .fl {
      float: left;
    }

    .user-main .main-right {
      box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.15);
      padding: 35px;
      background-color: #FFF;
      border: 1px solid #E6E5E5;
      width: 755px;
    }

    .fr {
      float: right;
    }

    .user-main .main-right .tab span.hover {
      background-color: #E6E5E5;
      display: inline-block;
      height: 38px;
      color: #333;
      cursor: default;
    }

    .user-main .main-right .tab span {
      padding: 0px 25px;
      font-size: 14px;
      color: #888;
      cursor: pointer;
    }

    .user-main .main-right .all-list .list-bot li {
      border-bottom: 1px dashed #e9e9e9;
      height: 170px;
      position: relative;
    }

    .user-main .main-left ul li a {

      text-align: center;
      color: #555;
      font-size: 14px;
    }

    .user-main .main-right {
      box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.15);
      padding: 35px;
      background-color: #FFF;
      border: 1px solid #E6E5E5;
      width: 755px;
    }

    .user-main .main-right .title {
      font-size: 22px;
      font-weight: bold;
    }

    .user-main .main-right .title span {
      color: #e4393c;
      margin: 0 10px;
    }

    .user-main .main-right .tab {
      margin-top: 20px;
      background-color: #F5F5F5;
      height: 38px;
      line-height: 38px;
      border-bottom: 1px solid #E6E6E6;
    }

    .user-main .main-right .tab span {
      padding: 0px 25px;
      font-size: 14px;
      color: #888;
      cursor: pointer;
    }

    .user-main .main-right .tab span.hover {
      background-color: #E6E5E5;
      display: inline-block;
      height: 38px;
      color: #333;
      cursor: default;
    }

    #updatePwd .ErrMsgNew, #updateName .ErrMsgNew {
      width: 253px;
      float: right;
      margin-top: 10px;
    }

    .user-main .main-right .change-pwd {
      width: 350px;
      margin: 10px auto;
    }

    .user-main .main-right li {
      clear: both;
      padding-top: 30px;
    }

    input, textarea, button {
      margin: 0;
      padding: 0;
      outline: none;
      resize: none;
      font-family: "Hiragino Sans GB", "Microsoft Yahei UI", "Microsoft Yahei", "微软雅黑", 'Segoe UI', Tahoma, "宋体b8b\4f53", SimSun, sans-serif;
    }

    .user-main .main-right .change-pwd span {
      width: 95px;
      display: inline-block;
      font-size: 14px;
    }

    .user-main .main-right .change-pwd li {
      padding-top: 15px;
    }

    .user-main .main-right li {
      clear: both;
      padding-top: 30px;
    }

    dl, dt, dd, ul, ol, li {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    user agent stylesheet
    li {
      display: list-item;
      text-align: -webkit-match-parent;
    }

    .user-main .main-right .change-pwd {
      width: 350px;
      margin: 10px auto;
    }

    .user-main .main-right .change-pwd li {
      padding-top: 15px;
    }

    .user-main .main-right .change-pwd span {
      width: 95px;
      display: inline-block;
      font-size: 14px;
    }

    .user-main .main-right .change-pwd input {
      width: 237px;
      height: 38px;
      border: 1px solid #c8c8c8;
      padding: 0 5px;
    }

    .user-main .main-right .save-list li .tagdel .tag span {
      display: inline-block;
      height: 32px;
      line-height: 32px;
      background: #fff;
      padding: 0 8px;
      margin: 5px;
    }

    .user-main .main-right .save-list li .tagdel .fr {
      margin: 5px;
    }

    .user-main .main-right .save-list li .tagdel .fr a {
      color: #4d4d4d;
    }

    .user-main .main-right .save-list li .tagdel .fr span {
      cursor: pointer;
    }

    #updatePortrait .img-container {
      width: 100%;
      margin-top: 10px;
    }

    .img-container {
      min-height: 200px;
      max-height: 516px;
      margin-bottom: 20px;
    }

    .img-container, .img-preview {
      background-color: #f7f7f7;
      width: 100%;
      text-align: center;
    }

    .user-main .main-right .change-portrait .preview .fr .preview-box {
      background: #F5F5F5 none repeat scroll 0% 0%;
      height: 196px;
      padding-top: 47px;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="row clearfix">
    <div class="col-md-12 column">
      <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" style="background-color:rgb(30,70,100)">
        <div class="container">
          <!-- Brand and toggle get grouped for better mobile display -->

          <div class="navbar-header ">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href=${pageContext.request.contextPath}/jsp/html/homepage.jsp>Easyhousing</a>

          </div>

          <!-- 左上角的导航 -->


          <div class="collapse navbar-collapse nav-justified" id="bs-example-navbar-collapse-1">
            <div class="col-md-offset-3 column">
              <ul class="nav navbar-nav">
                <li style="margin-right:150px;margin-left:50px;"><a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp>主页<span
                  class="sr-only">(current)</span></a></li>

                <li data-toggle="modal" data-target="#about"><a href="https://github.com/632team/EasyHousing">关于</a></li>
              </ul>
            </div>


            <ul class="nav navbar-nav navbar-right">
              <li data-toggle="modal" data-target="#signin-signup-tab" id="signin-button"><a href=${pageContext.request.contextPath}/logout.do>注销</a></li>

            </ul>

          </div>
        </div>


      </nav>
    </div>
  </div>
  <br><br><br>
  <div class="container">
    <div class="user-main">
      <div class="main-left fl">
        <ul class="nav nav-pills nav-stacked">
          <li role="presentation"><img class="img-responsive name img-rounded"></li>

          <li role="presentation" class="active"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/userCenter.jsp>编辑资料</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/collection.jsp>我的收藏</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/myHouse.jsp>我的房子</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/comment.jsp>我的评论</a></li>
          <!-- <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/application.jsp>我的申请</a></li> -->
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/dealHistory.jsp>成交记录</a></li>
        </ul>
      </div>
      <div class="main-right fr">
        <div class="allList">
          <div class="title">我的账户信息</div>
          <font color="#FF0000">${requestScope.infoMessage}</font>

          <div class="tab">
            <span class="actTap actSetArgs hover">上传头像</span>
            <span class="actTap actSetArgs ">个人信息</span>
            <span class="actTap actSetArgs ">修改密码</span>

          </div>
          <form  method="post" id="updatePwd" style="display: none" class="js_module" action=${pageContext.request.contextPath}/changePwd.do>
            <ul class="change-pwd">
              <li class="js_ajaxError ErrMsgNew" style="display: none"></li>
              <li>
                <span>输入旧密码：</span>

                <input type="password" class="form-control  " style="display: inline" name="name" id="password"
                       placeholder="请输入密码" rule="notNull maxThanSix" validatename="密码">
              </li>
              <li>
                <span>设置新密码：</span>
                <input type="password" class="form-control   " style="display: inline" name="username" id="password1"
                       placeholder="请输入新密码" rule="notNull maxThanSix" class="js_comparePwdFrom" validatename="密码">
              </li>
              <li>

                <span>确认新密码：</span>
                <input type="password" class="form-control  " style=" display: inline" placeholder="请确认新密码"
                       name="userEmail" class="js_comparePwdTo" rule="notNull compareIsSame"
                       validatename="确认新密码">
              </li>
              <li>
                <span></span>

                <span></span><button type="submit" class="actSubmit lj-btn" id="nameSubmit">保存修改</button>
              </li>
            </ul>
          </form>
          <form  method="post" id="updateName" style="display: none" class="js_module" action=${pageContext.request.contextPath}/changeInfo.do>
            <ul class="change-pwd">
              <li class="js_ajaxError ErrMsgNew" style="display: none"></li>
              <li>
                <span style="text-align:right">昵称：</span>
                <input type="text" class="form-control" style=" display: inline" id="nickname" placeholder="请输入昵称"
                       maxlength="14" name="username" rule="notNull" validatename="昵称" value=<%out.print(user.getUsername()); %>>
              </li>
              <li>
                <span style="text-align:right">邮箱：</span>
                <%
                if (user.getUserEmail() == null) {
                	%>
                	<input type="text" class="form-control" style=" display: inline" id="email" placeholder="请输入邮箱"
                       maxlength="30" name="userEmail" rule="notNull" validatename="邮箱">
                	<%
                }
                else {
                	%>
                	<input type="text" class="form-control" style=" display: inline" id="email" placeholder="请输入邮箱"
                       maxlength="30" name="userEmail" rule="notNull" validatename="邮箱" value=<%out.print(user.getUserEmail()); %>>
                	<%
                }
                %>
              </li>
              <li>
                <span style="text-align:right">手机：</span>
                <%
                if (user.getUserPhoneNumber() == null) {
                	%>
                	<input type="text" class="form-control" style=" display: inline" id="phonenum" placeholder="请输入手机"
                       maxlength="14" name="userPhoneNumber" rule="notNull" validatename="手机">
                	<%
                }
                else {
                	%>
                	<input type="text" class="form-control" style=" display: inline" id="phonenum" placeholder="请输入手机"
                       maxlength="14" name="userPhoneNumber" rule="notNull" validatename="手机" value=<%out.print(user.getUserPhoneNumber()); %>>
                	<%
                }
                %>
              </li>
              <li>
                <span style="text-align:right">姓名：</span>
                <%
                if (user.getUserPhoneNumber() == null) {
                	%>
                	<input type="text" class="form-control" style=" display: inline" id="myname" placeholder="请输入姓名"
                       maxlength="14" name="name" rule="notNull" validatename="姓名">
                	<%
                }
                else {
                	%>
                	<input type="text" class="form-control" style=" display: inline" id="myname" placeholder="请输入姓名"
                       maxlength="14" name="name" rule="notNull" validatename="姓名" value=<%out.print(user.getName()); %>>
                	<%
                }
                %>
              </li>
              <li>
                <span style="text-align:right">性别：</span>
                 <%
                if (user.getUserPhoneNumber() == null) {
                	%>
                	 <input type="text" class="form-control" style=" display: inline" id="myname" placeholder="请输入性别"
                       maxlength="14" name="userSex" rule="notNull" validatename="性别">
                	<%
                }
                else {
                	%>
                	 <input type="text" class="form-control" style=" display: inline" id="myname" placeholder="请输入性别"
                       maxlength="14" name="userSex" rule="notNull" validatename="性别" value=<%out.print(user.getUserSex()); %>>
                	<%
                }
                %>
               

              <li>
                <span></span><button type="submit" class="actSubmit lj-btn" id="nameSubmit">保存修改</button>
              </li>
            </ul>
          </form>
          

			
			<form  method="post" id="updatePortrait" class="js_module" action=${pageContext.request.contextPath}/changePhoto.do enctype="multipart/form-data">
				<!--
				<ul>
					<li>
	                	<span style="text-align:right">选择图像：</span>
	             		<input type="file" name="userPhoto"></input>
	             	</li></br>
					<span></span><button type="submit" class="actSubmit lj-btn" id="nameSubmit">提交</button>
				</ul>
				-->
				 <div class="container"
					 style="  width: 400px;margin: 40px auto 0 0;position: relative;font-family: 微软雅黑;font-size: 12px;">
					  <img name="myImg" id = "myImg"  src="" style="display: block; width:300px; height: 300px">
					  <br/><br/>
					  <input type="file" name="upload-file" id="imgFile" onchange="changeImg()"  class=""  style="">
					  <br/>
					  <input type="submit" name="submitImg"  id="submitImg" style="width:64px; display:inline-block">
				
					<script>
					  function changeImg() {
						if (typeof FileReader === 'undefined') {
						  alert('Your browser does not support FileReader...');
						  return;
						}
						var reader = new FileReader();
				
						reader.onload = function(e) {
						  var img = document.getElementById("myImg");
						  img.src = this.result;
						}
						reader.readAsDataURL(document.getElementById("imgFile").files[0]);
					  }
					</script>
				  <!--<div class="imageBox">-->
					<!--<div class="thumbBox"></div>-->
					<!--<div class="spinner" style="display: none">Loading...</div>-->
				  <!--</div>-->
				  <!--<div class="action">-->
					<!--&lt;!&ndash; <input type="file" id="file" style=" width: 200px">&ndash;&gt;-->
					<!--<div class="new-contentarea tc"><a href="javascript:void(0)" class="upload-img">-->
					  <!--<label for="upload-file" style="text-align: center">上传图像</label>-->
					<!--</a>-->
				
					  <!--<input type="file" class="" name="upload-file" value="Add" id="upload-file" />-->
					<!--</div>-->
					<!--<input type="button" id="btnCrop" class="Btnsty_peyton" value="裁切">-->
					<!--<input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+">-->
					<!--<input type="button" id="btnZoomOut" class="Btnsty_peyton" value="-">-->
					<!--<input type="submit" id="btnSave" class="Btnsty_peyton" value="保存">-->
				  <!--</div>-->
				  <!--<div class="cropped"></div>-->
				</div>
				
            </form>
           
            

          <!--<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>-->
        </div>
      </div>
    </div>
  </div>

</div>
</body>
<script>
  $('.user-main .tab span').click(function () {
    $('.js_ajaxError').hide();
    if ($(this).text() == '修改密码') {
      $(this).addClass('hover').siblings().removeClass('hover');
      $('#updatePwd').css('display', 'block');
      $('#updateName').css('display', 'none');
      $('#updatePortrait ').css('display', 'none');
    }
    if ($(this).text() == '上传头像') {
      $(this).addClass('hover').siblings().removeClass('hover');
      $('#updatePwd').css('display', 'none');
      $('#updateName').css('display', 'none');
      $('#updatePortrait ').css('display', 'block');
    }
    if ($(this).text() == '个人信息') {
      $(this).addClass('hover').siblings().removeClass('hover');
      $('#updatePwd').css('display', 'none');
      $('#updateName').css('display', 'block');
      $('#updatePortrait ').css('display', 'none');
    }

  });

</script>
</html>
