<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.ArrayList, com.scale.admin.product.model.vo.*"  %>
<%
	Product p = (Product)request.getAttribute("p");
	ProductImg at = (ProductImg)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품조회</title>
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
	
	
		 <h1>상품조회</h1>
	    
	    <p align="right">* 는 필수 입력사항입니다.</p>
	
	    <form action="" name="form1">
	        * 카테고리 
	        <select name="p-category" id="" >
	            <option value="신발">신발</option>
	            <option value="지갑">지갑</option>
	            <option value="테크">테크</option>
	        </select>
	    </form>
		 <br><br>
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
	    * 상품번호 <input type="text"> &nbsp;&nbsp;&nbsp;&nbsp;
	    * 모델번호 <input type="text"> <br><br>
	
	    * 컬러 <input type="text">
	    <hr>
	    * 블라인드 여부 <input type="text">
	
	    <br><br>
	    <hr>
	
	
	    <form action=""name="form3">
	    출시일 <input type="text" ><br><br>
	    발매가 <input type="text" >
	    </form>
	
	    <br><br><br><br><br>
	
	
	    <button type="button" class="btn btn-outline-secondary">목록으로</button>
	    <button type="button" class="btn btn-outline-primary">수정</button>
	    <button type="button" class="btn btn-outline-danger">삭제</button>
    </div>
	</body>
</html>	