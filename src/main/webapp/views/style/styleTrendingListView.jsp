<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.style.model.vo.*, java.util.ArrayList, java.net.URLEncoder" %>
<%
	ArrayList<Style> list = (ArrayList<Style>)request.getAttribute("list");
	ArrayList<StyleImg> ilist = (ArrayList<StyleImg>)request.getAttribute("ilist");
	ArrayList<Hashtag> tag = (ArrayList<Hashtag>)request.getAttribute("tag");
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
    .set{margin: 15px; float: left;}
    #hashtag{font-size: 40px; font: bold;}

    .cimg{width: 260px; height: 260px; border-radius: 0.5em;}

    .nickname{height: 40px; text-align: left;}
    .nickname>img{width: 25px; height: 25px;}
    .nickname>a{margin-left: 3px;}

    .like{text-align: right;}
    .like>a{padding: 0;}

    .text{text-align: left;}

    #tag-search{
    	width: 330px;
        height: 32px;
        border: 1px solid gray;
        border-radius: 0.3em;
        padding-left: 10px;
   	}
   	#tag-search:focus {outline:none;}
    #trending{
    	margin-left: 5px; 
    	margin-right: 5px;
    	background-color: black;
    	color: white;
    	width: 70px;
    	height: 40px;
    	font-size: 20px;
    	font-weight : bold;
    	border-radius: 1em;
    }
    #newest{
    	margin-left: 5px; 
    	margin-right: 5px;
    	background: none;
    	border: 0px;
    	color: black;
    	width: 70px;
    	height: 40px;
    	font-size: 20px;
    	border-radius: 1em;
    }
    .text{
    	text-overflow:ellipsis; 
    	overflow:hidden;
    	width:260px;
    	white-space:nowrap;
    }
    .tag-area{height: 27px;}
    
    #up-btn{
    	position: fixed; 
    	right: 50px; 
    	bottom: 30px;
    }
    #insert-btn{
    	position: fixed; 
    	right: 120px; 
    	bottom: 30px;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <div id="standard">
            <button type="button" id="trending">인기</button>
            <button type="button" id="newest" onclick="location.href='<%= contextPath %>/newestlist.st?cpage=1'">최신</button>
        </div>
        
        <div>
            <form action="<%= contextPath %>/search.st" method="get">
                <div>
                    <input type="search" placeholder="해쉬태그 검색" id="tag-search" name="keyword">
                </div>
            </form>
        </div>

        <div>
        	<% for(Hashtag t : tag){ %>
            	<button type="button" class="hashtag btn btn-light btn-sm" onclick="search(this);"><%= t.getKeyword() %></button>
            <% } %>
        </div>
		
		<br>
		
        <div id="table-container">
        	<!-- 반복문 -->
        	<% for(int i=0; i<list.size(); i++) { %>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <div id="demo<%= i %>" class="carousel">

                            <!-- Indicators -->
                            
                          
                            <!-- The slideshow -->
                            <div class="carousel-inner">
                            	<% for(int j=0; j<ilist.size(); j++) { %>
                            		<% if(list.get(i).getStyleNo() == ilist.get(j).getStyleNo() && ilist.get(j).getFileLevel() == 1) { %>
											<div class="carousel-item active">
											  <img class="cimg" src="<%= contextPath %>/<%= ilist.get(j).getFilePath() + ilist.get(j).getChangeName() %>">
											</div>
		                            <% } else if(list.get(i).getStyleNo() == ilist.get(j).getStyleNo() && ilist.get(j).getFileLevel() == 2) { %>
			                            	<div class="carousel-item">
											  <img class="cimg" src="<%= contextPath %>/<%= ilist.get(j).getFilePath() + ilist.get(j).getChangeName() %>">
											</div>
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
                        
                        <script>
						    $(document).ready(function() {      
						        $('.carousel').carousel('pause');
						    });
						</script>
                            
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
                    <td colspan="2" class="tag-area">
                        <div class="text">
                        	<% if(list.get(i).getHashtag() != null) { %>
                        		<% String[] tagArr = list.get(i).getHashtag().split(" "); %>
                        		<% for(int t=0; t<tagArr.length; t++) { %>
                        			<% String enco = URLEncoder.encode(tagArr[t], "UTF-8"); %>
                        			<a href="<%= contextPath %>/search.st?keyword=<%= enco %>"><%= tagArr[t] %></a>
                        		<% } %>
                        	<% } %>
                        </div>
                    </td>
                </tr>
            </table>
            <% } %>
        </div>
    </div>
    
    <button id="up-btn">UP</button>
    <button id="insert-btn">+</button>
    <br><br>
    
    <script>
    	function search(btn){
    		const text = encodeURIComponent(btn.innerText);
    		location.href = "<%= contextPath %>/search.st?keyword=" + text;
    	}
    	
    	$(function(){
    		$("#insert-btn").click(function(){
        		 <% if(loginUser == null) { %>
	        		 	alert("로그인 후 이용가능한 페이지입니다.");
	        		 	location.href = "<%= contextPath %>/loginForm.us";
        		 <% } else { %>
        		 		location.href = "<%= contextPath %>/enrollForm.st";
        		 <% } %>
        	})
    	})
    	
    </script>

	</body>
</html>