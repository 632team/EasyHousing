<%@page import="java.util.*"%>
<%@page import="com.easyhousing.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%
  HttpSession s = request.getSession(); 
  List<String> rentHousePicList = (List<String>)s.getAttribute("rentHousePicList");
  RentHouse irentHouse = (RentHouse)s.getAttribute("rentHouse");
%>
    <meta charset="UTF-8">
    <title>房屋详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">try {
  var AG_onLoad=function(func){
  if(document.readyState==="complete"||document.readyState==="interactive")
  func();
  else if(document.addEventListener)
  document.addEventListener("DOMContentLoaded",func);
  else if(document.attachEvent)
  document.attachEvent("DOMContentLoaded",func)};
  var AG_removeElementById = function(id) {
  var element = document.getElementById(id);
  if (element && element.parentNode) {
  element.parentNode.removeChild(element);
  }
  };
  var AG_removeElementBySelector = function(selector) {
  if (!document.querySelectorAll) {
  return;
  }
  var nodes = document.querySelectorAll(selector);
  if (nodes) {
  for (var i = 0; i < nodes.length; i++) {
  if (nodes[i] && nodes[i].parentNode) {
  nodes[i].parentNode.removeChild(nodes[i]);
  }
  }
  }
  };
  var AG_each = function(selector, fn) {
  if (!document.querySelectorAll)
  return;
  var elements = document.querySelectorAll(selector);
  for (var i = 0; i < elements.length; i++) {
  fn(elements[i]);
  }
  };
  var AG_removeParent = function(el, fn) {
  while (el && el.parentNode) {
  if (fn(el)) {
  el.parentNode.removeChild(el);
  return;
  }
  el = el.parentNode;
  }
  };
  window.wcs_add = {};
  window.wcs_do = function() { };
  } catch (ex) { console.error('Error executing AG js: ' + ex);}
  </script>
  <script>
  jQuery(document).ready(function($) {
  $('.theme-login').click(function(){
  $('.theme-popover-mask').fadeIn(100);
  $('.theme-popover').slideDown(200);
  })
  $('.theme-poptit .close').click(function(){
  $('.theme-popover-mask').fadeOut(100);
  $('.theme-popover').slideUp(200);
  })

  })
  </script>

  <style type="text/css">

  body, h1, h2, h3, h4, h5, h6, p, blockquote, pre, code, del, dfn, em, img, strong, dd, dl, dt, li, ol, ul, fieldset, form, label, button, input, table, caption, tbody, tfoot, thead, tr, th, td, menu {
  margin:0;
  padding:0;
  }
  article, aside, details, figcaption, figure, footer, header, hgroup, nav, section {
  display:block
  }
  audio, canvas, video {
  display:inline-block;
  *display:inline;
  *zoom:1
  }
  audio:not([controls]) {
  display:none
  }
  table {
  border-collapse:collapse;
  border-spacing:0;
  empty-cells:show
  }
  ol, ul, menu {
  list-style:none
  }
  img {
  border:0
  }
  a:focus {
  outline:none
  }
  em, i {
  font-style: normal;
  }
  button, input, select, textarea {
  font-size:100%;
  margin:0;
  vertical-align:-3px;
  outline:none;
  }
  button, input {
  border:1px solid;
  outline:none;
  line-height:normal;
  *overflow:visible
  }
  button::-moz-focus-inner, input::-moz-focus-inner {
  border:0;
  padding:0
  }
  button, input[type="button"], input[type="reset"], input[type="submit"] {
  cursor:pointer;
  -webkit-appearance:button
  }
  input[type="search"] {
  -webkit-appearance:textfield;
  -webkit-box-sizing:content-box;
  -moz-box-sizing:content-box;
  box-sizing:content-box
  }
  input[type="search"]::-webkit-search-decoration {
  -webkit-appearance:none
  }
  textarea {
  overflow:auto;
  vertical-align:top
  }
  ::selection {
  background:#72d0eb;
  color:#fff;
  text-shadow:none
  }
  ::-moz-selection {
  background:#72d0eb;
  color:#fff;
  text-shadow:none
  }
  *[hidden] {
  display:none
  }
  a {
  color:#0088DB;
  text-decoration:none;
  cursor:pointer
  }
  a:hover {
  color:#2A5E8E
  }
  .clearfix:after, .central:after, .widget ul:after, .paging:after, .pagenav:after, .base-tit:after {
  content:".";
  display:block;
  height:0;
  clear:both;
  visibility:hidden
  }
  .clearfix, .central, .widget ul, .paging, .pagenav, .base-tit {
  height:1%;
  }
  body, button, input, select, textarea, code {
  font-size:12px;
  font-family:microsoft yahei;
  color: #444;
  }
  .ipt {
  border: solid 1px #d2d2d2;
  border-left-color: #ccc;
  border-top-color: #ccc;
  border-radius: 2px;
  box-shadow: inset 0 1px 0 #f8f8f8;
  background-color: #fff;
  padding: 4px 6px;
  height: 21px;
  line-height: 21px;
  color: #555;
  width: 180px;
  vertical-align: baseline;
  }
  .ipt-mini {
  width: 140px;
  padding: 1px 3px;
  }
  .ipt:focus {
  border-color: #95C8F1;
  box-shadow: 0 0 4px #95C8F1;
  }
  /* btn */
  .btn {
  position: relative;
  cursor: pointer;
  display: inline-block;
  vertical-align: middle;
  font-size: 12px;
  font-weight: bold;
  height: 27px;
  line-height: 27px;
  min-width: 52px;
  padding: 0 12px;
  text-align: center;
  text-decoration: none;
  border-radius: 2px;
  border: 1px solid #ddd;
  color: #666;
  background-color: #f5f5f5;
  background: -webkit-linear-gradient(top, #F5F5F5, #F1F1F1);
  background: -moz-linear-gradient(top, #F5F5F5, #F1F1F1);
  background: linear-gradient(top, #F5F5F5, #F1F1F1);
  }
  input.btn {
  height: 29px;
  }
  .btn:hover {
  border-color:#c6c6c6;
  color:#333;
  background-color:#f8f8f8;
  background:-webkit-linear-gradient(top, #f8f8f8, #f1f1f1);
  background:-moz-linear-gradient(top, #f8f8f8, #f1f1f1);
  background:linear-gradient(top, #f8f8f8, #f1f1f1);
  box-shadow:#ddd 0 1px 1px 0;
  }
  .btn:active, .btn.btn-active {
  box-shadow:#ddd 0 1px 2px 0 inset;
  border-color:#c6c6c6;
  }
  .btn:focus {
  border-color:#4d90fe;
  outline:none
  }
  .btn-primary {
  /* border-color: #3079ED;*/
  color: #ffffff;
  background-color: #4b91c4;
  background: -webkit-linear-gradient(top, #4b91c4, #4b91c4);
  background: -moz-linear-gradient(top, #4b91c4, #4b91c4);
  background: linear-gradient(top, #4b91c4, #4b91c4);
  display: inline-block;
  width: 98px;
  height: 34px;
  border: 0px solid #34724f;
  border-radius: 2px;
  font-size: 14px;
  text-align: center;
  cursor: pointer;
  }
  .btn-primary:hover {
  border-color:#2F5BB7;
  color:#fff;
  background-color: #4D90FE;
  background: -webkit-linear-gradient(top, #4D90FE, #357AE8);
  background: -moz-linear-gradient(top, #4D90FE, #357AE8);
  background: linear-gradient(top, #4D90FE, #357AE8);
  }
  .btn-primary:active, .btn-primary.btn-active {
  box-shadow:#2176D3 0 1px 2px 0 inset;
  border-color: #3079ED;
  }
  .btn-primary:focus {
  border-color:#4d90fe;
  outline:none
  }
  .theme-buy {
  margin-top:10%;
  text-align: center;
  }
  .theme-gobuy, .theme-signin {
  font-size: 15px;
  }
  .theme-price {
  position: relative;
  bottom: -6px;
  font-family: microsoft yahei, Arial, Helvetica, sans-serif;
  margin-right: 20px;
  font-weight: bold;
  color: #f60;
  line-height: 32px;
  font-size: 24px;
  display: inline-block;
  }
  .theme-price dfn {
  font-style: normal;
  font-size: 18px;
  margin-right: 2px;
  }
  .theme-desc {
  padding: 30px;
  }
  .theme-version {
  padding: 30px;
  }
  .theme-popover-mask {
  z-index: 9998;
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:#000;
  opacity:0.4;
  filter:alpha(opacity=40);
  display:none
  }
  .theme-popover {
  z-index:9999;
  position:fixed;
  top:50%;
  left:50%;
  width:660px;
  height:460px;
  margin:-180px 0 0 -330px;
  border-radius:5px;
  border:solid 2px #666;
  background-color:#fff;
  display:none;
  box-shadow: 0 0 10px #666;
  }
  .theme-poptit {
  border-bottom:1px solid #ddd;
  padding:12px;
  position: relative;
  }
  .theme-popbod {
  padding:60px 15px;
  color:#444;
  height: 148px;
  }
  .theme-popbom {
  padding:15px;
  background-color:#f6f6f6;
  border-top:1px solid #ddd;
  border-radius:0 0 5px 5px;
  color:#666
  }
  .theme-popbom a {
  margin-left:8px
  }
  .theme-poptit .close {
  float:right;
  color:#999;
  padding:5px;
  margin:-2px -5px -5px;
  font:bold 14px/14px simsun;
  text-shadow:0 1px 0 #ddd
  }
  .theme-poptit .close:hover {
  color:#444;
  }
  .btn.theme-reg {
  position: absolute;
  top: 8px;
  left: 43%;
  display: none
  }
  .inp-gray, .feed-mail-inp {
  border:1px solid #ccc;
  background-color:#fdfdfd;
  width:220px;
  height:16px;
  padding:4px;
  color:#444;
  margin-right:6px
  }
  .dform {
  padding:80px 60px 40px;
  text-align: center;
  }
  .dform .ipt_error {
  background-color:#FFFFCC;
  border-color:#FFCC66
  }
  .dform-tip {
  display:none;
  background-color:#080;
  color:#fff;
  line-height:42px;
  margin-top:10px;
  /*display:;*/
  font-size: 14px;
  }
  .dform-tip-errer {
  background-color: #CF301A;
  }
  .dform-tip a {
  display: inline-block;
  padding: 0 20px;
  margin-left:10px;
  background-color: #FFE924;
  color: #CF301A;
  }
  .dform-login {
  padding:0;
  height: 270px;
  overflow: hidden;
  }
  .dform-login iframe {
  height: 470px;
  margin-top: -180px;
  }
  .theme-signin {
  margin: -50px -20px -50px 90px;
  text-align:left;
  font-size: 14px;
  }
  .theme-signin h4 {
  color:#999;
  font-weight:100;
  margin-bottom: 20px;
  font-size: 12px;
  }
  .theme-signin li {
  padding-left: 80px;
  margin-bottom: 15px;
  }
  .theme-signin li strong {
  float: left;
  margin-left: -80px;
  width: 80px;
  text-align: right;
  line-height: 32px;
  }
  .theme-signin .btn {
  margin-bottom: 10px;
  }
  .theme-signin p {
  font-size: 12px;
  color: #999;
  }
  .theme-desc, .theme-version {
  padding-top: 0
  }

  </style>

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
  margin-top: -2px;
  margin-left: 120px;
  }
  .header .logo {
  width: 120px;
  height:55px;
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
  margin-left:50px;

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
  background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg23.png) no-repeat right center;
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
  background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg24.png) no-repeat center center;
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
  margin-right: 60px;
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
  background: url(${pageContext.request.contextPath}/jsp/images/rentWindow/djimg25.png) no-repeat left center;

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
  i, em {
  font-style: normal;
  }
  .clear {
  display: block;
  }
  .intro {
  height: 46px;
  line-height: 46px;
  background: #f1f1f1;
  border-top: 1px solid #eee;
  }
  .intro .container {
  width: 1000px;
  margin: 0 auto;
  }
  div {
  display: block;
  }
  .intro .l-txt, .intro .r-txt {
  font-size: 12px;
  }
  .fl {
  float: left;
  }
  .intro .l-txt i {
  background: url(img/new-version/bg.png) no-repeat -12px -7px;
  width: 13px;
  height: 19px;
  display: inline-block;
  position: relative;
  top: 3px;
  }
  em, i, b, strong {
  font-weight: 400;
  font-style: normal;
  }
  .intro .l-txt a, .intro .l-txt span {
  color: #555555;
  }
  a {
  text-decoration: none;
  outline: none;
  }
  .intro .l-txt span.stp {
  color: #999;
  font-family: simsun;
  }
  .intro .l-txt a, .intro .l-txt span {
  color: #555555;
  }
  .intro .l-txt span.stp {
  color: #999;
  font-family: simsun;
  }
  .intro .l-txt a, .intro .l-txt span {
  color: #555555;
  }
  .intro .l-txt span.stp {
  color: #999;
  font-family: simsun;
  }
  .content-wrapper {
  width: 1000px;
  margin: 0 auto;
  background-color: #fff;
  box-shadow: 0 1px 3px rgba(13,3,9,0.2);
  border-radius: 2px;
  }
  .content-wrapper {
  width: 1000px;
  margin: 0 auto;
  background-color: #fff;
  box-shadow: 0 1px 3px rgba(13,3,9,0.2);
  border-radius: 2px;
  }
  .title-wrapper {
  height: 125px;
  line-height: 125px;
  text-align: center;
  position: relative;
  border-bottom: 1px solid #ebebeb;
  background-color: #fcfcfc;

  }
  .title-wrapper .content {
  display: inline-block;
  width: 928px;
  vertical-align: middle;
  line-height: 1;
  text-align: left;
  }
  .title-wrapper .content .title {
  display: table-cell;
  }
  .title-wrapper .content .title .main {
  max-width: 790px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  font-size: 26px;
  color: #333333;
  font-weight: bold;
  }
  h1, h2, h3, h4, h5, h6 {
  margin: 0;
  padding: 0;
  font-size: 100%;
  font-weight: normal;
  }
  h1 {
  display: block;
  font-size: 2em;
  -webkit-margin-before: 0.67em;
  -webkit-margin-after: 0.67em;
  -webkit-margin-start: 0px;
  -webkit-margin-end: 0px;
  font-weight: bold;
  }
  .title-wrapper .content .title .sub {
  max-width: 790px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  margin-top: 15px;
  font-size: 14px;
  color: #aaaaaa;
  }
  .title-wrapper .content .btnContainer {
  display: table-cell;
  width: 1000px;
  text-align: right;
  vertical-align: middle;
  }
  .title-wrapper .content .btnContainer button {
  display: inline-block;
  width: 98px;
  height: 34px;
  background-color: #4b91c4;
  border: 0px solid #34724f;
  border-radius: 2px;
  color: #ffffff;
  font-size: 14px;
  text-align: center;
  cursor: pointer;
  }
  .overview {
  width: 928px;
  padding: 36px;
  background-color: #fff;
  }
  body, div, p {
  margin: 0;
  padding: 0;
  }
  .overview .img {
  display: inline-block;
  width: 418px;
  cursor: pointer;
  }
  .overview .img .imgContainer {
  position: relative;
  }
  .overview .img .imgContainer img {
  width: 450px;
  height: 340px;
  display: block;
  }
  img {
  border: 0;
  vertical-align: top;
  }
  .thumbnail {
  display: block;
  padding: 4px;
  margin-bottom: 20px;
  line-height: 1.42857143;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 4px;
  -webkit-transition: border .2s ease-in-out;
  -o-transition: border .2s ease-in-out;
  transition: border .2s ease-in-out;
  }
  .overview .img .thumbnail ul {
  white-space: nowrap;
  overflow: hidden;
  height: 82px;
  font-size: 0;
  }
  dl, dt, dd, ul, ol, li {
  list-style: none;
  margin: 0;
  padding: 0;
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
  .overview .img .thumbnail {
  position: relative;
  margin-top: 6px;
  width: 454px;
  height: 82px;
  }
  .overview .img .thumbnail ul li:first-child {
  margin-left: 0;
  }
  .overview .img .thumbnail ul li {
  display: inline-block;
  width: 109px;
  height: 82px;
  margin-left: 6px;
  }
  dl, dt, dd, ul, ol, li {
  list-style: none;
  margin: 0;
  padding: 0;
  }
  body, div, p {
  margin: 0;
  padding: 0;
  }
  .overview .img .thumbnail .pre {
  position: absolute;
  top: 0;
  left: 0;
  line-height: 82px;
  width: 32px;
  text-align: center;
  font-size: 20px;
  color: #cac9c9;
  opacity: .8;
  filter: alpha(opacity=80);
  background-color: #000;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  }
  .overview .img .thumbnail .next {
  position: absolute;
  top: 0;
  right: 0;
  line-height: 82px;
  width: 32px;
  text-align: center;
  font-size: 20px;
  color: #cac9c9;
  opacity: .8;
  filter: alpha(opacity=80);
  background-color: #000;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  }
  .overview .img .imgContainer span {
  position: absolute;
  left: 10px;
  bottom: 10px;
  background-color: rgba(0,0,0,0.7);
  font-size: 12px;
  color: #ffffff;
  padding: 0 11px;
  line-height: 32px;
  border-radius: 2px;
  }
  .overview .img .imgContainer .loading {
  display: none;
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  z-index: 1;
  background: url(${pageContext.request.contextPath}/jsp/img/detail/loading.gif) center no-repeat;
  }
  .overview .content {
  display: inline-block;
  float: right;
  width: 300px;
  line-height: 1;
  margin-right: 40px;
  }
  .overview .content .price {
  position: relative;
  height: 49px;
  white-space: nowrap;
  }
  .zf-content .price {
  margin-bottom: 2px;

  }
  .overview .content .price .total {
  display: inline-block;
  font-family: Tahoma;
  font-size: 46px;
  line-height: 37px;
  height: 38px;
  color: #e4393c;
  font-weight: bold;
  letter-spacing: -1px;
  max-width: 50%;
  overflow: hidden;
  text-overflow: ellipsis;
  }
  .overview .content .price .unit, .overview .content .price .payNorm {
  display: inline-block;
  margin-left: 7px;
  font-size: 16px;
  color: #e4393c;
  height: 37px;
  vertical-align: 2px;
  }
  .overview .content .price .unit span, .overview .content .price .payNorm span {
  display: block;
  margin-top: 9px;
  }
  .overview .content .price .removeIcon {
  display: none;
  width: 150px;
  height: 112px;
  position: absolute;
  right: -25px;
  top: -31px;
  background: url(${pageContext.request.contextPath}/jsp/img/detail/isRemove.png) no-repeat;
  }
  .zf-content .zf-room p.lf {
  float: left;
  width: 215px;

  }
  .zf-content .zf-room p {
  font-size: 12px;
  color: #333;
  margin-top: 20px;
  }
  p {
  display: block;
  -webkit-margin-before: 1em;
  -webkit-margin-after: 1em;
  -webkit-margin-start: 0px;
  -webkit-margin-end: 0px;
  }
  .zf-content .zf-room p i {
  color: #888;
  }
  em, i, b, strong {
  font-weight: 400;
  font-style: normal;
  }
  .zf-content .zf-room p.lf {
  float: left;
  width: 600px;
  }
  .zf-content .zf-room p {
  font-size: 12px;
  color: #333;
  margin-top: 20px;
  }
  p {
  display: block;
  -webkit-margin-before: 1em;
  -webkit-margin-after: 1em;
  -webkit-margin-start: 0px;
  -webkit-margin-end: 0px;
  }
  .clear {
  display: block;
  }
  .zf-content .zf-room p {
  font-size: 12px;
  color: #333;
  margin-top: 20px;
  }

  /*点评部分*/
  .mod-wrap {
  width: 1000px;
  margin: 0 auto;
  }
  .mod-wrap .user-comment {
  padding-bottom: 0;


  }
  .mod-wrap .mod-panel {
  background-color: #fff;
  padding-left: 40px;
  padding-right: 30px;
  padding-top: 30px;
  padding-bottom: 30px;
  margin-bottom: 15px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  -o-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  -ms-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  }

  </style>
  
        <script type="text/javascript">
      function showall(){
        var temp = document.getElementById("serchar");
        temp.style.display = "block";
      }
      function hideall(){
        var temp = document.getElementById("serchar");
        temp.style.display = "none";
      }
      $(function(){
    	  $("ul .sel").click(function(){
        	var temp = document.getElementById("keyword");
            temp.value = $(this).text();
//          temp.innerHTML = $(this).text();
         // alert( $("span#searchName").html());
          $("#searchName").text($(this).text());
        });
      });
    </script>
  
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
        <a href="#">
          <img src="${pageContext.request.contextPath}/jsp/images/rentWindow/logo1.png" class="logo" >
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
              <a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp class="hrf">首页</a>
            </span>
          <span>
              <a href="homepage.html" class="hrf">二手房</a>
            </span>
          <span>
              <a href=${pageContext.request.contextPath}/buildingSelect.do class="hrf">新房</a>
            </span>
          <span>
              <a href=${pageContext.request.contextPath}/rentHouseSelect.do class="hrf" style="color: #8fcafe">租房</a>
            </span>
        </div>
      </div>

    </div>
    <div class="wsrrent">
      <div class="container">
        <div class="subsh subsher">
          <form action=${pageContext.request.contextPath}/globalSearch.do method="post" id="searchForm">
          <div class="subsh_l fl">
            <div class="sd_sel fl">
            <input hidden=true id="keyword" value="新房" name="which"></input>
              <span id="searchName" onclick="showall()">新房</span>
				<ul id="serchar" onmouseleave="hideall()">
					<li class="sel">新房</li>
					<li class="sel">租房</li>
				</ul>
            </div>
            <input type="text" name="content" placeholder="请输入小区、地铁、区域开始找房" class="text" id="autoSearchText" maxlength="20" autocomplete="off">
            <div id="autoSearchItem" style="height: 285px; visibility: hidden;">
              <ul class="menu_v"></ul>
            </div>
            <input type="button" value class="submit" id="btnSearch" onclick="document.getElementById('searchForm').submit();">
            <input type="hidden" value="1" id="pageIndex">
          </div>
          </form>
          <div class="subsh_r fr">
            <a href=${pageContext.request.contextPath}/mapSearch.do class="al">
                <span>
                  <b>地图找房</b>
                  <i>地图</i>
                </span>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="intro clear" mod-id="lj-common-bread">
      <div class="container">
        <div class="fl l-txt">
          <i class="icon"></i>&nbsp;
          <a href=${pageContext.request.contextPath}/rentHouseSelect.do>易购房</a>
          <!-- <span class="stp">&nbsp;&gt;&nbsp;</span>
          <a href="https://cq.lianjia.com/zufang/">重庆租房</a>
          <span class="stp">&nbsp;&gt;&nbsp;</span>
          <a href="https://cq.lianjia.com/zufang/yuzhong/">渝中租房</a>
          <span class="stp">&nbsp;&gt;&nbsp;</span>
          <a href="https://cq.lianjia.com/zufang/lianglukou/">两路口租房</a>
          <span class="stp">&nbsp;&gt;&nbsp;</span>
          <a href="https://cq.lianjia.com/zufang/c3611060655470/">巴教村社区租房</a> -->
          <span class="stp">&nbsp;&gt;&nbsp;</span>&nbsp;<span>当前房源</span>&nbsp;
        </div>
      </div>
      
       <%
       if (s.getAttribute("user") != null) {
    	   %>
    	   <div class="theme-popover" style="display: none;">
		  <div class="theme-poptit">
		  <a href="javascript:;" title="关闭" class="close">×</a>
		  <h3>请填写申请表单</h3>
		  </div>
		  <div class="theme-popbod dform">
			  <form class="theme-signin" name="loginform" 
			  action=${pageContext.request.contextPath}/sendRentHouseOrder.do 
			  method="post">
			  <ol>
			  <li>用户ID：<input class="ipt" type="text" name="userId" value="<%=(((User)s.getAttribute("user")).getUserId()) %>" size="20" readonly="true" style="background-color:gray;"></li>
			  <li>房子ID：<input class="ipt" type="text" name="rentHouseId" value="<%=irentHouse.getRentHouseId() %>" size="20" readonly="true" style="background-color:gray;"></li>
			  <li>状态：<input class="ipt" type="text" name="orderStatus" value="未处理" size="20" readonly="true" style="background-color:gray;"></li>
			  <li>联系电话：<input class="ipt" type="text" name="userPhoneNumber" placeholder="请输入联系电话" size="20"></li>
			  <li>看房时间：<input class="ipt" type="text" name="date" placeholder="xxxx-xx-xx" size="20"></li>
			  <li><input class="btn btn-primary" type="submit" name="submit" value=" 确定申请 " onclick=alert("你的申请已提交");></li>
			  </ol>
			  </form>
		  </div>
		  </div>
    	   <%
       }
       %>
	  
    </div>
    <div class="content-wrapper" style="display: block;">
      <div class="title-wrapper">
        <div class="content">
          <div class="title">
            <h1 class="main">
            <% 
            out.print(irentHouse.getRentHouseAddress()+" ");
            out.print(irentHouse.getRentHouseRoom()+"室"+irentHouse.getRentHouseHall()+"厅 ");
            out.print(irentHouse.getRentHousePrice()+"元");
            %>
                     <!--  巴教村社区 3室1厅 2300元-->
            </h1>
            <div class="sub">这个经纪人很懒，没写核心卖点</div>
          </div>
          <div class="btnContainer ">
          
           <div class="theme-buy" style="display: inline;">
		  	<!--
		  	<a class="btn btn-primary btn-large theme-login" href="javascript:;">点击申请</a>
		  	-->
		  </div>
  			<div class="theme-buy" style="display: inline;">
            <button 
            <%
            int ok1 = 1;
            int ok2 = 0;
            if (s.getAttribute("user") == null)
            	ok1 = 0;
            else
            	ok1 = 1;
            if(s.getAttribute("haveRent") == null) {
            	ok2 = 0;
            }
            else {
            	ok2 = (Integer)s.getAttribute("haveRent");
            }
            if(ok1 == 0) {
            	out.print("onclick=\"window.location.href='/EasyHousing/jsp/html/logIn.jsp'\"");
            }
            else if(ok2 == 0) {
            	out.print("onclick=\"window.location.href='/EasyHousing/rentHouseCollect.do'\"");
            }
            else {
            	out.print("onclick=\"window.location.href='/EasyHousing/calcelRentHouseCollect.do'\"");
            }
            %>>
            <%
            System.err.println(ok1);
            System.err.println(ok2);
            if(ok1 != 0 && ok2 != 0) {
            	out.print("已关注房源");
            }
            else {
            	out.print("关注房源");
            }
            %></button>
            </div>
          </div>
        </div>
      </div>
      <div class="overview">
        <div class="img" id="topImg">
          <div class="imgContainer">
          <iframe id="iframe" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 450px; width:450px"
				  name="iframe" frameborder="0" src="/EasyHousing/jsp/html/example.jsp"></iframe>
            <!--<img src="<%
            if (rentHousePicList.size() != 0)
            	out.print(rentHousePicList.get(0)); 
            %>" alt="">
            <span>卧室B</span>
            <div class="loading" style="display: none;"></div>
          </div>
          <div class="thumbnail">
            <ul>
            <% 
            if (rentHousePicList.size() != 0) {
            	for(int i = 0; i < rentHousePicList.size(); i++) {
            	%>
             	 <li class=""><img src="<%out.print(rentHousePicList.get(i));%>" style="width:100%; height:100%" alt=""></li>
            	<%
            	}
            }
            %>
            </ul>
            -->
            <!-- <div class="pre">&lt;</div>
            <div class="next">&gt;</div> -->
          </div>
        </div>
        <div class="content zf-content">
          <div class="price ">
            <span class="total">
            <% 
            out.print(irentHouse.getRentHousePrice());
            %></span>
            <span class="unit">
        <span>元/月</span>
      </span>
            <div class="removeIcon"></div>
          </div>
          <div class="zf-room">
            <p class="lf"><i>面积：</i>
            <%out.print(irentHouse.getRentHouseArea()); %>平米</p>
            <p class="lf"><i>房屋户型：</i>
            <%out.print(irentHouse.getRentHouseRoom()); %>室
            <%out.print(irentHouse.getRentHouseHall()); %>厅
            <%out.print(irentHouse.getRentHouseToilet());%>卫  </p>
            <p class="lf"><i>楼层：</i><%out.print(irentHouse.getRentHouseFloorAttribute()); %> (共<%out.print(irentHouse.getRentHouseAllFloor()); %>层)</p>
            <p class="lf"><i>房屋朝向：</i><%out.print(irentHouse.getRentHouseToward()); %></p>
            <div class="clear"></div>
            <p><i>地铁：</i><%out.print(irentHouse.getRentHouseSubway()); %></p>
            <p><i>小区：</i><a href="https://cq.lianjia.com/xiaoqu/3611060655470/">巴教村社区</a>
              - <a href="https://cq.lianjia.com/zufang/c3611060655470/">1套出租中</a></p>
            <p><i>位置：</i><a href="https://cq.lianjia.com/zufang/yuzhong/">渝中</a> <a href="https://cq.lianjia.com/zufang/lianglukou/">两路口</a></p>
            <p class="lf"><i>时间：</i><%=(((new Date()).getTime() - irentHouse.getRentHousePublishTime().getTime() +1000000)/(3600*24*1000)) %>天前发布</p>      <div class="clear"></div>
          </div>
          <div class="brokerInfo" log-mod="zufang_detail_diamond-first">
            <div class="noData">暂无相关经纪人，请直接联系客服  10109666</div>
          </div>
          <!--<div class="houseRecord">-->
            <!--<span class="houseNum">链家编号：106100440279</span>-->
            <!--<div class="right">-->
              <!--<a href="javascript:;" class="report">虚假房源举报</a>-->
              <!--<a href="https://www.lianjia.com/zhuanti/pfgz" target="blank" class="detail">假一罚百细则</a>-->
            <!--</div>-->
          </div>
        </div>
      
      <div class="comment-module">
        <!-- UY BEGIN -->
        <!--<div id="uyan_frame"></div>-->
        <!--<script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js"></script>-->
        <!-- UY END -->
        <!--
        <form action=${pageContext.request.contextPath}/userCommentRentHouse.do method="post">
	        <textarea style="width: 95%; height:100px; margin-left: 20px; margin-right: 20px" onfocus="on_focus(this)" onblur="on_blur(this)" placeholder="您可以在这里输入您的评论："></textarea>
	        <button class="commentPress" style="float: right; margin-right:25px;">评论</button>
	    </form>
	    -->
        

		<!--用户评论-->
      <div class="mod-wrap" style="width: 1000px;  margin-top:20px;  background-color: white;">
        <iframe id="iframe" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "
              name="iframe" frameborder="0" src="/EasyHousing/jsp/html/Comment/commentBox.jsp"></iframe>
      </div>
        
        
      </div>
  </body>
</html>
