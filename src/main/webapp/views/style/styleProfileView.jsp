<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.user.model.vo.User" %>
<%
	User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin: auto; 
        margin-top: 50px;
        /* border: 1px solid black; */
        width: 1200px;
    }
    .profile{width: 1100px;}
    .header>td{height: 150px;}
    .header>td>img{width: 100px; height: 100px;}
    .header>td>span{font-size: 30px; font-weight: bolder; padding-left: 10px;}
    .id, .introduce{height: 70px; font-size: 20px;}
    .id>div, .introduce>div{margin-left: 10px;}

    .edit-td{text-align: right;}
    .edit-btn{
        background-color: gray;
        border-radius: 0.3em;
        border: none;
        height: 30px;
    }

    .set{
        margin: 15px; 
        float: left;
    }
    .cimg{
        width: 260px; 
        height: 260px; 
        border-radius: 0.5em;
    }
    .nickname{height: 40px; text-align: left;}
    .nickname>img{width: 25px; height: 25px;}
    .nickname>a{margin-left: 3px;}

    .like{text-align: right;}
    .like>a{padding: 0;}

    .text{text-align: left;}

    .text{
    	text-overflow:ellipsis; 
    	overflow:hidden;
    	width:260px;
    	white-space:nowrap;
    }
    .tag-area{height: 27px;}
    #up-btn{
    	position: fixed; 
    	right: 50px; 
    	bottom: 30px;
    }
    #insert-btn{
    	position: fixed; 
    	right: 120px; 
    	bottom: 30px;
    }

	#modal-img{
		width: 90px; 
		height: 90px;
	}
	#modal-nickname{
		padding-left: 5px;
		font-size: 25px;
		font-weight: bold;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer">
		<div id="profile-box">
			<% if(loginUser != null && loginUser.getUserNo() == user.getUserNo()) { %>
				<table class="profile">
					<tr class="header">
						<td>
							<img src="<%= user.getProfileImg() %>" class="rounded-circle">
							<span><%= user.getUserNickName() %></span>
						</td>
						<td class="edit-td">
							<button type="button" class="edit-btn btn-secondary" data-toggle="modal" data-target="#profile-edit">프로필 편집</button>
						</td>
					</tr>
					<tr>
						<td class="id">
							<div><%= user.getUserId() %></div>
						</td>
					</tr>
					<tr>
						<% if(user.getIntroduce() != null) { %>
						<td class="introduce">
							<div><%= user.getIntroduce() %></div>
						</td>
						<% } %>
					</tr>
				</table>
			<% } else { %>
				<table class="profile">
					<tr class="header">
						<td>
							<img src="<%= user.getProfileImg() %>" class="rounded-circle">
							<span><%= user.getUserNickName() %></span>
						</td>
					</tr>
					<tr>
						<td class="id">
							<div><%= user.getUserId() %></div>
						</td>
					</tr>
					<tr>
						<% if(user.getIntroduce() != null) { %>
						<td class="introduce">
							<div><%= user.getIntroduce() %></div>
						</td>
						<% } %>
					</tr>
				</table>
			<% } %>
		</div>

        <br><br>
		
	    <div id="table-container">
	        
	    </div>
	
	    <div class="modal" id="profile-edit">
	        <div class="modal-dialog">
	          <div class="modal-content">
	      
	            <!-- Modal Header -->
	            <div class="modal-header">
	              <h4 class="modal-title">프로필 편집</h4>
	              <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>
	      
	            <!-- Modal body -->
	            <form class="modal-body">
					<table>
						<tr>
							<td rowspan="2">
								<img src="<%= loginUser.getProfileImg() %>" class="rounded-circle" id="modal-img">
							</td>
							<td>
								<span id="modal-nickname"><%= loginUser.getUserNickName() %></span>
							</td>
						</tr>
						<tr>
							<td>
								<a class="btn btn-outline-secondary btn-sm" id="modal-inputbtn">이미지 변경</a>
							</td>
							<td>
								<a class="btn btn-outline-secondary btn-sm">삭제</a>
							</td>
						</tr>
					</table>
	                <br>
	                <div>닉네임*</div>
	                <input type="text" name="nickname" value="<%= loginUser.getUserNickName() %>">
	                <br>
	                <div>소개</div>
	                <textarea name="introduce" cols="50" rows="5" style="resize: none;"><%= loginUser.getIntroduce() %></textarea>
	                <br><br>
	                <button type="submit" class="btn btn-secondary" data-dismiss="modal">변경</button>
	                <button type="reset" class="btn btn-secondary">초기화</button>
	            </form>
	      
	          </div>
	        </div>
        <button id="up-btn">UP</button>
        <button id="insert-btn">+</button>
        
        <script>
	        $("#up-btn").click(function(){
	            window.scrollTo({ top: 0, behavior: "smooth"});
	        })

			let cpage = 0;

			$(function(){
				$(window).scroll();
			})

			$(window).scroll(function() {
				if($(window).scrollTop() + $(window).height() == $(document).height()){
					cpage++;
					StyleList();
				}
			});

			function StyleList(){
				$.ajax({
					url:"<%= contextPath %>/profile.ajax",
					type:"get",
					data:{"cpage":cpage, "nickname":"<%= user.getUserNickName() %>", "userNo":"<%= user.getUserNo() %>"},
					success:function(map){
						let list = map.list;
						let ilist = map.ilist;
						let checkLike = map.checkLike;
						let maxPage = map.maxPage;
						
						let value = "";
						if(list.length > 0){
							if(cpage > maxPage){
								return;
							}
							$("#nothing").css("display", "none");
							for(let i=0; i<list.length; i++){
								value = "<table class='set'>"
											+ "<tr>"
												+ "<td colspan='2' class='style-img'>"
													+ "<div id='demo" + i + (12 * (cpage - 1)) + "' class='carousel'>"
														+ "<div class='carousel-inner' data-interval='false'>";
											for(let j=0; j<ilist.length; j++){
												if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 1) {
													value += "<div class='carousel-item active'>"
																+ "<img class='cimg' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "'>"
															+ "</div>";
												} else if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 2) {
													value += "<div class='carousel-item'>"
																+ "<img class='cimg' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "'>"
															+ "</div>";
												}
											}
												value += "</div>"
														+ "<a class='carousel-control-prev' href='#demo" +  i + (12 * (cpage - 1)) + "' data-slide='prev'>"
														+ "<span class='carousel-control-prev-icon'></span>"
														+ "</a>"
														+ "<a class='carousel-control-next' href='#demo" + i + (12 * (cpage - 1)) + "' data-slide='next'>"
														+ "<span class='carousel-control-next-icon'></span>" 
														+ "</a>"
													+ "</div>"
												+ "</td>"
											+ "</tr>"
											+ "<tr>"
												+ "<td class='nickname'>"
													+ "<img src='<%= contextPath %>/" + list[i].profileImg + "' class='rounded-circle'>"
													+ "<a href='<%= contextPath %>/profile.st?nickname=" + list[i].styleWriter + "&cpage=1'>" + list[i].styleWriter + "</a>"
												+ "</td>"
												+ "<td class='like'>";
										if(checkLike[i] == 0){
											value += "<a class='btn smile'>🤍</a>"
										} else {
											value += "<a class='btn smile'>❤</a>"
										}     
											value += "<input type='hidden' class='styleNo' value='" + list[i].styleNo + "'>"
													+ "<span>" + list[i].count + "</span>"
												+ "</td>"
											+ "</tr>"
											+ "<tr>"
												+ "<td colspan='2' class='tag-area'>"
													+ "<div class='text'>";
										if(list[i].hashtag != null){
											let tagArr = list[i].hashtag.split(" ");
											for(let t=0; t<tagArr.length; t++){
												const enco= encodeURIComponent(tagArr[t]);
												value += "<a href='<%= contextPath %>/search.st?keyword=" + enco + "'>" + tagArr[t] + "</a>";
											}
										}
										value += "</div>"
											+ "</td>"
										+ "</tr>"
									+ "</table>";
								$("#table-container").append(value);
							}
						} else {
							if($("#table-container").children().length == 0){
							value = "<div>새로운 스타일을 작성해보세요</div>";
							$(".set-container").append(value);
						}
						}
					},
					error:function(){
						console.log("통신실패");
					}
				})
				
			}

			$(document).on("click", ".smile", function(){
				let e = $(this);
				let like = e.text();
				<% if(loginUser == null) { %>
					alert("로그인 후 이용가능한 페이지입니다.");
					location.href = "<%= contextPath %>/loginForm.us";
				<% } else { %>
					let userNo = <%= loginUser.getUserNo() %>;
					$.ajax({
						url:"increaselike.ajax",
						data:{"userNo":userNo, "styleNo":$(this).next().val()},
						success:function(result){
							if(like == "🤍"){
								e.text("❤");
								e.next().next().text(Number(e.next().next().text()) + 1);
							} else {
								e.text("🤍");
								e.next().next().text(Number(e.next().next().text()) - 1);
							}
						},
						error:function(){
							console.log("실패");
						}
					})
				<% } %>
			})
        </script>

    </div>
    
</body>
</html>