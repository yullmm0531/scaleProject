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
<title>공지사항 관리</title>
<style>
    .outer{
        width:1200px;
        margin:auto;
    }
    .outer-2{float:left; width:80%;}
    .title{
        margin:70px 0px;
    }
    .mb-3 button{
        background:black;
        color:white;
    }
    .table{
        text-align:center;
        font-size:14px;
    }
    .list-row:hover{
        cursor:pointer;
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
    <%@ include file="../common/adminMenubar.jsp"%>
    <div class="outer" align="center">
        <div class="outer-2">
            <div class="title">
                <h2><b>공지사항 관리</b></h2>
                <br>
            </div>
            <div class="list-area">
                <form class="input-group mb-3" style="width:400px" action="<%=contextPath%>/searchNotice.ad" method="get">
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
                <div align="right">
                    <a class="btn btn-outline-dark" href="<%=contextPath%>/enrollFormNotice.ad">공지사항 등록</a>
                </div>
                <br>
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th width="20px">번호</th>
                            <th width="300px">제목</th>
                            <th width="20px">조회수</th>
                            <th width="60px">작성일</th>
                            <th width="30px">작성자</th>
                            <th width="20px">공개</th>
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
                                <tr class="list-row">
                                    <td><%= n.getNoticeNo() %></td>
                                    <td><%= n.getNoticeTitle() %></td>
                                    <td><%= n.getCount() %></td>
                                    <td><%= n.getCreateDate() %></td>
                                    <td><%= n.getNoticeWriter() %></td>
                                    <td><%= n.getDisplayStatus() %></td>
                                </tr>
                            <% } %>
                        <% } %>
                </table>
            </div>
            <br><br>
            <!-- 페이징 -->
            <div class="paging-area">
                <% if(pi.getCurrentPage() != 1) { %>
                    <button onclick="location.href='<%=contextPath%>/noticeList.ad?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                <% } %>
                
                <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
                    <button onclick="location.href='<%=contextPath%>/noticeList.ad?cpage=<%=i%>';"><%= i %></button>
                <% } %>
                
                <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                    <button onclick="location.href='<%=contextPath%>/noticeList.ad?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
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

        $(".table tr:not(:first)").on("click", function(){
            let noticeNo = $(this).children(":first").text();
            location.href = "<%=contextPath%>/detailNotice.ad?noticeNo=" + noticeNo;
        })
    </script>
</body>
</html>