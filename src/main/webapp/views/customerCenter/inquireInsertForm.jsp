<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
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
                <li class="depth2"><a href="<%=contextPath%>/list.inq?cpage=1" style="background:black; color:white;"><b>1:1 문의</b></a></li>
                <li class="depth2"><a href="<%=contextPath%>/inspection.po">검수정책</a></li>
            </ul>
        </div>
        <div class="outer-2">
            <div class="title">
                <h2><b>1:1 문의</b></h2>
                <br>
            </div>
            <div class="noti" align="left">
                <p id="notiTitle">상담 시간</p>
                <p id="notiContent">
                    평일(월 ~ 금) 10:00 ~ 17:00 (토/일/공휴일 휴무) <br>
                    한번 등록한 상담내용은 수정이 불가능합니다.
                </p>
            </div>
            <br>

            <form action="<%=contextPath%>/insert.inq" method="post" class="inquire-form" enctype="multipart/form-data"> 
                <div>
                    <table class="table">
                        <th><span class="rq-mark">*</span>구분</th>
                        <td class="category">
                        	<input type="radio" name="category" value="product" id="product">
                            <label for="product">상품</label>
                            <input type="radio" name="category" value="buy" id="buy">
                            <label for="buy">구매</label>
                            <input type="radio" name="category" value="sell" id="sell">
                            <label for="sell">판매</label>
                            <input type="radio" name="category" value="payment" id="payment">
                            <label for="payment">결제</label>
                            <input type="radio" name="category" value="shipping" id="shipping">
                            <label for="shipping">배송</label>
                            <input type="radio" name="category" value="site" id="site">
                            <label for="site">사이트 이용</label>
                        </td>
                        <tr>
                            <th>성명</th>
                            <td><%= loginUser.getUserName() %></td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td><%= loginUser.getUserId() %></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><%= loginUser.getEmail() %></td>
                        </tr>
                        <tr>
                            <th><span class="rq-mark">*</span>제목</th>
                            <td><input type="text" name="title" placeholder="문의 제목을 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th height="200"><span class="rq-mark">*</span>내용</th>
                            <td>
                                <textarea name="content" rows="10" placeholder="문의 내용을 상세히 입력해주세요."></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>사진첨부</th>
                            <td><input type="file" name="upfile"></td>
                        </tr>
                    </table>
                    <br><br>
                    <button type="button" class="btn btn-outline-danger" onclick="cancelForm();">취소</button>
                    <button type="submit" class="btn btn-dark" onclick="return validate();">문의 등록</button>
                    <br><br><br><br>
                </div>
            </form>
        </div>
        <br><br>
    </div>
<script>
    function validate(){
        if(!$("input:radio[name=category]").is(":checked")){
            alert("문의 구분을 선택해주세요.");
            $("input:radio[name=category]").focus();
            return false;
        }

        if($("input[name=title]").val() == ""){
            alert("제목을 입력해주세요.");
            $("input[name=title]").focus();
            return false;
        }

        if($("textarea").val() == ""){
            alert("내용을 입력해주세요.");
            $("textarea").focus();
            return false;
        }
    }

    function cancelForm(){
        if(confirm("문의 등록을 취소하시겠습니까?")){
            location.href = "<%=contextPath%>/list.inq?cpage=1";
        }
    }

</script>
</body>
</html>