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
        width: 320px;
    }
    #add-address-form{
        margin:auto;
        padding:10px;
    }
    #zipCode{
        width:330px; display:inline-block;
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
    .address-option{
        width: 90%;
        text-align: left !important; 
        border: none;
    }
    

</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <script>
        $(function(){
            <% if(loginUser != null && loginUser.getShopBlockDate() != null) { %>
                alert("????????? ???????????? SHOP ?????????????????????.");
                location.href = "<%= contextPath %>";
            <% } %>
        })
    </script>
    <br><br>
    <div class="shipping-payment">
    
        <form action="<%= contextPath %>/buybidding.bi" id="buyBiddingForm">
        	<input type="hidden" name="bType" value="<%= bType %>">
            <br>
            <div id="shipping-payment">
	                <div id="title">??????/??????</div>
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
                            <th id="shipping-title">????????????</th>
                            <td id="shipping-address-button">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#address-add">????????? ??????</button>
                                <button type="button" class="btn btn-outline-secondary btn-sm" id="addressList" data-toggle="modal" data-target="#address-list">????????? ??????</button>
                            </td>
                        </tr>
                        <% if(ad != null) { %>
                            <tr>
                                <th>?????????</th>
                                <td><input type="text" id="recipient" name="recipient" value="<%= ad.getRecipient() %>" readonly></td>
                            </tr>
                            <tr>
                                <th>?????????</th>
                                <td><input type="text" id="reciPhone" name="reciPhone" value="<%= ad.getPhone() %>" readonly></td>
                            </tr>
                            <tr>
                                <th>????????????</th>
                                <td><input type="text" id="shippingZipCode" name="shippingZipCode" value="(<%= ad.getZipCode() %>)" readonly> <input type="text" id="shippingAddress" name="shippingAddress" value="<%= ad.getAddress1() %> <%= ad.getAddress2() %>" readonly></td>
                            </tr>
                        <% } else { %>
                            <tr>
                                <th>?????????</th>
                                <td><input type="text" id="recipient" name="recipient" value="????????? ????????? ????????????." readonly></td>
                            </tr>
                            <tr>
                                <th>?????????</th>
                                <td><input type="text" id="reciPhone" name="reciPhone" value="????????? ????????? ????????????." readonly></td>
                            </tr>
                            <tr>
                                <th>????????????</th>
                                <td><input type="text" id="shippingAddress" name="shippingAddress" value="????????? ????????? ????????????." readonly></td>
                            </tr>
                        <% } %>
                        <tr>
                            <th>?????? ????????????</th>
                            <td>
                                <select id="shipping-msg" name="shipping-msg">
                                    <option value="0">???????????? ??????</option>
                                    <option value="1">??? ?????? ???????????????</option>
                                    <option value="2">???????????? ???????????????</option>
                                    <option value="3">????????????</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <!--????????? select box?????? '????????????'??? ???????????? ????????? ????????????-->
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

                <!-- ??????????????? ?????? -->
                <div class="modal" id="address-list">
                    <div class="modal-dialog">

                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h5 class="modal-title">????????? ??????</h5>
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
                                    <button type="button" class="btn btn-secondary" id="change-address-button" onclick="changeAddress();">??????</button>
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
                                        str +=   "<input type='radio' id='" + response[0].addresNo + "' name='checkedAddress' value='" + response[0].addresNo + "'>"
                                                +   "<label for='" + response[0].addresNo + "'  class='address-option btn'><span>"
                                                +      "<div class='address-check'>"
                                                +       "<!--????????????????????????-->"
                                                +       "<span class='badge badge-pill badge-secondary'>???????????????</span>"
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
                                                + "</label>"
                                                + "<div class='line2'></div>";

                                        for(let i=1; i<response.length; i++){
                                            str +=   "<input type='radio' id='" + response[i].addresNo + "' name='checkedAddress' value='" + response[i].addresNo + "'>"
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
                                                    + "</label>"
                                                    + "<div class='line2'></div>";
                                        }
                                        $(".address").html(str);

                                    }
                                },
                                error:function(){
                                    alert("????????? ?????? ????????? ??????????????????.");
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
                            // ?????? ??????
                            $('#address-list').modal('hide')
                            
                            // ???????????? ????????? ?????? ??????
                            $("#recipient").val($checkedName.text());
                            $("#reciPhone").val($checkedPhone.text());
                            $("#shippingZipCode").val($checkedZipCode.text());
                            $("#shippingAddress").val($checkedDetailAddress.text());
                            
                        }
                        else {
                            alert("???????????? ??????????????????.");
                        }

                    }
                </script>

                <!-- ????????? ?????? ?????? -->
                <div class="modal" id="address-add">
                    <div class="modal-dialog">

                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h5 class="modal-title">????????? ??????</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div id="add-address-form">
                                    <div class="form-group">
                                        <label for="userName"><span class="rq-mark">*</span>??????</label>
                                        <input type="text" class="form-control" name="userName" id="userName" placeholder="????????? ??????????????????.">
                                        <div class="check-input" id="check-input-name"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="phone"><span class="rq-mark">*</span>???????????????</label>
                                        <input type="text" class="form-control" name="phone" id="phone" placeholder="??????????????? ????????? ??????????????????." onKeyup="addHypen(this);">
                                        <div class="check-input" id="check-input-phone"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="zipCode"><span class="rq-mark">*</span>??????</label> <br>
                                        <input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="????????? ??????????????????." readonly>
                                        <button type="button" class="btn btn-dark" onclick="sample6_execDaumPostcode();">?????? ??????</button>
                                    </div>
                    
                                    <div class="form-group" id="addrGroup">
                                        <input type="text" class="form-control" id="address" name="address"><br>
                                        <label for="detailAddress">????????????</label> <br>
                                        <input type="text" class="form-control" id="detailAddress" name="detailAddress">
                                    </div>
                                    <div>
                                        <input type="checkbox" name="defaultAD" value="Y" id="defaultAD">
                                        <label for="defaultAD">??????????????? ??????</label>
                                    </div>
                                    <br><br>
                                    <div align="center">
                                        <button type="button" class="btn btn-secondary" onclick="addAddress();">??????</button>
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

                        // ?????? ????????? ??????
                        $userName.focusout(function(){
                            if($userName.val() == ""){
                                $checkInputName.html("????????? ??????????????????.");
                            }else{
                                $checkInputName.html("");
                            }
                        })


                        // ??????????????? ????????? ??????
                        $phone.focusout(function(){
                            if($phone.val() == ""){
                                $checkInputPhone.html("?????????????????? ??????????????????.");
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
                            alert("???????????? ????????? ??????????????????.")
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
                                        // ?????? ??????
                                        $('#address-add').modal('hide')

                                        // ???????????? ????????? ?????? ????????????
                                        $("#recipient").val($recipient);
                                        $("#reciPhone").val($recipientPhone);
                                        $("#shippingZipCode").val("(" + $zipCode + ")");
                                        $("#shippingAddress").val($address);
                                        
                                        // ????????? ????????? ??? ????????????
                                        $("#userName").val("");
                                        $("#phone").val("");
                                        $("#zipCode").val("")
                                        $("#address").val("");
                                        $("#detailAddress").val("");

                                    } else{
                                        alert("????????? ????????? ??????????????????.");
                                    }
                                    
                                },
                                error:function(){
                                    console.log("????????? ????????? ajax ?????? ??????");
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

                <!-- ?????? api -->
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
                    function sample6_execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                                var addr = ''; // ?????? ??????
                                var extraAddr = ''; // ???????????? ??????

                                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                                    addr = data.roadAddress;
                                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                                    addr = data.jibunAddress;
                                }

                                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
                                if(data.userSelectedType === 'R'){
                                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                                        extraAddr += data.bname;
                                    }
                                    // ???????????? ??????, ??????????????? ?????? ????????????.
                                    if(data.buildingName !== '' && data.apartment === 'Y'){
                                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                                    if(extraAddr !== ''){
                                        extraAddr = ' (' + extraAddr + ')';
                                    }
                                    // ????????? ??????????????? ?????? ????????? ?????????.
                                    document.getElementById('address').value = extraAddr;
                                
                                } else {
                                    document.getElementById('detailAddress').value = '';
                                }

                                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                                document.getElementById('zipCode').value = data.zonecode;
                                document.getElementById('address').value = addr;
                                // ????????? ???????????? ????????? ????????????.
                                document.getElementById('addrGroup').style.display = 'block';
                                document.getElementById('detailAddress').focus();
                            }
                        }).open();
                    }
                </script>

                <br><br>
                <div class="order-info">
                    <div id="order-title">?????? ?????? ??????</div>
                    <br>
                    <table id="price-detail">
                        <tr>
                            <th class="total-price-tag" id="total-price">??? ?????? ??????</th>
                            <% if(bType.equals("buyI")){ %>
                            	<td class="total-price"><input type="text" class="totalPrice" name="totalPrice" value="<%= formatter.format(b.getbPrice() + b.getDeliveryFee()) %>???" readonly></td>
                            <% } else{ %>
                            	<td class="total-price"><input type="text" class="totalPrice" name="totalPrice" value="<%= formatter.format(price + 3000) %>???" rea></td>
                            <% } %>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="line"></div>
                            </td>
                        </tr>
                        <% if(bType.equals("buyI") && b != null){ %>
	                        <tr>
	                            <th>?????? ?????????</th>
	                            <td><%= formatter.format(b.getbPrice()) %>???</td>
	                        </tr>
	                        <tr>
	                            <th>?????????</th>
	                            <td>??????</td>
	                        </tr>
	                        <tr>
	                            <th>?????????</th>
	                            <td>??????</td>
	                        </tr>
	                        <tr>
	                            <th>?????????</th>
	                            <td><%= formatter.format(b.getDeliveryFee()) %>???</td>
	                        </tr>
                        <% } else{ %>
	                        <tr>
	                            <th>?????? ?????????</th>
	                            <td><%= formatter.format(price) %>???</td>
	                        </tr>
	                        <tr>
	                            <th>?????????</th>
	                            <td>??????</td>
	                        </tr>
	                        <tr>
	                            <th>?????????</th>
	                            <td>??????</td>
	                        </tr>
	                        <tr>
	                            <th>?????????</th>
	                            <td><%= formatter.format(3000) %>???</td>
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
                                    ???????????? ????????????, ????????????, ????????? ?????? ????????? ????????? ??????, ????????? ????????? ??? ????????????.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term1"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">??? ?????? ??????, ????????? ??????, ???????????? ?????? ??? ????????? ????????? ?????? ?????? ?????? ????????? ?????? ??? ????????????.</div>
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
                                    ?????? ???????????? ??? ??????????????? ?????? ????????? ????????????, ?????? ???????????? ????????? ?????? ????????? ??????????????????.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term2"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">??? ????????? ????????? ????????? ??????????????????(???17???)??? ?????? ????????????(??????, ??????) ????????? ???????????? ????????????.</div>
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
                                    ?????? ????????? ?????? ??????????????????, ????????? ????????? ???????????????.
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
                            <th class="total-price-tag" name="total-price">??? ?????? ??????</th>
                             <% if(bType.equals("buyI")){ %>
                             	<input type="hidden" name="bNo" value="<%= b.getbNo() %>">
                            	<td class="totalPrice"><%= formatter.format(b.getbPrice() + b.getDeliveryFee()) %>???</td>
                            <% } else{ %>
                                <input type="hidden" name="pCo" value="<%= p.getProductCode() %>">
                                <input type="hidden" name="size" value="<%= size %>">
                                <input type="hidden" name="price" value="<%= price %>">
                            	<td class="totalPrice"><%= formatter.format(price + 3000) %>???</td>
                            <% } %>
                            
                        </tr>
                    </table>
                </div>
                <br><br>
                <input type="hidden" id="paymentNumber" name="paymentNumber" value="">
                <input type="hidden" id="paymentMethod" name="paymentMethod" value="">
                <div align="center">
                    <button type="button" class="btn btn-outline-secondary" onclick="history.back();">??????</button>
                    <input id="requestPay" type="button" class="btn btn-outline-warning" value="????????????" disabled>
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
                        $('#requestPay').prop('disabled', false);
                    } else{
                        $('#requestPay').prop('disabled', true);
                    }
                })
                
                const zipCode = $("#shippingZipCode").val().replace("(", "").replace(")", "");

                $("#requestPay").click(function () {
                    var IMP = window.IMP; // ????????????
                    IMP.init('imp22538717');
                    // 'iamport' ?????? ???????????? "????????? ????????????"??? ??????
                    // i'mport ????????? ????????? -> ????????? -> ?????????????????????
                    IMP.request_pay({
                        pg: 'html5_inicis', // version 1.1.0?????? ??????.
                        /*
                        'kakao':???????????????,
                        html5_inicis':????????????(???????????????)
                        'nice':???????????????
                        'jtnet':????????????
                        'uplus':LG????????????
                        'danal':??????
                        'payco':?????????
                        'syrup':????????????
                        'paypal':?????????
                        */
                        pay_method: 'card',
                        /*
                        'samsung':????????????,
                        'card':????????????,
                        'trans':?????????????????????,
                        'vbank':????????????,
                        'phone':?????????????????????
                        */
                        merchant_uid: 'merchant_' + new Date().getTime(),
                        /*
                        merchant_uid??? ??????
                        https://docs.iamport.kr/implementation/payment
                        ?????? url??? ??????????????? ?????? ??? ?????? ????????? ????????????.
                        ???????????????.
                        ????????? ????????? ????????????.
                        */
                        name: "<%= p.getProductNameKo() %>",
                        //??????????????? ????????? ??????
                        amount: 1000,
                        //??????
                        buyer_email: '<%= loginUser.getEmail() %>',
                        buyer_name: $("#recipient").val(),
                        buyer_tel: $("#reciPhone").val(),
                        buyer_addr: $("#shippingAddress").val(),
                        buyer_postcode: zipCode,
                        
                        /*
                        ????????? ?????????,
                        ????????? ????????? ???????????? URL??? ??????
                        (???????????????, ?????????, ????????? ????????? ????????????. PC??? ??????????????? callback????????? ????????? ?????????)
                        */
                    }, function (rsp) {
                        if (rsp.success) {
                        	console.log(rsp.merchant_uid);
                        	// ?????? ??????
                            $("#paymentNumber").val(rsp.merchant_uid);
                            // ?????? ??????
                        	$("#paymentMethod").val(rsp.card_name + " " + rsp.card_number);
                            $("#buyBiddingForm").submit();
                        } else {
                            alert("????????? ?????????????????????. ?????? ??????: " +  rsp.error_msg);
                        }
                        
                    });
                });

                
                
            })
      

            

        </script>
        <br><br>
    </div>
    
</body>
</html>