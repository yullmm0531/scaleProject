<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scale</title>
<!-- <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

    div{
        box-sizing: border-box;
    }
	
	.wrap{
		width:1920px;
		background:black;
	}
    #header{
        width:1200px;
        margin:auto;
        background:black;
        color:white;
        height:180px;
    }
    #logo, #searchBox, #utilities{
        height:60%;
        background:transparent;
        float:left;
    }
    #logo{
        width:20%;
        text-align:center;
        line-height:100px;
    }
    #searchBox{
        width:60%;
        padding:40px 150px

    }
    #utilities{
        width:20%;
        line-height:50px;
    }

    #searchInput{
        width:400px;
        height:40px;
        border-radius:4px;
        background:rgb(41,41,41);
        border:none;
        color:rgb(226, 226, 226);
        padding-left:13px;
    }
    #searchInput:focus{
        outline: 1px solid black;
    } 
    #searchInput::placeholder{
        font-size:13px;
        padding-left:2px;
        color:gray;
    }
    #searchBox button{
        /* width:60px;
        height:44px; */
        border-radius:4px;
        font-size:13px;
        background:rgb(41,41,41);
        color:rgb(226, 226, 226);
        display:none;
    }

    #utilities a{
        color:rgb(212, 212, 212);
        font-size:12px;
        margin:10px;
    }

    #navigator{
        clear:both;
        width:100%;
        height:40%;
    }
    #navi{
        width:100%;
        height:100%;
        list-style-type:none;
        padding:0;
        margin:0;
        border-top:1px solid rgb(41,41,41);
    }
    #navi>li{
        width:14%;
        height:100%;
        float:left;
    }
    #navi a{
        color:white;
        text-decoration:none;
        font-size:18px;
        font-weight:700;
        letter-spacing:1px;
        display:block;
        width:100%;
        height:100%;
        text-align:center;
        line-height:64px;
    }
    #navi a:hover{
        color:rgb(80, 80, 80);
    }

</style>
</head>
<body>
   <div class="wrap">
    <div id="header">

        <div id="logo">
            <a href="<%=contextPath%>">
                <img src="<%=contextPath %>/resources/images/logo.png" width="180">
            </a>
        </div>

        <div id="searchBox">
            <input type="text" id="searchInput" placeholder="상품을 검색해보세요.">
            <button type="submit"></button>
        </div>

        <div id="utilities">
            <a href="">로그인</a> 
            <a href="">회원가입</a> 
            <a href="">고객센터</a>
        </div>
        
        <div id="navigator">
            <ul id="navi">
                <li><a href="<%=contextPath%>/list.st">STYLE</a></li>
                <li><a href="">SHOP</a></li>
            </ul>
        </div>
    </div>
   </div>
</body>       
</html>