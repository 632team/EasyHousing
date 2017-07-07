<%@page import="java.util.List"%>
<%@page import="com.easyhousing.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%
HttpSession s = request.getSession(); 
List<BuildingInfo> mapBuildingList = (List<BuildingInfo>)s.getAttribute("mapBuildingList");
List<String> mapBuildingPicList = (List<String>)s.getAttribute("mapBuildingPicList");
List<RentHouse> mapRentHouseList = (List<RentHouse>)s.getAttribute("mapRentHouseList");
List<String> mapRentHousePicList = (List<String>)s.getAttribute("mapRentHousePicList");

for (int i = 0; i < mapBuildingList.size(); ++i) {
	BuildingInfo tmp = mapBuildingList.get(i);
	%>
	<li style="display:none">
	<input hidden=true name="bPicUrl" id="bPicUrl<%=i %>" value="<%=mapBuildingPicList.get(i) %>"></input>
	<input hidden=true name="bName" id="bName<%=i %>" value="<%=tmp.getBuildingName() %>"></input>
	<input hidden=true name="bAddress" id="bAddress<%=i %>" value="<%=tmp.getBuildingAddress() %>"></input>
	<input hidden=true name="bId" id="bId<%=i %>" value="<%=tmp.getBuildingId() %>"></input>
	<input hidden=true name="bPrice" id="bPrice<%=i %>" value="<%=tmp.getBuildingReferencePrice() %>"></input>
	</li>
	<!-- =================================================================================== -->
	<%
}
%>
<!-- ==============================以下为租房====================================== -->
<ul id="rentData">
<%
for (int i = 0; i < mapRentHouseList.size(); ++i) {
	RentHouse tmp = mapRentHouseList.get(i);
	%>
	<li style="display:none">
	<input hidden=true name="rPicUrl" id="rPicUrl<%=i %>" value="<%=mapRentHousePicList.get(i) %>"></input>
	<input hidden=true name="rName" id="rName<%=i %>" value="<%=tmp.getRentHouseAddress() %>"></input>
	<input hidden=true name="rAddress" id="rAddress<%=i %>" value="<%=tmp.getRentHouseAddress() %>"></input>
	<input hidden=true name="rId" id="rId<%=i %>" value="<%=tmp.getRentHouseId() %>"></input>
	<input hidden=true name="rPrice" id="rPrice<%=i %>" value="<%=tmp.getRentHousePrice() %>"></input>
	</li>
	<!-- =================================================================================== -->
	<%
}

