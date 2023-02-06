<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.scale.policy.model.vo.Policy" %>
<% Policy p = (Policy)request.getAttribute("p"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<style>
    .outer{
        width:1200px;
        margin:auto;
    }
    .outer-2{width:80%; float:left;}
    .title{
        margin:70px 0px;
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
	<%@ include file="../common/adminMenubar.jsp" %>
	
	<div class="outer" align="center">
        <div class="outer-2">
            <div class="title">
                <h2><b>서비스 이용약관 관리</b></h2>
                <br>
            </div>
            <br><br>
        <div class="form-area">
            <form class="enroll-form" action="updateTerms.ad" method="post">
                <table class="table enroll-form">
                    <tr>
                        <th height="200" width="150">이용약관 내용</th>
                        <td>
                        <% if(p != null) {%>
                            <textarea name="content" id="summernote"><%= p.getPolicyContent() %></textarea>
                        <%}else{ %>
                            <textarea name="content" id="summernote"></textarea>
                        <%} %>
                        </td>
                    </tr>
                    <tr>
                        <th>최종 수정일</th>
                    <% if(p != null) {%>
                        <td><%= p.getModifyDate() %></td>
                    <%}else{ %>
                    	<td></td>
                    <%} %>
                    </tr>
                </table>
                <button type="submit" class="btn btn-dark">수정</button>
            </form>
            <br><br>
        </div>
        </div>
    </div>

<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script>
    $(function() {
        $('#summernote').summernote({
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
        });
    });

    $(function() {
	    $('#summernote').summernote();
	});
</script>

</body>
</html>