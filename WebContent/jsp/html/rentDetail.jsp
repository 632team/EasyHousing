<%@page import="java.util.List"%>
<%@page import="com.easyhousing.model.RentHouse"%>
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
      background:  #333;
    }
    .headerbg {
      width: 100%;
      height: 50px;
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
    .listhead .header .logo {
      width: 140px;
      margin-top: 6px;
    }
    .header .logo {
      width: 160px;
      float: left;
    }
    .listhead .header .nav {
      height: 60px;
      font-size: 25px;
    }
    .header .nav {
      width: 850px;
      height: 50px;
      float: left;
      font-size: 18px;
      font-weight: bold;
      margin-left: 100px;
    }
    .listhead .header .nav span {
      height: 60px;
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
    .wsrrent {
      width: 100%;
      border-bottom: 1px solid #ddd;
      background: #fff;
      margin-bottom: 20px;
      box-shadow: 0 2px 2px #e1e1e1;
    }
    .wsrrent .container {
      width: 1220px;
    }
    .container {
      width: 1200px;
      margin: auto;
    }
    .subsh {
      height: 35px;
      padding: 10px 0;
    }
    .subsh_l {
      width: 388px;
      height: 33px;
      border: 1px solid #bbb;
      position: relative;
      background: #fff;
    }
    .fl {
      float: left;
    }
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
    .fr {
      float: right;
    }
    .subsh_r .al {
      width: 85px;
      height: 31px;
      line-height: 31px;
      border: 2px solid #ddd;
      border-right: none;
      border-top-left-radius: 5px;
      border-bottom-left-radius: 5px;
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
      background-color: #ac3e58;
      border: 1px solid #34724f;
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
      background: url(../../img/detail/loading.gif) center no-repeat;
    }
    .overview .content {
      display: inline-block;
      float: right;
      width: 390px;
      line-height: 1;
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
      background: url(../../img/detail/isRemove.png) no-repeat;
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
      padding-left: 30px;
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
  function collect() {
	  
  }
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
          <img src="../images/rentWindow/logo1.png" class="logo" >
        </a>
        <div class="nav navml">
            <span>
              <a href=${pageContext.request.contextPath}/jsp/html/homepage.jsp class="hrf">首页</a>
            </span>
          <span>
              <a href="homepage.html" class="hrf">二手房</a>
            </span>
          <span>
              <a href="homepage.html" class="hrf">新房</a>
            </span>
          <span>
              <a href=${pageContext.request.contextPath}/rentHouseSelect.do class="hrf">租房</a>
            </span>
          <span>
             <%
              if (s.getAttribute("user") == null) {
            	  out.println("<a href=/EasyHousing/jsp/html/logIn.jsp class=\"href\">登录</a>");
              }
              else {
            	  out.println("<a href=/EasyHousing/jsp/html/logIn.jsp class=\"href\">个人中心</a>");
              }
              %>
            </span>
          <span>
              <a href=${pageContext.request.contextPath}/jsp/html/register.jsp class="hrf">注册</a>
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
    <div class="intro clear" mod-id="lj-common-bread">
      <div class="container">
        <div class="fl l-txt">
          <i class="icon"></i>&nbsp;
          <a href="https://cq.lianjia.com/">易购房</a>
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
            <button id="follow"
            <%
             if (s.getAttribute("user") == null) {
            	 out.print("href=/EasyHousing/jsp/html/logIn.jsp");
             }
             else {
            	 out.print("href='${pageContext.request.contextPath}/collect.do'");
             }
             %>>关注房源</button>
          </div>
        </div>
      </div>
      <div class="overview">
        <div class="img" id="topImg">
          <div class="imgContainer">
            <img src="<%out.print(rentHousePicList.get(0)); %>" alt="">
            <span>卧室B</span>
            <div class="loading" style="display: none;"></div>
          </div>
          <div class="thumbnail">
            <ul>
            <% 
            for(int i = 0; i < rentHousePicList.size(); i++) {
            %>
              <li class=""><img src="<%out.print(rentHousePicList.get(i));%>" style="width:100%; height:100%" alt=""></li>
            <%
            }
            %>
            </ul>
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
            <p class="lf"><i>时间：</i>4天前发布</p>      <div class="clear"></div>
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
        <% 
        if (s.getAttribute("user") != null) {
        %>
        <textarea style="width: 95%; height:100px; margin-left: 20px; margin-right: 20px" onfocus="on_focus(this)" onblur="on_blur(this)">您可以在这里输入您的评论：</textarea>
        <!--<input type="button" style="float: right;" value="评论"></input>-->
        <button class="commentPress" style="float: right; margin-right:25px;">评论</button>
        <%
        }
        %>
        
        <ul class="comentList" style="margin-top: 20px; margin-left:
        20px; width:95%">
          <li style="margin-top: 10px;">
            <strong style="font-size: large; color: red;">赵欢</strong>:
            <span>房子不错哦</span>
          </li>
          
          <li style="margin-top: 10px;" >
            <strong style="font-size: large; color: red;">赵欢</strong>:
            <span>房子不错哦</span>
          </li>
        </ul>
        <div style="height: 100px;"></div>
        
      </div>
    </div>

		<script type="text/javascript">
			//提示内容：（默认值）
			var c = '您可以在这里输入您的评论：';

			function on_focus(obj) {
				obj.value = obj.value == (!!arguments[1] ? arguments[1] : c) ? ''
						: obj.value;
			}

			function on_blur(obj) {
				obj.value = obj.value == '' ? (!!arguments[1] ? arguments[1]
						: c) : obj.value;
			}
		</script>

	</div>
  </body>
</html>
