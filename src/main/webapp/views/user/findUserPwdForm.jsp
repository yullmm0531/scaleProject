<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	.outer{
        font-family: 'Noto Sans KR', sans-serif;
        width:1200px;
        min-width:650px;
        margin:auto;
        margin-top:100px;
        margin-bottom:70px;
    }
    h2{
        text-align:center;
        margin:50px 0px;
    }
    .findPwd-wrapper{
        width:500px;
        height:600px;
        margin:auto;
        padding:30px 0px;
    }
    #findPwdForm{
        width:500px;
        height:500px;
        margin:auto;
        padding:10px;
        border:0.5px solid lightgray;
        border-radius:7px;
        box-shadow:rgba(0, 0, 0, 0.05) 0px 0px 8px 0px;
    }
    #find-area{margin:0px 40px;}
    #find-area>p{
        font-size:14px;
        text-align:center;
        margin:30px 10px;
    }
    .rq-mark{color:red; margin:7px;}
    ::placeholder{font-size:12px;}
    #findPwdForm>input, #find-btn{
        width:100%;
        height:48px;
        margin-bottom:20px;
        border-radius:6px;
        border:none;
        font-size:15px;
    }
    #find-btn{
        background:black;
        color:white;
        margin-top:20px;
    }
    #validateMsg{
        color:red;
        font-size:12px;
        text-align:center;
        margin:12px 0px 15px 0px;
        visibility: hidden;
    }
    #failed, #send-code, #newPwd-form, #success{padding:30px; display:none;}
    #failed>p, #success>p{
        font-size:20px;
        margin-top:80px;
    }
    #failed>a, #send-code>a, #newPwd-form>a, #success>a{
        width:100%;
        height:48px;
        line-height:35px;
        border-radius:6px;
        border:none;
        font-size:15px;
        background:black;
    }
    #send-code>p, #newPwd-form>p{
        font-size:18px;
        text-align:center;
        margin-top:80px;
    }
    #send-code>input{
        width:100%;
        height:48px;
        margin-bottom:20px;
        border-radius:6px;
        font-size:15px;
    }
    #success>p{
        font-size:20px;
        margin-top:80px;
    }
    .check-input{
        color:red;
        font-size:11px;
        padding:3px 10px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<h2><b>비밀번호 찾기</b></h2>
        <div class="findPwd-wrapper">

            <div id="findPwdForm">
                <div id="find-area">
                    <p>가입한 계정의 이름, 아이디, 이메일 정보를 입력해주세요.</p>
                    <br>
                    <div class="form-group">
                        <label for="userId"><span class="rq-mark">*</span>아이디</label> <br>
                        <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력해주세요." required>
                    </div>
                    <div class="form-group">
                        <label for="userName"><span class="rq-mark">*</span>이름</label> <br>
                        <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요." required>
                    </div>
                    <div class="form-group">
                        <label for="email"><span class="rq-mark">*</span>이메일</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요." required>
                    </div>
                    <div>
                        <button type="button" class="btn btn-dark" id="find-btn" disabled onclick="findPwd();">비밀번호 찾기</button>
                    </div>
                </div>
                    
                <div id="failed" align="center">
                    <p>일치하는 회원정보가 없습니다.<br>다시 시도해주세요.</p>
                    <br>
                    <a href="<%=contextPath%>/findPwdForm.us" class="btn btn-dark">비밀번호 다시 찾기</a>
                </div>

                <div id="send-code">
                    <p>입력하신 이메일로 인증번호가 전송되었습니다.<br>인증코드를 입력해주세요.</p>
                    <br>
                    <label for="emailCode" align="left"><span class="rq-mark">*</span>인증코드</label> <br>
                    <input type="text" class="form-control" id="emailCode" name="emailCode" placeholder="인증코드 5자리" required>
                    <div id="validateMsg">인증번호가 일치하지 않습니다.</div>
                    <a class="btn btn-dark" id="codeCheck-btn">인증하기</a>
                </div>

                <div id="newPwd-form">
                    <p>비밀번호를 재설정해주세요.</p>
                    <br>
                    <div class="form-group">
                        <label for="pwd"><span class="rq-mark">*</span>새 비밀번호</label>
                        <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="8자 이상의 영문+숫자+특수문자로 조합해주세요." required>
                        <div class="check-input" id="check-input-pwd"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="pwdCheck"><span class="rq-mark">*</span>새 비밀번호 확인</label>
                        <input type="password" class="form-control" id="pwdCheck" placeholder="입력한 비밀번호를 확인해주세요." required>
                        <div class="check-input" id="check-input-pwd2"></div>
                    </div>
                    <br>
                    <a class="btn btn-dark" id="setPwd-btn" onclick="setPwd();">변경 완료</a>
                </div>
                
                <div id="success" align="center">
                    <p>비밀번호가 재설정되었습니다.<br>변경된 로그인 후 이용해주세요.</p>
                    <br><br>
                    <a href="<%=contextPath%>/loginForm.us" class=" btn btn-dark">로그인 </a><br>
                </div>
            </div>

        </div>
    </div>
    
    <script>
        $(function(){
            // 버튼 활성화
            let e = $("input").keypress();
            function enableBtn(e){
                if($("#userId").val() == "" || $("#userName").val() == "" || $("#email").val() == ""){
                    $("#find-btn").attr("disabled", true);
                }else{
                    $("#find-btn").attr("disabled", false);
                    if(e.keyCode==13){
                        findPwd();
                    }
                }
            }
            $("input").on({"keyup":enableBtn, "change":enableBtn});

            // 비밀번호 유효성검사
            $("#userPwd").focusout(function(){
            if($("#userPwd").val() == ""){
                $("#check-input-pwd").html("비밀번호를 입력해주세요.");
            }
            })

            $("#userPwd").keyup(function(){
                let regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
                if(!regExp.test($("#userPwd").val())){
                    $("#check-input-pwd").css("color", "red").html("영문+숫자+특수문자(!@#$%^&*) 조합으로 8자 이상 입력해주세요.");
                }else{
                    $("#check-input-pwd").html("");
                }
            })

            $("#pwdCheck").focusout(function(){
                if($("#pwdCheck").val() == ""){
                    $$("#check-input-pwd2").html("비밀번호를 다시 입력해주세요.");
                }else if($("#userPwd").val() != $("#pwdCheck").val()){
                    $("#check-input-pwd2").html("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
                }else{
                    $("#check-input-pwd2").html("");
                }
            })
        })

    </script>
    <script>
        function findPwd(){
            
            $.ajax({
                url:"<%=contextPath%>/findPwd.us",
                data:{
                        userId:$("#userId").val(),
                        userName:$("#userName").val(),
                        email:$("#email").val()
                },
                success:function(user){
                    $("#find-area").css("display", "none");
					if(user == null){
                        $("#failed").css("display", "block");
                    }else{
                        $("#send-code").css("display", "block");
                        sendCode();
                    }
                }, error:function(){
                    console.log("비밀번호찾기 통신 실패");
                }
            });
            
        }

        function sendCode(){
            
            $.ajax({
                url:"<%=contextPath%>/sendEmail.pw",
                data:{email:$("#email").val()},
                success:function(code){
                    $("#codeCheck-btn").click(function(){
                        if($("#emailCode").val() == code){
                            $("#send-code").css("display", "none");
                            $("#newPwd-form").css("display", "block");
                        }else{
                            $("#validateMsg").css("visibility", "visible");
                        }
                    })
                }, error:function(){
                    console.log("이메일 인증 통신 실패");
                } 
            })
        }

        function setPwd(){
            if($("#userPwd").val() != $("#pwdCheck").val()){
                alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
                return false;
            }else{
                $.ajax({
                    url:"<%=contextPath%>/setNewPwd.pw",
                    data:{
                        userId:$("#userId").val(),
                        newPwd:$("#userPwd").val()
                    },
                    success:function(result){
                        if(result == 'Y'){
                            $("#newPwd-form").css("display", "none");
                            $("#success").css("display", "block");
                        }else{
                            alert("비밀번호 변경에 실패했습니다.");
                        }
                    
                    }, error:function(){
                        console.log("비밀번호 업데이트 통신 실패");
                    } 
                })

            }
        }
    </script>
</body>
</html>
