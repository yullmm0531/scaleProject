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
    
    .text{
    	text-overflow:ellipsis; 
    	overflow:hidden; 
    	width:260px; 
    	white-space:nowrap;
    }
    
    .carousel-wrap{
        width: 260px; 
        height:260px; 
        overflow: hidden;
    }

    .carousel-content{
        display: flex;
        transform: translate3d(0, 0, 0);
        transition: transform 0.2s;
    }

    .prev{
        width: 25px;
        height: 25px;
        position: absolute;
        top: 120px;
        left: 5px;
    }
    .next{
        width: 25px;
        height: 25px;
        position: absolute;
        top: 120px;
        right: 5px;
    }
    .style-img>div{position: relative;}

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
        	<% for(Style st : list) { %>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <div>
                            <!-- The slideshow -->
                            <div class="carousel-wrap">
                              	<% for(StyleImg img : ilist) { %>
                              	<div class="carousel-content">
                              		<% if(img.getStyleNo() == st.getStyleNo()) { %>
                                	<img src="<%= contextPath %>/<%= img.getFilePath() %><%= img.getChangeName() %>" width="260" height="260">
                                	<% } %>
                                </div>
                                <% } %>
                            </div>
                            
                            <!-- Left and right controls -->
                            <img src="resources/images/style/좌.png" class="prev">
                            <img src="resources/images/style/우.png" class="next">
                          </div>
                          
                          <script>
                          	const arr = []
                          	for(StyleImg img : ilist) {
                          		if(<%= st.getStyleNo() %> == img.getStyleNo()){
                          			arr += img
                          		}
                          	}
                            const prevButton = document.querySelector('.prev');
                            const nextButton = document.querySelector('.next');
                            const carousel = document.querySelector('.carousel-content');

                            let index = 0;

                            prevButton.addEventListener('click', () => {
                                if (index === 0) return;
                                index -= 1;
                                
                                carousel.style.transform = `translate3d(-${260 * index}px, 0, 0)`;
                            });

                            nextButton.addEventListener('click', () => {
                                if (index === <%=  %>) return;
                                index += 1;
                                
                                carousel.style.transform = `translate3d(-${260 * index}px, 0, 0)`;
                            });
                        </script>
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/<%= st.getProfileImg() %>" class="rounded-circle">
                        <a href=""><%= st.getStyleWriter() %></a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span><%= st.getCount() %></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                        	<% for(int i=0; i<st.getHashtag().length; i++) { %>
                            <a href=""><%= st.getHashtag()[i] %></a>
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