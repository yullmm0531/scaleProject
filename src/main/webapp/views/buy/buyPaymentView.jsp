<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.product.model.vo.Product, com.scale.bidding.model.vo.Bidding, java.text.DecimalFormat, com.scale.user.model.vo.Address" %>
<%
	Product p = (Product)request.getAttribute("p");
	String size = (String)request.getAttribute("size");
	String bType = (String)request.getAttribute("bType");
	Bidding b = (Bidding)request.getAttribute("b");
	int price = (int)request.getAttribute("price");
	Address ad = (Address)request.getAttribute("ad");
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<style>
        
    .shipping-payment{width: 600px; margin: auto; border: 1px solid gray; background-color: whitesmoke;}
    .product-info{height: 180px; padding-left: 30px; padding-top: 15px;}
    .product-info img{width: 150px;}
    #product-brand{font-weight: bold;}
    #product-eng-name{font-size: 14px;}
    #product-kor-name{
        font-size: 14px;
        color: gray;
    }
    #product-size{font-weight: bold;}
    #title{
        text-align: center;
        font-size: 25px;
        font-weight: bold;
    }
    .line{
        border: 0.5px solid gray;
        width: 500px;
        margin: auto;
    }
    .line2{
        border: 0.5px solid gray;
        width: 90%;
        margin: auto;
    }
    #shipping{
        margin:auto;
    }
    #shipping-title{
        font-size: 20px;
        width: 120px;
        height: 70px;
    }
    #shipping-address-button{
        width: 400px; 
        text-align: right;
    }
    #shipping-msg{
        width: 400px;
    }
    #shipping-msg-user{
        width: 400px;
    }
    #order-title{
        padding-left: 50px;
        font-size: 20px;
        font-weight: bold;
    }
    #price-detail{
        margin: auto;
    }
    .order-info{margin: auto;}
    #price-detail th{width: 120px;}
    #price-detail td{
        width: 400px;
        text-align: right;
    }
    .total-price-tag{
        font-size: 20px;
    }
    
    .buy-terms, .total-price-info{
        padding-left: 50px;
    }
    .terms{width: 450px;}
    .terms-detail{
        width: 450px;
        font-size: 12px;
    }
    .buy-terms th{
        width: 30px;
        text-align: right;
    }
    .buy-terms td{font-size: 15px;}
    #total-price-info td{
        width: 400px;
        text-align: right;
    }
    .modal-content{height: 600px;}
    .address-name{
        font-weight: bold;
    }
    .address{padding: 10px;}
    .address:hover{background-color: rgba(247, 246, 246, 0.479);}
    #add-address-form{
        margin: auto;
        padding: 10px;
    }
    .input_area input{
        border: none;
        border-bottom: 1px solid lightgray;
        width: 300px;
    }
    .add-address-type{
        font-size: 15px;
        font-weight: bold;
    }
    #add-address-form div{
        padding-top: 10px;
    }
    #recipient, #reciPhone, #shippingAddress{
        width: 400px;
        border: none;
        background-color: whitesmoke;
    }
    .totalPrice{
        width: 100px;
        border: none;
        background-color: whitesmoke;
        font-size: 20px;
        color: orange;
        font-style: italic;
    }
    #shippingZipCode{
        border: none;
        background-color: whitesmoke;
        width: 75px;
    }
    #shippingAddress{
        border: none;
        background-color: whitesmoke;
    }
    #add-address-form{
        margin:auto;
        padding:10px;
    }
    #zipCode{
        width:350px; display:inline-block;
    }
    ::placeholder{font-size:12px;}
    .check-input{
        color:red;
        font-size:11px;
        padding:3px 10px;
    }
    #btn-area{
        text-align:center;
        padding : 30px;
    }
    .form-fields button{
        font-size:14px;
        width:90px;
    }
    .rq-mark{color:red; margin:7px;}
    #address-add .modal-content{
        height: 750px;
    }
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <br><br>
    <div class="shipping-payment">
    
        <form action="<%= contextPath %>/buybidding.bi" id="buyBiddingForm">
        	<input type="hidden" name="bType" value="<%= bType %>">
            <br>
            <div id="shipping-payment">
	                <div id="title">배송/결제</div>
	                <div class="product-info row">
	                    <div class="product-img col-sm-4">
	                        <img src="<%= contextPath %>/<%= p.getProductImgM() %>" alt="">
	                    </div>
	                    <div class="product-name col-sm-8">
	                        <br>
	                        <span id="product-brand"><%= p.getBrandName() %></span><br>
	                        <span id="product-eng-name"><%= p.getProductNameEng() %></span><br>
	                        <span id="product-kor-name"><%= p.getProductNameKo() %></span> <br>
	                        <span id="product-size" name="size"><%= size %></span>
	                    </div>
	                </div>
                <div class="line"></div>
                <br>
                <div class="shipping-address">
                    <table id="shipping">
                        <tr>
                            <th id="shipping-title">배송주소</th>
                            <td id="shipping-address-button">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#address-add">배송지 추가</button>
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#address-list">배송지 목록</button>
                            </td>
                        </tr>
                        <% if(ad != null) { %>
                            <tr>
                                <th>받는분</th>
                                <td><input type="text" id="recipient" name="recipient" value="<%= ad.getRecipient() %>" readonly></td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td><input type="text" id="reciPhone" name="reciPhone" value="<%= ad.getPhone() %>" readonly></td>
                            </tr>
                            <tr>
                                <th>배송주소</th>
                                <td><input type="text" id="shippingZipCode" name="shippingZipCode" value="(<%= ad.getZipCode() %>)" readonly> <input type="text" id="shippingAddress" name="shippingAddress" value="<%= ad.getAddress1() %> <%= ad.getAddress2() %>" readonly></td>
                            </tr>
                        <% } else { %>
                            <tr>
                                <th>받는분</th>
                                <td><input type="text" id="recipient" name="recipient" value="등록된 정보가 없습니다." readonly></td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td><input type="text" id="reciPhone" name="reciPhone" value="등록된 정보가 없습니다." readonly></td>
                            </tr>
                            <tr>
                                <th>배송주소</th>
                                <td><input type="text" id="shippingAddress" name="shippingAddress" value="등록된 정보가 없습니다." readonly></td>
                            </tr>
                        <% } %>
                        <tr>
                            <th>배송 요청사항</th>
                            <td>
                                <select id="shipping-msg" name="shipping-msg">
                                    <option value="0">요청사항 없음</option>
                                    <option value="1">문 앞에 놓아주세요</option>
                                    <option value="2">경비실에 맡겨주세요</option>
                                    <option value="3">직접입력</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <!--상단의 select box에서 '직접입력'을 선택하면 나타날 인풋박스-->
                                <input type="text" id="shipping-msg-user" name="shipping-msg-user">
                            </td>
                        </tr>
                    </table>

                    <script>
                        $(function(){
                            $("#shipping-msg-user").hide();
                            $("#shipping-msg").change(function() {
                                if($("#shipping-msg").val() == "3") {
                                    $("#shipping-msg-user").show();
                                }  else {
                                    $("#shipping-msg-user").hide();
                                }
                            }) 
                        });
                    </script>
                    
                </div>

                <!-- 배송지목록 모달 -->
                <div class="modal" id="address-list">
                    <div class="modal-dialog">

                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h5 class="modal-title">배송지 목록</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div id="addresses">
                                    
                                    <div class="address">
                                        <div class="address-check">
                                            <!--기본배송지인경우-->
                                            <span class="badge badge-pill badge-secondary">기본배송지</span>
                                            <!--선택한 배송지-->
                                            <span>✓</span>
                                        </div>
                                        <div class="address-name">
                                            정유림
                                        </div>
                                        <div class="address-phone">
                                            010-****-****
                                        </div>
                                        <div class="address-detail">
                                            (*****)서울시 강서구 공항대로161-17 108동 303호
                                        </div>
                                    </div>
                                    <br>
                                    <div class="line2"></div>
                                    <br>
                                    <div class="address">
                                        <div class="address-name">
                                            정유림
                                        </div>
                                        <div class="address-phone">
                                            010-****-****
                                        </div>
                                        <div class="address-detail">
                                            (*****)서울시 강서구 공항대로161-17 108동 303호
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 배송지 추가 모달 -->
                <div class="modal" id="address-add">
                    <div class="modal-dialog">

                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h5 class="modal-title">배송지 추가</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div id="add-address-form">
                                    <div class="form-group">
                                        <label for="userName"><span class="rq-mark">*</span>이름</label>
                                        <input type="text" class="form-control" name="userName" id="userName" placeholder="이름을 입력해주세요.">
                                        <div class="check-input" id="check-input-name"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="phone"><span class="rq-mark">*</span>휴대폰번호</label>
                                        <input type="text" class="form-control" name="phone" id="phone" placeholder="휴대폰번호 숫자만 입력해주세요." onKeyup="addHypen(this);">
                                        <div class="check-input" id="check-input-phone"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="zipCode"><span class="rq-mark">*</span>주소</label> <br>
                                        <input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="주소를 검색해주세요." readonly>
                                        <button type="button" class="btn btn-dark" onclick="sample6_execDaumPostcode();">주소 검색</button>
                                    </div>
                    
                                    <div class="form-group" id="addrGroup">
                                        <input type="text" class="form-control" id="address" name="address"><br>
                                        <label for="detailAddress">상세주소</label> <br>
                                        <input type="text" class="form-control" id="detailAddress" name="detailAddress">
                                    </div>
                                    <div>
                                        <input type="checkbox" name="defaultAD" value="Y" id="defaultAD">
                                        <label for="defaultAD">기본배송지 설정</label>
                                    </div>
                                    <br><br>
                                    <div align="center">
                                        <button type="button" class="btn btn-outline-secondary class" data-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-secondary" disabled>확인</button>
                                    </div>
                                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    $(function(){
                        const $userName = $("#userName");
                        const $checkInputName = $("#check-input-name");
                        const $phone = $("#phone");
                        const $checkInputPhone = $("#check-input-phone");

                        // 이름 유효성 체크
                        $userName.focusout(function(){
                            if($userName.val() == ""){
                                $checkInputName.html("이름을 입력해주세요.");
                            }else{
                                $checkInputName.html("");
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

                    })
                </script>


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

                <br><br>
                <div class="order-info">
                    <div id="order-title">최종 주문 정보</div>
                    <br>
                    <table id="price-detail">
                        <tr>
                            <th class="total-price-tag" id="total-price">총 결제 금액</th>
                            <% if(bType.equals("buyI")){ %>
                            	<td class="total-price"><input type="text" class="totalPrice" name="totalPrice" value="<%= formatter.format(b.getbPrice() + b.getDeliveryFee()) %>원" readonly></td>
                            <% } else{ %>
                            	<td class="total-price"><input type="text" class="totalPrice" name="totalPrice" value="<%= formatter.format(price + 3000) %>원" rea></td>
                            <% } %>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="line"></div>
                            </td>
                        </tr>
                        <% if(bType.equals("buyI") && b != null){ %>
	                        <tr>
	                            <th>즉시 구매가</th>
	                            <td><%= formatter.format(b.getbPrice()) %>원</td>
	                        </tr>
	                        <tr>
	                            <th>검수비</th>
	                            <td>무료</td>
	                        </tr>
	                        <tr>
	                            <th>수수료</th>
	                            <td>무료</td>
	                        </tr>
	                        <tr>
	                            <th>배송비</th>
	                            <td><%= formatter.format(b.getDeliveryFee()) %>원</td>
	                        </tr>
                        <% } else{ %>
	                        <tr>
	                            <th>구매 입찰가</th>
	                            <td><%= formatter.format(price) %>원</td>
	                        </tr>
	                        <tr>
	                            <th>검수비</th>
	                            <td>무료</td>
	                        </tr>
	                        <tr>
	                            <th>수수료</th>
	                            <td>무료</td>
	                        </tr>
	                        <tr>
	                            <th>배송비</th>
	                            <td><%= formatter.format(3000) %>원</td>
	                        </tr>
                        <% } %>
                    </table>
                    <br>
                    <div class="line"></div>
                </div>
                <br><br>
                
                <div class="buy-terms">
                    <table id="buy-terms">
                        <tr>
                            <td>
                                <div class="terms">
                                    판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우, 거래가 취소될 수 있습니다.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term1"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">앱 알림 해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는 거래 진행 상태 알림을 받을 수 없습니다.</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="line"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms">
                                    바로 결제하기 를 선택하시면 즉시 결제가 진행되며, 단순 변심이나 실수에 의한 취소가 불가능합니다.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term2"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">본 거래는 개인간 거래로 전자상거래법(제17조)에 따른 청약철회(환불, 교환) 규정이 적용되지 않습니다.</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="line"></div>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;">
                                <div class="terms">
                                    구매 조건을 모두 확인하였으며, 거래를 진행에 동의합니다.
                                </div>
                            </td>
                            <th><input type="checkbox" id="term3"></th>
                        </tr>
                    </table>
                </div>
                <br><br>

                <div class="total-price-info">
                    <table id="total-price-info">
                        <tr>
                            <th class="total-price-tag" name="total-price">총 결제 금액</th>
                             <% if(bType.equals("buyI")){ %>
                             	<input type="hidden" name="bNo" value="<%= b.getbNo() %>">
                            	<td class="totalPrice"><%= formatter.format(b.getbPrice() + b.getDeliveryFee()) %>원</td>
                            <% } else{ %>
                                <input type="hidden" name="pCo" value="<%= p.getProductCode() %>">
                                <input type="hidden" name="size" value="<%= size %>">
                                <input type="hidden" name="price" value="<%= price %>">
                            	<td class="totalPrice"><%= formatter.format(price + 3000) %>원</td>
                            <% } %>
                            
                        </tr>
                    </table>
                </div>
                <br><br>
                <input type="hidden" id="paymentNumber" name="paymentNumber" value="">
                <input type="hidden" id="paymentMethod" name="paymentMethod" value="">
                <div align="center">
                    <button type="button" class="btn btn-outline-secondary">취소</button>
                    <input id="requestPay" type="button" class="btn btn-outline-warning" value="다음단계">
                </div>
                <br><br>
            </div>
            
        </form>
        <script>
            /*
            function submitCheck(){
                var checkboxes = $("input[type='checkbox']");
                
                checkboxes.click(function(){
                    if($("#term1").is(":checked") && $("#term2").is(":checked") && $("#term3").is(":checked")){
                        $('input[type="submit"]').prop('disabled', false);
                    } else{
                        $('input[type="submit"]').prop('disabled', true);
                    }
                })
            }
            */
            $(function(){

            	$("#submit").prop("disabled", true);
                
                var checkboxes = $("input[type='checkbox']");
                
                checkboxes.click(function(){
                    if($("#term1").is(":checked") && $("#term2").is(":checked") && $("#term3").is(":checked")){
                        $('input[type="submit"]').prop('disabled', false);
                    } else{
                        $('input[type="submit"]').prop('disabled', true);
                    }
                })
                
                const zipCode = $("#shippingZipCode").val().replace("(", "").replace(")", "");

                $("#requestPay").click(function () {
                    var IMP = window.IMP; // 생략가능
                    IMP.init('imp22538717');
                    // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
                    // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
                    IMP.request_pay({
                        pg: 'html5_inicis', // version 1.1.0부터 지원.
                        /*
                        'kakao':카카오페이,
                        html5_inicis':이니시스(웹표준결제)
                        'nice':나이스페이
                        'jtnet':제이티넷
                        'uplus':LG유플러스
                        'danal':다날
                        'payco':페이코
                        'syrup':시럽페이
                        'paypal':페이팔
                        */
                        pay_method: 'card',
                        /*
                        'samsung':삼성페이,
                        'card':신용카드,
                        'trans':실시간계좌이체,
                        'vbank':가상계좌,
                        'phone':휴대폰소액결제
                        */
                        merchant_uid: 'merchant_' + new Date().getTime(),
                        /*
                        merchant_uid에 경우
                        https://docs.iamport.kr/implementation/payment
                        위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
                        참고하세요.
                        나중에 포스팅 해볼게요.
                        */
                        name: "<%= p.getProductNameKo() %>",
                        //결제창에서 보여질 이름
                        amount: 1000,
                        //가격
                        buyer_email: '<%= loginUser.getEmail() %>',
                        buyer_name: $("#recipient").val(),
                        buyer_tel: $("#reciPhone").val(),
                        buyer_addr: $("#shippingAddress").val(),
                        buyer_postcode: zipCode,
                        
                        /*
                        모바일 결제시,
                        결제가 끝나고 랜딩되는 URL을 지정
                        (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
                        */
                    }, function (rsp) {
                        if (rsp.success) {
                        	console.log(rsp.merchant_uid);
                        	// 결제 번호
                            $("#paymentNumber").val(rsp.merchant_uid);
                            // 결제 방법
                        	$("#paymentMethod").val(rsp.card_name + " " + rsp.card_number);
                            $("#buyBiddingForm").submit();
                        } else {
                            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
                        }
                        
                    });
                });

                
                
            })
      

            

        </script>
        <br><br>
    </div>
    
</body>
</html>