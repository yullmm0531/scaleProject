<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .outer{margin-left: 30%;}
        #list-outLine{width: 800px;height: 100px;}
        #list-outLine2{margin-left: 15%; }
        .sellingList-div{ width: 30%;}
        #sellingList-div1{float: left;}
        #sellingList-div2{float: left;}
        #sellingList-div3{float: left;}

        .underline{border: 3px solid gray; width: 800px;}
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <div class="title-div"><h4>판매내역</h4></div>

            <div id="list-outLine">
                <div id="list-outLine2">
                    <div id="sellingList-div1" class="sellingList-div">
                        <div class="selling-count" align="center"><span>0</span></div>
                        <div class="selling-tag" align="center"><span>판매입찰</span></div>
                    </div>
                    <div id="sellingList-div2" class="sellingList-div">
                        <div class="selling-count" align="center"><span>0</span></div>
                        <div class="selling-tag" align="center"><span>진행중</span></div>
                    </div>
                    <div id="sellingList-div3" class="sellingList-div">
                        <div class="selling-count" align="center"><span>0</span></div>
                        <div class="selling-tag" align="center"><span>종료</span></div>
                    </div>
                </div>
                
        </div>
        <div class="underline"></div>
        <br><br>
        <div class="title-div"><h4>판매한 상품 목록</h4></div>
    </div>
</body>
</html>