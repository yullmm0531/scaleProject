<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검수정책</title>
<style>
    .outer{
        width:1200px;
        margin:auto;
        margin-top:50px;
    }
    .submenu-area, .outer-2{float:left;}
    .submenu-area{width:20%; padding-left:60px;}
    .submenu-area ul{
        list-style:none;
        padding-left:0px;
    }
    .submenu-area li{
        line-height:40px;
    }
    .submenu-area a{
        color:black;
    }
    .depth1>a{
        font-size:25px;
        text-decoration:none;
    }
    .outer-2{width:80%;}
    .title{
        text-align:center;
        margin-bottom:30px;
    }
    #notiTitle{
        font-weight:800;
        font-size:18px;
    }
    #notiContent{
        line-height:28px;
        font-size:14px;
    }
    .rq-mark{color:red; margin-right:7px;}
	.category input[type=radio]{
	    margin:0px 10px;
	}
    .inquire-form{
        text-align:center;
        font-size:14px;
    }
	.inquire-form textarea{
	    width:60%
	}
	.inquire-form input[type=text]{
	    width:60%
	}
	.inquire-form td{
	    text-align:left
	}
	.btn{
	    margin:5px;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer" align="center">
        <div class="submenu-area" align="left">
            <ul>
                <li class="depth1"><a><b>고객센터</b></a></li><br>
                <li class="depth2"><a href="<%=contextPath%>/list.no?cpage=1">공지사항</a></li>
                <li class="depth2"><a href="<%=contextPath%>/listForm.faq">자주묻는질문</a></li>
                <li class="depth2"><a href="<%=contextPath%>/list.inq?cpage=1">1:1 문의</a></li>
                <li class="depth2"><a href="<%=contextPath%>/inspection.po" style="background:black; color:white;"><b>검수정책</b></a></li>
            </ul>
        </div>
        <div class="outer-2">
            <div class="title">
                <h2><b>검수정책</b></h2>
                <br>
            </div>
            <br><br>
        </div>
    </div>
</body>
</html>