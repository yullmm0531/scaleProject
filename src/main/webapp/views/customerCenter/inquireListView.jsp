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
<title>1:1문의</title>
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
    #notiTitle{
        font-weight:800;
        font-size:18px;
    }
    #notiContent{
        line-height:28px;
        font-size:14px;
    }
    .inquire-btn{
        margin-bottom:10px;
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
    </style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer" align="center">
        <div class="submenu-area" align="left">
            <ul>
                <li class="depth1"><a><b>고객센터</b></a></li><br>
                <li class="depth2"><a href="<%=contextPath%>/list.no?cpage=1">공지사항</a></li>
                <li class="depth2"><a href="<%=contextPath%>/listForm.faq">자주묻는질문</a></li>
                <li class="depth2"><a href="<%=contextPath%>/listForm.inq?cpage=1" style="background:black; color:white;"><b>1:1 문의</b></a></li>
                <li class="depth2"><a href="">검수정책</a></li>
            </ul>
        </div>
        <div class="outer-2">
            <div class="title">
                <h2><b>1:1 문의</b></h2>
                <br>
            </div>
            <div class="noti" align="left">
                <p id="notiTitle">상담 시간</p>
                <p id="notiContent">
                    평일(월 ~ 금) 10:00 ~ 17:00 (토/일/공휴일 휴무) <br>
                    한번 등록한 상담내용은 수정이 불가능합니다.
                </p>
            </div>

            <div class="inquire-btn" align="right">
                <a href="" class="btn btn-outline-dark">문의하기</a>
                <br>
            </div>
            <form action="<%=contextPath%>">
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>구분</th>
                            <th width="600">문의 제목</th>
                            <th>작성일</th>
                            <th>답변유무</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(list.isEmpty()) {%>
	                        <!-- case1. 문의 내역 없을 때 -->
	                        <tr>
	                            <td colspan="5" align="center">문의한 내역이 없습니다.</td>
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
	                            <td><%= iq.getCategory() %></td>
	                            <td>
	                                <div>
	                                    <p class="inquire-title"><%= iq.getInquireTitle() %></p>
	                                    <div class="inquire-content-wrap">
	                                        <div class="inquire-content">
	                                            <%= iq.getInquireContent() %>
	                                            <br>
	                                            <% if(iq.getInquireImg() != null) {%>
	                                            	<img src="<%= iq.getInquireImg() %>" width="300">
	                                            <%} %>
	                                            <hr>
	                                            
	                                            <% if(iq.getAnswerStatus().equals("Y")) {%>
		                                            <!-- 답변 있을 때... -->
		                                            <div class="inquire-answer">
		                                                <br>
		                                                <p><%= iq.getAnswerContent() %></p>
	                                                </div>
                                                <%}else {%>
                                                	<div class="inquire-answer">
		                                                <br>
		                                                <p>답변이 아직 등록되지 않았습니다.</p>
                                                	</div>
                                                <%} %>
                                            </div>
                                        </div>
                                     </div>
                                </td>
	                            <td><%= iq.getInquireDate() %></td>
	                            <td><%= iq.getAnswerStatus() %></td>
	                            <td>
	                                <button type="submit" class="btn btn-sm btn-secondary">삭제</button>
	                            </td>
	                        </tr>
	                        <%} %>
                        <%} %>
                    </tbody>
                </table>
                <br><br>
            </form>
            <script>
            $(function(){
                    $(".my-inquire").click(function(){
                        $(this).find($(".inquire-content-wrap")).slideToggle();
                    })

            })
            </script>
            <!-- 페이징 -->
            <div class="paging-area">
                <% if(pi.getCurrentPage() != 1) { %>
                    <button onclick="location.href='<%=contextPath%>/listForm.inq?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                <% } %>
                
                <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
                    <button onclick="location.href='<%=contextPath%>/listForm.inq?cpage=<%=i%>';"><%= i %></button>
                <% } %>
                
                <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                    <button onclick="location.href='<%=contextPath%>/listForm.inq?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                <% } %>
            </div>
            <br><br>
        </div>
    </div>
</html>