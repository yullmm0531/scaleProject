<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.scale.user.model.vo.Address"%>
    
    <%
	ArrayList<Address> list = (ArrayList<Address>)request.getAttribute("list");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.sideMenu-div{
            list-style-type:none; /*불릿기호 없애기*/
            padding: 0;
            margin: 0;
            width: 800px;
            height: 100%;

        }
        .sideMenu-div>li{
            border: 1px solid blue;
            float: left;
            width: 15%;
            height: 100%;
            transform: scale(1);
        }
        .sideMenu-div a{
            /*공백은 후손선택자*/
            border:1px solid orange;
            text-decoration:none;
            color: orange;
            font-size: 18px;
            font-weight: 900;
            width: 100%;
            height: 100%;
            display:block;
            text-align:center;
            /*vertical-align:middle;*/
            line-height: 35px;
        }
        .sideMenu-div a:hover{color: orangered;}

        .sideMenu-div>li>ul{
            list-style-type:none;
            padding:0;
            margin:0;
            display:none;
        }
        .sideMenu-div>li>ul a{ font-size:15px;}

        .sideMenu-div>li:hover>ul{
            display:block;
        }

        #likeList-div{margin-top: 30%;margin-left: 6%;}

        .sideMenu-area{margin-top: 30%;}




        div{
            box-sizing: border-box;
            
        }
        .wrap{
            width:1000px;
            height: auto;
            margin:auto;
        }

        .wrap>div{
            width: 100%;
        }
        
        #content{height:55%;}
       

         #content>div {
            height:100%;
            float:left;
        }

        #content-1{width:20%}
        #content-2{width:80%}
        

        .underline{border: 3px solid gray; width: 800px;}
        
        .outer{margin-left: 30%;}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	
		<%
		int userNo = loginUser.getUserNo();
		String userId = loginUser.getUserId();
		%>
	
	
	
		<div class="wrap">
	        <div id="content">
	            <div id="content-1">
	                <div class="sideMenu-area">
	                    <div class="sideMenu-div">
	                        <li><a href="">쇼핑정보</a>
	                            <ul>
	                                <li><a href="<%=contextPath %>/userBuyList.us">구매내역</a></li>
	                                <li><a href="<%=contextPath %>/userSellList.us?userNo=<%=userNo%>">판매내역</a></li>
	                                <li><a href="<%=contextPath %>/userLikeList.us">찜목록</a></li>
	                            </ul>
	                        </li>
	                    </div>
	                    <br><br><br><br><br><br><br><br>
	                    <div class="sideMenu-div">
	                        <li><a href="">내정보</a>
	                            <ul>
	                                <li><a href="<%=contextPath%>/userInfoUpdate.us">회원정보수정</a></li>
	                                <li><a href="<%=contextPath%>/paymentAndShippingOnlyView.us">결제 및 배송정보</a></li>
	                                
	                            </ul>
	                        </li>
	                    </div>
	                </div>
	            </div>
		
	
	<!-- 영역구분 -->
	
			<div id="content-2">
				<form action="" method="post" id="payment-shipping-form">
				
				        <div id="payment-shipping">
				            <div id="main-tag">
				                <h4 id="title">
				                    <p>결제 및 배송정보</p>
				                </h4>
				            </div>
				            <div class="underline"></div>
				            <br>
				    
				            <div id="payment-div">
				                <div id="bank-box">
				                    <div id="bank-tag">
				                        <p>은행명</p>
				                        
				                    </div>
				                    <div id="bank">
				                        <select>
				                            <option value="">국민은행</option>
				                            <option value="">신한은행</option>
				                            <option value="">하나은행</option>
				                            <option value="">기업은행</option>
				                        </select>
				                    </div>
				                    <br>
				                    <div class="underline"></div>
				                </div>
				                <br>
				
				                <div id="user-account-box">
				                    <div id="user-account-tag">
				                        <p>예금주</p>
				                    </div>
				                    <div id="user-account-name">
				                        <h5>홍길동</h5>
				                    </div>
				                    <div class="underline"></div>
				                </div>
				                <div id="account-box">
				                    <div id="account-tag">
				                        <p>계좌번호</p>
				                    </div>
				                    <div id="account">
				                        <h5>000-000000-000</h5>
				                    </div>
				                    <div class="underline"></div>
				                </div>
				                <br>
				                <div id="account-edit-box">
				                    <div id="account-edit">
				                        <a href="" class="btn btn outlinegrey small" type="button" id="edit-account">계좌번호 변경</a>
				                    </div>
				                </div>
				            </div>
				            <br><br>
						</form>
						
						
				            <div id="shipping-div">
				                <div id="shipping-box">
				                    <div id="address-title">
				                        <p>기본 배송지</p>
				                    </div>
				                    
				                    
				                    
				                    <div id="add-address-div">
				                        
				                        
				                        	<div id="insert-address-div">
							                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updateAddressModal" id="update-address">배송지추가</button>
							                </div>
							                
										         <div class="modal" id="updateAddressModal">
												  <div class="modal-dialog">
												    <div class="modal-content">
												
												      <!-- Modal Header -->
												      <div class="modal-header">
												        <h4 class="modal-title">배송지 추가</h4>
												        <button type="button" class="close" data-dismiss="modal">&times;</button>
												      </div>
												
												      <!-- Modal body -->
												      <div class="modal-body" align="center">
												        
												        <b>배송지를 추가하시겠습니까?<br>새 배송지를 입력해주십시오.</b> <br><br>
												        
														<form action="<%= contextPath %>/userPaymentAndShipping.us">
															<input type="hidden" name="userNo" value="<%= userNo %>">
												        	<div class="form-group">
											                    <label for="zipCode"><span class="rq-mark"></span>주소입력</label> <br>
											                    <input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="주소를 검색해주세요." required readonly>
											                    <button type="button" class="btn btn-dark" onclick="sample6_execDaumPostcode();">주소 검색</button>
											                </div>
											
											                <div class="form-group" id="addrGroup" style="display:none">
											               		<input type="radio" class="form-control" id="basicAddress" name="defaultAdd" value="Y" required><br>
											               		<label for="basicAddress">기본배송지 설정</label>
											               		<input type="radio" class="form-control" id="basicAddress" name="defaultAdd" value="N" required><br>
											               		<label for="basicAddress">기본배송지 설정 안함</label>
											                    <input type="text" class="form-control" id="address" name="address" required><br>
											                    <label for="detailAddress">상세주소</label> <br>
											                    <input type="text" class="form-control" id="detailAddress" name="detailAddress">
											                </div>
											                
											                <div class="form-group">
											                    
											                    <input type="text" class="form-control"  name="recipient" placeholder="수령인을 입력하세요" required>
											                     <input type="text" class="form-control" name="Phone" placeholder="수령인 연락처를 입력하세요" required>
											                    
											                </div>
												        	
												        	<button type="submit" class="btn btn-danger btn-sm">추가하기</button>
																	

														</form>

												        
												        
												      </div>
												
												    </div>
												  </div>
												</div>
												
												
												<!-- 스크립트 -->
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
				                        
				                        
				                    </div>
				                    <br>
				                    
				                    
				                    
		<% for(Address ad : list){ %>  
         <div class="wrap-div" style=" cursor: pointer;" onclick="test2(<%= ad.getAddressNo()%>,<%= ad.getUserNo()%> );">
         		
         		<input type="hidden" id="addressNo" value="<%= ad.getAddressNo()%>">
         		<input type="hidden" id="userNo" value="<%= ad.getUserNo()%>">
            <div class="sell-product-div1">
                <div class="img">
                    <img src="<%=ad.getAddress1() %>" alt="사용자이미지" id="sell-img">
                </div>
            </div>
            <div class="sell-product-div2">
                <div class="brand-name"><%=ad.getAddress2() %></div>
                <br><br>
                <div class="product-ex"><%=ad.getZipCode() %></div>
            </div>
            <div class="sell-product-div2">
                <div class="brand-name"><%=ad.getRecipient() %></div>
                <br><br>
                <div class="product-ex"><%=ad.getPhone() %></div>
            </div>
            
            
           
            	
            
            
            
        </div>
        <% } %>
        
        <script>
    	
    	
    	function test1(e1,e2){
    		
    		location.href = "<%=contextPath%>/updateBasicAddress.us?AddressNo=" + $(e).children('#addressNo').val()"&" + userNo=$(e).children('#userNo').val();
    	}
    </script>
				                    
				                    
				                    <div id="edit-address-div">
				                        <a href="" class="btn btn outlinegrey small" type="button" id="edit-address">수정</a>
				                    </div>
				                    <div id="delete-address-div">
				                        <a href="" class="btn btn outlinegrey small" type="button" id="delete-address">삭제</a>
				                    </div>
				                </div>
				                
				            </div>
				            <br>
				            <div class="underline"></div>
				            <br>
				            
				
				        </div>
   				 
			</div>
</body>
</html>