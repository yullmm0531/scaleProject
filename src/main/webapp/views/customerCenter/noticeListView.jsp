<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.common.model.vo.PageInfo, java.util.ArrayList, com.scale.customerCenter.model.vo.Notice" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
    .title{text-align:center; margin-top:50px; margin-bottom:50px;}
    .outer{
        width:1200px;
        margin:auto;
        margin-top:50px;
        padding:20px;
    }
    .mb-3 button{
        background:black;
        color:white;
    }
    .table{
        text-align:center;
    }
    .paging-area button{
        border:0.5px solid lighstgray;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<div class="outer" align="center">
        <div class="title">
            <h2><b>공지사항</b></h2>
            <br>
        </div>
        <form class="input-group mb-3" style="width:400px" action="<%=contextPath%>/search.no?cpage=1" method="get">
            <select name="option" id="search-option">
                <option name="option" value="all">제목+내용</option>
                <option name="option" value="title">제목</option>
                <option name="option" value="content">내용</option>
            </select>
            <input type="text" class="form-control" placeholder="검색어를 입력하세요." id="search-input" name="keyword">
            <div class="input-group-append">
              <button class="btn" type="submit" id="search-btn">검색</button>
            </div>
        </form>
        <br>
        <div class="list-area">
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                	<% if(list.isEmpty()) { %>
                    <!-- 게시글 없을 경우-->
                    <tr>
                        <td colspan="4">조회된 게시글이 없습니다.</td>
                    </tr>
                    <% }else { %>
                    	<!-- 게시글 있을 경우-->
                    	<% for(Notice n : list) { %>
		                    <tr>
		                        <td><%= n.getNoticeNo() %></td>
		                        <td><%= n.getNoticeTitle() %></td>
		                        <td><%= n.getCount() %></td>
		                        <td><%= n.getCreateDate() %></td>
		                    </tr>
                    	<% } %>
                    <% } %>
            </table>
        </div>
        <br><br>
        <!-- 페이징 -->
        <div class="paging-area">
        	<% if(pi.getCurrentPage() != 1) { %>
            	<button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <% } %>
            
            <% for(int i=pi.getStartPage(); i<pi.getEndPage(); i++) { %>
            	<button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=i%>';"><%= i %></button>
            <% } %>
            
            <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
            	<button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <% } %>
        </div>
        <br><br>
    </div>

    <script>
        $(function(){
            $("#search-input").on("keypress", function(e){
                if(e.keyCode == 13){
                    
                }
            })
        })
    
    </script>
</body>
</html>