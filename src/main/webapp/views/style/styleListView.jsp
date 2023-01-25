<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.style.model.vo.*, java.util.ArrayList" %>
<%
	ArrayList<Style> list = (ArrayList<Style>)request.getAttribute("list");
	ArrayList<StyleImg> ilist = (ArrayList<StyleImg>)request.getAttribute("ilist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin: auto; 
        margin-top: 50px;
        /* border: 1px solid black; */
        text-align: center;
        width: 1200px;
    }
    .outer>div{margin: 10px;}
    .set{margin: 10px; float: left;}
    #hashtag{font-size: 40px; font: bold;}

    .style-img>img{width: 260px; height: 260px; border-radius: 0.5em;}

    .nickname{height: 40px; text-align: left;}
    .nickname>img{width: 25px; height: 25px;}
    .nickname>a{margin-left: 3px;}

    .like{text-align: right;}
    .like>a{padding: 0;}

    .text{text-align: left;}

    #search-box{
        display: inline-block;
        width: 330px;
        height: 32px;
        border: 1px solid gray;
        border-radius: 0.3em;
    }
    #search-box>img{width: 20px; height: 20px;}
    #tag-search{width: 300px; border: 0px; margin-left: 2px;}
    #tag-search:focus {outline: none;}
    #standard>button{
    	margin-left: 5px; 
    	margin-right: 5px; 
    	background: lightgray; 
    	color: white; 
    	border:0px;
    	width: 70px;
    	height: 40px;
    	font-size: 18px;
    	border-radius: 0.4em;
    }
    #standard>button:hover{background: gray; color: white;}
    
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <div id="standard">
            <button type="button">인기</button>
            <button type="button">최신</button>
        </div>
        
        <div>
            <form action="" method="get">
                <div id="search-box">
                    <img src="<%= contextPath %>/resources/images/style/search.svg"><input type="search" placeholder="해쉬태그 검색" id="tag-search">
                </div>
            </form>
        </div>

        <div>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
        </div>
		
		<br>
		
        <div>
        	<!-- 반복문 -->
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <div id="demo" class="carousel">

                            <!-- Indicators -->
                            <ul class="carousel-indicators">
                            	
                              <li data-target="#demo" data-slide-to="0" class="active"></li>
                              <li data-target="#demo" data-slide-to="1"></li>
                              <li data-target="#demo" data-slide-to="2"></li>
                            </ul>
                            
                            <!-- The slideshow -->
                            <div class="carousel-inner">
                              <div class="carousel-item active">
                                <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" width="260" height="260">
                              </div>
                            </div>
                            
                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                              <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                              <span class="carousel-control-next-icon"></span>
                            </a>
                          </div>
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    
    <button id="up-btn" style="position: fixed; right: 100px; bottom: 50px;">글쓰기</button>
    <br><br>

</body>
</html>