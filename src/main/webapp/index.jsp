<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scale</title>
<style>
	.main-c img{
		width: 100%;
	}
</style>
</head>
<body>

	<%@ include file="views/common/menubar.jsp" %>
	
	
	<div id="demo" class="carousel slide" data-ride="carousel">

	  <!-- Indicators -->
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	
	  <!-- The slideshow -->
	  <div class="carousel-inner main-c">
	    <div class="carousel-item active">
	      <img src="<%= contextPath %>/resources/images/banner/1.png" alt="Los Angeles">
	    </div>
	    <div class="carousel-item">
	      <img src="<%= contextPath %>/resources/images/banner/2.png" alt="Chicago">
	    </div>
	    <div class="carousel-item">
	      <img src="<%= contextPath %>/resources/images/banner/3.png" alt="New York">
	    </div>
	  </div>
	

</body>
</html>