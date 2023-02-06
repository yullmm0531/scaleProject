<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
    </style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp"%>
	<div class="outer" align="center">
	
   <h1>상품관리_수정 및 삭제</h1>    
    <p>* 는 필수 입력사항입니다.</p>

    <form action="" name="form1">
        * 카테고리 
        <select name="p-category" id="" >
            <option value="신발">신발</option>
            <option value="지갑">지갑</option>
            <option value="테크">테크</option>
        </select>
    </form>

    <form action="" name="img-form">
        <img src="cinqueterre.jpg" class="img-thumbnail" alt="Cinque Terre">
    </form>

    <br><br>
    * 한글상품명 <input type="text"><br><br>
    * 영문상품명 <input type="text"><br><br>
    <hr>

    <form action="" name="form2">
        * 브랜드 
        <select name="p-brand" id="">
            <option value="">A</option>
            <option value="">B</option>
            <option value="">C</option>
            <option value="">D</option>
            <option value="">E</option>
        </select>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        * 사이즈 
        <select name="p-size" id="">
            <option value=""></option>
        </select>
        &nbsp;&nbsp; ~ &nbsp;&nbsp;
        <select name="" id="">
            <option value=""></option>
        </select>
    </form>
    <br><br>
    * 상품번호 <input type="text" placeholder="자동으로 부여됩니다."> &nbsp;&nbsp;&nbsp;&nbsp;
    * 모델번호 <input type="text" 내용을 입력하세요> <br><br>

    * 컬러 <input type="text">

    <br><br>
    <hr>


    <form action=""name="form3">
    출시일 <input type="text" placeholder="내용을 입력해주세요"><br><br>
    발매가 <input type="text" placeholder="내용을 입력해주세요">
    </form>

    <br><br><br><br><br>


    <button type="button" class="btn btn-secondary">목록으로</button>
    <button type="submit" class="btn btn-primary">수정</button>
    <button type="button" class="btn btn-dark">삭제</button>

	</div>
</body>
</html>