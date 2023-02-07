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
    .outer-2{float:left; width:80%;}
    .space{height: 10px;}
    .line{
        border: 0.5px solid gray;
        width: 1200px;
    }
    .table{
        box-sizing: border-box;
        font-size: 15px;
    }
    .productNameKo{
        width: 280px;
        text-overflow:ellipsis; 
        overflow:hidden;
        white-space:nowrap;
    }
    .menu3 label{padding: 10px;}
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
            <div class="outer-2">
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
                <script>
                    $("#biddingList").click(function(){
                        location.href = "<%= contextPath %>/biddingList.ad?cpage=1"
                    })
                    $("#dealList").click(function(){
                        location.href = "<%= contextPath %>/dealList.ad?cpage=1"
                    })
        
                </script>  
                <div class="space"></div>
                <div class="line"></div>
                <div class="space"></div>
                <div class="menu2">
                    <div class="btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-outline-secondary btn-sm">
                            <input type="radio" name="biddingType" id="allBidding" value="all" checked onclick="location.href='<%=contextPath%>/biddingTypeList.ad?biddingType=all&cpage=1';"> 전체
                        </label>
                        <label class="btn btn-outline-secondary btn-sm">
                            <input type="radio" name="biddingType" id="buyBidding" value="1" onclick="location.href='<%=contextPath%>/biddingTypeList.ad?biddingType=1&cpage=1';"> 구매
                        </label>
                        <label class="btn btn-outline-secondary btn-sm">
                            <input type="radio" name="biddingType" id="sellBidding" value="2" onclick="location.href='<%=contextPath%>/biddingTypeList.ad?biddingType=2&cpage=1';"> 판매
                        </label>
                    </div>
                </div>
                
            <div class="biddingList-area">
                <br>
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 8%;">입찰번호</th>
                            <th style="width: 8%;">상품번호</th>
                            <th style="width: 28%;">상품명</th>
                            <th style="width: 8%;">사이즈</th>
                            <th style="width: 8%;">입찰종류</th>
                            <th style="width: 10%;">아이디</th>
                            <th style="width: 10%;">입찰금액</th>
                            <th style="width: 12%;">입찰일시</th>
                            <th style="width: 8%;">입찰상태</th>
                        </tr>
                    </thead>
                    <tbody class="listSpace">
                        <% if(list.isEmpty()) { %>
                            <!-- 게시글 없을 경우-->
                            <tr>
                                <td colspan="9" class="noResult">등록된 게시글이 없습니다.</td>
                            </tr>
                        <% }else { %>
                            <!-- 게시글 있을 경우-->
                            <% for(Bidding b : list) { %>
                                <tr class="rowNum">
                                    <input type="hidden" value="<%= b.getbNo() %>"> <!-- 뽑기 쉬운 위치에 필요한 요소 값 숨겨두기 -->
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
                    </tbody>            
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

    </div>
    <script>
        function toMoney(num) {
            return num.toLocaleString('ko-KR');
        }	
        
        $(function(){
            $(".rowNum").click(function(){
                location.href = "<%=contextPath%>/detail.th?no=" + $(this).children('input').val();
            })
        })

        
    </script>



    

</body>
</html>