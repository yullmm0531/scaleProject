<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.common.model.vo.PageInfo, java.util.ArrayList, com.scale.admin.bidding.model.vo.Bidding, java.text.DecimalFormat" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Bidding> biddingTypeList = (ArrayList<Bidding>)request.getAttribute("biddingTypeList");
    String biddingType = (String)request.getAttribute("biddingType");
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
        width: 1200px;
        margin-left: 250px;
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
                            <input type="radio" name="biddingType" id="allBidding" value="all" onclick="location.href='<%=contextPath%>/biddingTypeList.ad?biddingType=all&cpage=1';"> 전체
                        </label>
                        <label class="btn btn-outline-secondary btn-sm">
                            <input type="radio" name="biddingType" id="buyBidding" value="1" onclick="location.href='<%=contextPath%>/biddingTypeList.ad?biddingType=1&cpage=1';"> 구매
                        </label>
                        <label class="btn btn-outline-secondary btn-sm">
                            <input type="radio" name="biddingType" id="sellBidding" value="2" onclick="location.href='<%=contextPath%>/biddingTypeList.ad?biddingType=2&cpage=1';"> 판매
                        </label>
                    </div>
                </div>
                <script>
                    $(function(){
                        $bType = $("menu2 input");
                        for(let i=0; i<$bType.length; i++){
                           if($(this).val() == "<%= biddingType %>"){
                                $(this).prop("checked", true);
                           } 
                        }
                    })
                </script>
                <div class="menu3" hidden>
                        <label>
                            <input type="checkbox" name="dealStatus" id="all" value="all"> 전체
                        </label>
                        <span class="dealStatus">
                            <label>
                                <input type="checkbox" name="dealStatus" id="0" value="0"> 입고전
                            </label>
                            <label>
                                <input type="checkbox" name="dealStatus" id="1" value="1"> 입고 완료
                            </label>
                            <label>
                                <input type="checkbox" name="dealStatus" id="2" value="2"> 검수중
                            </label>
                            <label>
                                <input type="checkbox" name="dealStatus" id="3" value="3"> 검수통과
                            </label>
                            <label>
                                <input type="checkbox" name="dealStatus" id="4" value="4"> 검수미통과
                            </label>
                            <label>
                                <input type="checkbox" name="dealStatus" id="5" value="5"> 발송완료
                            </label>
                            <label>
                                <input type="checkbox" name="dealStatus" id="6" value="6"> 거래완료
                            </label>
                    </span>
                </div>
            </div>
            <script>
                var flag = true;
                const $dealStatus = $(".dealStatus input");

                // 거래상태 전체
                $("#all").click(function(){
                    if($(this).is(":checked")){
                        $dealStatus.prop("checked", true);
                    } else {
                        $dealStatus.prop("checked", false);
                    }
                    
                })

                // 거래상태 개별체크에 따른 전체 체크여부
                $dealStatus.click(function(){
                    if($dealStatus.is(":checked").length == 7){
                        $("#all").prop("checked", true);
                    } else{
                        $("#all").prop("checked", false);
                    }
                })

            </script>
            
            <div class="biddingList-area">
                <br>
                <table class="table table-hover" style="table-layout: fixed; width: 1100px">
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
                        <% if(biddingTypeList.isEmpty()) { %>
                            <!-- 게시글 없을 경우-->
                            <tr>
                                <td colspan="9" class="noResult">등록된 게시글이 없습니다.</td>
                            </tr>
                        <% }else { %>
                            <!-- 게시글 있을 경우-->
                            <% for(Bidding b : biddingTypeList) { %>
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
                    </tbody>            
                </table>
            </div>
            <br><br>
            <!-- 페이징 -->
            <div class="paging-area" align="center">
                <% if(pi.getCurrentPage() != 1) { %>
                    <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/biddingTypeList.ad?biddingType=<%= biddingType %>&cpage=<%= pi.getCurrentPage()-1 %>';">&lt;</button>
                <% } %>
                
                <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
                    <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/biddingTypeList.ad?biddingType=<%= biddingType %>&cpage=<%=i%>';"><%= i %></button>
                <% } %>
                
                <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                    <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/biddingTypeList.ad?biddingType=<%= biddingType %>&cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                <% } %>
            </div>
            <br><br>
        

    </div>
    <script>
        function toMoney(num) {
            return num.toLocaleString('ko-KR');
        }	
        
    </script>



    

</body>
</html>