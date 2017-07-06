<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0134)./home.html# -->
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>网站后台管理系统 </title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">






 <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/bootstrap.min.css>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/ace.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/ace-elements.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/ace-extra.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/bar.js></script>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/dataTables.bootstrap.min.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/style.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/style.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/codemirror.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/ace.min.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/font-awesome.min.css>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/jquery.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/bootstrap.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/typeahead-bs2.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/jquery.dataTables.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/jquery.dataTables.bootstrap.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/H-ui.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/H-ui.admin.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/layer.js></script>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/layer.css>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/laydate.js></script>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/laydate.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/laydate(1).css>


  <script type="text/javascript">
    $(function () {
      var cid = $('#nav_list> li>.submenu');
      cid.each(function (i) {
        $(this).attr('id', "Sort_link_" + i);

      })
    })
    jQuery(document).ready(function () {
      $.each($(".submenu"), function () {
        var $aobjs = $(this).children("li");
        var rowCount = $aobjs.size();
        var divHeigth = $(this).height();
        $aobjs.height(divHeigth / rowCount);
      });
      //初始化宽度、高度 
      $("#main-container").height($(window).height() - 76);
      $("#iframe").height($(window).height() - 140);

      $(".sidebar").height($(window).height() - 99);
      var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
      $(".submenu").height();
      $("#nav_list").children(".submenu").css("height", thisHeight);

      //当文档窗口发生改变时 触发
      $(window).resize(function () {
        $("#main-container").height($(window).height() - 76);
        $("#iframe").height($(window).height() - 140);
        $(".sidebar").height($(window).height() - 99);

        var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
        $(".submenu").height();
        $("#nav_list").children(".submenu").css("height", thisHeight);
      });
      $(".iframeurl").click(function () {
        var cid = $(this).attr("name");
        var cname = $(this).attr("title");
        $("#iframe").attr("src", cid).ready();
        $("#Bcrumbs").attr("href", cid).ready();
        $(".Current_page a").attr('href', cid).ready();
        $(".Current_page").attr('name', cid);
        $(".Current_page").html(cname).css({"color": "#333333", "cursor": "default"}).ready();
        $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
        $("#parentIfour").html('').css("display", "none").ready();
      });


    });


    /*********************点击事件*********************/
    $(document).ready(function () {
      $('#nav_list').find('li.home').click(function () {
        $('#nav_list').find('li.home').removeClass('active');
        $(this).addClass('active');
      });


//时间设置
      function currentTime() {
        var d = new Date(), str = '';
        str += d.getFullYear() + '年';
        str += d.getMonth() + 1 + '月';
        str += d.getDate() + '日';
        str += d.getHours() + '时';
        str += d.getMinutes() + '分';
        str += d.getSeconds() + '秒';
        return str;
      }

      setInterval(function () {
        $('#time').html(currentTime)
      }, 1000);
//修改密码

      $('#Exit_system').on('click', function () {
        layer.confirm('是否确定退出系统？', {
            btn: ['是', '否'],//按钮
            icon: 2,
          },
          function () {
            location.href = '${pageContext.request.contextPath}/jsp/html/SystemUser/adminLogin.jsp';

          });
      });
    })
  </script>

</head>

<body>
<div class="navbar navbar-default" id="navbar">
  <script type="text/javascript">
    try {
      ace.settings.check('navbar', 'fixed')
    } catch (e) {
    }
  </script>
  <div class="navbar-container" id="navbar-container">
    <div class="navbar-header pull-left">
      <a href=${pageContext.request.contextPath}/jsp/html/SystemUser/home.jsp# class="navbar-brand">
        <small>
          <!--<img src="../../images/SystemUser/logo.png">-->
        </small>
      </a><!-- /.brand -->
    </div><!-- /.navbar-header -->

  </div>
