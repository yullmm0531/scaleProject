<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        margin:auto;
        
    }
    .title{text-align: center;}
    .space{height: 10px;}
    .line{
        border: 0.5px solid gray;
        width: 900px;
        margin: auto;
    }
    .menu1{}
    .menu2{}
</style>
</head>
<body>
    <%@ include file="../common/adminMenubar.jsp" %>

    <div class="outer">
        
        <div class="outer-2">
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
                        <label class="btn btn-outline-secondary">
                            <input type="checkbox" name="options" id="buyBidding" value="buyBidding"> 구매
                        </label>
                        <label class="btn btn-outline-secondary">
                            <input type="checkbox" name="options" id="sellBidding" value="sellBidding"> 판매
                        </label>
                    </div>
                </div>
            </div>
            
            <div class="list-area" align="right">
                
                <br>
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 8%;">입찰번호</th>
                            <th style="width: 8%;">상품번호</th>
                            <th style="width: 20%;">상품명</th>
                            <th style="width: 8%;">사이즈</th>
                            <th style="width: 8%;">입찰종류</th>
                            <th style="width: 10%;">회이디</th>
                            <th style="width: 15%;">입찰금액</th>
                            <th style="width: 15%;">입찰일시</th>
                            <th style="width: 8%;">체결여부</th>
                        </tr>
                    </thead>
                    
                                <tr>
                                    <td>20</td>
                                    <td>4</td>
                                    <td>whejs djlksjdlfishdfls</td>
                                    <td>245</td>
                                    <td>구매</td>
                                    <td>user06</td>
                                    <td>320,000원</td>
                                    <td>23/01/13</td>
                                    <td>Y</td>
                                </tr>
                           
                </table>
            </div>
            <br><br>
            <!-- 페이징 -->
            <div class="paging-area">
                
            </div>
            <br><br>
        </div>

    </div>




    

</body>
</html>