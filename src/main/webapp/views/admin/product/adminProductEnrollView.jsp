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
	
	<h1>상품등록</h1>    
    <p align="right">* 는 필수 입력사항입니다.</p>

    <form action="" name="form1">
        * 카테고리 
        <select name="p-category" id="" >
            <option value="신발">신발</option>
            <option value="지갑">지갑</option>
            <option value="테크">테크</option>
        </select>
    </form>

    <hr>
	 <br><br>

    <form action="" name="img-form">
    	<table>
    	<tr>
    		<td colspan ="2">
        		<img src="" width="200" height="150"><a href="">img</a>
        	</td>
        </tr>
        <tr>
    		<td>
        		<img src="" width="150" height="100"><a href="">img1</a>
        	</td>
        	<td>
        		<img src="" width="150" height="100"><a href="">img1</a>
        	</td>
        </tr>
        </table>
    	<input type=file>
    </form>
    
    
	 <br><br>
	<hr>


    <br><br>
    * 한글상품명 <input type="text"><br><br>
    * 영문상품명 <input type="text"><br><br>
    <hr>

    <form action="" name="form2">
        * 브랜드 
        <select name="p-brand" id="">
            <option value="">A</option>
            
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
    * 모델번호 <input type="text" placeholder="내용을 입력하세요"> <br><br>

    * 컬러 <input type="text">

    <br><br>
    <hr>


    <form action=""name="form3">
    출시일 <input type="text" placeholder="내용을 입력해주세요"><br><br>
    발매가 <input type="text" placeholder="내용을 입력해주세요">
    </form>

    <br><br><br><br><br>


    <button type="button" class="btn btn-outline-secondary">취소</button>
    <button type="submit" class="btn btn-outline-primary">등록</button>
    <button type="reset" class="btn btn-outline-danger">초기화</button>
    
    </div>
</body>
</html>