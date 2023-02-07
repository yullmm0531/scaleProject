<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.product.model.vo.Product, com.scale.bidding.model.vo.Bidding, java.text.DecimalFormat, com.scale.user.model.vo.*, com.scale.policy.model.vo.*" %>
<%
	Product p = (Product)request.getAttribute("p");
	String size = (String)request.getAttribute("size");
	String bType = (String)request.getAttribute("bType");
	Bidding b = (Bidding)request.getAttribute("b");
	int price = (int)request.getAttribute("price");
	Address ad = (Address)request.getAttribute("ad");
	User u = (User)request.getAttribute("u");
    Policy t = (Policy)request.getAttribute("t");
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
        .address{padding: 10px; height: 430px;}
        .address label:hover{background-color: rgba(247, 246, 246, 0.479);}
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
            height: 600px;
        }
        .totalPrice{
	        width: 100px;
	        border: none;
	        background-color: whitesmoke;
	        font-size: 20px;
	        color: green;
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
            width: 320px;
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
        .bank-account, .bank-owner{
            border: none;
            background-color: whitesmoke;
        }
        .address-option{
            width: 90%;
            text-align: left !important; 
            border: none;
        }
        .buy-terms span{
            color: blue;
            text-decoration: underline;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <script>
        $(function(){
            <% if(loginUser != null && loginUser.getShopBlockDate() != null) { %>
                alert("페널티 누적으로 SHOP 차단되었습니다.");
                location.href = "<%= contextPath %>";
            <% } %>
        })
    </script>
    <br><br>
    <div class="order-adjustment">
        <form action="<%= contextPath %>/sellbidding.bi">
        	<input type="hidden" name="bType" value="<%= bType %>">
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
                        	<% if(u.getUserAccBank().equals("없음")) { %>
                        		<tr>
		                            <th>계좌</th>
		                            <td id="bank-account"><input type="text" class="bank-account" placeholder="등록된 정보가 없습니다." readonly required></td>
		                            <td rowspan="2" id="account-button">
		                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#change-account">변경</button>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>예금주</th>
		                            <td id="bank-Owner"><input type="text" class="bank-owner" placeholder="등록된 정보가 없습니다." readonly required></td>
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
		                            <td id="bank-Owner"><%= u.getUserName() %></td>
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
	                            <td id="bank-Owner">등록된 정보가 없습니다.</td>
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
                                      		<% if(u.getUserAccBank().equals("없음")) { %>
                                        		등록된 정보가 없습니다.
                                        	<% } else{ %>
                                        		<%= u.getUserAccBank() %> <%= u.getUserAccNum() %> <%= u.getUserName() %>
                                        	<% } %>
                                        <% } else { %>
                                        	등록된 정보가 없습니다.
                                        <% } %>
                                    </div>
                                    <br>
                                    
                                    <div class="form-group">
                                        <label for="userName"><span class="rq-mark">*</span>은행명</label>

                                        <select name="bankName" class="form-control" id="bankName" name="bankName">
                                            <option value="NoSelect">선택하세요</option>
                                            <option value="국민은행">국민은행</option>
                                            <option value="신한은행">신한은행</option>
                                            <option value="우리은행">우리은행</option>
                                            <option value="하나은행">하나은행</option>
                                            <option value="기업은행">기업은행</option>
                                            <option value="농협">농협</option>
                                            <option value="sc은행">sc은행</option>
                                            <option value="우체국">우체국</option>
                                            <option value="한국씨티은행">한국씨티은행</option>
                                            <option value="산업은행">산업은행</option>
                                            <option value="카카오뱅크">카카오뱅크</option>
                                            <option value="부산은행">부산은행</option>
                                            <option value="대구은행">대구은행</option>
                                        </select>
                                        <div class="check-input" id="check-input-bankName"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="phone"><span class="rq-mark">*</span>계좌번호</label>
                                        <input type="text" class="form-control" name="bankAccount" id="bankAccount" placeholder="-포함하여 입력해주세요.">
                                        <div class="check-input" id="check-input-bankAccount"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone"><span class="rq-mark">*</span>예금주</label>
                                        <input type="text" class="form-control" name="bankAccountOwner" id="bankAccountOwner" placeholder="예금주명을 입력해주세요.">
                                        <div class="check-input" id="check-input-bankAccountOwner"></div>
                                    </div>
                                    <br><br>
                                    <div align="center">
                                        <button type="button" id="changeAccClose" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-secondary" id="change-account-button" disabled>확인</button>
                                    </div>
                                    <br><br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    
                    $(function(){
                        const $bankName = $("#bankName");
                        const $bankAccount = $("#bankAccount");
                        const $bankAccountOwner = $("#bankAccountOwner");
                        const $checkInputBankName = $("#check-input-bankName");
                        const $checkInputBankAccount = $("#check-input-bankAccount");
                        const $checkInputBankAccountOwner = $("#check-input-bankAccountOwner");
                        // 이름 유효성 체크
                        $bankAccountOwner.focusout(function(){
                            if($bankAccountOwner.val() == ""){
                                $checkInputBankAccountOwner.html("이름을 입력해주세요.");
                            }else if($bankAccountOwner.val() == "<%= loginUser.getUserName() %>"){
                                $checkInputBankAccountOwner.html("");
                            }else{
                                $checkInputBankAccountOwner.html("본인 명의의 계좌를 등록해주세요.");
                            }
                        })

                        $bankName.focusout(function(){
                            if($bankName.val() == 'NoSelect'){
                                $checkInputBankName.html("은행명을 선택해주세요.");
                            } else{
                                $checkInputBankName.html("");
                            }
                        })

                        $("#change-account-form input, #change-account-form select").on("change", function(){
                            if(($bankName.val() != 'NoSelect') && ($bankAccount.val() != '') && ($bankAccountOwner.val() == "<%= loginUser.getUserName() %>")){
                                $("#change-account-button").attr("disabled", false);
                            } else{
                                $("#change-account-button").attr("disabled", true);
                            }
                        })

                        $("#change-account-button").click(function(){
                           	$.ajax({
                           		url:"<%= contextPath %>/updateAcc.us",
                                data:{
                                    userNo: <%= loginUser.getUserNo() %>,
                                    accBank: $bankName.val(),
                                    accNum: $bankAccount.val()
                                },
                                type:"post",
                                success:function(result){
                                    if(result > 0){
                                        $('#change-account').modal('hide')
                                        selectUserAcc();

                                    } else{
                                        alert("계좌정보 변경에 실패했습니다.");
                                    }
                                    
                                },
                                error:function(){
                                    console.log("계좌정보 변경용 ajax 통신 실패");
                                }
                           	})
                        })

                        function selectUserAcc(){
                            $.ajax({
                                url:"<%= contextPath %>/selectAcc.us",
                                data:{userNo: <%= loginUser.getUserNo() %>},
                                success:function(response){
                                    let value="";
                                    if(response.userAccBank != '없음'){
                                        $("#bank-account").html("<input type='text' id='userAccBank' name='userAccBank' value='" + response.userAccBank + "' readonly required><input type='text' id='userAccNum' name='userAccNum' value='" + response.userAccNum + "' readonly>")
                                        $("#bank-Owner").html("<input type='text' class='bank-owner' value='" + response.userName + "' readonly required>")
                                    } else{
                                        $("#bank-account").html("<input type='text' class='bank-account' placeholder='등록된 정보가 없습니다.' readonly required>")
                                        $("#bank-Owner").html("<input type='text' class='bank-owner' placeholder='등록된 정보가 없습니다.' readonly required>")
                                    }
                                },
                                error:function(){
                                    console.log("계좌정보 조회용 ajax 통신 실패");
                                }
                            })
                        }


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
                                <button type="button" class="btn btn-outline-secondary btn-sm" id="addressList" data-toggle="modal" data-target="#address-list">배송지 목록</button>
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
                                    
                                    <div class="address" style="overflow: auto;">
                                        
                                        
                                    </div>
                                    <br>
                                    
                                    
                                </div>
                                <div align="center">
                                    <button type="button" class="btn btn-secondary" id="change-address-button" onclick="changeAddress();">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <script>
               
                    $(function(){
                        $("#addressList").click(function(){
                            $.ajax({
                                url:"<%= contextPath %>/addressList.us",
                                data:{userNo:<%= loginUser.getUserNo() %>},
                                success:function(response){
                                    console.log(response);
                                    var str = "";
                                    if(response.length != 0){
                                        str +=   "<div><input type='radio' id='" + response[0].addresNo + "' name='checkedAddress' value='" + response[0].addresNo + "'>"
                                                +   "<label for='" + response[0].addresNo + "'  class='address-option btn'><span>"
                                                +      "<div class='address-check'>"
                                                +       "<!--기본배송지인경우-->"
                                                +       "<span class='badge badge-pill badge-secondary'>기본배송지</span>"
                                                +      "</div>"
                                                +      "<div class='address-name'>"
                                                +          response[0].recipient
                                                +      "</div>"
                                                +      "<div class='address-phone'>"
                                                +          response[0].phone
                                                +      "</div>"
                                                +      "<div class='address-detail'>"
                                                +          "<span class='address-zipCode'>(" + response[0].zipCode + ")</span><span class='address-address'>" + response[0].address1 + " " + response[0].address2 + "</span>"
                                                +      "</div></span>"
                                                + "</label></div>"
                                                + "<div class='line2'></div>";

                                        for(let i=1; i<response.length; i++){
                                            str +=   "<div><input type='radio' id='" + response[i].addresNo + "' name='checkedAddress' value='" + response[i].addresNo + "'>"
                                                    +   "<label for='" + response[i].addresNo + "'  class='address-option btn'><span>"
                                                    +      "<div class='address-check'>"     
                                                    +      "</div>"
                                                    +      "<div class='address-name'>"
                                                    +          response[i].recipient
                                                    +      "</div>"
                                                    +      "<div class='address-phone'>"
                                                    +          response[i].phone
                                                    +      "</div>"
                                                    +      "<div class='address-detail'>"
                                                    +          "<span class='address-zipCode'>(" + response[i].zipCode + ")</span><span class='address-address'>" + response[i].address1 + " " + response[i].address2 + "</span>"
                                                    +      "</div></span>"
                                                    + "</label></div>"
                                                    + "<div class='line2'></div>";
                                        }
                                        $(".address").html(str);

                                    }
                                },
                                error:function(){
                                    alert("배송지 목록 조회에 실패했습니다.");
                                }
                            })

                        })

                    })

                    function changeAddress(){
                        const $checkedAddress = $("input[type=radio][name=checkedAddress]:checked")
                        const $checkedName = $("input[type=radio][name=checkedAddress]:checked + label .address-name")
                        const $checkedPhone = $("input[type=radio][name=checkedAddress]:checked + label .address-phone")
                        const $checkedZipCode = $("input[type=radio][name=checkedAddress]:checked + label .address-zipCode")
                        const $checkedDetailAddress = $("input[type=radio][name=checkedAddress]:checked + label .address-address")
                        if ($checkedAddress.val()) {
                            // 모달 닫기
                            $('#address-list').modal('hide')
                            
                            // 주문서에 배송지 정보 담기
                            $("#recipient").val($checkedName.text());
                            $("#reciPhone").val($checkedPhone.text());
                            $("#shippingZipCode").val($checkedZipCode.text());
                            $("#shippingAddress").val($checkedDetailAddress.text());
                            
                        }
                        else {
                            alert("배송지를 선택해주세요.");
                        }

                    }
                </script>
	
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
                                        <button type="button" class="btn btn-secondary" onclick="addAddress();">확인</button>
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
                        const $address = $("#address");

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

                    function addAddress(){
                        const $recipient = $("#userName").val();
                        const $recipientPhone = $("#phone").val();
                        const $zipCode = $("#zipCode").val()
                        const $address = $("#address").val() + $("#detailAddress").val();

                        var defaultAddress = "";
                        if($("#defaultAD").is(":checked")){
                            defaultAddress = "Y"
                        } else{
                            defaultAddress = "N"
                        }

                        if($("#userName").val() == "" || $("#phone").val() == "" || $("#address").val() == ""){
                            alert("배송지를 제대로 입력하십시오.")
                        } else{
                            $.ajax({
                                url:"<%= contextPath %>/insertAddress.us",
                                data:{
                                    userNo: <%= loginUser.getUserNo() %>,
                                    recipientName: $recipient,
                                    recipientPhone: $recipientPhone,
                                    zipCode: $zipCode,
                                    address: $("#address").val(),
                                    detailAddress: $("#detailAddress").val(),
                                    defaultAD: defaultAddress
                                },
                                type:"post",
                                success:function(result){
                                    if(result > 0){
                                        // 모달 닫기
                                        $('#address-add').modal('hide')

                                        // 주문서에 배송지 정보 입력하기
                                        $("#recipient").val($recipient);
                                        $("#reciPhone").val($recipientPhone);
                                        $("#shippingZipCode").val("(" + $zipCode + ")");
                                        $("#shippingAddress").val($address);
                                        
                                        // 모달에 입력한 값 비워주기
                                        $("#userName").val("");
                                        $("#phone").val("");
                                        $("#zipCode").val("")
                                        $("#address").val("");
                                        $("#detailAddress").val("");

                                    } else{
                                        alert("배송지 변경에 실패했습니다.");
                                    }
                                    
                                },
                                error:function(){
                                    console.log("배송지 변경용 ajax 통신 실패");
                                }
                            })
                    
                        }
                    }

                   
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
                            <th class="total-price-tag" name="total-price">총 정산 금액</th>
                            <% if(bType.equals("sellI")){ %>
                            	<td class="total-price"><input type="text" class="totalPrice" name="totalPrice" value="<%= formatter.format(b.getbPrice() - b.getInspectionCost() - b.getCommission()) %>원" readonly></td>
                            <% } else{ %>
                            	<td class="total-price"><input type="text" class="totalPrice" name="totalPrice" value="<%= formatter.format(0.97 * price) %>원" readonly></td>
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
                                <div class="terms-detail">이용정책 위반 시, 페널티가 부여됩니다. 페널티 3회 누적시 이용이 제한됩니다.</div>
                                <div><span data-toggle="modal" data-target="#modal-t">이용정책 보기</span></div>
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
                            <% if(t != null) {%>
                               <div class="modal-body"><%= t.getPolicyContent() %></div>
                            <%}else{ %>
                               <div class="modal-body"><%= t.getPolicyContent() %></div>
                            <%} %>
                          </div>
                        </div>
                    </div>
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
                    <button type="button" class="btn btn-outline-secondary" onclick="history.back();">취소</button>
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