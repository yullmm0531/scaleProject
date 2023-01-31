<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #thumb_img{
        width: 50%;
        height: 50%;
        border-radius: 100%;
        border-top-left-radius: 100%;
        border-top-right-radius: 100%;
        border-bottom-right-radius: 100%;
        border-bottom-left-radius: 100%;

        border: 0;
border-top-width: 0px;
border-right-width: 0px;
border-bottom-width: 0px;
border-left-width: 0px;
border-top-style: initial;
border-right-style: initial;
border-bottom-style: initial;
border-left-style: initial;
border-top-color: initial;
border-right-color: initial;
border-bottom-color: initial;
border-left-color: initial;
border-image-source: initial;
border-image-slice: initial;
border-image-width: initial;
border-image-outset: initial;
border-image-repeat: initial;

box-sizing: border-box;
    }
    .user_detail{
        
        width: 1000px;
        height: 200px;
        margin-left: 30%;
    }
    .user_thumb{
        
        width: 20%;
        height: 80%;
        float: left;
        margin-top: 1.9%;
        margin-left: 1%;
    }
    #thumb_img{width: 100%; height: 100%;}
    .user_info{
        
        width:  70%;
        height: 100%;
    }
    .info_box{width: 50%;
              margin-left: 15%;
              margin-top: 5%;
    }
    #toProfile{background-color: gray;}
    #toMyStyle{background-color: gray;}
    #pwd-box{width: 800px; margin-left: 30%;}
    #pwdBox-title-div{margin-left: auto;}
    #edit-pwd{margin-left: 73%; background-color: gray;}

    #user-info{width: 800px; margin-left: 30%;}
    #info-title{margin-left: auto;}
    .tag{margin-left: 5%;}
    .info-main{margin-left: 5%;}
    
    #edit-phone{margin-left: 73%; background-color: gray;}
    #edit-email{margin-left: 73%; background-color: gray;}
    #user-leave-div{width: 800px; margin-left: 30%;}
    #user-leave{margin-left: 73%; background-color: red; color: white;}
    
    
    .underline{border: 3px solid gray; width: 800px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<% 
		String userId = loginUser.getUserId(); 
		String userPwd = loginUser.getUserPwd();
		String userName = loginUser.getUserName(); 
		String userPhone = loginUser.getPhone(); 
		String userEmail = loginUser.getEmail();
		String nickName = loginUser.getUserNickName();
	%>

    <div class="userMembership">

        <div class="user_detail">
            <div class="user_thumb">
                <img src="resources/111500268.2.jpg" alt="사용자이미지" id="thumb_img">
                
            </div>
            <div class="user_info">
                <div class="info_box" align="center">
                    <p class="name"><%= userId %></p>
                    <p class="nickName"><%=nickName %></p>
                    <p class="email"><%=userEmail %></p>
                    <a href="" class="btn btn outlinegrey small" type="button" id="toProfile">프로필 편집</a>
                    <a href="<%= contextPath %>/profileView.st?cpage=1&nickname=<%= loginUser.getUserNickName() %>" class="btn btn btn_my_style outlinegrey small" type="button" id="toMyStyle">내 스타일</a>
                </div>
                <br>
      
                <div class="underline"></div>
            </div>
        </div>
        <br><br>
        

        <div id="pwd-box">
            <div id="pwdBox-title-div">
                <h4 id="pwd-title">로그인 정보</h4>
            </div>
            <br><br>
            
            
            <div id="edit-pwd-div">
                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updatePwdModal" id="edit-phone">비밀번호변경</button>
            </div>
            
            <!-- 비밀번호 변경용 모달 div -->
			    <div class="modal" id="updatePwdModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">비밀번호 변경</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body" align="center">
				        
				        <form action="<%= contextPath %>/updatePwd.us" method="post">
				        	<input type="hidden" name="userId" value="<%=userId%>">
				        	<input type="hidden" name="OriginalUserPWd" value="<%=userPwd%>" id="OriginalUserPWd">
				        	<table>
				        		<tr>
				        			<td>현재 비밀번호</td>
				        			<td><input type="password" name="userPwd" id="userPwd" required></td>
				        		</tr>
				        		<tr>
				        			<td>변경할 비밀번호</td>
				        			<td><input type="password" name="updatePwd" id="updatePwd" required></td>
				        		</tr>
				        		<tr>
				        			<td>변경할 비밀번호 확인</td>
				        			<td><input type="password" name="updatePwdCheck" id="updatePwdCheck" required></td>
				        		</tr>
				        	</table>
				        	<br>
				        	
				        	<button type="submit" class="btn btn-secondary btn-sm" onclick="return validate();">비밀번호 변경</button>
				        	
				        </form>
				        
				        <script>
				        	function validate(){
				        		const pwdInput1 = document.getElementById("updatePwd");
				                const pwdInput2 = document.getElementById("updatePwdCheck");
				                
				                const pwdInput3 = document.getElementById("userPwd");
				                const pwdInput4 = document.getElementById("OriginalUserPWd");
				                
				                if(pwdInput3.value != pwdInput4.value){
				                	alert("기존 비밀번호를 확인해주세요");
				                    pwdInput3.value = "";
				                    pwdInput3.focus();
				                    return false;
				                }else if(pwdInput1.value != pwdInput2.value) {
				                	 alert("동일한 비밀번호를 입력해주세요");
					                    pwdInput2.value = "";
					                    pwdInput2.focus();
					                    return false;
				                }
				                
				                
				        	}
				        </script>
				        
				      </div>
				
				    </div>
				  </div>
				</div>
            
            
            
            
            
            
            
            <br>
            <div class="underline"></div>
        </div>
        <br><br>
        
        

        <div id="user-info">
            <div id="user-info-title-div">
                <h4 id="info-title">개인정보</h4>
            </div>
            <br>

            <div id="user-name-box" class="box">
                <div id="name-tag" class="tag">
                    <p>이름</p>
                </div>
                <div id="user-name-div" class="info-main">
                    <span id="user-name"><%=userName %></span>
                </div>
            </div>
            <br>
            
            <div class="underline"></div>
			
			
			
			
            <div id="user-phone-box"class="box">
                <div id="phone-tag" class="tag">
                    <p>연락처</p>
                </div>
                <div id="user-phone-div"class="info-main">
                    <span id="user-phone"><%=userPhone %></span>
                </div>
                <div id="edit-phone-div">
                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updatePhoneModal" id="edit-phone">연락처변경</button>
                </div>
                
			         <div class="modal" id="updatePhoneModal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">연락처 변경</h4>
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body" align="center">
					        
					        <b>연락처를 변경하시겠습니까?<br>변경할 연락처를 입력해주십시오.</b> <br><br>
					        
					        <form action="<%= contextPath %>/updatePhone.us" method="post">
					        	
					        	<input type="hidden" name="userId" value="<%= userId %>">
					        	새 연락처 : <input type="text" name="phone" placeholder=" - 포함" required> <br><br>
					        	
					        	<button type="submit" class="btn btn-danger btn-sm">변경하기</button>
					        	
					        	
					        	
					        </form>
					        
					      </div>
					
					    </div>
					  </div>
					</div>
                
            </div>
            <br>
            
            <div class="underline"></div>

            <div id="user-email-box"class="box">
                <div id="email-tag" class="tag">
                    <p>이메일</p>
                </div>
                <div id="user-email-div"class="info-main">
                    <span id="user-email"><%=userEmail %></span>
                </div>
                <div id="edit-email-div">
                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updateEmailModal" id="edit-phone">이메일변경</button>
                </div>
                
                <div class="modal" id="updateEmailModal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">이메일 변경</h4>
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body" align="center">
					        
					        <b>이메일을 변경하시겠습니까?<br>변경할 이메일을 입력해주십시오.</b> <br><br>
					        
					        <form action="<%= contextPath %>/updateEmail.us" method="post">
					        	
					        	<input type="hidden" name="userId" value="<%= userId %>">
					        	새 이메일 : <input type="email" name="email" required> <br><br>
					        	
					        	<button type="submit" class="btn btn-danger btn-sm">변경하기</button>
					        	
					        	
					        	
					        </form>
					        
					      </div>
					
					    </div>
					  </div>
					</div>
                
                
                <br>
                <div class="underline"></div>
            </div>
        </div>
        <br>
        
        

        <div id="user-leave-div">
           
            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal" id="user-leave">회원탈퇴</button>
        </div>
        
         <div class="modal" id="deleteModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원탈퇴</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" align="center">
	        
	        <b>탈퇴후 복구가 불가능합니다. <br> 정말로 탈퇴하시겠습니까?</b> <br><br>
	        
	        <form action="<%= contextPath %>/deleteUser.us" method="post">
	        	
	        	<input type="hidden" name="userId" value="<%= userId %>">
	        	비밀번호 : <input type="password" name="userPwd" required> <br><br>
	        	
	        	<button type="submit" class="btn btn-danger btn-sm">탈퇴하기</button>
	        	
	        	
	        	
	        </form>
	        
	      </div>
	
	    </div>
	  </div>
	</div>
	
</body>
</html>