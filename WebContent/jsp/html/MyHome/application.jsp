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
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/myHouse.jsp>我的房子</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/comment.jsp>我的评论</a></li>
          <li role="presentation" class="active"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/application.jsp>我的申请</a></li>
          <li role="presentation"><a href=${pageContext.request.contextPath}/jsp/html/MyHome/dealHistory.jsp>成交记录</a></li>
        </ul>
      </div>
      <div class="main-right fr">
        <div class="allList">
          <div class="title">您的预约申请</div>

          <div class="tab">
            <span class="actTap actSetArgs hover">新房</span>
            <span class="actTap actSetArgs ">租房</span>
          </div>
           
          <div class="d_Confirm_Order_style" id="building">
            <div class="search_style" style="display: block">
              <div class="title_names">搜索查询</div>
              <ul class="search_content clearfix" style="display: inline-block">
                <nobr>
                  <li>
                    <label class="l_f" style="width: 60px">楼盘ID:</label>
                    <input name="" type="text" class="text_add form-control" placeholder="输入楼盘ID" style=" width:200px;display: inline-block">
                    <button type="button" class="btn_search"><i class="icon-search"></i>查询</button>
                  </li>
                </nobr>
              </ul>
            </div>



            <div class="table_menu_list">
              <div id="sample-table_wrapper1" class="dataTables_wrapper no-footer">
                <div class="row">
                  <div class="col-sm-6">
                    <div class="dataTables_length" id="sample-table_length1"><label>每页显示条数: <select
                      name="sample-table_length" aria-controls="sample-table" class="">
                      <option value="10">10</option>
                      <option value="25">25</option>
                      <option value="50">50</option>
                      <option value="100">100</option>
                    </select></label></div>
                  </div>
                  <div class="col-sm-6">
                    <div id="sample-table_filter1" class="dataTables_filter"><label>搜索:<input type="search" class=""
                                                                                              placeholder=""
                                                                                              aria-controls="sample-table"></label>
                    </div>
                  </div>
                </div>
                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample-table1"
                       role="grid" aria-describedby="sample-table_info">
                  <thead>
                  <tr role="row">

                    <th width="100" tabindex="0" aria-controls="sample-table" rowspan="1"
                        colspan="1" aria-sort="descending" aria-label="ID: 升序排列" style="width: 90px;">楼盘ID
                    </th>

                    <th tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="房名" style="width: 120px;">房名
                    </th>
                    <th tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="地址" style="width: 120px;">地址
                    </th>
                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                         aria-label="预约时间" style="width: 90px;">时间
                    </th>
                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                         aria-label="电话" style="width: 200px;">电话
                    </th>
                    <th tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="处理状态" style="width: 80px;">状态
                    </th>

                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                         aria-label="是否撤销" style="width: 250px;">是否撤销
                    </th>

                  </tr>
                  </thead>
                  <tbody>
                  <%
                  List<Order> lb = (List<Order>)s.getAttribute("orderBuilding");
                  for (int i = 0; i < lb.size(); ++i) {
                	  Order tmp = lb.get(i);
                	  %>
                	  <tr role="row" class="odd">

	                    <td class="sorting_1" value="<%=tmp.id %>"><%=tmp.id %></td>
	                    <td><%=tmp.name %></td>
	
	
	                    <td><%=tmp.address %></td>
	                    <td ><%=tmp.orderTime %></td>
	
	                    <td><%=tmp.phoneNumber %></td>
	                    <td><%=tmp.status %></td>
	                    <td class="td-manage">
	
	                      <a title="编辑" href="javascript:;" class="btn btn-xs btn-info" onclick="member_edit(this.parentNode.parentNode.cells[1].innerHTML  )">编辑</a>
	
	                      <a title="删除" href="javascript:;" class="btn btn-xs btn-warning" onclick="member_del(this, this.parentNode.parentNode.cells[1].innerHTML )">删除</a>
	                    </td>
	                  </tr>
                	  <%
                  }
                  %>
                  </tbody>


                </table>
              </div>
            </div>
          </div>

          <div class="d_Confirm_Order_style" id="rent" style="display: none;">
            <div class="search_style" style="display: block">
              <div class="title_names">搜索查询</div>
              <ul class="search_content clearfix" style="display: inline-block">
                <nobr>
                <li>
                  <label class="l_f">租房ID：</label>
                  <input name="" type="text" class="text_add " placeholder="输入租房ID" style=" width:200px">
                  <button type="button" class="btn_search"><i class="icon-search"></i>查询</button>
                </li>

                </nobr>
              </ul>
            </div>



            <div class="table_menu_list">
              <div id="sample-table_wrapper" class="dataTables_wrapper no-footer">
                <div class="row">
                  <div class="col-sm-6">
                    <div class="dataTables_length" id="sample-table_length"><label>每页显示条数: <select
                      name="sample-table_length" aria-controls="sample-table" class="">
                      <option value="10">10</option>
                      <option value="25">25</option>
                      <option value="50">50</option>
                      <option value="100">100</option>
                    </select></label></div>
                  </div>
                  <div class="col-sm-6">
                    <div id="sample-table_filter" class="dataTables_filter"><label>搜索:<input type="search" class=""
                                                                                             placeholder=""
                                                                                             aria-controls="sample-table"></label>
                    </div>
                  </div>
                </div>
                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample-table"
                       role="grid" aria-describedby="sample-table_info">
                  <thead>
                  <tr role="row">

                    <th width="100" tabindex="0" aria-controls="sample-table" rowspan="1"
                        colspan="1" aria-sort="descending" aria-label="ID: 升序排列" style="width: 150px;">租房ID
                    </th>

                    <th tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="房名" style="width: 150px;">地址
                    </th>
                    <th tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="地址" style="width: 250px;">经纪人
                    </th>
                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="预约时间" style="width: 200px;">时间
                    </th>
                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="电话" style="width: 200px;">电话
                    </th>
                    <th tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="处理状态" style="width: 100px;">状态
                    </th>

                    <th  tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                        aria-label="是否撤销" style="width: 250px;">是否撤销
                    </th>

                  </tr>
                  </thead>
                  <tbody>
                  <tr role="row" class="odd">
                  	<%
                  	List<Order> lr = (List<Order>)s.getAttribute("orderRentHouse");
                  	for (int i = 0; i < lr.size(); ++i) {
                  		Order tmp = lr.get(i);
                  		%>
                  		<td class="sorting_1" value="<%=tmp.id %>"><%=tmp.id %></td>
	                    <td><%=tmp.address %></td>
	
	
	                    <td><%=tmp.agentName %></td>
	                    <td ><%=tmp.orderTime %></td>
	
	                    <td><%=tmp.phoneNumber %></td>
	                    <td><%=tmp.status %></td>
	                    <td class="td-manage">
	
	                      <a title="编辑" href="javascript:;" class="btn btn-xs btn-info" onclick="member_edit(this.parentNode.parentNode.cells[1].innerHTML  )">编辑</a>
	
	                      <a title="删除" href="javascript:;" class="btn btn-xs btn-warning" onclick="member_del(this, this.parentNode.parentNode.cells[1].innerHTML )">删除</a>
	                    </td>
                  		<%
                  	}
                  	%>
                  </tr>
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
    $('.js_ajaxError').hide();
    if ($(this).text() == '新房') {
      $(this).addClass('hover').siblings().removeClass('hover');
      $('#building').css('display', 'block');
      $('#rent').css('display', 'none');
    }
    if ($(this).text() == '租房') {
      $(this).addClass('hover').siblings().removeClass('hover');
      $('#building').css('display', 'none');
      $('#rent ').css('display', 'block');
    }


  });

</script>
</html>
