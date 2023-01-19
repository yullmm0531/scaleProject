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
            min-width : 650px;
            margin:auto;
            margin-top : 100px;
            margin-bottom : 70px;
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

        #userId, #postCode{width:300px;}

        #joinForm input[type=checkbox]{margin-left: 20px;}

        .rq-mark{color:red; margin:7px;}
        
        #userId, #postCode{display:inline-block;}
       
        ::placeholder{font-size:12px;}

        .policy-agree div{display:inline-block;}

        .policy{width:85%;}

        .policy a{
            color:gray;
            padding-left:10px;
            text-decoration:underline;
            font-size:12px;
        }
        .policy-agree ul{
            list-style:none;
            padding-left:0px;
            line-height:35px;
        }
        #btn-area{
            text-align:center;
            padding : 30px;
        }
        .form-fields button{
            font-size: 14px;
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
        <form id="joinForm" action="<%=contextPath%>/" method="post">
            <div class="form-fields">
                <div class="form-group">
                    <label for="userId"><span class="rq-mark">*</span>아이디</label> <br>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="6자 이상의 영문 혹은 영문+숫자로 입력해주세요." required>
                    <button type="button" id="idCheck" class="btn btn-dark">중복 확인</button>
                    <div class="check-input" id="check-input-id"></div>
                </div>
                
                <div class="form-group">
                    <label for="pwd"><span class="rq-mark">*</span>비밀번호</label>
                    <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="영문+숫자를 조합하여 8자 이상으로 입력해주세요." required>
                    <div class="check-input" id="check-input-userPwd"></div>
                </div>
                
                <div class="form-group">
                    <label for="pwdCheck"><span class="rq-mark">*</span>비밀번호 확인</label>
                    <input type="password" class="form-control" id="pwdCheck" placeholder="입력한 비밀번호를 확인해주세요." required>
                </div>

                <div class="form-group">
                    <label for="userName"><span class="rq-mark">*</span>이름</label>
                    <input type="text" class="form-control" id="userName" placeholder="이름을 입력해주세요." required>
                </div>

                <div class="form-group">
                    <label for="userNickName"><span class="rq-mark">*</span>닉네임</label>
                    <input type="text" class="form-control" id="userNickName" placeholder="닉네임을 입력해주세요." required>
                </div>
                
                <div class="form-group">
                    <label for="phone"><span class="rq-mark">*</span>휴대폰번호</label>
                    <input type="text" class="form-control" id="phone" placeholder="휴대폰번호 숫자만 입력해주세요." onKeyup="addHypen(this);" required>
                </div>

                <div class="form-group">
                    <label for="email"><span class="rq-mark">*</span>이메일</label>
                    <input type="email" class="form-control" id="email" placeholder="예) example@scale.com" required>
                </div>
                
                <div class="form-group">
                    <label for="postCode"><span class="rq-mark">*</span>주소</label> <br>
                    <input type="text" class="form-control" id="postCode" name="postCode" placeholder="주소를 검색해주세요." required>
                    <button type="button" class="btn btn-dark" onclick="sample6_execDaumPostcode();">주소 검색</button>
                </div>

                <div class="form-group" id="addrGroup" style="display:none">
                    <input type="text" class="form-control" id="address" name="address" required><br>
                    <label for="detailAddress">상세주소</label> <br>
                    <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="">
                </div>
                <br>
                <hr>

                <div class="policy-agree">
                    <div class="policy">
                        <ul>
                            <li>SCALE 서비스 이용약관 동의 <a href="">내용보기</a></li>
                            <li>개인정보 수집 및 이용 동의 <a href="">내용보기</a></li>
                            <li>[선택] 광고성 정보 수신동의 <a href="">내용보기</a></li>
                        </ul>
                    </div>
                    <div class="agree">
                        <ul>
                            <li><input type="checkbox"></li>
                            <li><input type="checkbox"></li>
                            <li><input type="checkbox"></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="btn-area">
                <button type="submit" class="btn btn-primary" onclick="return validate();">회원가입</button>
            </div>

        </form>
</div>


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
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById('address').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addrGroup').style.display = 'block';
                document.getElementById('detailAddress').focus();
            }
        }).open();
    }

</script>

<script>

    function validate(){
        const userId = $("#userId").val();
        const userPwd = $("#userPwd").val();
        const pwdCheck = $("#pwdCheck").val();
        const userName = $("#userName").val();
        const userNickName = $("#userNickName").val();
        const phone = $("#phone").val();
        const email = $("#email").val();

       
        if(userId == ""){
            $("#check-input-id").html("아이디를 입력해주세요.");
            $("#userId").focus();
            return false
        }

        let regExp = /^[a-z][a-z\d]{4,14}$/;
        if(!regExp.test(userId)){
            $("#check-input-id").html("아이디 형식을 확인해주세요.");
            $("#userId").focus();
            return false
        }else{
            $("#check-input-id").html("");
        }

        if(pwdInput1.val() == ""){
            $("#check-input-userPwd").html("비밀번호를 입력해주세요.");
            pwdInput1.focus();
            return false
        }



        // 1) 아이디검사
        // let regExp = /^[a-z][a-z\d]{4,14}$/;
        // if(!regExp.test(idInput.value)){
        //     alert("영문으로 시작하는 5~15자의 유효한 아이디를 입력해주세요.");
        //     idInput.selet();
        //     return false;
        // }
    }
</script>

</body>
</html>