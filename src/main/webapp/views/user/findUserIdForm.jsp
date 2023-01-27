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
        height:400px;
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
                <button type="button" class="btn btn-dark" id="find-btn" disabled onclick="findId();">아이디 찾기</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        $(function(){
            $("input").change(function(){
                if($("#userName").val() == "" || $("#email").val() == ""){
                    $("#find-btn").attr("disabled", true);
                }else{
                    $("#find-btn").attr("disabled", false);
                }
            })
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
                    let value = "";
					 if(user == null){
                        $(".form-fields").css("display", "none");
                        value += "<div align='center' style='margin:auto;'>존재하지 않는 아이디입니다.<br>다시 시도해주세요.<br><a href='<%=contextPath%>/findIdForm.us' class='btn btn-dark'>아이디 다시 찾기</a></div>";
                        $("#findIdForm").append(value);

                    }else{
                        $(".form-fields").css("display", "none");
                        value += "<div align='center' style='margin:auto;'>회원님의 아이디는 <br><span style='color:blue;'>"
                                 + user.userId
                                 + "</span> 입니다.<br>"
                                 +"<a href='<%=contextPath%>/loginForm.us'class='btn btn-dark'>로그인 </a></div>"
                                 +"<a href='<%=contextPath%>/findPwdForm.us'class='btn btn-dark'>비밀번호 찾기 </a></div>";
                        $("#findIdForm").append(value);
                    }
                }, error:function(){
                    console.log("아이디찾기 실패");
                }
            });
            
        }
    </script>
</body>
</html>