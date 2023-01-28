<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.style.model.vo.*, java.util.ArrayList, java.net.URLEncoder" %>
<%
	String keyword = String.valueOf(request.getAttribute("keyword"));
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
        width: 1200px;
    }
    .set{
    	margin: 15px;
    	float: left;
    }
    

    .cimg{width: 260px; height: 260px; border-radius: 0.5em;}

    .nickname{height: 40px; text-align: left;}
    .nickname>img{width: 25px; height: 25px;}
    .nickname>a{margin-left: 3px;}
    
    .like{text-align: right;}
    .like>a{padding: 0;}

    .text{text-align: left;}
    
    .text{
    	text-overflow:ellipsis; 
    	overflow:hidden;
    	width:260px;
    	white-space:nowrap;
    }
    .tag-area{height: 27px;}
    #keyword{
    	font-size: 30px;
    	font-weight: bold;
    }
    
    #nothing{
    	text-align: center;
    	font-size: 20px;
    	font-weight: bold;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer">
    	<div align="center" id="keyword">
    		<% if(keyword.charAt(0) == '#') { %>
    			<%= keyword %>
    		<% } else { %>
    			#<%= keyword %>
    		<% } %>
    		
    	</div>
    	
    	<br><br><br>
    	
        <div>
        	<% if(list.isEmpty()) { %>
        		<div id="nothing">
        			검색된 스타일이 없습니다.
        		</div>
        	<% } else { %>
        		<% for(int i=0; i<list.size(); i++) { %>
            <div class="table-container">
            	<table class="set">
	                <tr>
	                    <td colspan="2" class="style-img">
	                        <div id="demo<%= i %>" class="carousel">
	                          	
	                            <!-- The slideshow -->
	                            <div class="carousel-inner">
	                            	<% for(StyleImg img : ilist) { %>
	                            		<% if(list.get(i).getStyleNo() == img.getStyleNo()) { %>
	                            			<% if(img.getFileLevel() == 1) { %>
												<div class="carousel-item active">
												  <img class="cimg" src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
												</div>
			                            	<% } else { %>
				                            	<div class="carousel-item">
												  <img class="cimg" src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
												</div>
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
	            </div>
	            <% } %>
        	<% } %>
        	
        </div>
    </div>
    
    <button id="up-btn" style="position: fixed; right: 50px; bottom: 20px;">올라가기</button>
    <br><br>
    

</body>
</html>