<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
	     background-color: #f5f6f7;
	     font-family: 'Noto Sans KR', sans-serif;
	
	        }
	
	.login-wrapper{
	    width: 500px;
	    height: 480px;
	    padding: 40px;
	    margin: auto;
	    box-sizing: border-box;
	    margin-top: 50px;
	  
	}
	
	.login-wrapper > h2{
	    font-size: 24px;
	    color: #071081;
	    margin-bottom: 20px;
	}
	#login-form > input{
	    font-family: 'Noto Sans KR', sans-serif;
	
	    width: 100%;
	    height: 48px;
	    padding: 0 10px;
	    box-sizing: border-box;
	    margin-bottom: 16px;
	    border-radius: 6px;
	    background-color: #F8F8F8;
	    border: 1px solid lightgray;
	    letter-spacing:1px;
	}
	#login-form > input::placeholder{
	    color: #7e7c7c;
	}
	#login-form > input[type="submit"]{
	    color: #fff;
	    font-size: 16px;
	    font-weight: 600;
	    background-color: #0f0257;
	    margin-top: 2px;
	    letter-spacing:7px;
	    cursor: pointer;
	}
	#enroll {
	    text-align: center;
	}
	 
	#enroll a{
	    letter-spacing:2px;
	    color: darkgray;
	    text-decoration: none;
	    padding: auto;
	    margin: auto;
	
	}
	
	.login-wrapper img{
	     margin-bottom: -5%;
	     width:200px;
	     display: block;
	     margin-left: auto;
	     margin-right: auto;
	    
	      }
	      .form-check{
	        display: flex;
	        flex-direction: row;
	        justify-content: center;
	    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="login-wrapper">
        <h2 style="text-align: center;"><img src="<%=contextPath%>/resources/images/logo_navy.png"></h2>
        <form action ="" form="" id="login-form">
            <input type="text" name="userName" placeholder="아이디" required>
            <input type="password" name="userPassword" placeholder="비밀번호" required>
            <br>
            <input type="submit" value="로그인"><br>
            
            <br clear="both">
            <div id="enroll">
            <a href="">회원가입   | </a> 
            <a href="">아이디찾기 | </a> 
            <a href="">비밀번호찾기</a>
        </div>
        <br clear="both">

        <footer>
            <div class="copyright-wrap" style="text-align: center;">
            <span>Copyright © Scale Corp. All Rights Reserved.</span>
            </div>
            <br clear="both">
        </footer>

        </form>
    </div>
</body>
</html>