<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.common.model.vo.PageInfo, java.util.ArrayList, com.scale.style.model.vo.StyleReport" %>
<%
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<StyleReport> list = (ArrayList<StyleReport>)request.getAttribute("list");
    String select = (String)request.getAttribute("select");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    #select{
        width: 100px; 
        height: 30px;
        text-align: center;
        margin-left: 5px;
        border-radius: 0.3em;
    }
    #search{
        border: 1px solid gray; 
        height: 30px;
        border-radius: 0.3em;
        width: 277px;
        margin-left: 20px;
    }
    #search-btn{
        height: 30px;
        border: 1px solid gray; 
        background-color: gray;
        color: white;
        border-radius: 0.3em;
    }

    .table{
        text-align: center;
        font-size:14px;
    }
    .list-row:hover{
        cursor:pointer;
    }
    
    #no{width: 70px;}
    #enroll-date{width: 100px;}
    #reported{width: 100px;}
    #title{
        width: 400px;
        text-overflow:ellipsis; 
    	overflow:hidden;
    	white-space:nowrap;
    }
    #report-date{width: 100px;}
    #reporting{width: 100px;}
    #status{width: 100px;}

    #form-table{
        width: 1000px;
    }
    
</style>
</head>
<body>

    <%@ include file="../common/adminMenubar.jsp"%>

    <div class="outer">
        <div class="outer-2">
            <div class="title">
                <h2><b>스타일 신고 관리</b></h2>
                <br>
            </div>
            <div class="list-area">
                <form class="input-group mb-3" style="width:400px" action="" method="get">
                    <div id="processing-status">
                        <span>처리현황</span>
                        <select name="select" id="select">
                            <option value="all">전체</option>
                            <option value="ready">신고완료</option>
                            <option value="report">처리완료</option>
                            <option value="reject">반려</option>
                        </select>
                    </div>
                    <br><br>
                    <div>
                        <span>닉네임</span>
                        <input type="search" id="search">
                        <button type="submit" id="search-btn">검색</button>
                    </div>
                </form>
                <br>
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th id="no">번호</th>
                            <th id="reporting">신고인</th>
                            <th id="title">신고제목</th>
                            <th id="report-date">신고일</th>
                            <th id="reported">피신고인</th>
                            <th id="status">처리현황</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(StyleReport rep : list) { %>
                        <tr class="list-row">
                            <td><%= rep.getReportNo() %></td>
                            <input type="hidden" value="<%= rep.getStyleNo() %>">
                            <td><%= rep.getReportingUser() %></td>
                            <td><%= rep.getTitle() %></td>
                            <td><%= rep.getReportedDate() %></td>
                            <td><%= rep.getReportedUser() %></td>
                            <% switch(rep.getReportCheck()) { 
                            	case "0": rep.setReportCheck("신고접수"); break;
                            	case "1": rep.setReportCheck("처리완료"); break;
                            	case "2": rep.setReportCheck("반려"); break;
                             } %>
                             <td><%= rep.getReportCheck() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <br><br>

            <script>
                $(".list-row").on("click", function(){
                    location.href = "detailreport.ad?repNo=" + $(this).children().eq(0).text() + "&styleNo=" + $(this).children().eq(1).val();
                });

            </script>

            <!-- 페이징 -->
            <% if(select != null) { %>
                <ul class="pagination">
                    <% if(pi.getCurrentPage() != 1) { %>
                    <li class="page-item">
                        <a class="page-link" href="<%= contextPath %>/searchreport.ad?cpage=<%= pi.getCurrentPage()-1 %>">&lt;</a>
                    </li>
                    <% } %>
                    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                        <li class="page-item">
                            <a class="page-link" href="<%= contextPath %>/searchreport.ad?cpage=<%= p %>"><%= p %></a>
                        </li>
                    <% } %>
                    
                    <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                        <li class="page-item">
                            <a class="page-link" href="<%= contextPath %>/searchreport.ad?cpage=<%= pi.getCurrentPage()+1 %>">&gt;</a>
                        </li>
                    <% } %>
                </ul>
            
            <% } %>
            <br><br>
        </div>
    </div>
</body>
</html>