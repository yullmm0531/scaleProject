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
    .outer{
        width:1200px;
        margin:auto;
        margin-top:50px;
    }
    .submenu-area, .outer-2{float:left;}
    .submenu-area{width:20%; padding-left:60px;}
    .submenu-area ul{
        list-style:none;
        padding-left:0px;
    }
    .submenu-area li{
        line-height:40px;
    }
    .submenu-area a{
        color:black;
    }
    .depth1>a{
        font-size:25px;
        text-decoration:none;
    }
    
    .outer-2{width:80%;}
    .title{
        text-align:center;
        margin-bottom:30px;
    }
    .mb-3 button{
        background:black;
        color:white;
    }
    .table{
        text-align:center;
        font-size:14px;
    }
    .paging-area button{
        border:0.5px solid lightgray;
        margin:3px;
    }
    .page-active{
        background:black;
        color:white;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<div class="outer" align="center">
        <div class="submenu-area" align="left">
            <ul>
                <li class="depth1"><a><b>고객센터</b></a></li><br>
                <li class="depth2"><a href="<%=contextPath%>/list.no?cpage=1" style="background:black; color:white;"><b>공지사항</b></a></li>
                <li class="depth2"><a href="<%=contextPath%>/listForm.faq">자주묻는질문</a></li>
                <li class="depth2"><a href="<%=contextPath%>/listForm.inq?cpage=1">1:1 문의</a></li>
                <li class="depth2"><a href="">검수정책</a></li>
            </ul>
        </div>
        <div class="outer-2">
            <div class="title">
                <h2><b>공지사항</b></h2>
                <br>
            </div>
            <div class="list-area">
                <form class="input-group mb-3" style="width:400px" action="<%=contextPath%>/search.no" method="get">
                    <select name="option" id="search-option">
                        <option value="all">제목+내용</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" class="form-control" placeholder="검색어를 입력하세요." id="search-input" name="keyword">
                    <input type="hidden" name="cpage" value="1">
                    <div class="input-group-append">
                    <button class="btn" type="submit" id="search-btn">검색</button>
                    </div>
                </form>
                <br>
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th width="20px">번호</th>
                            <th width="300px">제목</th>
                            <th width="20px">조회수</th>
                            <th width="60px">작성일</th>
                        </tr>
                    </thead>
                        <% if(list.isEmpty()) { %>
                        <!-- 게시글 없을 경우-->
                        <tr>
                            <td colspan="4">등록된 게시글이 없습니다.</td>
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
                
                <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
                    <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=i%>';"><%= i %></button>
                <% } %>
                
                <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                    <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                <% } %>
            </div>
            <br><br>
        </div>
    </div>

    <script>
        $(function(){
            $(".paging-area>button").each(function(){
                if($(this).text() == "<%=pi.getCurrentPage()%>"){
                    $(this).addClass("page-active");
                }
            })

            $("#search-input").on("keypress", function(e){
                if(e.keyCode == 13){
                    $("#search-btn").click();
                }
            })
        })
    </script>
</body>
</html>