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
  <style>
    .name {
      width: 100px;
      height: 100px;
      position: relative;
      background: transparent url(<%out.print(user.getUserPhoto());%>) no-repeat scroll;
      background-size: cover;

      margin: 25px;
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

          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/userCenter.jsp>编辑资料</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/collection.jsp>我的收藏</a></li>
          <li role="presentation" class="active"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/myHouse.jsp>我的房子</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/comment.jsp>我的评论</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/application.jsp>我的申请</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/dealHistory.jsp>成交记录</a></li>
        </ul>
      </div>
      <div class="main-right fr">
        <div class="allList">
          <div class="title">查看您发布的楼盘/租房信息</div>

          <div class="tab">
            <span class="actTap actSetArgs hover">全部</span>
            <span class="actTap actSetArgs ">楼盘</span>
            <span class="actTap actSetArgs ">租房</span>

          </div>
        </div>
      </div>
    </div>
  </div>

</div>
</body>
</html>
