<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
        #joinForm{
            width:500px;
            margin:auto;
            margin-top:50px;
            padding:10px;
            border:0.5px solid lightgray;
            border-radius:7px;
            box-shadow:rgba(0, 0, 0, 0.05) 0px 0px 8px 0px;
        }
        .form-fields{margin:40px;}

        #userId, #zipCode, #email, #emailCode-input{width:300px; display:inline-block;}

        .rq-mark{color:red; margin:7px;}
        
        ::placeholder{font-size:12px;}

        .emailVerify-area{display:none;}

        .policy-agree{border:1px solid lightgray; margin-top:10px;}
        .policy-agree div{display:inline-block; margin-top:10px;}

        .policy{width:85%;}

        .policy a{
            color:gray;
            padding-left:10px;
            text-decoration:underline;
            font-size:12px;
        }
        .policy-agree ul{
            padding-left:20px;
            list-style:none;
            line-height:35px;
            font-size:14px;
        }
        .policy-agree input[type=checkbox]{margin-left:0px; width:16px; height:16px;}
        
        #btn-area{
            text-align:center;
            padding : 30px;
        }
        .form-fields button{
            font-size:14px;
            width:90px;
        }
        .detail-addr-form{
            display:none;
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
    <h2><b>회원가입</b></h2>
        <form id="joinForm" action="<%=contextPath%>/insert.us" method="post">
            <div class="form-fields">
                <div class="form-group">
                    <label for="userId"><span class="rq-mark">*</span>아이디</label> <br>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="5자 이상의 영문 혹은 영문+숫자로 입력해주세요." required>
                    <button type="button" id="idCheck" class="btn btn-dark" onclick="checkId();">중복 확인</button>
                    <div class="check-input" id="check-input-id"></div>
                    <input type="hidden" id="idChecked" value="UnChecked">
                </div>
                
                <div class="form-group">
                    <label for="pwd"><span class="rq-mark">*</span>비밀번호</label>
                    <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="8자 이상의 영문+숫자+특수문자로 조합해주세요." required>
                    <div class="check-input" id="check-input-pwd"></div>
                </div>
                
                <div class="form-group">
                    <label for="pwdCheck"><span class="rq-mark">*</span>비밀번호 확인</label>
                    <input type="password" class="form-control" id="pwdCheck" placeholder="입력한 비밀번호를 확인해주세요." required>
                    <div class="check-input" id="check-input-pwd2"></div>
                </div>

                <div class="form-group">
                    <label for="userName"><span class="rq-mark">*</span>이름</label>
                    <input type="text" class="form-control" name="userName" id="userName" placeholder="이름을 입력해주세요." required>
                    <div class="check-input" id="check-input-name"></div>
                </div>

                <div class="form-group">
                    <label for="userNickName"><span class="rq-mark">*</span>닉네임</label>
                    <input type="text" class="form-control" name="userNickName" id="userNickName" placeholder="닉네임을 입력해주세요." required>
                    <div class="check-input" id="check-input-nickName"></div>
                </div>
                
                <div class="form-group">
                    <label for="phone"><span class="rq-mark">*</span>휴대폰번호</label>
                    <input type="text" class="form-control" name="phone" id="phone" placeholder="휴대폰번호 숫자만 입력해주세요." onKeyup="addHypen(this);" required>
                    <div class="check-input" id="check-input-phone"></div>
                </div>

                <div class="form-group">
                    <label for="email"><span class="rq-mark">*</span>이메일</label><br>
                    <input type="email" class="form-control" name="email" id="email" placeholder="예) example@scale.com" required>
                    <button type="button" id="sendEmail-btn" class="btn btn-dark" onclick="sendEmail();">메일 인증</button>
                    <div class="check-input" id="check-input-email"></div>
                </div>
                <div class="form-group emailVerify-area">
                    <input type="text" class="form-control" id="emailCode-input" placeholder="인증코드 5자리 입력">
                    <button type="button" id="codeCheck-btn" class="btn btn-dark">인증 완료</button>
                    <div class="check-input" id="check-input-emailCode"></div>
                    <input type="hidden" id="emailVerified" value="unverified">
                </div>
                
                <div class="form-group">
                    <label for="zipCode"><span class="rq-mark">*</span>주소</label> <br>
                    <input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="주소를 검색해주세요." required readonly>
                    <button type="button" class="btn btn-dark" onclick="sample6_execDaumPostcode();">주소 검색</button>
                </div>

                <div class="form-group" id="addrGroup" style="display:none">
                    <input type="text" class="form-control" id="address" name="address" required><br>
                    <label for="detailAddress">상세주소</label> <br>
                    <input type="text" class="form-control" id="detailAddress" name="detailAddress">
                </div>
                <br>
                <hr>
                    <fieldset class="policy-agree">
                        <div class="policy">
                            <ul>
                                <li style="font-size:15px"><b>전체 동의</b></li>
                                <li>SCALE 서비스 이용약관 동의 <a type="button" class="btn" data-toggle="modal" data-target="#modal-t">내용보기</a></li>
                                <li>개인정보 수집 및 이용 동의 <a type="button" class="btn" data-toggle="modal" data-target="#modal-p">내용보기</a></li>
                                <li>[선택] 광고성 정보 수신동의 <a type="button" class="btn" data-toggle="modal" data-target="#modal-a">내용보기</a></li>
                            </ul>
                        </div>
                        <div class="agree">
                            <ul>
                                <li><input type="checkbox" id="checkAll"></li>
                                <li><input type="checkbox" id="terms" class="checkPo"></li>
                                <li><input type="checkbox" id="privacy" class="checkPo"></li>
                                <li><input type="checkbox" id="ad" class="checkPo"></li>
                            </ul>
                        </div>
                    </fieldset>
                    
                    <!-- SCALE 서비스 이용약관 -->
					<div class="modal" id="modal-t">
					  <div class="modal-dialog modal-dialog-scrollable">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">SCALE 서비스 이용약관</h4>
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
					        Modal body..
					      </div>
					    </div>
					  </div>
					</div>
					
					<!-- 개인정보처리방침 -->
					<div class="modal" id="modal-p">
					  <div class="modal-dialog modal-dialog-scrollable">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">개인정보처리방침</h4>
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
					        Modal body..
					      </div>
					    </div>
					  </div>
					</div>
					
					<!-- 광고성정보수신 -->
					<div class="modal" id="modal-a">
					  <div class="modal-dialog modal-dialog-scrollable">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">광고성 정보 수신 동의</h4>
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
					        Modal body..
					      </div>
					    </div>
					  </div>
					</div>
					
					
            </div>
            <div id="btn-area">
                <button type="submit" class="btn btn-primary" id="joinBtn" onclick="return validate();">회원가입</button>
            </div>

        </form>
</div>

<script>
    const $userId = $("#userId");
    const $checkInputId = $("#check-input-id");
    const $userPwd = $("#userPwd");
    const $checkInputPwd = $("#check-input-pwd");
    const $idChecked = $("#idChecked");
    const $pwdCheck = $("#pwdCheck");
    const $checkInputPwd2 = $("#check-input-pwd2");
    const $userName = $("#userName");
    const $checkInputName = $("#check-input-name");
    const $userNickName = $("#userNickName");
    const $checkInputNickName = $("#check-input-nickName");
    const $phone = $("#phone");
    const $checkInputPhone = $("#check-input-phone");
    const $email = $("#email");
    const $emailCheckMsg = $("#check-input-email");
    const $sendEmailBtn = $("#sendEmail-btn"); // 메일 인증 버튼
    const $emailCode = $("#emailCode-input"); // 인증코드 인풋
    const $codeCheckBtn = $("#codeCheck-btn"); // 인증완료 버튼
    const $emailCodeMsg = $("#check-input-emailCode"); // 인증번호 유효성검사메세지
    const $emailVerified = $("#emailVerified"); // 이메일 인증 여부
    
    $(function(){
        
        // 아이디 유효성 체크
        $userId.focusout(function(){
            if($userId.val() == ""){
                $checkInputId.html("아이디를 입력해주세요.");
            }
        })

        $userId.keyup(function(){
            let regExp = /^[a-z][a-z\d]{4,14}$/;
            if(!regExp.test($userId.val())){
                $checkInputId.css("color", "red").html("아이디는 5자 이상의 영문, 영문+숫자 조합으로 입력해주세요.");
            }else{
                $checkInputId.html("");
            }
            $idChecked.val("UnChecked");
        })

        // 비밀번호 유효성 체크
        $userPwd.focusout(function(){
            if($userPwd.val() == ""){
                $checkInputPwd.html("비밀번호를 입력해주세요.");
            }
        })

        $userPwd.keyup(function(){
            let regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
            if(!regExp.test($userPwd.val())){
                $checkInputPwd.css("color", "red").html("영문+숫자+특수문자(!@#$%^&*) 조합으로 8자 이상 입력해주세요.");
            }else{
                $checkInputPwd.html("");
            }
        })

        $pwdCheck.focusout(function(){
            if($pwdCheck.val() == ""){
                $checkInputPwd2.html("비밀번호를 다시 입력해주세요.");
            }else if($userPwd.val() != $pwdCheck.val()){
                $checkInputPwd2.html("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
            }else{
                $checkInputPwd2.html("");
            }
        })

        // 이름 유효성 체크
        $userName.focusout(function(){
            if($userName.val() == ""){
                $checkInputName.html("이름을 입력해주세요.");
            }else{
                $checkInputName.html("");
            }
        })

        // 닉네임 유효성 체크
        $userNickName.focusout(function(){
            if($userNickName.val() == ""){
                $checkInputNickName.html("닉네임을 입력해주세요.");
            }else{
                $checkInputNickName.html("");
            }
        })

        // 휴대폰번호 유효성 체크
        $phone.focusout(function(){
            if($phone.val() == ""){
                $checkInputPhone.html("휴대폰번호를 입력해주세요.");
            }else{
                $checkInputPhone.html("");
            }
        })

        // 이메일 유효성 체크
        $email.focusout(function(){
            let regExp = /@/g;
            if($email.val() == ""){
                $emailCheckMsg.html("이메일 주소를 입력해주세요.");
            }else if(!regExp.test($email.val())){
                $emailCheckMsg.html("올바른 이메일 주소를 입력해주세요.");
            }else{
                $emailCheckMsg.html("");
            }
        })

        // 약관 전체동의
        $("#checkAll").click(function(){
            if($(this).is(":checked")){
                $(".agree input").prop("checked", true)
            }else {
                $(".agree input").prop("checked", false);
            }
        });

        // 약관 개별 체크에 따른 전체동의 체크여부
        $(function(){
            $(".checkPo").click(function(){
                if($(".checkPo:checked").length == 3){
                    $("#checkAll").prop("checked", true);
                }else{
                    $("#checkAll").prop("checked", false);
                }
            })
        })

    })

</script>

<script>
	function checkId(){
        let regExp = /^[a-z][a-z\d]{4,14}$/;
		if($userId.val() == "" || !regExp.test($userId.val())){
			$checkInputId.html("아이디는 5자 이상의 영문, 영문+숫자 조합으로 입력해주세요.");
            $userId.focus();
		}else{
			$.ajax({
		        url:"<%=contextPath%>/check.id",
		        data:{checkId:$userId.val()},
		        success:function(result){
		            if(result == "Y"){
		            	$checkInputId.css("color", "red").html("이미 사용중인 아이디입니다.");
		            	$userId.select();
		            }else if(result == "N"){
		            	$checkInputId.css("color", "limegreen").html("사용 가능한 아이디입니다.");
                        $idChecked.val("Checked");
		            }
		        }, error:function(){
					console.log("아이디 중복확인 실패");
		        }
		    });
		}
	}
</script>

<script>
	function sendEmail(){
        let regExp = /@/g;
		if($email.val() == ""){
            $emailCheckMsg.html("이메일 주소를 입력해주세요.");
            $email.focus();
            $emailVerified.val("unverified");
        }else if(!regExp.test($email.val())){
            $emailCheckMsg.html("올바른 이메일 주소를 입력해주세요.");
            $email.focus();
            $emailVerified.val("unverified");
        }else {
            $sendEmailBtn.html("재인증");
            $(".emailVerify-area").css("display", "block");
            $emailCode.focus();
            $emailCheckMsg.html("");
            $emailCodeMsg.html("");
            $emailVerified.val("unverified");
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
	}
</script>

<script>
    function validate(){
        
        // 아이디 중복체크 여부
        if($idChecked.val() == "UnChecked"){
            alert("아이디 중복 확인을 해주세요.");
            $userId.focus();
            return false;
        }

        // 비밀번호 일치여부
        if($userPwd.val() != $pwdCheck.val()){
            alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
            return false;
        }

        // 이메일 인증여부
        if($("#emailVerified").val() == "unverified"){
            alert("이메일 인증을 진행해주세요.");
            $email.focus();
            return false;
        }

        // 약관 동의여부
        if(!($("#terms").is(":checked") && $("#privacy").is(":checked"))){
            alert("약관에 동의해주세요.");
            return false;
        }
        

    }
</script>
<!-- 휴대폰번호 하이픈 자동 추가 -->
<script>
    function addHypen(obj) {
        var number = obj.value.replace(/[^0-9]/g, "");
        var phone = "";

        if(number.length < 4) {
            return number;
        } else if(number.length < 7) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3);
        } else if(number.length < 11) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(6);
        } else {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 4);
            phone += "-";
            phone += number.substr(7);
        }
        obj.value = phone;
}
</script>

<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById('address').value = extraAddr;
                
                } else {
                    document.getElementById('detailAddress').value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCode').value = data.zonecode;
                document.getElementById('address').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addrGroup').style.display = 'block';
                document.getElementById('detailAddress').focus();
            }
        }).open();
    }
</script>

</body>
</html>