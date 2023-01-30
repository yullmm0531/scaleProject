<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.style.model.vo.*, java.util.ArrayList, java.net.URLEncoder" %>
<%
	ArrayList<Style> list = (ArrayList<Style>)request.getAttribute("list");
	// style_no, profile_img, count, user_id, user_nickname, introduce, hashtag
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
        width: 1200px;
    }
    .profile{width: 1100px;}
    .header>td{height: 150px;}
    .header>td>img{width: 100px; height: 100px;}
    .header>td>span{font-size: 30px; font-weight: bolder; padding-left: 10px;}
    .id, .introduce{height: 70px; font-size: 20px;}
    .id>div, .introduce>div{margin-left: 10px;}

    .edit-td{text-align: right;}
    .edit-btn{
        background-color: gray;
        border-radius: 0.3em;
        border: none;
        height: 30px;
    }

    .set{
        margin: 15px; 
        float: left;
    }
    .cimg{
        width: 260px; 
        height: 260px; 
        border-radius: 0.5em;
    }
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
        <% if(loginUser == null) { %>
        	<table class="profile">
        		<tr class="header">
                	<td>
                    	<img src="<%= contextPath %>/<%= list.get(0).getProfileImg() %>" class="rounded-circle">
                    	<span><%= list.get(0).getStyleWriter() %></span>
                	</td>
           		</tr>
	            <tr>
	                <td class="id">
	                    <div><%= list.get(0).getUserId() %></div>
	                </td>
	            </tr>
	            <% if(list.get(0).getIntroduce() != null) { %>
	            	<tr>
		                <td class="introduce">
		                    <div><%= list.get(0).getIntroduce() %></div>    
		                </td>
		            </tr>
	            <% } %>
        	</table>
        <% } else { %>
        	<% if(list.size() == 0) { %>
        		<table class="profile">
	        		<tr class="header">
	                	<td>
	                    	<img src="<%= contextPath %>/<%= loginUser.getProfileImg() %>" class="rounded-circle">
	                    	<span><%= loginUser.getUserNickName() %></span>
	                	</td>
                        <td class="edit-td">
                            <button type="button" class="edit-btn btn-secondary" data-toggle="modal" data-target="#myModal">프로필 편집</button>
                        </td>
	           		</tr>
		            <tr>
		                <td class="id">
		                    <div><%= loginUser.getUserId() %></div>
		                </td>
		            </tr>
		            <% if(loginUser.getIntroduce() != null) { %>
		            	<tr>
			                <td class="introduce">
			                    <div><%= loginUser.getIntroduce() %></div>    
			                </td>
			            </tr>
		            <% } %>
        		</table>
        	<% } else { %>
        		<% if(loginUser.getUserNickName().equals(list.get(0).getStyleWriter())) { %>
        			<table class="profile">
		        		<tr class="header">
		                	<td>
		                    	<img src="<%= contextPath %>/<%= list.get(0).getProfileImg() %>" class="rounded-circle">
		                    	<span><%= list.get(0).getStyleWriter() %></span>
		                	</td>
		                	<td class="edit-td">
	                            <button type="button" class="edit-btn btn-secondary" data-toggle="modal" data-target="#myModal">프로필 편집</button>
	                        </td>
		           		</tr>
			            <tr>
			                <td class="id">
			                    <div><%= list.get(0).getUserId() %></div>
			                </td>
			            </tr>
			            <% if(list.get(0).getIntroduce() != null) { %>
			            	<tr>
				                <td class="introduce">
				                    <div><%= list.get(0).getIntroduce() %></div>    
				                </td>
				            </tr>
			            <% } %>
		        	</table>
        		<% } else { %>
		        	<table class="profile">
		        		<tr class="header">
		                	<td>
		                    	<img src="<%= contextPath %>/<%= list.get(0).getProfileImg() %>" class="rounded-circle">
		                    	<span><%= list.get(0).getStyleWriter() %></span>
		                	</td>
		           		</tr>
			            <tr>
			                <td class="id">
			                    <div><%= list.get(0).getUserId() %></div>
			                </td>
			            </tr>
			            <% if(list.get(0).getIntroduce() != null) { %>
			            	<tr>
				                <td class="introduce">
				                    <div><%= list.get(0).getIntroduce() %></div>    
				                </td>
				            </tr>
			            <% } %>
		        	</table>
        		<% } %>
        	<% } %>
        <% } %>

        <br><br>
		
		<% if(!list.isEmpty()) { %>
	        <div id="table-container">
	        	<!-- 반복문 -->
	        	<% for(int i=0; i<list.size(); i++) { %>
	            <table class="set">
	                <tr>
	                    <td colspan="2" class="style-img">
                            <div id="demo<%= i %>" class="carousel" data-interval="false">
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
	                    </td>
	                </tr>
	                <tr>
	                    <td class="nickname">
	                        <img src="<%= contextPath %>/<%= list.get(i).getProfileImg() %>" class="rounded-circle">
	                        <a href="<%= contextPath %>/profile.st?nickname=<%= list.get(i).getStyleWriter() %>&cpage=1"><%= list.get(i).getStyleWriter() %></a>
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
	
	    <div class="modal" id="profile-edit">
	        <div class="modal-dialog">
	          <div class="modal-content">
	      
	            <!-- Modal Header -->
	            <div class="modal-header">
	              <h4 class="modal-title">프로필 편집</h4>
	              <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>
	      
	            <!-- Modal body -->
	            <form class="modal-body">
	                <div>
	                    <img src="" class="rounded-circle" style="width: 70px; height: 70px;">
	                    <br><br>
	                    <input type="file">
	                </div>
	                <br>
	                <div>닉네임*</div>
	                <input type="text" name="nickname" value="xxx">
	                <br>
	                <div>소개</div>
	                <textarea name="introduce" cols="22" rows="5" style="resize: none;">xxx</textarea>
	                <br><br>
	                <button type="submit" class="btn btn-secondary" data-dismiss="modal">변경</button>
	                <button type="reset" class="btn btn-secondary">초기화</button>
	            </form>
	      
	          </div>
	        </div>
		<% } else { %>
			<div>게시물이 없습니다.</div>
		<% } %>
        <button id="up-btn">UP</button>
        <button id="insert-btn">+</button>
        
        <script>
	        $("#up-btn").click(function(){
	            window.scrollTo({ top: 0, behavior: "smooth" });
	        })
        </script>

    </div>
    
</body>
</html>