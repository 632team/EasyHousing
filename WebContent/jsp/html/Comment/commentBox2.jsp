<%@page import="com.easyhousing.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>仿微博评论</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/comment.css">
</head>
<body>
<!--
    此评论textarea文本框部分使用的https://github.com/alexdunphy/flexText此插件
-->
<!--rentHouseUserComments  -->
<%
HttpSession s = request.getSession();
int bid = (Integer)s.getAttribute("buildingId");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<div class="commentAll">
  <!--评论区域 begin-->
  <%
  if (s.getAttribute("user") != null) {
	  %>
	  <form action=${pageContext.request.contextPath}/userCommentBuilding.do method="post">
	  <div class="reviewArea clearfix">
	    <textarea class="content comment-input" placeholder="请在此处输入评论："
	              onkeyup="keyUP(this)" name="userComment"></textarea>
	    <button class="plBtn" onclick="parent.location.reload();">评论</button>
	  </div>
	  </form>
	  <%
  }
  %>
  <!--评论区域 end-->
  <!--回复区域 begin-->
  <div class="comment-show">
  <%
    List<Collect> lc = (List<Collect>)s.getAttribute("buildingUserComments");
    for (Collect i : lc) {
    	%>
    	<div class="comment-show-con clearfix">
	      <div class="comment-show-con-img pull-left">
	      <img src="<%=i.picUrl %>" alt="" style="width:48px;height:48px">
	      </div><div class="comment-show-con-list pull-left clearfix">
	      <div class="pl-text clearfix">
	      <a href="#" class="comment-size-name"><%=i.name %>: </a>
	      <span class="my-pl-con">&nbsp;<%=i.comment %></span> </div>
	      <div class="date-dz"> <span class="date-dz-left pull-left comment-time">
	      <%=sdf.format(new Date(i.decoration)) %></span>
	      <div class="date-dz-right pull-right comment-pl-block">
	
	
	     <a href="javascript:;" class="date-dz-z pull-left">
	     </a> </div> </div><div class="hf-list-con"></div></div> </div>
    	<%
    }
    %>
  </div>
  <!--回复区域 end-->
</div>


<script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="js/jquery.flexText.js"></script>
<!--textarea高度自适应-->
<script type="text/javascript">
  $(function () {
    $('.content').flexText();
  });
</script>
<!--textarea限制字数-->
<script type="text/javascript">
  function keyUP(t) {
    var len = $(t).val().length;
    if (len > 139) {
      $(t).val($(t).val().substring(0, 140));
    }
  }
</script>

<!--点击评论创建评论条-->
<!--
<script type="text/javascript">
  $('.commentAll').on('click', '.plBtn', function () {
    var myDate = new Date();
    //获取当前年
    var year = myDate.getFullYear();
    //获取当前月
    var month = myDate.getMonth() + 1;
    //获取当前日
    var date = myDate.getDate();
    var h = myDate.getHours();       //获取当前小时数(0-23)
    var m = myDate.getMinutes();     //获取当前分钟数(0-59)
    if (m < 10) m = '0' + m;
    var s = myDate.getSeconds();
    if (s < 10) s = '0' + s;
    var now = year + '-' + month + "-" + date + " " + h + ':' + m + ":" + s;
    //获取输入内容
    var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
    console.log(oSize);
    //动态创建评论模块
    oHtml = '' +
      '<div class="comment-show-con clearfix">' +
      '<div class="comment-show-con-img pull-left">' +
      '<img src="images/header-img-comment_03.png" alt="">' +
      '</div>' +
      ' <div class="comment-show-con-list pull-left clearfix">' +
      '<div class="pl-text clearfix"> ' +
      '<a href="#" class="comment-size-name">David Beckham : </a>' +
      ' <span class="my-pl-con">&nbsp;' + oSize + '</span> </div>' +
      ' <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
      + now + '</span>' +
      ' <div class="date-dz-right pull-right comment-pl-block">' +


     ' <a href="javascript:;" class="date-dz-z pull-left">' +
     '</a> </div> </div><div class="hf-list-con"></div></div> </div>';
    if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
      $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
      $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value', '').siblings('pre').find('span').text('');
    }
  });
</script>
-->
<!--点击回复动态创建回复块-->

</body>
</html>
