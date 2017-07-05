<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
  <link rel="stylesheet" href="../../css/SystemUser/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/SystemUser/style.css">
  <link rel="stylesheet" href="../../css/SystemUser/codemirror.css">
  <!--<link rel="stylesheet" href="../../css/ace.min.css">-->
  <link rel="stylesheet" href="../../css/SystemUser/font-awesome.min.cs">

  <link rel="stylesheet" href="../../css/SystemUser/ace-rtl.min.css">
  <link rel="stylesheet" href="../../css/SystemUser/ace-skins.min.css">
  <link rel="stylesheet" href="../../css/login.css">
  <link rel="stylesheet" href="../../css/SystemUser/layer.css">



  <script src="../../js/SystemUser/typeahead-bs2.min.js"></script>
  <script src="../../js/SystemUser/H-ui.js"></script>
  <script src="../../js/SystemUser/H-ui.admin.js"></script>
  <script src="../../js/SystemUser/layer.js"></script>
  <link rel="stylesheet" href="../../css/SystemUser/layer.css">
  <script src="../../js/SystemUser/layate.js"></script>
  <link rel="stylesheet" href="../../css/SystemUser/laydate.css">
  <link rel="stylesheet" href="../../css/SystemUser/laydate(1).css">


  <link rel="stylesheet" href="../../css/SystemUser/font-awesome.min.css">
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="../../js/SystemUser/jquery.min.js"></script>
  <script src="../../js/SystemUser/bootstrap.min.js"></script>
  <script src="../../js/SystemUser/jquery.dataTables.min.js"></script>
  <script src="../../js/SystemUser/jquery.dataTables.bootstrap.js"></script>



  <script type="text/javascript">try {
  var AG_onLoad=function(func){if(document.readyState==="complete"||document.readyState==="interactive")func();else if(document.addEventListener)document.addEventListener("DOMContentLoaded",func);else if(document.attachEvent)document.attachEvent("DOMContentLoaded",func)};
  var AG_removeElementById = function(id) { var element = document.getElementById(id); if (element && element.parentNode) { element.parentNode.removeChild(element); }};
  var AG_removeElementBySelector = function(selector) { if (!document.querySelectorAll) { return; } var nodes = document.querySelectorAll(selector); if (nodes) { for (var i = 0; i < nodes.length; i++) { if (nodes[i] && nodes[i].parentNode) { nodes[i].parentNode.removeChild(nodes[i]); } } } };
  var AG_each = function(selector, fn) { if (!document.querySelectorAll) return; var elements = document.querySelectorAll(selector); for (var i = 0; i < elements.length; i++) { fn(elements[i]); }; };
  var AG_removeParent = function(el, fn) { while (el && el.parentNode) { if (fn(el)) { el.parentNode.removeChild(el); return; } el = el.parentNode; } };
} catch (ex) { console.error('Error executing AG js: ' + ex); }</script>
  <!--[if lt IE 9]>
  <![endif]-->
  <!--[if !IE]> -->
  <!-- <![endif]-->


  <title>无标题文档</title>
  <script data-require-id="echarts/chart/line" src="../../js/SystemUser/line.js" async=""></script><script data-require-id="echarts/chart/bar" src="../../js/SystemUser/bar.js" async=""></script>
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

</head>
<body>
<div class="page-content clearfix">
  <div class="alert alert-block alert-success">
    <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
    <i><span class="glyphicon glyphicon-ok green"></span></i>欢迎使用<strong class="green">后台管理系统<small>(v1.2)</small></strong>,你本次登陆时间为2016年7月12日13时34分，登陆IP:192.168.1.110.
  </div>

  <div class="state-overview clearfix">
    <div class="col-lg-5 col-sm-10">
      <section class="panel">
        <a href=${pageContext.request.contextPath}/managerUserinit.do title="用户数">
          <div class="symbol terques">
            <i><span class="glyphicon glyphicon-user"></span></i>
          </div>
          <div class="value">
            <h1><%out.print((Integer)session.getAttribute("userListSize"));%></h1>
            <p>用户数</p>
          </div>
        </a>
      </section>
    </div>
    <div class="col-lg-5 col-sm-10">
      <section class="panel">
        <div class="symbol red">
          <i><span class="glyphicon glyphicon-th-list"></span></i>
        </div>
        <div class="value">
          <h1><%out.print((Integer)session.getAttribute("buildingDealListSize"));%></h1>
          <p>卖掉房屋</p>
        </div>
      </section>
    </div>
    <div class="col-lg-5 col-sm-10">
      <section class="panel">
        <div class="symbol yellow">
          <i><span class="glyphicon glyphicon-home"></span></i>
        </div>
        <div class="value">
          <h1><%out.print((Integer)session.getAttribute("rentHouseDealListSize"));%></h1>
          <p>租房成交</p>
        </div>
      </section>
    </div>
    <div class="col-lg-5 col-sm-10">
      <section class="panel">
        <div class="symbol blue">
          <i><span class="glyphicon glyphicon-pencil"></span></i>
        </div>
        <div class="value">
          <h1><%out.print((Integer)session.getAttribute("rentHouseListSize"));%></h1>
          <p>租房数</p>
        </div>
      </section>
    </div>
  </div>
</div>
  <!--实时交易记录-->
</body>
</html>