%>
</ul>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        body, html{width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
        #l-map{height:300px;width:100%;}
        #r-result{width:100%;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=L6hYTtxR11fz8xGIFvPcww3EfwKNL2vl"></script>
    <title>Easyhousing地图搜房</title>
    <style>
        .gotoIndex {
            position: absolute;
            color: #6C707A;
            font-size: 14px;
            right: 19px;
            text-decoration: none;
        }

        .login-body {
            background: url(${pageContext.request.contextPath}/jsp/images/login/bg-pixiu.png) no-repeat;
            background-size: 100% 100%;
            width: 383px;
            height: 383px;
            position: absolute;
            top: 0;
            right: 0;
            border-radius: 30px;
        }

        .login-wrap {

            background: url(${pageContext.request.contextPath}/jsp/images/register/bg.jpg);
            overflow: hidden;
            width: 100%;
            height: 100%;
            position: absolute;
            background-size: cover;
            background-position: center center;
            min-width: 1280px;
            background-repeat: no-repeat;
        }

        .fa {
            display: inline-block;
            top: 27px;
            left: 6px;
            position: relative;
            color: #ccc;
        }

        input[type="text"], input[type="password"] {
            padding-left: 26px;
        }

        .checkbox {
            padding-left: 21px;
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
  </style>
  <script type="text/javascript">
      function getPoint(address) {


        var myGeo = new BMap.Geocoder();
        myGeo.getPoint(address, function(point){
          if (point) {
//            map.centerAndZoom(point, 16);
            map.addOverlay(new BMap.Marker(point));
            console.log(point);
            return point;
          }else{
//            return
//            alert("您选择地址没有解析到结果!");
          }
        }, "北京市");
      }
  function myload(){

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

</div>
        <div id="headsearch" style="display: inline-block">
                <input type="text" id="search" placeholder="请输入区域或板块开始找房" style=" width:450px;height: 35px;margin-left:100px" >
                <button type="button" class="form-control" style="display: inline-block;width: 70px" onclick="searchMap()">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
        </div>
        <!--<div class="map-contain" style="margin-top: 0px;">-->

            <div id="l-map" style="display: inline-block; width: 100%; height: 100%;margin:5px 5px 5px 5px">


            <!--</div>-->
        </div>
</body>
</html>
<script type="text/javascript">
  var mypoint = new BMap.Point(29.587884, 106.440644);

  $('#search').bind('input propertychange', function() {searchMap();});
  var mydata  = [];
  var myGeo = new BMap.Geocoder();
  var adds    = [];
  var points  = [];
  var index = 0;
  function bdGEO(){
    var add = adds[index];
    geocodeSearch(add);
    index++;
  }

  function geocodeSearch(add){
    if(index < adds.length){
        setTimeout(bdGEO,400);
    }
    myGeo.getPoint(add, function(point) {
      if (point) {
        var newpoint = new BMap.Point(point.lng, point.lat);
        points.push(point);
      } else {
          points.push(point);
      }
    },"重庆市");

  }
  function  initdata() {
      var len =  $("#rentData li").length;
      $("#rentData li").each(function(){
          var address = $(this).find("input[name='rAddress']").val();
          adds.push(address);
      });
      index = 0;
      bdGEO();
      console.log(adds);
      console.log(points);
      setTimeout(getdata,20000);
      //getdata();
  }
  function getdata() {
      var len =  $("#rentData li").length;
      console.log(len);
      var i = 0;
      $("#rentData li").each(function(){
            var obj={};
            var url = $(this).find("input[name='rPicUrl']").val();
            var name = $(this).find("input[name='rName']").val();
            var address = $(this).find("input[name='rAddress']").val();
            var id = $(this).find("input[name='rId']").val();
            var price = $(this).find("input[name='rPrice']").val();

            obj['id']=id;
            obj['imgsrc']=url;
            obj['title']=name;
            obj['content']=address;
            obj['isOpen'] = 0;
            obj['icon'] = "http://api.map.baidu.com/images/markers.png";
            obj['point'] = points[i];
            obj['price'] = price;
            i++;
            console.log("obj point");
            console.log(obj['point']);
            if(obj['point']) mydata.push(obj);
      });
      console.log("mydata");
      console.log(mydata);
  }
  initdata();
	var BASEDATA = [
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"奥亚酒店",content:"北苑路169号",point:"116.422792|40.009471",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"珀丽酒店",content:"将台西路8号",point:"116.484289|39.97936",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"贵国酒店",content:"左家庄1号",point:"116.454494|39.964011",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"科通酒店",content:"民族园路8号院2号楼",point:"116.394601|39.987925",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"将台酒店",content:"酒仙桥路甲12号",point:"116.496024|39.976864",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"成宏酒店",content:"北四环东路惠新东桥西北侧",point:"116.429445|39.995392",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"华商酒店",content:"延静西里2号",point:"116.488962|39.921939",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"标华酒店",content:"北京市 朝阳区红庙路柴家湾1号",point:"116.489284|39.92104",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"万程酒店",content:"天坛路89号",point:"116.411762|39.89457",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"黎昌酒店",content:"永定门外彭庄乙58号",point:"116.393532|39.876272",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"北京图书馆",content:"北京市海淀区白石桥路39号",point:"116.329593|39.952398",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"海淀图书馆",content:"丹棱街16西门",point:"116.315551|39.984388",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"北京图书馆",content:"北京市西城区文津街附近",point:"116.391713|39.929007",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"首都图书馆",content:"东三环南路88号",point:"116.469899|39.87684",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"国家图书馆",content:"中关村南大街33号",point:"116.331292|39.949031",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"崇文区图书馆",content:"北京市崇文区花市大街113号（乐天玛特超市旁）的敕建火德真君庙内",point:"116.427671|39.903568",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"朝阳区图书馆",content:"北京市朝阳区朝外小庄金台里17号",point:"116.47766|39.922295",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"宣武区图书馆",content:"教子胡同8号",point:"116.374561|39.894302",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"东城区图书馆",content:"交道口东大街85号",point:"116.41927|39.9474",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"},
        {id:"",imgsrc:"http://os8z6i0zb.bkt.clouddn.com/1.jpg",title:"西城区图书馆",content:"北京市西城区后广平胡同26号",point:"116.368099|39.942332",isOpen:0,icon:"http://api.map.baidu.com/images/markers.png"}
     ]
    function searchMap() {

      search();
    }


	function initMap(){
		window.map = new BMap.Map("l-map");
		map.centerAndZoom(new BMap.Point(106.440644, 29.587884),12);
		map.enableScrollWheelZoom();
		map.addControl(new BMap.NavigationControl());
		//创建自定义搜索类
		window.searchClass = new SearchClass();
		searchClass.setData(mydata);
		reset();
	}

	//搜索方法 param{searchTypeRadio_name：搜索radio的名字,keyword_name:搜索文本框的id}
	function search(){


    var txt = $("#search").val();
    console.log("txt");
    console.log(txt);
    var dd = searchClass.search({k:"title",d:txt,t:"more",s:"!all"});
    addMarker(dd);//向地图中添加marker
	}
	//重置返回所有结果
	window.reset = function(){
		//s:{''只返回找到的结果|all返回所有的}
		var dd = searchClass.search({k:"title",d:"显示全部",t:"single",s:"all"});
    addMarker(dd);//向地图中添加marker
	}

	//创建marker
	window.addMarker = function (data){
		map.clearOverlays();
		var len = Math.min(10, data.length);
		len = data.length;
		console.log("addData");
		console.log(data);
		for(var i=0;i<data.length;++i){
			var json = data[i];
			//var p0 = json.point.split("|")[0];
			//var p1 = json.point.split("|")[1];
			var point = new BMap.Point(data[i].point.lng,data[i].point.lat);
			var iconImg = new BMap.Icon(json.icon, new BMap.Size(22, 22), new BMap.Size(22*11, 25*11));
			var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);

			var label = new BMap.Label(json.title,{"offset":new BMap.Size(22, 22)});
			marker.setLabel(label);
			map.addOverlay(marker);
			label.setStyle({
						borderColor:"#808080",
						color:"#333",
						cursor:"pointer"
			});

			(function(){
				var _json = json;
				var _iw = createInfoWindow(_json);

				var _marker = marker;
				_marker.addEventListener("click",function(){
					this.openInfoWindow(_iw);
				   });
				   _iw.addEventListener("open",function(){
					_marker.getLabel().hide();
				   })
				   _iw.addEventListener("close",function(){
					_marker.getLabel().show();
				   })
				label.addEventListener("click",function(){
					_marker.openInfoWindow(_iw);
				   })
				if(!!json.isOpen){
				 label.hide();
				 _marker.openInfoWindow(_iw);
				}
				})()
			}
		}

  function createInfoWindow2(json){
    var iw = new BMap.InfoWindow("" +
      "<li style='margin: 2px 0px; padding: 0px 5px 5px 0px; cursor: pointer; overflow: hidden; line-height: 17px;'>"+
      "<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b>"+
      "<a target='_blank' href=" + json.actsrc +
      " style='margin-left:5px;font-size:12px;color:#3d6dcc;font-weight:normal;text-decoration:none;'></a>"+
      "</li>"
    );

//      var iw = new BMap.InfoWindow("<li><b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div></li>");
    return iw;
  }
		function createInfoWindow(json){
        var actsrc="http://www.baidu.com";
			var iw = new BMap.InfoWindow("" +
	  "<form action=${pageContext.request.contextPath}/mapRentHouseDetail.do method='post'>" +
      "<li style=\'margin: 2px 0px; padding: 0px 5px 5px 0px; cursor: pointer; overflow: hidden; line-height: 17px;\'>"+
        "    <div style=\'width: 300px; height: 80px; display: inline-block\'>"+
        "        <div style=\'zoom: 1; overflow: hidden; padding: 0px 5px; background-color: rgb(240, 240, 240);\'>"+
        "            <div style=\'line-height:20px;font-size:12px;\'><span style=\'color:#00c;\'>"+ json.title+ "</span>" +
        "             <input hidden=true name='rentHouseId' value='" + json.id + "'></input>" +
        "             <button type='submit' target=\'_blank\' href="+actsrc +" style=\'margin-left:5px;font-size:12px;color:#3d6dcc;font-weight:normal;text-decoration:none;\'>详情»</button>"+
        "            </div>"+
        "        </div>"+
        "    </div>"+
        "    <div style=\'height: 80px; width: 100px; display: inline-block\' >"+
        "        <img src= "+json.imgsrc +" style=\'width: auto; height: 80px\'>"+
        "    </div>"+
        "</li>" +
        "</form>"
   );


//      var iw = new BMap.InfoWindow("<li><b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div></li>");
      return iw;
		}
		//创建一个Icon
		function createIcon(json){
			var icon = new BMap.Icon("http://api.map.baidu.com/images/markers.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowAnchor:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
			return icon;
		}

		function SearchClass(data){
			this.datas = data;
		}
		// rule = {k:"title",d:"酒店",s:"all",t:"single"}=>t{single:(key=?),more:(key like[%?%])}//t:{single|more},s{all|!all}
		// rule = {k:"名字",d:"搜索关键字",t:{single名字精确查找|more名字模糊匹配查找},s{''只返回找到的结果|all返回所有的}
		SearchClass.prototype.search = function(rule){
		    console.log("rule");
		    console.log(rule);
			if(this.datas == null){alert("数据不存在!");return false;}
			if(this.trim(rule) == "" || this.trim(rule.d) == "" || this.trim(rule.k) == "" || this.trim(rule.t) == ""){
//			    alert("请指定要搜索内容!");
        console.log("null input");
			    return false;
			}
			var reval = [];
			var datas = this.datas;
			var len = datas.length;
			console.log("len");
      console.log(datas);
			var me = this;
			var ruleReg = new RegExp(this.trim(rule.d));
			var hasOpen = false;

			var addData = function(data,isOpen){
				// 第一条数据打开信息窗口
				if(isOpen && !hasOpen){
					hasOpen = true;
					data.isOpen = 1;
				}else{
					data.isOpen = 0;
				}
				reval.push(data);
			}
			var getData = function(data,key){
				var ks = me.trim(key).split(/\./);
				var i = null,s = "data";
				if(ks.length == 0){
					return data;
				}else{
					for(var i = 0; i < ks.length; i++){
						s += '["' + ks[i] + '"]';
					}
					return eval(s);
				}
			}
			var tmp = Math.min(10, len);
			for(var cnt = 0; cnt < len; cnt++){
				var data = datas[cnt];
				var d = getData(data,rule.k);

				if(rule.t == "single" && rule.d == d){
					addData(data,true);
				}else if(rule.t != "single" && ruleReg.test(d)){
					addData(data,true);
				}else if(rule.s == "all"){
					addData(data,false);
				}
			}
			return reval;
		}
		SearchClass.prototype.setData = function(data){
			this.datas = data;
		}
		SearchClass.prototype.trim = function(str){
			if(str == null){str = "";}else{ str = str.toString();}
			return str.replace(/(^[\s\t\xa0\u3000]+)|([\u3000\xa0\s\t]+$)/g, "");
		}

		initMap();//创建和初始化地图
</script>