</div>
<div class="main-container" id="main-container" style="height: 537px;">
  <script type="text/javascript">
    try {
      ace.settings.check('main-container', 'fixed')
    } catch (e) {
    }
  </script>
  <div class="main-container-inner">
    <a class="menu-toggler" id="menu-toggler" href=${pageContext.request.contextPath}/jsp/html/SystemUser/home.jsp#>
      <span class="menu-text"></span>
    </a>
    <div class="sidebar" id="sidebar" style="height: 514px;">
      <script type="text/javascript">
        try {
          ace.settings.check('sidebar', 'fixed')
        } catch (e) {
        }
      </script>
      <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
          Easyhousing后台管理系统
        </div>
        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
          <span class="btn btn-success"></span>
          <span class="btn btn-info"></span>
          <span class="btn btn-warning"></span>
          <span class="btn btn-danger"></span>
        </div>
      </div><!-- #sidebar-shortcuts -->
      <ul class="nav nav-list" id="nav_list" style="height: 440px;text-align: right">
        <li class="home">
          <a href="javascript:void(0)"  name=${pageContext.request.contextPath}/homeinit.do class="iframeurl" title="">
            <span class="menu-text"> 系统首页 </span>
          </a>
        </li>

        <li>
          <a class="dropdown-toggle" href="#"><span class="menu-text"> 用户 </span></a>
          <ul class="submenu" id="Sort_link_1">
            <li class="home" style="height: 41.3333px;">
              <a href="#" title="用户管理" name=${pageContext.request.contextPath}/managerUserinit.do class="iframeurl" style="text-align: center">用户管理</a>
            </li>
          </ul>
        </li>

        <li>
          <a href="#" class="dropdown-toggle"><span class="menu-text"> 租房管理 </span></a>
          <ul class="submenu" id="Sort_link_2">
            <li class="home" style="height: 41.3333px;">
              <a href="#" title="租房管理" class="iframeurl" name=${pageContext.request.contextPath}/managerRentHouseinit.do style="text-align: center">租房管理</a>
            </li>
            <li class="home" style="height: 41.3333px;">
              <a href="#" title="租房记录" name=${pageContext.request.contextPath}/managerRentHouseDealinit.do class="iframeurl" style="text-align: center">租房记录</a>
            </li>
          </ul>
        </li>


        <li>
          <a href="#" class="iframeurl" name=${pageContext.request.contextPath}/managerAgentinit.do><span class="menu-text"> 经纪人 </span></a>
        </li>

        <li>
          <a href="#" class="dropdown-toggle" name=${pageContext.request.contextPath}/jsp/html/SystemUser/managerBuilding.jsp><span class="menu-text"> 楼盘管理 </span></a>
          <ul class="submenu" id="Sort_link_5">
            <li class="home" style="height: 41.3333px;">
              <a href="#" title="楼盘管理" class="iframeurl" name=${pageContext.request.contextPath}/managerBuildinginit.do style="text-align: center">楼盘管理</a>
            <li class="home" style="height: 41.3333px;">
              <a href="#" title="楼盘交易" name=${pageContext.request.contextPath}/managerBuildingDealinit.do class="iframeurl" style="text-align: center">买房记录</a>
          </ul>
        </li>
        
        <li>
          <a href="#" class="iframeurl" name=${pageContext.request.contextPath}/managerCheckRentHouseinit.do><span class="menu-text"> 审核租房 </span></a>
        </li>
        
      </ul>


      <div class="sidebar-collapse" id="sidebar-collapse">
        <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
      </div>

      <script type="text/javascript">
        try {
          ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
      </script>
    </div>
    <div class="main-content">
      <script type="text/javascript">
        try {
          ace.settings.check('breadcrumbs', 'fixed')
        } catch (e) {
        }
      </script>
      <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
          <li>
            <i class="icon-home home-icon"></i>
            <a href=${pageContext.request.contextPath}/homeinit.do>首页</a>
          </li>
          <li class="active"><span class="Current_page iframeurl"></span></li>
          <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
          <li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
        </ul>
      </div>



      <iframe id="iframe" style="border: 0px; width: 90%; background-color: rgb(255, 255, 255); height: 473px; "
              name="iframe" frameborder="0" src=${pageContext.request.contextPath}/homeinit.do></iframe>
      <!--<iframe id="managerUser" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "-->
              <!--name="iframe" frameborder="0" src="./managerUser.html"></iframe>-->
      <!--<iframe id="managerRent" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "-->
              <!--name="iframe" frameborder="0" src="./managerRent.html"></iframe>-->
      <!--<iframe id="managerRentHistory" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "-->
              <!--name="iframe" frameborder="0" src="./managerRentHistory.html"></iframe>-->
      <!--<iframe id="managerAgent" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "-->
              <!--name="iframe" frameborder="0" src="./managerAgent.html"></iframe>-->
      <!--<iframe id="managerBuilding" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "-->
              <!--name="iframe" frameborder="0" src="./managerBuilding.html"></iframe>-->
      <!--<iframe id="managerBuildingHistory" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "-->
              <!--name="iframe" frameborder="0" src="./managerBuildingHistory.html"></iframe>-->
      <!--<iframe id="managerPic" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "-->
              <!--name="iframe" frameborder="0" src="./managerPic.html"></iframe>-->
      <!--<iframe id="managerApplicant" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "-->
              <!--name="iframe" frameborder="0" src="./managerApplicant.html"></iframe>-->
      <!--<iframe id="managerComment" style="border: 0px; width: 100%; background-color: rgb(255, 255, 255); height: 473px; "-->
              <!--name="iframe" frameborder="0" src="./managerComment.html"></iframe>-->
      <div id="calUser" style="display: none">

      </div>


      <!-- /.page-content -->
    </div><!-- /.main-content -->

  </div><!-- /.main-container-inner -->

</div>
<!--底部样式-->

<div class="footer_style" id="footerstyle">
  <p class="l_f">版权所有：重庆大学team632</p>
  <p class="r_f">地址：重庆市沙坪坝大学城重庆大学虎溪校区 邮编：401331 技术支持：XXXX</p>
</div>
<!--修改密码样式-->

<!-- /.main-container -->
<!-- basic scripts -->


</body>
</html>
