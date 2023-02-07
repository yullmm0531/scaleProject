<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.scale.admin.user.model.vo.AdminUser"%>
<% 
	String contextPath = request.getContextPath();
	AdminUser adminUser = (AdminUser)session.getAttribute("adminUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.wrap{
		float:left;
		box-sizing:border-box;
		margin-right:200px;
		padding-right:50px;
		background:rgb(39, 39, 39);
		width:15%;
	}
	#navigator *{
		list-style:none;
		color:white;
		line-height:40px;
	}
	#navi>li>a{
		font-weight: 900;
	}
	#navi>li>ul>li{
		font-size:14px;
	}
	.outer{
		width:80%;
	}
</style>
</head>
<body>
	<% if(alertMsg != null){ %>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
	<% if(adminUser == null){ %>
		<script>
			alert("로그인 후 이용해주세요.");
			location.href = "<%=contextPath%>/loginForm.ad";
		</script>
	<% } %>
<div class="wrap">
	<div id="navigator">
		<ul id="navi">
			<img src="<%= contextPath %>/resources/images/logo.png" width="200">
			<li><a href="">결제 관리</a>
				<ul>
					<li><a href="<%= contextPath %>/biddingList.ad?cpage=1">입찰 리스트</a></li>
					<li><a href="<%= contextPath %>/dealList.ad?cpage=1">거래내역</a></li>
				</ul>
			</li>
			<li><a href="">스타일 관리</a>
				<ul>
					<li><a href="<%= contextPath %>/stylelist.ad?cpage=1">피드관리</a></li>
					<li><a href="<%= contextPath %>/stylereport.ad?cpage=1">신고관리</a></li>
				</ul>
			</li>
			<li><a href="">고객센터 관리</a>
				<ul>
					<li><a href="<%=contextPath%>/noticeList.ad?cpage=1">공지사항 관리</a></li>
					<li><a href="<%=contextPath%>/faqList.ad?cpage=1">자주묻는질문 관리</a></li>
					<li><a href="<%=contextPath%>/inquireList.ad?cpage=1">1:1문의 관리</a></li>
				</ul>
			</li>
			<li><a href="">정책 관리</a>
				<ul>
					<li><a href="<%=contextPath%>/inspection.ad">검수정책</a></li>
					<li><a href="<%=contextPath%>/terms.ad">이용약관</a></li>
					<li><a href="<%=contextPath%>/privacy.ad">개인정보처리방침</a></li>
				</ul>
			</li>
		</ul>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
</div>
</body>
</html>