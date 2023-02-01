<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.product.model.vo.Product, com.scale.bidding.model.vo.Bidding, java.text.DecimalFormat, com.scale.user.model.vo.*" %>
<%
	Product p = (Product)request.getAttribute("p");
	String size = (String)request.getAttribute("size");
	String bType = (String)request.getAttribute("bType");
	Bidding b = (Bidding)request.getAttribute("b");
	int price = (int)request.getAttribute("price");
	Address ad = (Address)request.getAttribute("ad");
	User u = (User)request.getAttribute("u");
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        
        .order-adjustment{width: 600px; margin: auto; border: 1px solid gray; background-color: whitesmoke;}
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
            border: 0.5px solid lightgray;
            width: 500px;
            margin: auto;
        }
        .line2{
            border: 0.5px solid lightgray;
            width: 90%;
            margin: auto;
        }
        #account{
            margin: auto;
        }
        #account-title{
            font-size: 20px; 
            width: 130px; 
            height: 70px;
        }
        #bank-account{
            width: 290px;
        }
        #account-button{
            width: 100px;
            text-align: right;
        }
        .account-info{
            border: 0.5px solid black;
            border-radius: 10px;
            padding: 15px;
        }
        #change-account-form{
            padding: 20px;
        }
        .add-account-type{
            font-size: 15px;
            font-weight: bold;
            width: 400px;
        }
        .account_input_area input{
            border: none;
            border-bottom: 1px solid gray;
            width: 400px;
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
        #change-account .modal-content{
            height: 530px;
        }
        .totalPrice{
	        width: 100px;
	        border: none;
	        background-color: whitesmoke;
	        font-size: 20px;
	        color: green;
	        font-style: italic;
	    }
	    #userAccBank{
	    	border: none;
	        background-color: whitesmoke;
            width: 75px;
	    }
	    #userAccNum{
	    	border: none;
	        background-color: whitesmoke;
	    }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <br><br>
    <div class="order-adjustment">
        <form action="">
        	<input type="hidden" name="biddingInfo" value="<%= bType %>">
            <br>
            <div id="order-adjustment">
                <div id="title">주문/정산</div>
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
                <div class="account">
                    <table id="account">
                        <tr>
                            <th id="account-title">판매정산계좌</th>
                        </tr>
                        <% if(u != null) { %>
                        	<% if(u.getUserAccBank() == "없음") { %>
                        		<tr>
		                            <th>계좌</th>
		                            <td id="bank-account">등록된 정보가 없습니다.</td>
		                            <td rowspan="2" id="account-button">
		                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#change-account">변경</button>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>예금주</th>
		                            <td>등록된 정보가 없습니다.</td>
		                        </tr>
                        	<% } else{  %>
		                        <tr>
		                            <th>계좌</th>
		                            <td id="bank-account">
		                            	<input type="text" id="userAccBank" name="userAccBank" value="<%= u.getUserAccBank() %>" readonly>
                                        <input type="text" id="userAccNum" name="userAccNum" value="<%= u.getUserAccNum() %>" readonly>
                                    </td>
		                            <td rowspan="2" id="account-button">
		                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#change-account">변경</button>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>예금주</th>
		                            <td><%= u.getUserName() %></td>
		                        </tr>
	                        <% } %>
                        <% } else { %>
                        	<tr>
	                            <th>계좌</th>
	                            <td id="bank-account">등록된 정보가 없습니다.</td>
	                            <td rowspan="2" id="account-button">
	                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#change-account">변경</button>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>예금주</th>
	                            <td>등록된 정보가 없습니다.</td>
	                        </tr>
                        <% } %>
                    </table>
                </div>
                <br>

                <!-- 정산 계좌 변경 모달 -->
                <div class="modal" id="change-account">
                    <div class="modal-dialog">

                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h5 class="modal-title">판매 정산 계좌</h5>  
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div id="change-account-form">
                                    <div class="account-info">
                                        <span id="account-info">등록된 계좌 정보</span> 
                                        <br>
                                        <% if(u != null) { %>
                                      		<% if(u.getUserAccBank() == "없음") { %>
                                        		등록된 정보가 없습니다.
                                        	<% } else{ %>
                                        		<%= u.getUserAccBank() %> <%= u.getUserAccNum() %> <%= u.getUserName() %>
                                        	<% } %>
                                        <% } else { %>
                                        	등록된 정보가 없습니다.
                                        <% } %>
                                    </div>
                                    <br>
                                    <div class="add-account-type">은행명</div>
                                    <div class="account_input_area"><input type="text" id="bankName" name="bankName" placeholder="은행명"></div>
                                    <br>
                                    <div class="add-account-type">계좌번호</div>
                                    <div class="account_input_area"><input type="text" id="bankAccount" name="bankAccount"
                                        placeholder="-없이 입력하세요"></div>
                                    <br>
                                    <div class="add-account-type">예금주</div>
                                    <div class="account_input_area">
                                        <input type="text" id="accountOwner" placeholder="예금주명을 정확히 입력하세요." name="accountOwner">
                                    </div>
  
                                    <br><br>
                                    <div align="center">
                                        <button type="button" class="btn btn-outline-secondary class" data-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-secondary" id="change-account-button" disabled>확인</button>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    $(function(){
                        $("#change-account-form input").on('input', function(){
                            if(($("#bankName").val() != '') && ($("#bankAccount").val() != '') && ($("#accountOwner").val() != '')){
                                $("#change-account-button").attr("disabled", false);
                            } else{
                                $("#change-account-button").attr("disabled", true);
                            }
                        }) 
                    })
                </script>



                <div class="line"></div>
                <br>
                <div class="shipping-address">
                    <table id="shipping">
                        <tr>
                            <th id="shipping-title">반송주소</th>
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
                        <% } else{ %>
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
                            
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div id="add-address-form" align="center">
                                    <table>
                                        <tr>
                                            <th colspan="2">
                                                <div class="add-account-type">* 이름</div>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="input_area"><input type="text" maxlength="5" name="userName" placeholder="이름입력"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">
                                                <div class="add-account-type">* 전화번호</div>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="input_area"><input type="text" maxlength="13" name="phone"
                                                    placeholder="숫자만입력" onKeyup ="addHypen(this);"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">
                                                <div class="add-account-type">* 우편번호</div>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="input_area">
                                                    <input type="text" id="sample6_postcode" placeholder="우편번호">
                                                </div>
                                            </td>
                                            <td>
                                                <div>
                                                    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">검색</button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="input_area"><input type="text" id="sample6_address" placeholder="주소"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="input_area"><input type="text" id="sample6_extraAddress" placeholder="참고항목"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="input_area"><input type="text" id="sample6_detailAddress" placeholder="상세주소"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div>
                                                    <input type="checkbox" name="defaultAD" value="Y" id="defaultAD">
                                                    <label for="defaultAD">기본배송지 설정</label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
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
                                    document.getElementById("sample6_extraAddress").value = extraAddr;
                                
                                } else {
                                    document.getElementById("sample6_extraAddress").value = '';
                                }

                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('sample6_postcode').value = data.zonecode;
                                document.getElementById("sample6_address").value = addr;
                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById("sample6_detailAddress").focus();
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
                            <th class="total-price-tag" name="total-price">총 정산 금액</th>
                            <% if(bType.equals("sellI")){ %>
                            	<td class="total-price"><input type="text" class="totalPrice" name="totalPrice" value="<%= formatter.format(b.getbPrice() - b.getInspectionCost() - b.getCommission()) %>원"></td>
                            <% } else{ %>
                            	<td class="total-price"><input type="text" class="totalPrice" name="totalPrice" value="<%= formatter.format(0.97 * price) %>원"></td>
                            <% } %>
                        </tr>
                        <% if(bType.equals("buyI") && b != null){ %>
                        <tr>
                            <td colspan="2">
                                <div class="line"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>판매가</th>
                            <td><%= formatter.format(b.getbPrice()) %>원</td>
                        </tr>
                        <tr>
                            <th>검수비</th>
                            <td><%= formatter.format(b.getInspectionCost()) %>원</td>
                        </tr>
                        <tr>
                            <th>수수료</th>
                            <td><%= formatter.format(b.getCommission()) %>원</td>
                        </tr>
                        <tr>
                            <th>배송비</th>
                            <td>선불/판매자부담</td>
                        </tr>
                        <% } else{ %>
                        	<tr>
	                            <th>판매 입찰가</th>
	                            <td><%= formatter.format(price) %>원</td>
	                        </tr>
	                        <tr>
	                            <th>검수비</th>
	                            <td><%= formatter.format(0.01 * price) %>원</td>
	                        </tr>
	                        <tr>
	                            <th>수수료</th>
	                            <td><%= formatter.format(0.02 * price) %>원</td>
	                        </tr>
	                        <tr>
	                            <th>배송비</th>
	                            <td>선불/판매자부담</td>
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
                                    거래가 체결되면 일요일 · 공휴일을 제외하고 48시간 내에 SCALE로 발송을 완료한 후, 발송 정보를 정확히 입력해야 합니다.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term1"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">착불 배송 시 판매 금액에서 차감 정산하며, 미정산 시 별도 고지없이 해당 금액을 결제 시도할 수 있습니다.</div>
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
                                    송장 번호 미기재·오입력 시 입고가 진행되지 않으며, 발송 후 5일(일요일·공휴일 제외) 내 미도착은 허위 정보 입력으로 간주하여 미입고 페널티를 부과합니다.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term2"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">앱 알림 해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는 거래 진행 상태 알림을 받을 수 없으며 이로 인한 거래 실패는 판매자의 책임입니다.</div>
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
                                    검수 기준과 페널티 및 이용 정책을 다시 한번 확인하였습니다.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term3"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">이용정책 위반 시, 페널티가 부과됩니다. 페널티 회피 시 이후 거래가 제한되며 별도 고지없이 해당 금액을 결제 시도할 수 있습니다.</div>
                                <div><a href="">이용정책 보기</a></div>
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
                                    판매 조건을 모두 확인하였으며, 입찰 진행에 동의합니다.
                                </div>
                            </td>
                            <th><input type="checkbox" id="term4"></th>
                        </tr>
                    </table>
                </div>
                <br><br>

                <div class="total-price-info">
                    <table id="total-price-info">
                        <tr>
                            <th class="total-price-tag" name="total-price">총 결제 금액</th>
                        	<% if(bType.equals("sellI")){ %>
                             	<input type="hidden" name="bNo" value="<%= b.getbNo() %>">
                            	<td class="totalPrice"><%= formatter.format(b.getbPrice() - b.getInspectionCost() - b.getCommission()) %>원</td>
                            <% } else{ %>
                                <input type="hidden" name="pCo" value="<%= p.getProductCode() %>">
                                <input type="hidden" name="size" value="<%= size %>">
                                <input type="hidden" name="price" value="<%= price %>">
                            	<td class="totalPrice"><%= formatter.format(0.97 * price) %>원</td>
                            <% } %>
                            
                        </tr>
                    </table>
                </div>
                <br><br>
                <div align="center">
                    <button type="button" class="btn btn-outline-secondary">취소</button>
                    <button id="submit" type="submit" class="btn btn-outline-success" disabled>다음단계</button>
                </div>
                <br><br>
            </div>
            
        </form>
        <script>
            $(function(){
                var checkboxes = $("input[type='checkbox']");
                    
                checkboxes.click(function(){
                    if($("#term1").is(":checked") && $("#term2").is(":checked") && $("#term3").is(":checked") && $("#term4").is(":checked")){
                        $("#submit").attr("disabled", false);
                    } else{
                        $("#submit").attr("disabled", true);
                    }
                })
            })
            function addressList(){

            }
        </script>
        <br><br>
    </div>
    
</body>
</html>