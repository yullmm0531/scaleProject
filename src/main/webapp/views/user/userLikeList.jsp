<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{width: 800px;margin-left: 30%;}
    .picture-area{ width: 70%; float: left;}
    .button-tag{margin-left: 78%; }
    .button {
background-color: red; /* Red */
border: none;
color: white;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 24px;
margin: 4px 2px;
cursor: pointer;
}


    .underline{border: 3px solid gray; width: 800px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <div id="outLine"><h4>찜 목록</h4></div>
        <br><br>
        <div class="underline"></div>
        <br>
        <div id="button-tag-div">
            <div class="picture-area">사진과 상품 설명들</div>
            <div class="button-tag">
                <button class="button">상품 보러 가기</button>
            </div>
        </div>
        <br>
        <div id="button-tag-div">
            <div class="picture-area">사진과 상품 설명들</div>
            <div class="button-tag">
                <button class="button">상품 보러 가기</button>
            </div>
        </div>
        <br>
        <div id="button-tag-div">
            <div class="picture-area">사진과 상품 설명들</div>
            <div class="button-tag">
                <button class="button">상품 보러 가기</button>
            </div>
        </div>
        

    </div>
</body>
</html>