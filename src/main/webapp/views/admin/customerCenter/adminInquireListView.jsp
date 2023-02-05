<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.scale.customerCenter.model.vo.Inquire, com.scale.common.model.vo.PageInfo" %>
<% 
	ArrayList<Inquire> list = (ArrayList<Inquire>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 관리</title>
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
    input[type=radio]{
        margin:10px;
    }
    .table{
        text-align:center;
        font-size:14px;
    }
    .table>tbody>tr:hover{
        cursor: pointer;
    }
    .inquire-content-wrap{
        display:none;
    }
    .paging-area button{
        border:0.5px solid lightgray;
    }
    .page-active{
        background:black;
        color:white;
    }
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>

    <div class="outer" align="center">
        <div class="outer-2">
            <div class="title">
                <h2><b>1:1문의 관리</b></h2>
                <br>
            </div>
            <div class="search-area">
                <form class="input-group mb-3" style="width:400px" action="<%=contextPath%>/searchFaq.ad" method="get">
                    <select name="option" id="search-option">
                        <option value="all">제목+내용</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" class="form-control" placeholder="검색어를 입력하세요." id="search-input" name="keyword">
                    <div class="input-group-append">
                        <button class="btn" type="submit" id="search-btn">검색</button>
                    </div>
                    <input type="hidden" name="cpage" value="1">
                </form>
                <br>
            </div>
            <hr>
            <div align="left">
                <input type="radio" name="category" id="" checked>전체
                <input type="radio" name="category" id="">구매
                <input type="radio" name="category" id="">판매
                <input type="radio" name="category" id="">결제
                <input type="radio" name="category" id="">배송
                <input type="radio" name="category" id="">상품
                <input type="radio" name="category" id="">사이트이용
            </div>
            <br>
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                    	<th>번호</th>
                        <th>구분</th>
                        <th width="600">문의 제목</th>
                        <th>문의일</th>
                        <th>문의자</th>
                        <th>답변유무</th>
                        <th>답변자</th>
                        <th>답변일</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(list.isEmpty()) {%>
                        <!-- case1. 문의 내역 없을 때 -->
                        <tr>
                            <td colspan="5" align="center">문의 내역이 없습니다.</td>
                        </tr>
                    <%}else {%>
                        <% for(Inquire iq : list) {%>
                            <% switch(iq.getCategory()){ 
                            case "buy": iq.setCategory("구매"); break;
                            case "sell": iq.setCategory("판매"); break;
                            case "site": iq.setCategory("사이트이용"); break;
                            case "payment": iq.setCategory("결제"); break;
                            case "shipping": iq.setCategory("배송"); break;
                            case "product": iq.setCategory("상품"); break;
                            }	
                            %>
                        <!-- case2. 문의 내역 있을 때 -->
                           <tr class="my-inquire">
                           	   <td><%= iq.getInquireNo() %></td>
                               <td><%= iq.getCategory() %></td>
                               <td class="inquire-title">
                                   <div>
                                       <p><%= iq.getInquireTitle() %></p>
                                   </div>
                               </td>
                               <td><%= iq.getInquireDate() %></td>
                               <td><%= iq.getInquireUser() %></td>
                               <td><%= iq.getAnswerStatus() %></td>
                               <% if(iq.getAnswerUser() == null){%>
                               	<td>-</td>
                               <%}else{ %>
                               	<td><%= iq.getAnswerUser() %></td>
                               <%} %>
                               <% if(iq.getAnswerModifyDate() == null){%>
                               	<td>-</td>
                               <%}else{ %>
                               	<td><%= iq.getAnswerModifyDate() %></td>
                               <%} %>
                           </tr>
                        <%} %>
                    <%} %>
                </tbody>
            </table>
            <br><br>

            <!-- 페이징 -->
            <div class="paging-area">
                <% if(pi.getCurrentPage() != 1) { %>
                    <button onclick="location.href='<%=contextPath%>/inquireList.ad?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                <% } %>
                
                <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
                    <button onclick="location.href='<%=contextPath%>/inquireList.ad?cpage=<%=i%>';"><%= i %></button>
                <% } %>
                
                <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                    <button onclick="location.href='<%=contextPath%>/inquireList.ad?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
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

            $(".table tr:not(:first)").on("click", function(){
            let inquireNo = $(this).children(":first").text();
            location.href = "<%=contextPath%>/detailInquire.ad?inquireNo=" + inquireNo;
        })
        })
    </script>
</body>
</html>