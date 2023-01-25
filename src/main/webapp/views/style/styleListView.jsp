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

	.carousel-inner{width: 260px; height: 260px;}
	.carousel-item{width: 260px; height: 260px;}
    .cimg{width: 260px; height: 260px; border-radius: 0.5em;}

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
    .text{
    	text-overflow:ellipsis; 
    	overflow:hidden;
    	width:260px;
    	white-space:nowrap;
    }
    
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
        	<% for(int i=0; i<list.size(); i++) { %>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <div id="demo<%= i %>" class="carousel" data-ride="carousel">

                            <!-- Indicators -->
                            
                          
                            <!-- The slideshow -->
                            <div class="carousel-inner">
                            	<% for(int l=0; l<ilist.size(); l++) { %>
                            		<% if(list.get(i).getStyleNo() == ilist.get(l).getStyleNo()) { %>
                            			<% if(ilist.get(l).getFileLevel() == 1) { %>
											<div class="carousel-item active">
											  <img class="cimg" src="<%= contextPath %>/<%= ilist.get(l).getFilePath() + ilist.get(l).getChangeName() %>">
											</div>
											<% System.out.println(ilist.get(l).getFilePath() + ilist.get(l).getChangeName()); %>
		                            	<% } else { %>
			                            	<div class="carousel-item">
											  <img class="cimg" src="<%= contextPath %>/<%= ilist.get(l).getFilePath() + ilist.get(l).getChangeName() %>">
											</div>
											<% System.out.println(ilist.get(l).getFilePath() + ilist.get(l).getChangeName()); %>
										<% } %>
                              		<% } %>
                              	<% } %>
                            </div>
                          	
                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#demo<%= i %>" data-slide="prev">
                              <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#demo<%= i %>" data-slide="next">
                              <span class="carousel-control-next-icon"></span>
                            </a>
                          
                        </div>
                            
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/<%= list.get(i).getProfileImg() %>" class="rounded-circle">
                        <a href=""><%= list.get(i).getStyleWriter() %></a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span><%= list.get(i).getCount() %></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="text">
                        	<% for(int j=0; j<list.get(j).getHashtag().length; j++) { %>
                            <a href=""><%= list.get(j).getHashtag()[j] %></a>
                            <% } %>
                        </div>
                    </td>
                </tr>
            </table>
            <% } %>
        </div>
    </div>
    
    <button id="up-btn" style="position: fixed; right: 100px; bottom: 50px;">글쓰기</button>
    <br><br>

</body>
</html>