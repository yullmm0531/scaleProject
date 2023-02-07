<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.scale.customerCenter.model.vo.Notice"%>
<% Notice n = (Notice)request.getAttribute("n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
    .table{
        text-align:left;
        font-size:14px;
    }
    .notice-content{
        height:300;
        padding:20px;
    }
    .prev .next{
        cursor: pointer;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer" align="center">
        <div class="submenu-area" align="left">
            <ul>
                <li class="depth1"><a><b>고객센터</b></a></li><br>
                <li class="depth2"><a href="<%=contextPath%>/list.no?cpage=1" style="background:black; color:white;"><b>공지사항</b></a></li>
                <li class="depth2"><a href="<%=contextPath%>/listForm.faq">자주묻는질문</a></li>
                <li class="depth2"><a href="<%=contextPath%>/list.inq?cpage=1">1:1 문의</a></li>
                <li class="depth2"><a href="<%=contextPath%>/inspection.po">검수정책</a></li>
            </ul>
        </div>
        <div class="outer-2">
            <div class="title">
                <h2><b>공지사항</b></h2>
                <br>
            </div>
            <table class="table">
                <thead class="thead-dark" align="center">
                    <tr>
                        <th colspan="4"><%= n.getNoticeTitle() %></th>
                    </tr>
                </thead>
                <tr>
                    <td colspan="2" width="200"></td>
                    <td width="150"><%= n.getCreateDate() %></td>
                    <td width="80"><%= n.getCount() %></td>
                </tr>
                <tr>
                    <td colspan="4" class="notice-content">
                        <%= n.getNoticeContent() %>
                    </td>
                </tr>
            </table>
            <br><br><br>
            <div>
                <a class="btn btn-secondary" href="list.no?cpage=1">목록</a>
            </div>
            <br><br><br>
        </div>
</body>
</html>