<%@page import="com.easyhousing.model.RentHouse"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.Math"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <%
  HttpSession s = request.getSession(); 
  String strtemp;
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
  %>

		<meta charset="utf-8" />
		<title>Photo Sphere Viewer</title>
		<meta name="viewport" content="initial-scale=1.0" />
		<script src="three.min.js"></script>
		<script src="photo-sphere-viewer.min.js"></script>
		<style>
			html, body {
				margin: 0;
				width: 460px;
				height: 450px%;
				overflow: hidden;
			}

			#container {
				width: 450px;
				height: 450px;
			}
		</style>
	</head>

	<body onload="initialize('<%=s.getAttribute("rentHousePic") %>');">
		<div id="container"></div>

		<script>
			function initialize(url){
				var div = document.getElementById('container');
				var PSV = new PhotoSphereViewer({
					panorama: url,
					container: div,
					time_anim: 3000,
					navbar: true,
					navbar_style: {
						backgroundColor: 'rgba(58, 67, 77, 0.7)'
					},
				});
			}
			//window.onload = function myFunc(){
				//var div = document.getElementById('picUrl');
				//alert(div.value);
				//initialize(div.value);
			//};
		</script>
	</body>

</html>
