<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
    p{font-size:14px; text-align:center;}
    .findId-wrapper{
        margin:auto;
        margin-top:50px;
    }
    #findIdForm{
        width:500px;
        height:500px;
        margin:auto;
        margin-top:50px;
        padding:10px;
        border:0.5px solid lightgray;
        border-radius:7px;
        box-shadow:rgba(0, 0, 0, 0.05) 0px 0px 8px 0px;
    }
    .form-fields{margin:40px;}
    .rq-mark{color:red; margin:7px;}
    .form-fields>input, .form-fields>button{
        width:100%;
        height:48px;
        box-sizing:border-box;
        margin-bottom:20px;
        border-radius:6px;
        border:none;
        font-size:15px;
    }
    .form-fields>button{background:black; color:white; margin-top:20px;}
    ::placeholder{font-size:12px;}
    
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<h2><b>아이디 찾기</b></h2>
        <div class="findId-wrapper">
            <div id="findIdForm">
            <div class="form-fields">
            	<p>가입한 계정의 이름, 아이디, 이메일 정보를 입력해주세요.</p>
                <br>
                <div class="form-group">
                    <label for="userName"><span class="rq-mark">*</span>이름</label> <br>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요." required>
                </div>
                
                <div class="form-group">
                    <label for="userId"><span class="rq-mark">*</span>아이디</label> <br>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="이름을 입력해주세요." required>
                </div>
                
                <div class="form-group">
                    <label for="email"><span class="rq-mark">*</span>이메일</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요." required>
                </div>
                <button type="button" class="btn btn-dark" id="find-btn" disabled onclick="findPwd();">비밀번호 찾기</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        $(function(){
            $("input").change(function(){
                if($("#userName").val() == "" || $("#userId").val() == "" || $("#email").val() == ""){
                    $("#find-btn").attr("disabled", true);
                }else{
                    $("#find-btn").attr("disabled", false);
                }
            })
        })
    </script>
    <script>
        function findPwd(){
            
            $.ajax({
                url:"<%=contextPath%>/findPwd.us",
                data:{
                        userName:$("#userName").val(),
                        userId:$("#userId").val(),
                        email:$("#email").val()
                },
                success:function(user){
                    let value = "";
					 if(user == null){
                        $(".form-fields").css("display", "none");
                        value += "<div align='center' style='margin:auto;'>회원정보가 일치하지 않습니다.<br>다시 시도해주세요.<br><a href='<%=contextPath%>/findPwdForm.us' class='btn btn-dark'>아이디 다시 찾기</a></div>";
                        $("#findIdForm").append(value);

                    }else{
                        $(".form-fields").css("display", "none");
                        alert("인증번호가 전송되었습니다. 이메일을 확인해주세요.");
                        $.ajax({
                            url:"<%=contextPath%>/sendEmail.us",
                            data:{email:$email.val()},
                            success:function(code){
                                $("#codeCheck-btn").click(function(){
                                    if($emailCode.val() == code){
                                        $emailCheckMsg.css("color", "limegreen").html("인증되었습니다.");
                                        $(".emailVerify-area").css("display", "none");
                                        $emailCode.val("");
                                        $emailVerified.val("verified");
                                    }else{
                                        $emailCodeMsg.css("color", "red").html("인증코드가 일치하지 않습니다. 다시 입력해주세요.");
                                    }
                                })
                            }, error:function(){
                                console.log("이메일 인증 실패");
                            } 
                        })
                    }
                }, error:function(){
                    console.log("아이디찾기 실패");
                }
            });
            
        }
    </script>
</body>
</html>