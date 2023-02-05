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
    }
    .outer-2{float:left; width:80%;}
    .title{
        margin:70px 0px;
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
        position:relative;
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
    .btn-outline-danger{
        position:absolute;
        left:0px;
    }
    .btn-secondary{
        position:absolute;
        left:80px;
    }
    .btn-dark{
        position:absolute;
        right:0px;
    }
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	
	<div class="outer" align="center">
        <div class="outer-2">
            <div class="title">
                <h2><b>공지사항 수정</b></h2>
                <br>
            </div>
            <div class="form-area">
                <form class="enroll-form" action="updateNotice.ad" method="post">
                    <table class="table enroll-form">
                        <tr>
                            <th width="100"><span class="rq-mark">*</span>제목</th>
                            <td><input type="text" name="title" placeholder="공지사항 제목을 입력해주세요." value="<%= n.getNoticeTitle() %>"></td>
                        </tr>
                        <tr>
                            <th height="200"><span class="rq-mark">*</span>내용</th>
                            <td>
                                <textarea name="noticeDoc" id="summernote"><%= n.getNoticeContent() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td><%= n.getNoticeWriter() %></td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td><%= n.getCreateDate() %></td>
                        </tr>
                        <tr>
                            <th>수정일</th>
                            <td><%= n.getModifyDate() %></td>
                        </tr>
                        <tr>
                            <th><span class="rq-mark">*</span>공개여부</th>
                            <td>
                                <input type="radio" name="display" value="Y"> 공개
                                <input type="radio" name="display" value="N"> 비공개
                                <input type="hidden" id="display-check" value="<%=n.getDisplayStatus()%>">
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="noticeNo" value="<%=n.getNoticeNo()%>">
                    <a class="btn btn-outline-danger" href="deleteNotice.ad?noticeNo=<%=n.getNoticeNo()%>" onclick="return confirm('공지사항을 삭제하시겠습니까?')">삭제</a>
                    <a class="btn btn-secondary" href="noticeList.ad?cpage=1" onclick="return confirm('공지사항 수정을 취소하시겠습니까?')">목록</a>
                    <button type="submit" class="btn btn-dark">수정</button>
                </form>
                <br><br>
            </div>
            <div>
                
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

    $(function(){
        let displayCheck = $("#display-check").val();
        if(displayCheck == "Y"){
            $("input[type=radio]").first().attr("checked", true);
        }else{
            $("input[type=radio]").last().attr("checked", true);
        }
    })
</script>
</body>
</html>