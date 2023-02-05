<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.customerCenter.model.vo.Inquire" %>
<% 
	Inquire iq = (Inquire)request.getAttribute("iq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 관리</title>
<style>
    .outer{
        width:1200px;
        margin:auto;
    }
    .outer-2{float:left; width:80%;}
    .title{
        margin:70px 0px;
    }
	.category input[type=radio]{
	    margin:0px 10px;
	}
    .inquire-form{
        text-align:center;
        font-size:14px;
        position:relative;
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
    .btn-outline-danger{
        position:absolute;
        left:0px;
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
                <h2><b>1:1문의 관리</b></h2>
                <br>
            </div>
            <br>
            <form action="<%=contextPath%>/upadteAnswer.ad" method="post" class="inquire-form"> 
                <div>
                    <table class="table">
                        <tr>
                            <th>문의자 아이디</th>
                            <td><%= iq.getInquireUser() %></td>
                            <th width="100px">문의일</th>
                            <td><%= iq.getInquireDate() %></td>
                        </tr>
                        <tr>
	                        <th width="150px">구분</th>
	                        <% switch(iq.getCategory()){ 
	                            case "buy": iq.setCategory("구매"); break;
	                            case "sell": iq.setCategory("판매"); break;
	                            case "site": iq.setCategory("사이트이용"); break;
	                            case "payment": iq.setCategory("결제"); break;
	                            case "shipping": iq.setCategory("배송"); break;
	                            case "product": iq.setCategory("상품"); break;
	                            }	
	                        %>
	                        <td colspan="3"><%= iq.getCategory() %></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="3"><%= iq.getInquireTitle() %></td>
                        </tr>
                        <tr>
                            <th height="200">내용</th>
                            <td colspan="3">
                                <%= iq.getInquireContent() %> <br><br>
                                <%if(iq.getInquireImg() != null) {%>
                            	<img src="<%=contextPath%>/<%=iq.getInquireImg()%>" height="300">
                            	<%} %>
                            </td>
                        </tr>
                        <% if(iq.getAnswerStatus().equals("Y")) {%>
	                        <tr>
	                            <th>답변</th>
	                            <td colspan="3"><textarea name="answer" cols="30" rows="10" style="resize:none"><%=iq.getAnswerContent()%></textarea></td>
	                        </tr>
	                        <tr>
	                            <th>최종 답변자</th>
	                            <td><%=iq.getAnswerUser()%></td>
	                            <th width="100px">최종 답변일</th>
	                            <td><%=iq.getAnswerModifyDate()%></td>
	                        </tr>
                        <%}else{ %>
                        	<tr>
	                            <th>답변</th>
	                            <td colspan="3"><textarea name="answer" cols="30" rows="10" style="resize:none" placeholder="답변 내용을 입력해주세요." required></textarea></td>
	                        </tr>
                        <%} %>
                    </table>
                    <br><br>
                    <input type="hidden" name="inquireNo" value="<%=iq.getInquireNo()%>">
                    <button type="button" class="btn btn-outline-danger" onclick="cancelForm();">취소</button>
                    <button type="submit" class="btn btn-dark" onclick="return validate();">답변 등록/수정</button>
                    <br><br><br><br>
                </div>
            </form>
        </div>
        <br><br>
    </div>
<script>

    function cancelForm(){
        if(confirm("답변 등록/수정을 취소하시겠습니까?")){
            location.href = "<%=contextPath%>/inquireList.ad?cpage=1";
        }
    }

    function validate(){
        if($("textarea").val() == ""){
            alert("답변 내용을 입력해주세요.");
            $("textarea").focus();
            return false;
        }
    }

</script>
</body>
</html>