<%@page import="com.easyhousing.model.*"%>
<%@page import="java.util.*" %>
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
   <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/codemirror.css">
  <!--<link rel="stylesheet" href="css/ace.min.css">-->
  <link rel="stylesheet" href="css/font-awesome.min.cs">

  <link rel="stylesheet" href="css/ace-rtl.min.css">
  <link rel="stylesheet" href="css/ace-skins.min.css">
  <link rel="stylesheet" href="css/login.css">
  <link rel="stylesheet" href="css/layer.css">



  <script src="js/typeahead-bs2.min.js"></script>
  <script src="js/H-ui.js"></script>
  <script src="js/H-ui.admin.js"></script>
  <script src="js/layer.js"></script>
  <link rel="stylesheet" href="css/layer.css">
  <script src="js/layate.js"></script>
  <link rel="stylesheet" href="css/laydate.css">
  <link rel="stylesheet" href="css/laydate(1).css">


  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link href="./sitelogo/sitelogo.css" rel="stylesheet">
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.dataTables.min.js"></script>
  <script src="js/jquery.dataTables.bootstrap.js"></script>
  <style>
    .form-control {
      display: block;
      width: 100%;
      height: 34px;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      color: #555;
      background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
      -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
      box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
      -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
      -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
      transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    }
    th,td,.table-bordered
    {
      border-radius: 0!important;
    }

    .table thead tr
    {
      color: #707070;
      font-weight: normal;
      background: #f2f2f2;
      /* background-image: -webkit-gradient(linear,left 0,left 100%,from(#f8f8f8),to(#ececec));
       background-image: -webkit-linear-gradient(top,#f8f8f8,0%,#ececec,100%);
       background-image: -moz-linear-gradient(top,#f8f8f8 0,#ececec 100%);
       background-image: linear-gradient(to bottom,#f8f8f8 0,#ececec 100%);*/
      background-repeat: repeat-x;
      /*  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff8f8f8',endColorstr='#ffececec',GradientType=0);
      */}

    .table thead tr th
    {
      border-color: #DDD;
      font-weight: bold;
    }

    .table thead tr th [class*="icon-"]:first-child
    {
      margin-right: 2px;
    }

    .table thead tr th:first-child
    {
      border-left-color: #f1f1f1;
    }

    .table thead tr th:left-child
    {
      border-right-color: #f1f1f1;
    }

    .table.table-bordered thead tr th
    {
      vertical-align: middle;
      text-align:center;
    }

    .table.table-bordered thead tr th:first-child
    {
      border-left-color: #DDD;
    }

    th.center,td.center
    {
      text-align: center;
    }

    th .lbl,td .lbl
    {
      margin-bottom: 0;
    }

    th .lbl:only-child,td .lbl:only-child
    {
      vertical-align: top;
    }

    .table.table-bordered thead tr th {
      vertical-align: middle;
      text-align: center;
    }
    .table thead tr th {
      border-color: #DDD;
      font-weight: bold;
    }
    .dataTables_wrapper .row:first-child+.dataTable {
      border-top: 1px solid #DDD;
      border-bottom: 1px solid #DDD;
    }
    .table-bordered {
      border: 1px solid #ddd;
    }
    .table {
      width: 100%;
      max-width: 100%;
      margin-bottom: 20px;
    }
    .dataTable {
      margin-bottom: 0;
      text-align: center;
    }

    th, td, .table-bordered {
      border-radius: 0!important;
    }
    .dataTables_wrapper label {
      display: inline-block;
      font-size: 13px;
    }
    .dataTables_length label {
      font-weight: normal;
    }
    label {
      display: inline-block;
      max-width: 100%;
      margin-bottom: 5px;
      font-weight: 700;
    }
    label, .lbl {
      vertical-align: middle;
    }
    label {
      font-weight: normal;
      font-size: 14px;
    }
    .dataTables_wrapper input[type=text], .dataTables_wrapper select {
      margin-bottom: 0!important;
      margin: 0 4px;
    }
    .dataTables_wrapper .row:first-child {
      padding-top: 12px;
      padding-bottom: 12px;
    }
    .table.table-bordered tbody tr td {
      word-wrap: break-word;
      word-break: break-all;
      vertical-align: middle;
      font-family: "æ–°å®‹ä½“";
      text-align: center;
    }
    .dataTables_wrapper .row {
      margin: 0;
    }
    .table.table-bordered thead tr th:first-child {
      border-left-color: #DDD;
    }
    .dataTables_length select {
      width: 70px;
      height: 25px;
      padding: 2px 3px;
    }
    textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"] {
      border-radius: 0!important;
      color: #858585;
      background-color: #fff;
      border: 1px solid #d5d5d5;
      padding: 5px 4px;
      margin-left: 10px;
      line-height: 1.2;
      font-size: 14px;
      font-family: inherit;
      -webkit-box-shadow: none!important;
      box-shadow: none!important;
      -webkit-transition-duration: .1s;
      transition-duration: .1s;
    }
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

    .list_tit {
      width: 100%;
      height: 35px;
      line-height: 35px;
      font-size: 14px;
      margin-top: 10px;
      border-bottom: 1px solid #ccc;
      overflow: hidden;
    }

    .list_tit .cenl {
      width: 500px;
      height: 35px;
      overflow: hidden;
    }

    .fl {
      float: left;
    }

    .list_tit .cenl strong {
      color: #c00000;
      font-weight: bold;
    }

    i, em {
      font-style: normal;
    }

    .list_tit .cenr {
      width: 600px;
      height: 35px;
      text-align: right;
      overflow: hidden;
    }

    .fr {
      float: right;
    }

    .list_tit a.first {
      margin: 0;
    }

    .list_tit .active {
      font-weight: bold;
      color: #c00000;
    }

    .list_tit a {
      margin-left: 10px;
    }

    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }

    .list_tit .hovs {
      background: url(images/rentWindow/djimg80.png) no-repeat right center;
    }

    .list_tit .hovs, .list_tit .hovx {
      padding-right: 10px;
    }

    .list_tit a {
      margin-left: 10px;
    }

    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }

    .list_tit .hovx {
      background: url(images/rentWindow/djimg81.png) no-repeat right center;
    }

    .list_tit .hovs, .list_tit .hovx {
      padding-right: 10px;
    }

    .list_tit a {
      margin-left: 10px;
    }

    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }

    ol, ul, li {
      list-style: none;
    }

    ul, menu, dir {
      display: block;
      list-style-type: disc;
      -webkit-margin-before: 1em;
      -webkit-margin-after: 1em;
      -webkit-margin-start: 0px;
      -webkit-margin-end: 0px;
      -webkit-padding-start: 40px;
    }

    .mor_list li {
      height: 190px;
      padding: 20px 10px 20px 195px;
      background: #fff;
      border-bottom: 1px solid #eee;
      overflow: hidden;
      cursor: pointer;
      position: relative;
    }

    .data_link {
      width: 100%;
      height: 100%;
      position: absolute;
      top: 0;
      left: 0;
      z-index: 200;
      display: block;
    }

    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }

    .mor_list li .mor_img {
      width: 185px;
      height: 150px;
      overflow: hidden;
      background: #ccc;
      position: absolute;
      top: 20px;
      left: 10px;
      z-index: 1;
      font-size: 14px;
      font-weight: bold;
    }

    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }

    .mor_list li .mor_img img {
      width: 100%;
      height: 100%;
    }

    fieldset, img {
      border: 0;
    }

    .mor_list li .mor_txt {
      width: 100%;
      height: 150px;
      margin-left: 10px;
      position: relative;
    }

    .mor_list li .mor_txt h3 {
      height: 23px;
      font-size: 18px;
      font-weight: bold;
      line-height: 20px;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
    }

    .mor_list li .mor_txt .dot {
      width: 100%;
      height: 48px;
    }

    .mor_list li .mor_txt p {
      width: 100%;
      height: 24px;
      margin-top: 10px;
      line-height: 24px;
      font-size: 14px;
      color: #666;
      overflow: hidden;
    }

    .mor_list li .mor_txt .dor {
      height: 24px;
      padding-left: 15px;
      background: url(images/rentWindow/djimg25.png) no-repeat left center;
      white-space: nowrap;
      text-overflow: ellipsis;
    }

    p {
      display: block;
      -webkit-margin-before: 1em;
      -webkit-margin-after: 1em;
      -webkit-margin-start: 0px;
      -webkit-margin-end: 0px;
    }

    .mor_list li .mor_txt a {
      height: 22px;
      line-height: 22px;
      display: block;
      float: left;
      margin-right: 5px;
      border: 1px solid;
      padding: 0 5px;
      cursor: default;
    }

    .bq_cor_1, .bq_cor_11, .bq_cor_21, .bq_cor_31, .bq_cor_41, .bq_cor_51, .bq_cor_61, .bq_cor_71, .bq_cor_81, .bq_cor_91, .bq_cor_101, .bq_cor_111, .bq_cor_121, .bq_cor_131, .bq_cor_141, .bq_cor_151, .bq_cor_161, .bq_cor_171, .bq_cor_181, .bq_cor_191 {
      color: #ff943e;
      border-color: #ff943e;
    }

    .bq_cor_2, .bq_cor_12, .bq_cor_22, .bq_cor_32, .bq_cor_42, .bq_cor_52, .bq_cor_62, .bq_cor_72, .bq_cor_82, .bq_cor_92, .bq_cor_102, .bq_cor_112, .bq_cor_122, .bq_cor_132, .bq_cor_142, .bq_cor_152, .bq_cor_162, .bq_cor_172, .bq_cor_182, .bq_cor_192 {
      color: #9a89b9;
      border-color: #9a89b9;
    }

    .bq_cor_3, .bq_cor_13, .bq_cor_23, .bq_cor_33, .bq_cor_43, .bq_cor_53, .bq_cor_63, .bq_cor_73, .bq_cor_83, .bq_cor_93, .bq_cor_103, .bq_cor_113, .bq_cor_123, .bq_cor_133, .bq_cor_143, .bq_cor_153, .bq_cor_163, .bq_cor_173, .bq_cor_183, .bq_cor_193 {
      color: #47a8d9;
      border-color: #47a8d9;
    }

    a {
      text-decoration: none;
      color: #333;
      outline: none;
    }

    .mor_list li .mor_tip:last-child {
      right: 0;
    }

    .mor_list li .mor_w {
      width: 240px;
    }

    .mor_list li .mor_tip {
      width: 140px;
      text-align: center;
      font-size: 14px;
      line-height: 18px;
      overflow: hidden;
      position: absolute;
      top: 65px;
      right: 170px;
      z-index: 1;
    }

    .mor_list li .mor_tip p {
      height: 30px;
      line-height: 30px;
    }

    .mor_list li .mor_tip strong {
      color: #c00000;
      font-weight: bold;
      font-size: 30px;
    }

    .mor_list li .mor_tip:last-child {
      right: 0;
    }

    .mor_list li .mor_w {
      width: 240px;
    }

    .mor_list li .mor_tip {
      width: 140px;
      text-align: center;
      font-size: 14px;
      line-height: 18px;
      overflow: hidden;
      position: absolute;
      top: 65px;
      right: 170px;
      z-index: 1;
    }
    .colorFillLabel {display:inline-block; float:left; height:25px; line-height:25px; padding:0 5px; color:#fff; text-align:center; font-size:12px; margin-right:5px}
    .colorFillLabel.yangtai {background:#00ae66}
    .colorFillLabel.weishengjian {background:#F1B541}
    .xinfangTag {
      height:22px;
      line-height:22px;
      text-align:center;
      border:1px solid #fff;
      padding: 0 8px;
      font-size: 12px;
      margin-right: 8px;
      line-height: 22px;
      display: inline-block;
    }
    .xinfangTag.tag1 {
      border-color:#e2d197;
      color:#e2d197
    }
    .xinfangTag.tag2 {
      border-color:#C5A9DD;
      color:#C5A9DD
    }
    .xinfangTag.tag3 {
      border-color:#E0A0A0;
      color:#E0A0A0
    }
    .xinfangTag.tag4 {
      border-color:#85c6dc;
      color:#85c6dc
    }
    .user-main .main-right li .info-panel .col-3 {
      width: 200px;
      text-align: right;
      float: left;
      position: absolute;
      top: 30px;
      right: 80px;
    }
    .user-main .main-right li .info-panel .col-3 .price {
      color: #e4393c;
      margin-top: 6px;
      width: 100%;
      position: relative;
      font-size: 16px;
    }
    .user-main .main-right li .info-panel .col-3 .price_xiajia,
    .user-main .main-right li .info-panel .col-3 .price_shixiao,
    .user-main .main-right li .info-panel .col-3 .price_chengjiao {
      color: #808080;
      margin-top: 6px;
      width: 100%;
      position: relative;
      font-size: 16px;
    }
    .user-main .main-right li .info-panel .col-3 .price .num,
    .user-main .main-right li .info-panel .col-3 .price_shixiao .num,
    .user-main .main-right li .info-panel .col-3 .price_xiajia .num,
    .user-main .main-right li .info-panel .col-3 .price_chengjiao .num {
      font-size: 30px;
      font-weight: 700;
      margin-right: 3px;
      font-family: tahoma;
    }
    .user-main .main-right li .info-panel .col-3 .price-pre {
      font-size: 12px;
      color: #999;
      font-family: Arial;
      margin-top: 5px;
    }
    .user-main .main-right li .pic-panel img.lj-lazy {
      width: 173px;
      height: 130px;
    }
    .user-main .main-right li .info-panel h2 {
      font-size: 19px;
      white-space: nowrap;
      width: 100%;
      height: 32px;
      line-height: 20px;
      vertical-align: middle;
      font-family: "Hiragino Sans GB","微软雅黑","Microsoft YaHei",SimHei,Tahoma,"宋体b8b\4f53",SimSun,sans-serif;
    }
    h1, h2, h3, h4, h5, h6 {
      margin: 0;
      padding: 0;
      font-size: 100%;
      font-weight: normal;
    }
    user agent stylesheet
    h2 {
      display: block;
      font-size: 1.5em;
      -webkit-margin-before: 0.83em;
      -webkit-margin-after: 0.83em;
      -webkit-margin-start: 0px;
      -webkit-margin-end: 0px;
      font-weight: bold;
    }
    .user-main .main-right li .info-panel h2 a, .user-main .main-right li .info-panel h2 span {
      font-family: "Hiragino Sans GB","微软雅黑","Microsoft YaHei",SimHei,Tahoma,"宋体b8b\4f53",SimSun,sans-serif;
      color: #009de8;
      font-size: 20px;
      font-weight: 700;
    }
    .user-main .main-right .all-list .list-bot li {
      border-bottom: 1px dashed #e9e9e9;
      height: 170px;
      position: relative;
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
    .user-main .main-right li .other .con {
      width: 410px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      font-size: 14px;
      color: #888;
    }
    body, div, p {
      margin: 0;
      padding: 0;
    }
    user agent stylesheet
    div {
      display: block;
    }
    .main-right li .info-panel {
      color: #565a5c;
      padding-left: 14px;
      width: 505px;
      position: relative;
      float: right;
      height: 130px;
    }
    body, div, p {
      margin: 0;
      padding: 0;
    }
    user agent stylesheet
    div {
      display: block;
    }
    .main-right li .pic-panel {
      width: 175px;
      float: left;
      position: relative;
    }
    body, div, p {
      margin: 0;
      padding: 0;
    }
    user agent stylesheet
    div {
      display: block;
    }
    .colorFillLabel {display:inline-block; float:left; height:25px; line-height:25px; padding:0 5px; color:#fff; text-align:center; font-size:12px; margin-right:5px}
    .colorFillLabel.yangtai {background:#00ae66}
    .colorFillLabel.weishengjian {background:#F1B541}
    .xinfangTag {
      height:22px;
      line-height:22px;
      text-align:center;
      border:1px solid #fff;
      padding: 0 8px;
      font-size: 12px;
      margin-right: 8px;
      line-height: 22px;
      display: inline-block;
    }
    .xinfangTag.tag1 {
      border-color:#e2d197;
      color:#e2d197
    }
    .xinfangTag.tag2 {
      border-color:#C5A9DD;
      color:#C5A9DD
    }
    .xinfangTag.tag3 {
      border-color:#E0A0A0;
      color:#E0A0A0
    }
    .xinfangTag.tag4 {
      border-color:#85c6dc;
      color:#85c6dc
    }
    .user-main .main-right li .info-panel .col-3 {
      width: 200px;
      text-align: right;
      float: left;
      position: absolute;
      top: 30px;
      right: 80px;
    }
    .user-main .main-right li .info-panel .col-3 .price {
      color: #e4393c;
      margin-top: 6px;
      width: 100%;
      position: relative;
      font-size: 16px;
    }
    .user-main .main-right li .info-panel .col-3 .price_xiajia,
    .user-main .main-right li .info-panel .col-3 .price_shixiao,
    .user-main .main-right li .info-panel .col-3 .price_chengjiao {
      color: #808080;
      margin-top: 6px;
      width: 100%;
      position: relative;
      font-size: 16px;
    }
    .user-main .main-right li .info-panel .col-3 .price .num,
    .user-main .main-right li .info-panel .col-3 .price_shixiao .num,
    .user-main .main-right li .info-panel .col-3 .price_xiajia .num,
    .user-main .main-right li .info-panel .col-3 .price_chengjiao .num {
      font-size: 30px;
      font-weight: 700;
      margin-right: 3px;
      font-family: tahoma;
    }
    .user-main .main-right li .info-panel .col-3 .price-pre {
      font-size: 12px;
      color: #999;
      font-family: Arial;
      margin-top: 5px;
    }
    .user-main .main-right li .pic-panel img.lj-lazy {
      width: 173px;
      height: 130px;
    }
    .user-main .main-right li .info-panel h2 {
      font-size: 19px;
      white-space: nowrap;
      width: 100%;
      height: 32px;
      line-height: 20px;
      vertical-align: middle;
      font-family: "Hiragino Sans GB","微软雅黑","Microsoft YaHei",SimHei,Tahoma,"宋体b8b\4f53",SimSun,sans-serif;
    }
    h1, h2, h3, h4, h5, h6 {
      margin: 0;
      padding: 0;
      font-size: 100%;
      font-weight: normal;
    }
    user agent stylesheet
    h2 {
      display: block;
      font-size: 1.5em;
      -webkit-margin-before: 0.83em;
      -webkit-margin-after: 0.83em;
      -webkit-margin-start: 0px;
      -webkit-margin-end: 0px;
      font-weight: bold;
    }
    .user-main .main-right li .info-panel h2 a, .user-main .main-right li .info-panel h2 span {
      font-family: "Hiragino Sans GB","微软雅黑","Microsoft YaHei",SimHei,Tahoma,"宋体b8b\4f53",SimSun,sans-serif;
      color: #009de8;
      font-size: 20px;
      font-weight: 700;
    }
    .user-main .main-right .all-list .list-bot li {
      border-bottom: 1px dashed #e9e9e9;
      height: 170px;
      position: relative;
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
    .user-main .main-right li .other .con {
      width: 410px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      font-size: 14px;
      color: #888;
    }
    body, div, p {
      margin: 0;
      padding: 0;
    }
    user agent stylesheet
    div {
      display: block;
    }
    .main-right li .info-panel {
      color: #565a5c;
      padding-left: 14px;
      width: 505px;
      position: relative;
      float: right;
      height: 130px;
    }
    body, div, p {
      margin: 0;
      padding: 0;
    }
    user agent stylesheet
    div {
      display: block;
    }
    .main-right li .pic-panel {
      width: 175px;
      float: left;
      position: relative;
    }
    body, div, p {
      margin: 0;
      padding: 0;
    }
    user agent stylesheet
    div {
      display: block;
    }
    .navbar  .navbar-brand {
      float: left;
      height: 50px;
      padding: 15px 15px;
      font-size: 18px;
      line-height: 20px;
      margin-bottom: 0px;
    }
  </style>
</head>

 <style>
		   .dataTable th.sorting_desc:after {
		     content: "\f0dd";
		     top: 5px;
		     color: #307ecc;
		   }
		 </style>
		 <script>
		   $(document).ready(function() {
		     $('#sample-table').DataTable();
		   } );
		   $.fn.dataTable.ext.errMode = function(s,h,m){}
		 </script>

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
    <div class="user-main" style="width: 1200px">
      <div class="main-left fl">
        <ul class="nav nav-pills nav-stacked">
          <li role="presentation"><img class="img-responsive name img-rounded"></li>

          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/userCenter.jsp>编辑资料</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/collection.jsp>我的收藏</a></li>
          <li role="presentation" class="active"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/myHouse.jsp>我的房子</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/comment.jsp>我的评论</a></li>
          <!--<li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/application.jsp>我的申请</a></li>-->
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/dealHistory.jsp>成交记录</a></li>
        </ul>
      </div>
      <div class="main-right fr" style="width: 950px">
        <div class="allList">
          <div class="title" >出租房屋</div>
          <font color="#FF0000">${requestScope.rentMessage}</font>

          <div class="tab">
            <span class="actTap actSetArgs hover ">委托出租</span>
            <span class="actTap actSetArgs ">我的委托</span>

          </div>
          <form id="submitRent" style="display: inline" class="js_module" action=${pageContext.request.contextPath}/sendRentHouse.do method="post" enctype="multipart/form-data">
          <ul class="">
            <li class="js_ajaxError ErrMsgNew" style="display: none"></li>

            <li style="display: block">
              <nobr>
                <label style="text-align:right; width:150px">省市：</label>
                <input type="text" class="form-control" style=" display: inline;width: 200px" id="rentHouseProvince" placeholder="请输入所在省市" name="rentHouseProvince">
                <label style="text-align:right; width:150px">区域：</label>
                <input type="text" class="form-control" style=" display: inline;width: 200px" id="rentHouseRegion" placeholder="请输入所在区域" name="rentHouseRegion">
              </nobr>
            </li>


            <li style="display:block">
              <nobr>
                <label style="text-align:right; width:150px">租金：</label>
                <input type="text" class="form-control" style=" display: inline; width:200px" id="rentHousePrice" placeholder="xx元/月"  rule="notNull" validatename="租金" name="rentHousePrice">
                <label style="text-align:right; width:150px">面积：</label>
                <input type="text" class="form-control" style=" display: inline; width:150px" id="rentHouseArea" placeholder="请输入面积" rule="notNull" validatename="地址" name="rentHouseArea">
              </nobr>
            </li>
            <li style="display: block">
              <nobr>
                <label style="text-align:right; width:150px">地址：</label>
                <input type="text" class="form-control" style=" display: inline; width:200px" id="rentHouseUnitNumber" placeholder="楼栋号-单元号-门牌号" rule="notNull" name="rentHouseUnitNumber">
                <label style="text-align:right; width:150px">地铁：</label>
                <input type="text" class="form-control" style=" display: inline; width:150px" id="rentHouseSubway" placeholder="请输入地铁" name="rentHouseSubway">
              </nobr>
            </li>
            <li style="display: block">
              <nobr>
                <label style="text-align:right; width:150px">朝向：</label>
                <input type="text" class="form-control" style=" display: inline; width:200px" id="rentHouseToward" placeholder="请输入朝向" rule="notNull" name="rentHouseToward">
                <label style="text-align:right; width:150px">楼层：</label>
                <input type="text" class="form-control" style=" display: inline; width:150px" id="rentHouseFloor" placeholder="请输入楼层" name="rentHouseFloor">
              </nobr>
            </li>
            <li style="display: block">
              <nobr>
                <label style="text-align:right; width:150px">房型：</label>
                <input type="text" class="form-control" style=" display: inline; width:100px" id="rentHouseRoom" placeholder="几室" name="rentHouseRoom">
                <input type="text" class="form-control" style=" display: inline; width:100px" id="rentHouseHall" placeholder="几厅" name="rentHouseHall">
                <input type="text" class="form-control" style=" display: inline; width:100px" id="rentHouseToilet" placeholder="几厕" name="rentHouseToilet">
              </nobr>
            </li>
            <li style="display: block">
              <nobr>
                <label style="text-align:right; width:150px">小区：</label>
                <input type="text" class="form-control" style=" display: inline;width:150px" id="communityName" placeholder="请输入小区"
                       maxlength="14" name="communityName" rule="notNull" validatename="小区">
              </nobr>
            </li>
            <li style="display: block">
              <nobr>
                <label style="text-align:right; width:150px">图片：</label>
                <input type="file" name="img" multiple="multiple"  style="display: inline-block" />
              </nobr>
            </li>


            <li style="display: block">
              <label style="text-align:right; width:150px"></label>
              <span></span><button type="submit" class="actSubmit lj-btn btn btn-primary" id="nameSubmit" >提交委托</button>
            </li>
          </ul>
        </form>
          <div class="d_Confirm_Order_style" id="selectRent" style="display: none;">
            <div class="search_style" style="display: none" >
              <div class="title_names" >搜索查询</div>
              <ul class="search_content clearfix">

                <li><label class="l_f">租房ID</label>
                  <input name="" type="text" class="text_add " placeholder="输入租房ID" style=" width:200px">
                  <button type="button" class="btn_search" style="display: inline-block"><i class="icon-search"></i>查询</button>

                </li>

              </ul>
            </div>



            <div class="table_menu_list">
              <div id="sample-table_wrapper" class="dataTables_wrapper no-footer">

                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample-table"
                       role="grid" aria-describedby="sample-table_info">
                  <thead>
                  <tr role="row">

                    <th  tabindex="0" aria-controls="sample-table" rowspan="1"
                        colspan="1" aria-sort="descending" aria-label="上架时间" style="width: 150px;">上架时间
                    </th>
                    <th tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="房源" style="width: 200px;">房源
                    </th>
                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="房型" style="width: 100px;">房型
                    </th>
                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="租金" style="width: 100px;">租金
                    </th>
                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="联系方式" style="width: 150px;">联系方式
                    </th>
                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="审核情况" style="width: 150px;">审核情况
                    </th>

                    <!--<th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="操作" style="width: 150px;">操作
                    </th>-->

                  </tr>
                  </thead>
                  <tbody>
                   <%
                  List<Application> lra = (List<Application>)s.getAttribute("rentHouseApplication");
                  for (int i = 0; i < lra.size(); ++i) {
                	  Application a = lra.get(i);
                	  %>
                	  <tr role="row" class="odd">
	                    <td><%=a.date %></td>
	                    <td><%=a.address %></td>
	                    <td><%=a.room %>室<%=a.hall %>厅<%=a.toilet %>厕</td>
	                    <td><%=a.price %></td>
	                    <td><%=a.phone %></td>
	                    <td>
	                    <%
	                    if(a.check == 0)
	                    	out.print("正在审核");
	                    else if(a.check == 1)
	                    	out.print("审核通过");
	                    else if(a.check == 2)
	                    	out.print("审核未通过");
	                    %>
	                    </td>
	                    <!--<td class="td-manage">
	                      <a id="<% //a.houseId %>" href="javascript:;" class="btn btn-xs btn-warning" onclick="member_del(this, this.parentNode.parentNode.cells[1].innerHTML )">删除</a>
	                    </td>-->
	                  </tr>
                	  <%
                  }
                  %>
                  </tbody>


                </table>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>

</div>
</body>
<script>
  $('.user-main .main-right .tab span').click(function () {
//    $('.js_ajaxError').hide();
    if ($(this).text() == '委托出租') {
      $(this).addClass('hover').siblings().removeClass('hover');
      $('#submitRent').css('display', 'block');
      $('#selectRent').css('display', 'none');
    }
    if ($(this).text() == '我的委托') {
      $(this).addClass('hover').siblings().removeClass('hover');
      $('#submitRent').css('display', 'none');
      $('#selectRent ').css('display', 'block');
    }


  });

</script>
</html>

