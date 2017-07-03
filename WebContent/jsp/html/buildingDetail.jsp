<%@page import="java.util.List"%>
<%@page import="com.easyhousing.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
HttpSession s = request.getSession(); 
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>楼盘详细信息</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!--头部样式-->
  <style>
    body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td {
      margin: 0;
      padding: 0;
    }
    body {
      height: 100%;
      font-size: 12px;
      color: #333;
      background: #f2f2f2;
      min-width: 1220px;
    }
    .listhead {
      height: 60px;
      background:  #1a4563;
    }
    .headerbg {
      width: 100%;
      height: 40px;
      position: relative;
    }
    .listhead .header {
      height: 60px;
      padding: 0;
      line-height: 60px;
    }
    .header {
      width: 1220px;
      height: 50px;
      line-height: 50px;
      font-size: 14px;
      color: #fff;
      margin: auto;
      padding-top: 20px;
      position: relative;
    }
    /*logo CSS*/
    .listhead .header .logo {
      width: 120px;
      margin-top: -1px;
      margin-left: 60px;
    }
    .header .logo {
      width: 120px;
      height:50px;
      margin-top: 0px;
      float: left;
    }
    .listhead .header .nav {
      height: 60px;
      font-size: 15px;

    }
    /* .header .nav {
       width: 850px;
       height: 50px;
       float: left;
       font-size: 18px;
       font-weight: bold;
       margin-left: 100px;
     }*/
    /*顶上字体CSS*/
    .header .nav {
      width: 600px;
      height: 30px;
      float: right;
      font-size: 15px;
      font-weight:bold;
      margin-right: 350px;
      margin-top: -30px;
    }
    /*登录注册字体CSS*/
    .header .nav1 {
      width: 100px;
      height: 30px;
      float: right;
      font-size: 12px;
      font-weight: bold;
      margin-top: -7px;
      margin-right: 50px;
    }
    /*搜索框大小CSS*/
    .listhead .header .nav span {
      height: 160px;
      margin: 0;
    }
    .listhead .header .nav span .hrf {
      height: 60px;
      line-height: 60px;
      margin: 0;
      padding: 0 18px;
      border: 0;
      color:white;
    }
    .header a {
      color: #fff;
    }
    /*搜索栏灰色底框距离底部的距离*/
    .wsrrent {
      width: 100%;
      border-bottom: 1px solid #ddd;
      background: #fff;
      margin-bottom: 30px;
      box-shadow: 0 1px 1px #e1e1e1;
    }

    /*搜索栏白色底框CSS*/
    .wsrrent .container {
      width: 100%;
      height:110px;
      margin-top: 70px;             /*搜索底框的上边距离顶栏的距离*/
      background:#faf7fa;
    }

    /*范围栏*/
    .container {
      width: 1200px;
      margin: auto;
    }
    .subsh {
      height: 35px;
      padding: 10px 0;
    }
    /*搜索框边线*/
    .subsh_l {
      width: 388px;
      height: 33px;
      border: 1px solid #bbb;
      position: relative;
      background: #fff;
      margin-left: 110px;
      margin-top:20px;
    }
    .fl {
      float: left;
    }
    /*搜索小框内文字*/
    .subsh_l .sd_sel {
      width: 60px;
      height: 33px;
      font-size: 14px;
      padding-left: 5px;
      position: relative;
      margin-right: 5px;
    }

    .subsh_l .sd_sel span {
      width: 50px;
      padding-right: 8px;
      text-align: center;
      height: 33px;
      line-height: 33px;
      background: url(../images/rentWindow/djimg23.png) no-repeat right center;
      display: block;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      cursor: pointer;
    }
    .subsh_l .sd_sel ul {
      width: 50px;
      position: absolute;
      top: 33px;
      left: 0;
      z-index: 99;
      background: #fff;
      border: 1px solid #888;
      padding: 5px;
      display: none;
    }
    .subsh_l .sd_sel ul li {
      line-height: 24px;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      cursor: pointer;
    }
    ol, ul, li {
      list-style: none;
    }
    .subsh_l .text {
      width: 260px;
      height: 18px;
      line-height: 18px;
      padding: 0 10px;
      float: left;
      margin-top: 7px;
      border: 0;
      background: 0;
      color: #888;
    }
    input[type="text"], input[type="passwrod"] {
      outline: none;
    }
    input {
      -webkit-appearance: textfield;
      background-color: white;
      -webkit-rtl-ordering: logical;
      user-select: text;
      cursor: auto;
      padding: 1px;
      border-width: 2px;
      border-style: inset;
      border-color: initial;
      border-image: initial;
    }
    .subsh_l #autoSearchItem {
      width: 100%;
      top: 34px;
      left: -1px;
      z-index: 9999;
    }
    #autoSearchItem {
      width: 600px;
      background: #fff;
      border: 1px solid #ddd;
      position: absolute;
      top: 50px;
      left: 0;
      visibility: hidden;
    }
    .subsh_l .submit {
      width: 35px;
      height: 33px;
      float: right;
      font-size: 0;
      background: url(../images/rentWindow/djimg24.png) no-repeat center center;
      border: none;
    }
    input[type="button"], input[type="file"], input[type="submit"], input[type="reset"] {
      -webkit-appearance: none;
      border: none;
      cursor: pointer;
      outline: none;
      border: 0;
    }
    .subsh_r {
      width: 158px;
      height: 35px;
      border-radius: 5px;
      font-size: 14px;
      font-weight: bold;
      overflow: hidden;
    }
    .subsh_r {
      width: 158px;
      height: 35px;
      border-radius: 5px;
      font-size: 14px;
      font-weight: bold;
      overflow: hidden;
    }
    .fr {
      float: right;
    }
    .subsh_r .al {
      width: 85px;
      height: 31px;
      line-height: 31px;

      /*border: 2px solid #ddd;*/
      /*border-right: none;*/
      /*border-top-left-radius: 5px;
      border-bottom-left-radius: 5px;*/
      color: #333;
    }
    .subsh_r a {
      height: 35px;
      line-height: 35px;
      text-align: center;
      float: left;
      overflow: hidden;
      display: block;
    }
    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }
    .subsh_r .al span {
      padding-left: 15px;
      background: url(../images/rentWindow/djimg25.png) no-repeat left center;

    }
    .subsh_r a span {
      display: inline-block;
    }
    strong, b {
      font-weight: bold;
      font-size: 16px;

    }
    .subsh_r .al span i {
      display: none;


    }
  </style>

  <!--主体样式-->
  <style>
    .mod-global {
      width: 100%;
      background: #f1f1f1;
    }
    #matchBar .match-nav {
      position: fixed;
      bottom: 100px;
      right: 5px;
    }
    .mod-global .match-nav {
      z-index: 1002;
    }
    .match-nav {
      position: fixed;
      bottom: 281px;
      right: 5px;
      font-size: 12px;
      z-index: 1;
    }
    #matchBar .match-nav .unadd-nav-box {
      background-color: rgba(0,0,0,0);
      height: 100%;
      border: 0;
    }
    .unadd-nav-box {
      width: 45px;
      height: 75px;
      border: 1px solid #efeeef;
      border-top-color: #f9f9f9;
      -moz-border-radius: 2px;
      -webkit-border-radius: 2px;
      border-radius: 2px;
      background-color: white;
    }
    .focusloupan {
      padding: 5px 10px;
      color: black;
      font-size: 12px;
      border-top-color: #f9f9f9;
      -moz-border-radius: 2px;
      -webkit-border-radius: 2px;
      border-radius: 2px;
      background-color: white;
      box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -o-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -ms-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      margin-bottom: 5px;
      text-align: center;
      cursor: pointer;
    }
    .mod-banner {
      font-family: Tahoma;
      width: 100%;
      height: 539px;
      margin-bottom: 15px;
      padding-top: 1px;
      overflow: hidden;
      position: relative;
    }
    .mod-banner .filter-bg {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 0;
      -webkit-filter: blur(8px);
      -moz-filter: blur(8px);
      filter: progid:DXImageTransform.Microsoft.Blur(PixelRadius='3');
      filter: blur(8px);
      background-size: cover;
      background-position: center 0;
      background-repeat: no-repeat;
    }
    img {
      border: 0;
      vertical-align: top;
    }
    .mod-banner .opacity-bg {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 0;
      background-color: #000;
      opacity: .4;
      filter: alpha(opacity=40);
    }
    .mod-banner .mid-content {
      width: 1000px;
      height: 35px;
      margin: 0 auto;
      position: relative;
      z-index: 100;
    }
    .mod-banner .mid-content .breadcrumbs {
      font-size: 12px;
      height: 35px;
      line-height: 35px;
    }
    .mod-banner .mid-content .breadcrumbs .icon {
      background: url(../images/loupan/bread-icon.png) no-repeat;
      width: 13px;
      height: 19px;
      display: inline-block;
      margin-top: 5px;
      vertical-align: middle;
    }
    em, i, b, strong {
      font-weight: 400;
      font-style: normal;
    }
    a {
      color: #ffffff;
    }
    .mod-banner .mid-content .breadcrumbs .stp {
      font-family: simsun;
    }
    .mod-banner .mid-content .breadcrumbs span {
      color: #ffffff;
    }
    .mod-banner .banner-box {
      width: 1000px;
      height: 472px;
      margin: 0 auto;
      background-position: center 0;
      background-repeat: no-repeat;
      box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -webkit-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -moz-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -o-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -ms-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      position: relative;
    }
    a:-webkit-any-link {
      color: white;
      cursor: auto;
      text-decoration: underline;
    }
    .coverpic-pos-rtf {
      right: 20px;
      top: 20px;
    }
    .coverpic-type {
      position: absolute;
      display: block;
      color: rgba(255,255,255,0.5);
      font-size: 12px;
    }
    .mod-banner .banner-box .youhui-detail {
      width: 830px;
      height: 330px;
      display: none;
      position: fixed;
      margin: auto;
      left: 0;
      right: 0;
      top: 0;
      bottom: 0;
      z-index: 1001;
    }
    .mod-banner .banner-box .when-detail {
      width: 830px;
      height: 344px;
      display: none;
      position: fixed;
      margin: auto;
      left: 0;
      right: 0;
      top: 0;
      bottom: 0;
      z-index: 1001;
    }
    .mod-banner .banner-box .box-left {
      width: 362px;
      height: 416px;
      margin-top: 15px;
      margin-left: 30px;
      position: relative;
      float: left;
    }
    .mod-banner .banner-box .box-left .box-left-top {
      width: 100%;
      height: 140px;
      overflow: hidden;
      background-color: #333333;
      padding-left: 30px;
      padding-right: 30px;
      border-radius: 2px 2px 0 0;
      box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -webkit-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -moz-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -o-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -ms-box-shadow: 0 0 3px rgba(0,0,0,0.2);
    }
    .mod-banner .banner-box .box-left .box-left-top .state-div {
      vertical-align: middle;
      margin-left: -33px;
      margin-top: -3px;
      margin-bottom: 5px;
    }
    .mod-banner .banner-box .box-left .box-left-top .state-div .state {
      display: inline-block;
      font-size: 12px;
      border-radius: 6px;
      padding: 0 8px;
      color: #fff;
      background-color: #666666;
      line-height: 30px;
      height: 30px;
    }
    .mod-banner .banner-box .box-left .box-left-top .name-box a {
      color: #fff;
      cursor: pointer;
    }
    h1 {
      font-size: 20px;
      font-weight: bolder;
      color: #fff;
      float: left;
      padding-bottom: 6px;
      margin-top: -3px;
      max-width: 224px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
    .mod-banner .banner-box .box-left .box-left-top .jiage {
      width: 100%;
      height: 40px;
      font-size: 14px;
      color: #fff;
      margin-bottom: 5px;
      display: inline-block;
    }
    .mod-banner .banner-box .box-left .box-left-top .jiage .junjia {
      font-size: 22px;
      font-weight: bold;
      color: #f76e64;
    }
    .mod-banner .banner-box .box-left .box-left-bottom {
      background-color: #fff;
      width: 100%;
      margin-bottom: 0;
      border-radius: 0 0 2px 2px;
      box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -webkit-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -moz-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -o-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -ms-box-shadow: 0 0 3px rgba(0,0,0,0.2);
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info {
      width: 302px;
      height: 302px;
      margin: 0 auto;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .small-tags {
      padding: 15px 0;
      border-bottom: 1px solid #ededed;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .small-tags .popular {
      background-color: #e0a0a0;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .small-tags span {
      font-size: 12px;
      color: #fff;
      margin-right: 5px;
      height: 23px;
      vertical-align: middle;
      line-height: 23px;
      padding: 0 5px;
      display: inline-block;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .small-tags .villa {
      background-color: #c5a9dd;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .small-tags .q70 {
      background-color: #ecc896;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .wu-type {
      padding: 17px 0;
      border-bottom: 1px solid #ededed;
      font-size: 14px;
      font-weight: bold;
      position: relative;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .wu-type .iic {
      display: inline-block;
      float: right;
      margin-top: 3px;
      margin-right: 8px;
      width: 7px;
      height: 13px;
      /*!*background: url(../../img/detail/iic.png);*!  background: -webkit-image-set(url(../../img/detail/iic.png) 1x, url(../../img/detail/iic@2x.png) 2x);*/
      background-repeat: no-repeat;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .where {
      padding: 17px 0;
      border-bottom: 1px solid #ededed;
      font-size: 14px;
      font-weight: bold;
      max-width: 302px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .when {
      padding: 17px 0;
      font-size: 14px;
      font-weight: bold;
      cursor: pointer;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .phonetag {
      width: 302px;
      position: absolute;
      padding-top: 10px;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .phonetag .btn_phone_ll {
      display: inline-block;
      width: 302px;
      height: 100%;
      line-height: 25px;
      padding: 10px 0;
      background: #f15044;
      border-radius: 2px;
      text-align: center;
    }
    .mod-banner .banner-box .box-left .box-left-bottom .bottom-info .phonetag .btn_phone_ll span {
      display: inline-block;
      font-size: 18px;
      font-family: "Hiragino Sans GB", "Microsoft Yahei UI", "Microsoft Yahei", 微软雅黑, "Segoe UI", Tahoma, 宋体, SimSun, sans-serif;
      color: rgb(255, 255, 255);
      vertical-align: middle;
    }
    .mod-wrap {
      width: 1000px;
      margin: 0 auto;
    }
    .mod-wrap .mod-estate-dynamic {
      background-color: #fff;
      margin-bottom: 15px;
      padding: 20px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -o-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -ms-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    }
    .clear {
      /* zoom: 1; */
    }
    .clear {
      display: block;
    }
    .mod-wrap .mod-estate-dynamic .dynamic-wrap .dynamic-wrap-left {
      display: block;
      width: 580px;
      padding: 10px 0 10px 10px;
      margin-right: 60px;
    }
    .mod-wrap h2 {
      font-size: 20px;
      font-weight: normal;
      padding-bottom: 26px;
      display: block;
      margin-top: -5px;
    }
    .pull-left {
      float: left;
    }
    .mod-wrap .mod-estate-dynamic .dynamic-wrap .dynamic-wrap-left .dynamic-wrap-lt {
      border-bottom: 1px solid #eeeeee;
    }
    .pull-left .title-link {
      color: #00ae66;
      text-decoration: none;
      cursor: pointer;
    }
    .mod-wrap .mod-estate-dynamic .dynamic-wrap .dynamic-wrap-left .dynamic-wrap-block {
      margin-top: 30px;
      position: relative;
    }
    .mod-wrap .mod-estate-dynamic .dynamic-wrap .dynamic-wrap-left h4 {
      padding: 3px 6px;
      background-color: #39ac6a;
      border-radius: 2px;
      font-size: 13px;
      color: #ffffff;
      margin-top: -2px;
    }
    .mod-wrap .mod-estate-dynamic .dynamic-wrap .dynamic-wrap-left .dynamic-block-detail {
      width: 490px;
    }
    .mod-wrap .mod-estate-dynamic .dynamic-wrap .dongtai-title {
      color: #333333;
      font-size: 16px;
      margin-bottom: 4px;
      min-height: 23px;
    }
    .mod-wrap .mod-estate-dynamic .dynamic-wrap .dynamic-wrap-left .detail {
      display: block;
      font-size: 14px;
      width: 490px;
      height: auto;
      color: #9c9fa1;
      text-decoration: none;
      line-height: 24px;
    }
    .mod-wrap .mod-panel-houseonline {
      background-color: #fff;
      margin-bottom: 15px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -o-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -ms-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    }
    .mod-house-online {
      position: relative;
    }
    .mod-wrap {
      width: 1000px;
      heith: 257px;
      margin: 0 auto;
    }
    .h2-flow {
      float: left;
      padding-left: 30px;
      padding-top: 25px;
      padding-bottom: 10px;
      font-size: 20px;
    }
     #house-online .title-link {
      color: #00ae66;
      text-decoration: none;
      cursor: pointer;
    }
    .mod-house-online .houselist {
      padding-left: 30px;
      padding-right: 30px;
    }
    .mod-house-online .house-det {
      border-bottom: 1px solid #e4e4e4;
      padding-bottom: 27px;
      padding-top: 30px;
    }
    .mod-house-online .house-det .img-li {
      text-align: center;
      width: 140px;
      height: 120px;
      margin-right: 40px;
      position: relative;
      font-size: 0;
    }
    .mod-house-online .house-det li {
      float: left;
    }
    dl, dt, dd, ul, ol, li {
      list-style: none;
      margin: 0;
      padding: 0;
    }
    li {
      display: list-item;
      text-align: -webkit-match-parent;
    }
    .mod-house-online .house-det .img-li img {
      cursor: pointer;
      display: inline-block;
      margin: auto;
      max-width: 100%;
      max-height: 100%;
      vertical-align: middle;
    }
    img {
      border: 0;
      vertical-align: top;
    }
    .mod-house-online .type-tab {
      float: right;
      padding-right: 30px;
      padding-top: 27px;
    }
    .mod-house-online .det-line-h {
      display: inline-block;
      width: 1000px;
      height: 1px;
      margin: 0 auto;
      margin-top: -100px;
      background-color: #e4e4e4;
    }
    #listItem{
      height: 179px;
    }
    .mod-house-online .house-det .info-li {
      margin-right: 135px;
    }
    .mod-house-online .house-det li {
      float: left;
    }
    .mod-house-online .house-det .info-li .p1 {
      margin-top: -3px;
      font-size: 20px;
      font-weight: bold;
    }
    .mod-house-online .house-det .info-li .p2 {
      font-size: 14px;
      font-weight: bold;
    }
    .mod-house-online .house-det .info-li p {
      margin-bottom: 10px;
    }
    .mod-house-online .house-det .info-li .p2 span {
      color: #f15044;
    }
    .mod-house-online .house-det .info-li p {
      margin-bottom: 10px;
    }
    .mod-house-online .house-det .info-li .p4 .tag1 {
      background-color: #c5a9dd;
    }
    .mod-house-online .house-det .info-li .p4 span {
      font-size: 12px;
      color: #fff;
      margin-right: 5px;
      height: 23px;
      vertical-align: middle;
      line-height: 23px;
      padding: 0 5px;
      display: inline-block;
    }
    .mod-wrap .mod-panel {
      background-color: #fff;
      padding-left: 30px;
      padding-right: 30px;
      padding-top: 30px;
      /*padding-bottom: 30px;*/
      margin-bottom: 15px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -o-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      -ms-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    }
    .mod-details {
      position: relative;
    }
    /*#house-details h2 .title-link{*/

    /*}*/
    .mod-details .mod-details-line {
      width: 1000px;
      height: 1px;
      background-color: #e4e4e4;
      position: absolute;
      left: 0;
    }
    .mod-details .box-loupan {
      margin-bottom: -10px;
      margin-top: 5px;
    }
    .desc-p {
      padding: 7px 0;
      font-size: 14px;
      line-height: 24px;
    }
    .desc-p {
      padding: 7px 0;
      font-size: 14px;
      line-height: 24px;
    }
    .desc-p .label {
      font-size: 15px;
      display: inline-block;
      width: 100px;
      font-weight: bold;
      color: #333;
      vertical-align: top;
      float: left;
    }
    .desc-p .label-val {
      display: block;
      color: #888;
      margin-left: 100px;
    }
  </style>
</head>
<body>
  <div class="fotpof">
  <div class="pofcons pofsoll pofcont">
    <span></span>
    <div>
    </div>
  </div>
    <div class="headerbg listhead">
      <div class="header">
        <a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp>
          <img src=${pageContext.request.contextPath}/jsp/images/rentWindow/logo1.png class="logo" >
        </a>
        <div class="nav1 navml">
        <span>
              <%
              if (s.getAttribute("user") == null) {
            	  out.println("<a href=/EasyHousing/jsp/html/logIn.jsp class=\"href\">登录</a>");
              }
              else {
            	  out.println("<a href=/EasyHousing/userCenter.do class=\"href\">个人中心</a>");
              } %>
          </span>
          /
          <span>
          
          	<%
              if (s.getAttribute("user") == null) {
            	  out.println("<a href=/EasyHousing/jsp/html/register.jsp class=\"href\">注册</a>");
              }
              else {
            	  out.println("<a href=/EasyHousing/logout.do class=\"href\">注销</a>");
              }
          	%>
          </span>
	  </div>
	        <div class="nav navml">
	          <span>
	            <a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp class="href">首页</a>&nbsp&nbsp&nbsp
	          </span>
	          <span>
	            <a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp class="href">二手房</a>&nbsp&nbsp&nbsp
	          </span>
	          <span>
	            <a href=${pageContext.request.contextPath}/buildingSelect.do class="href" style="color: #8fcafe">新房</a>&nbsp&nbsp&nbsp
	          </span>
	          <span>
	            <a href=${pageContext.request.contextPath}/rentHouseSelect.do class="href">租房</a>
	          </span>
	
	        </div>
	      </div>
	
	    </div>
	    
  <div class="wsrrent">
    <div class="container">
      <div class="subsh subsher">
        <div class="subsh_l fl">
          <div class="sd_sel fl">
            <span>新房</span>
            <ul id="serchar">
              <li>
                二手房
              </li>
              <li class="sel">
                新房
              </li>
              <li>
                租房
              </li>
            </ul>
          </div>
          <input type="text" value="请输入小区、地铁、区域开始找房" class="text" id="autoSearchText" maxlength="20" autocomplete="off">
          <div id="autoSearchItem" style="height: 285px; visibility: hidden;">
            <ul class="menu_v"></ul>
          </div>
          <input type="button" value class="submit" id="btnSearch" onclick="indexSerch()">
          <input type="hidden" value="1" id="pageIndex">
        </div>
        <div class="subsh_r fr">
          <a href="#" class="al">
              <span>
                <b>地图找房</b>
                <i>地图</i>
              </span>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>
  <div class="mod-global">
    <div>
      <div id="matchBar">
        <div class="match-nav">
          <div class="unadd-nav-box">
            <div class="focusloupan" data-xftrack="10179_1">关注楼盘</div>
          </div>
        </div>
      </div>
      <div class="mod-banner">
        <div class="filter-bg">
          <img src="../images/loupan/bf0ac046-24ae-46b8-bbb2-9cb0d92a3f62.jpg.100x36.jpg" style="width:100%;height:100%;">
        </div>
        <div class="opacity-bg"></div>
        <div class="mid-content">
          <div class="breadcrumbs">
            <i class="icon"></i>&nbsp
            <a href="#">易购房</a>
            <span class="stp">&nbsp>&nbsp</span>
            <a href="#">新房</a>
            <span class="stp">&nbsp>&nbsp</span>
            <a href="#">楼盘</a>
            <span class="stp">&nbsp>&nbsp</span>
            <a href="#">沙坪坝</a>
            <span class="stp">&nbsp>&nbsp</span>
            <a href="#">融创春晖十里</a>
            <span class="stp">&nbsp>&nbsp</span>
          </div>
        </div>
        <div class="banner-box" style="background-image: url(../images/loupan/bf0ac046-24ae-46b8-bbb2-9cb0d92a3f62.jpg.1000x506.jpg)">
          <a target="_blank" href="#" style="display:inline-block;position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: 1;"></a>
          <span class="coverpic-type coverpic-pos-rtf">效果图</span>
          <div class="youhui-detail formis"></div>
          <div class="when-detail formis"></div>
          <div class="box-left" style="z-index:2">
            <div class="box-left-top">
              <div class="name-box">
                <div class="state-div">
                  <span class="state">在售</span>
                </div>
                <a class="clear" href="#" title="融创春晖十里">
                  <h1>融创春晖十里</h1>
                </a>
              </div>
              <div class="jiage">
                <span>均价</span>
                <span class="junjia">3万</span>
                <span class="yuan">元/平</span>
              </div>
            </div>
            <div class="box-left-bottom clickTargetBox">
              <div class="bottom-info">
                <p class="small-tags">
                  <span class="popular">住宅</span>
                  <span class="villa">五证齐全</span>
                  <span class="q70">车位充足</span>
                </p>
                <p class="wu-type">
                  <span>物业类型：</span>
                  <span>住宅</span>
                  <i class="iic" style="display: none;"></i>
                </p>
                <p class="where" style="cursor: pointer;">
                  <span title="沙坪坝某地">项目地址：沙坪坝某地</span>
                </p>
                <p class="when">
                  <span>最新开盘：</span>
                  <span>2017年7月1日</span>
                </p>
                <div class="phonetag clickAction">
                  <div class="btn_phone_ll LOGCLICK">
                    <span>电话：</span>
                    <span title="88888888">88888888</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!--楼盘动态部分-->
      <div class="mod-wrap">
        <div class="clear mod-estate-dynamic for-dtpic" id="estate-dynamic">
          <div class="dynamic-wrap clearfix">
            <div class="dynamic-wrap-left pull-left">
              <div class="dynamic-wrap-lt clearfix">
                <h2 class="pull-left">
                  <a class="title-link" href="#" target="_blank">楼盘动态</a>
                </h2>
              </div>
              <div class="dynamic-wrap-block clearfix">
                <h4 class="pull-left">销售动态</h4>
                <div class="dynamic-block-detail pull-right">
                  <div class="dongtai-title" title="洋房在售">洋房在售</div>
                  <span class="detail">现在购买，只要9999</span>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>

      <!--户型介绍-->
      <div class="mod-wrap" style="width: 1000px;height: 257px;margin: 0 auto; background-color: white;">
        <div class="clear mod-panel-houseonline mod-house-online" id="house-online">
          <span class="h2-flow">
            <a href="#" class="title-link">户型介绍</a>
          </span>
          <ul class="clear type-tab">户型</ul>
          <p class="det-line-h"></p>
          <div class="list-item " id="listItem">
            <div class="houselist">
              <ul class="clear house-det">
                <li class="img-li">
                  <img class="" src="../images/loupan/2e3571c9-f321-4231-a645-7ab1b85db3da.jpg.280x.jpg">
                </li>
                <li class="info-li">
                  <p class="p1">3室一厅<span>套内 100m²</span></p>
                  <p class="p2">均价<span>100</span>万/套</p>
                  <p class="p4"><span class="tag1">南北通透</span></p>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <!--楼盘详情-->
      <div class="mod-wrap"  style="width: 1000px;height: 584px; margin-top:20px;  background-color: white;">
        <div class="mod-panel mod-details" id="house-details">
          <h2>
            <a href="#" class="title-link" style="color: #00ae66; text-decoration: none">楼盘详情</a>
          </h2>
          <p class="mod-details-line"></p>
          <div class="box-loupan" style="width: 940px; height: 483px;">
            <p class="desc-p"></p>
            <p class="desc-p clear">
              <span class="label">项目地址：</span>
              <span class="label-val">沙坪坝</span>
            </p>
            <p class="desc-p clear">
              <span class="label">售楼处地址：</span>
              <span class="label-val">沙坪坝三峡广场</span>
            </p>
            <p class="desc-p clear">
              <span class="label">开发商：</span>
              <span class="label-val">恒大地产房地产开发有限公司</span>
            </p>
            <p class="desc-p clear">
              <span class="label">物业公司：</span>
              <span class="label-val">重庆正大物业公司</span>
            </p>
            <p class="desc-p clear">
              <span class="label">最新开盘：</span>
              <span class="label-val">2017年04月14日</span>
            </p>
            <p class="desc-p clear">
              <span class="label">交房时间：</span>
              <span class="label-val">2018年06月30日</span>
            </p>
            <p class="desc-p clear">
              <span class="label">产权年限：</span>
              <span class="label-val">50年</span>
            </p>
            <p class="desc-p clear">
              <span class="label">规划户数：</span>
              <span class="label-val">100户</span>
            </p>
            <p class="desc-p clear">
              <span class="label">车位情况：</span>
              <span class="label-val">地下车位数1000</span>
            </p>
            <p class="desc-p clear">
              <span class="label">供水方式：</span>
              <span class="label-val">民水</span>
            </p>
            <p class="desc-p clear">
              <span class="label">建筑类型：</span>
              <span class="label-val">塔楼</span>
            </p>
            <p class="desc-p clear">
              <span class="label">占地面积：</span>
              <span class="label-val">218,421㎡</span>
            </p>
          </div>
        </div>
      </div>

      <!--用户评论-->
      <div class="mod-wrap" style="width: 1000px;  margin-top:20px;  background-color: white;">
        <!-- UY BEGIN -->
        <div id="uyan_frame"></div>
        <script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js"></script>
        <!-- UY END -->
      </div>

    </div>
  </div>
</body>
</html>
