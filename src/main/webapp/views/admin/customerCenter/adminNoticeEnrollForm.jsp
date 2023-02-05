<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
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
    .rq-mark{color:red; margin-right:7px;}
    .table input[type=radio]{
	    margin:0px 10px;
	}
    .enroll-form{
        text-align:center;
        font-size:14px;
    }
	.enroll-form textarea{
	    width:60%;
	}
	.enroll-form input[type=text]{
	    width:60%;
        height:40px;
	}
	.enroll-form td{
	    text-align:left
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
            <form class="enroll-form" action="enrollNotice.ad" method="post">
                <table class="table enroll-form">
                    <tr>
                        <th><span class="rq-mark">*</span>제목</th>
                        <td><input type="text" name="title" placeholder="공지사항 제목을 입력해주세요."></td>
                    </tr>
                    <tr>
                        <th height="200"><span class="rq-mark">*</span>내용</th>
                        <td>
                            <textarea name="noticeDoc" id="summernote"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th><span class="rq-mark">*</span>공개여부</th>
                        <td>
                            <input type="radio" name="display" value="Y"> 공개
                            <input type="radio" name="display" value="N" checked> 비공개
                        </td>
                   		
                    </tr>
                </table>
                <input type="hidden" name="noticeWriter" value="<%=adminUser.getUserNo()%>">
                <button type="submit" class="btn btn-dark">등록</button>
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

<script>
    function validate(){

    }
</script>
</body>
</html>