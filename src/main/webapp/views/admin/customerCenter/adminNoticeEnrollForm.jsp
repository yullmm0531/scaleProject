<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.scale.common.model.vo.PageInfo, java.util.ArrayList, com.scale.customerCenter.model.vo.Notice" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
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
    .outer-2{float:left; width:80%;}
    .title{
        margin:70px 0px;
    }
    .mb-3 button{
        background:black;
        color:white;
    }
    .table{
        text-align:center;
        font-size:14px;
    }
    .paging-area button{
        border:0.5px solid lightgray;
        margin:3px;
    }
    .page-active{
        background:black;
        color:white;
    }
</style>
</head>
<body>
    <%@ include file="../common/adminMenubar.jsp"%>
    <div class="outer" align="center">
        <div class="outer-2">
            <div class="title">
                <h2><b>공지사항 등록</b></h2>
                <br>
            </div>
            <div class="form-area">
            <br><br>
        </div>
    </div>

    <script>
    </script>
</body>
</html>