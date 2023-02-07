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
    #profile-img{width: 100px; height: 100px;}
    #profile-nickname{font-size: 30px; font-weight: bolder; padding-left: 10px;}
    .id-td, .introduce-td{height: 70px; font-size: 20px;}
    #profile-id, #profile-introduce{margin-left: 10px;}

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
    	z-index: 999;
        width: 50px;
        height: 50px;
    }
    #up-btn{cursor: pointer;}
    #insert-btn{
    	position: fixed; 
    	right: 130px; 
    	bottom: 30px;
    	z-index: 999;
        width: 50px;
        height: 50px;
    }
    #insert-btn{cursor: pointer;}

	#modal-img{
		width: 90px; 
		height: 90px;
	}
	#modal-nickname{
		padding-left: 5px;
		font-size: 25px;
		font-weight: bold;
	}
	#nickname-input{width: 450px;}
	.style-img{
		width: 260px;
		height: 260px;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<script>
        $(function(){
            <% if(loginUser != null && loginUser.getStyleBlockDate() != null) { %>
                alert("스타일 신고 누적으로 STYLE 차단되었습니다.");
                location.href = "<%= contextPath %>";
            <% } %>
        })
    </script>
	
    <div class="outer">
		<div id="profile-box">
			<table class="profile">
				<tr class="header">
					<td>
						<img src="<%= user.getProfileImg() %>" class="rounded-circle" id="profile-img">
						<span id="profile-nickname"><%= user.getUserNickName() %></span>
					</td>
				</tr>
				<tr>
					<td class="id-td">
						<div id="profile-id"><%= user.getUserId() %></div>
					</td>
				</tr>
				<tr>
					<% if(user.getIntroduce() != null) { %>
						<td class="introduce-td">
							<div id="profile-introduce"><%= user.getIntroduce() %></div>
						</td>
					<% } else { %>
						<td class="introduce-td">
							<div id="profile-introduce"></div>
						</td>
					<% } %>
				</tr>
			</table>
		</div>

        <br>
		
	    <div id="table-container">
	        
	    </div>

		<img id="up-btn" src="<%= contextPath %>/resources/images/style/up.jpg">
		<img id="insert-btn" src="<%= contextPath %>/resources/images/style/insert.jpg">
		<br><br>

		<script>
			$("#up-btn").click(function(){
				window.scrollTo({ top: 0, behavior: "smooth" });
			})

			$(function(){
				$("#insert-btn").click(function(){
					<% if(loginUser == null) { %>
							alert("로그인 후 이용가능한 페이지입니다.");
							location.href = "<%= contextPath %>/loginForm.us";
					<% } else { %>
							location.href = "<%= contextPath %>/enrollForm.st";
					<% } %>
				})
			})
		</script>
	
	    <div class="modal" id="profile-edit">
	        <div class="modal-dialog">
	          <div class="modal-content">
	      
	            <!-- Modal Header -->
	            <div class="modal-header">
	              <h4 class="modal-title">프로필 편집</h4>
	            </div>
	      
	            <!-- Modal body -->
				<% if(loginUser != null) { %>
	            <div class="modal-body">
					<form id="xxx">
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
									<input type="file" id="img-input" style="display: none;" onchange="changeImg(this);">
									<a class="btn btn-outline-secondary btn-sm" id="modal-imgbtn" onclick="$('#img-input').click();">이미지 변경</a>
								</td>
								<td>
									<a class="btn btn-outline-secondary btn-sm" onclick="deleteImg();">삭제</a>
									<input type="hidden" value="false" id="delete-flag">
								</td>
							</tr>
						</table>

						<br>

						<div>닉네임<span style="color: red;">*</span></div>
						<input type="text" value="<%= loginUser.getUserNickName() %>" id="nickname-input" maxlength="20">

						<br>

						<div>소개</div>
						<% if(loginUser.getIntroduce() != null) { %>
						<textarea cols="58" rows="5" style="resize: none;" id="introduce"><%= loginUser.getIntroduce() %></textarea>
						<% } else { %>
						<textarea cols="58" rows="5" style="resize: none;" id="introduce"></textarea>
						<% } %>

						<br><br>

						<div align="center">
							<button type="button" class="btn btn-secondary" onclick="changeProfile();">변경</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="document.getElementById('xxx').reset();">취소</button>
						</div>
					</form>
	            </div>
				<% } %>

				<script>
					<% if(loginUser != null){ %>
					let a = <%= loginUser.getUserNo() %>;
					
					<% } %>

					$("#nickname-input").keydown(function(){
						if(event.keyCode == 13) {
                            event.preventDefault();
						}
					})

					function deleteImg(){
						$('#modal-img').attr('src', '<%= contextPath %>/resources/images/profile/default_img.png');
						$("#delete-flag").val("true");
					}

					function changeImg(inputFile){
						if(inputFile.files.length == 1){ 
                            const reader = new FileReader();
							reader.readAsDataURL(inputFile.files[0]);
							reader.onload = function(e){
								$("#modal-img").attr("src", e.target.result);
							}
						} else {
							$("#modal-img").attr("src", "<%= contextPath %>/resources/images/profile/default_img.png");
						}
					}

					function changeProfile(){
						event.preventDefault();
						$('#profile-edit').modal('hide');

						let formData = new FormData();
						let nickname = $("#nickname-input").val();
						let introduce = $("#introduce").val();
						let uploadFile = $("#img-input")[0].files[0];
						let deleteFlag = $("#delete-flag").val();

						formData.append("nickname", nickname);
						formData.append("introduce", introduce);
						formData.append("uploadFile", uploadFile);
						formData.append("deleteFlag", deleteFlag);

						
						
						$.ajax({
							url:"<%= contextPath %>/updateNickname.ajax",
							data: formData,
							processData:false,
							contentType:false,
							type:"POST",
							success:function(updateUser){
								
								if(a != updateUser.userNo){
									alert("프로필 편집을 실패했습니다.");
								} else {
									$("#profile-img").attr("src", updateUser.profileImg);
									$("#profile-nickname").text(updateUser.userNickName);
									$("#profile-introduce").text(updateUser.introduce);
								}
							},
							error:function(){
								console.log("통신실패");
							}
						})
					}

				</script>
	      
	          </div>
	        </div>
        
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
					data:{"cpage":cpage, "userNo":"<%= user.getUserNo() %>"},
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
													+ "<div id='demo" + Number(i + (12 * (cpage - 1))) + "' class='carousel' data-interval='false'>"
														+ "<div class='carousel-inner'>";
											for(let j=0; j<ilist.length; j++){
												if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 1) {
													value += "<div class='carousel-item active'>"
																+ "<img class='cimg' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "' onclick='detail(this);'>"
																+ "<input type='hidden' id='" + list[i].styleNo + "' value='" + list[i].styleNo + "'>"
																+ "<input type='hidden' value='" + cpage + "'>"
															+ "</div>";
												} else if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 2) {
													value += "<div class='carousel-item'>"
																+ "<img class='cimg' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "' onclick='detail(this);'>"
																+ "<input type='hidden' id='" + list[i].styleNo + "' value='" + list[i].styleNo + "'>"
																+ "<input type='hidden' value='" + cpage + "'>"
															+ "</div>";
												}
											}
												value += "</div>"
														+ "<a class='carousel-control-prev' href='#demo" +  Number(i + (12 * (cpage - 1))) + "' data-slide='prev'>"
														+ "<span class='carousel-control-prev-icon'></span>"
														+ "</a>"
														+ "<a class='carousel-control-next' href='#demo" + Number(i + (12 * (cpage - 1))) + "' data-slide='next'>"
														+ "<span class='carousel-control-next-icon'></span>" 
														+ "</a>"
													+ "</div>"
												+ "</td>"
											+ "</tr>"
											+ "<tr>"
												+ "<td class='nickname'>"
													+ "<img src='<%= contextPath %>/" + list[i].profileImg + "' class='rounded-circle'>"
													+ "<a href='<%= contextPath %>/profileView.st?userNo=" + list[i].userNo + "'>" + list[i].styleWriter + "</a>"
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
						async : false,
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

			function detail(e){
				let no = $(e).next().val();
            	let cpage = $(e).next().next().val();
				let userNo = <%= user.getUserNo() %>;
				location.href = "<%= contextPath %>/detail.st?no=" + no + "&view=profile&userNo=" + userNo + "&cpage=" + cpage;
			}
        </script>

    </div>
    
</body>
</html>