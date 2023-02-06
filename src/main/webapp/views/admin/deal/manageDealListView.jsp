<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.common.model.vo.PageInfo, java.util.ArrayList, com.scale.admin.bidding.model.vo.Bidding, java.text.DecimalFormat" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Bidding> list = (ArrayList<Bidding>)request.getAttribute("list");
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery는 slim버전이라 XXXX -->
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .outer{
        width:1200px;
        margin:auto;
    }
    .title{text-align: center;}
    .space{height: 10px;}
    .line{
        border: 0.5px solid gray;
        width: 1000px;
        margin-left: 250px;
    }
    .table{
        box-sizing: border-box;
        font-size: 15px;
    }
    .productNameKo{
        width: 230px;
        text-overflow:ellipsis; 
        overflow:hidden;
        white-space:nowrap;
    }
</style>
</head>
<body>
    <%@ include file="../common/adminMenubar.jsp" %>

    <div class="outer">
        <br><br><br>        
        
            <div class="title">
                <h2><b>거래 리스트</b></h2>
                <br>
            </div>
            <div class="menu">
                <div class="menu1">
                    <div class="btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-outline-secondary">
                            <input type="radio" name="options" id="biddingList" value="biddingList" checked> 입찰
                        </label>
                        <label class="btn btn-outline-secondary">
                            <input type="radio" name="options" id="dealList" value="dealList"> 체결거래
                        </label>
                    </div>
                </div>    
                <div class="space"></div>
                <div class="line"></div>
                <div class="space"></div>
                <div class="menu2">
                    <div class="btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-outline-secondary btn-sm">
                            <input type="checkbox" name="options" id="buyBidding" value="buyBidding"> 구매
                        </label>
                        <label class="btn btn-outline-secondary btn-sm">
                            <input type="checkbox" name="options" id="sellBidding" value="sellBidding"> 판매
                        </label>
                    </div>
                </div>
            </div>
            
            <div class="list-area">
                
                <br>
                <table class="table table-hover" style="table-layout: fixed; width: 950px">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 8%;">입찰번호</th>
                            <th style="width: 8%;">상품번호</th>
                            <th style="width: 26%;">상품명</th>
                            <th style="width: 8%;">사이즈</th>
                            <th style="width: 8%;">입찰종류</th>
                            <th style="width: 10%;">아이디</th>
                            <th style="width: 12%;">입찰금액</th>
                            <th style="width: 12%;">입찰일시</th>
                            <th style="width: 8%;">입찰상태</th>
                        </tr>
                    </thead>
                        <% if(list.isEmpty()) { %>
                            <!-- 게시글 없을 경우-->
                            <tr>
                                <td colspan="9">등록된 게시글이 없습니다.</td>
                            </tr>
                        <% }else { %>
                            <!-- 게시글 있을 경우-->
                            <% for(Bidding b : list) { %>
                                <tr>
                                    <td><%= b.getbNo() %></td>
                                    <td><%= b.getpCode() %></td>
                                    <td><div class="productNameKo"><%= b.getpNameKo() %></div></td>
                                    <td><%= b.getpSize() %></td>
                                    <td><%= b.getbType() %></td>
                                    <td><%= b.getUserId() %></td>
                                    <td style="text-align: right;"><%= formatter.format(b.getbPrice()) %>원</td>
                                    <td><%= b.getbDate() %></td>
                                    <td><%= b.getbStatus() %></td>
                                </tr>
                            <% } %>
                        <% } %>
                                
                </table>
            </div>
            <br><br>
            <!-- 페이징 -->
            <div class="paging-area" align="center">
                <% if(pi.getCurrentPage() != 1) { %>
                    <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/biddingList.ad?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                <% } %>
                
                <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
                    <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/biddingList.ad?cpage=<%=i%>';"><%= i %></button>
                <% } %>
                
                <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                    <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/biddingList.ad?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                <% } %>
            </div>
            <br><br>
        

    </div>




    

</body>
</html>