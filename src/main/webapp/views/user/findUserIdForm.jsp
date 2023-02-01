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
        margin:50px
    }
    .findId-wrapper{
        width:500px;
        height:500px;
        margin:auto;
        padding:30px 0px;
    }
    #findIdForm{
        width:500px;
        height:400px;
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
        margin:30px;
    }
    .rq-mark{color:red; margin:7px;}
    ::placeholder{font-size:12px;}
    #findIdForm>input, #find-btn{
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
    #failed, #success{padding:30px; display:none;}
    #failed>p{
        font-size:20px;
        margin-top:100px;
    }
    #failed>a, #success>a{
        width:100%;
        height:48px;
        line-height:35px;
        border-radius:6px;
        border:none;
        font-size:15px;
        background:black;
    }
    #success>p{
        font-size:20px;
        margin-top:80px;
    }
    #success>a{
        margin:5px 0px;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<h2><b>아이디 찾기</b></h2>
        <div class="findId-wrapper">
            
            <div id="findIdForm">
                <div id="find-area">
                    <p>가입한 계정의 이름과 이메일 정보를 입력해주세요.</p>
                    <br>
                    <div class="form-group">
                        <label for="userName"><span class="rq-mark">*</span>이름</label> <br>
                        <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요." required>
                    </div>
                    <div class="form-group">
                        <label for="email"><span class="rq-mark">*</span>이메일</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요." required>
                    </div>
                    <div>
                        <button type="button" class="btn btn-dark" id="find-btn" disabled onclick="findId();">아이디 찾기</button>
                    </div>
                </div>
                    
                <div id="failed" align="center">
                    <p>일치하는 회원정보가 없습니다.<br>다시 시도해주세요.</p>
                    <br>
                    <a href="<%=contextPath%>/findIdForm.us" class="btn btn-dark">아이디 다시 찾기</a>
                </div>
                
                <div id="success" align="center">
                    <br><br><br>
                    <a href="<%=contextPath%>/loginForm.us" class="btn btn-dark">로그인 </a><br>
                    <a href="<%=contextPath%>/findPwdForm.us" class="btn btn-dark">비밀번호 찾기 </a>
                </div>
            </div>

        </div>
    </div>
    
    <script>
        $(function(){
            let e = $("input").keypress();
            function enableBtn(e){
                if($("#userName").val() == "" || $("#email").val() == ""){
                    $("#find-btn").attr("disabled", true);
                }else{
                    $("#find-btn").attr("disabled", false);
                    if(e.keyCode==13){
                        findId();
                    }
                }
            }
            $("input").on({"keyup":enableBtn, "change":enableBtn});
        })

    </script>
    <script>
        function findId(){
            
            $.ajax({
                url:"<%=contextPath%>/findId.us",
                data:{
                        userName:$("#userName").val(),
                        email:$("#email").val()
                },
                success:function(user){
                    $("#find-area").css("display", "none");
					if(user == null){
                        $("#failed").css("display", "block");
                    }else{
                        let value = "<p>회원님의 아이디는 " + "<span style='color:blue'>" + user.userId + "</span> 입니다.</p>"         
                        $("#success").prepend(value);
                        $("#success").css("display", "block");
                    }
                }, error:function(){
                    console.log("아이디찾기 통신 실패");
                }
            });
            
        }
    </script>
</body>
</html>