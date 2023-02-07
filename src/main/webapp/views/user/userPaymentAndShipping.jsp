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


		
		#address-div{border: solid blue;}


        div{
            box-sizing: border-box;
            
        }
        .wrap{
            width:1000px;
            height: auto;
            margin:auto;
        }

        .wrap>div{
        	b
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
                                <li><a href="<%=contextPath %>/userSellBidding.us?userNo=<%=userNo%>">판매입찰</a></li>                                                               
                            </ul>
                        </li>
                    </div>
                    <br><br><br><br><br><br>
                    <div class="sideMenu-div">
                        <li><a href="">내정보</a>
                            <ul>
                                <li><a href="<%=contextPath%>/userInfoUpdate.us">회원정보수정</a></li>
                                <li><a href="<%=contextPath%>/paymentAndShippingView.us?userNo=<%=userNo%>">결제 및 배송정보</a></li>
                                
                            </ul>
                        </li>
	                    </div>
	                </div>
	            </div>
		
	
	<!-- 영역구분 -->
	
			<div id="content-2">
				
						
						
				            <div id="shipping-div">
				                <div id="shipping-box">
				                    <div id="address-title">
				                        <p>기본 배송지</p>
				                    </div>
				                    
				                    
				                    
				                    <div id="add-address-div" class="add-address-div">
				                        
				                        
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
												
												
												
												
								<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
								    function sample6_execDaumPostcode() {
								        new daum.Postcode({
								            oncomplete: function(data) {
								                
								                var addr = ''; 
								                var extraAddr = ''; 
								
								                
								                if (data.userSelectedType === 'R') { 
								                    addr = data.roadAddress;
								                } else { 
								                    addr = data.jibunAddress;
								                }
								
								                
								                if(data.userSelectedType === 'R'){
								                    
								                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								                        extraAddr += data.bname;
								                    }
								                    
								                    if(data.buildingName !== '' && data.apartment === 'Y'){
								                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								                    }
								                   
								                    if(extraAddr !== ''){
								                        extraAddr = ' (' + extraAddr + ')';
								                    }
								                    
								                    document.getElementById('address').value = extraAddr;
								                
								                } else {
								                    document.getElementById('detailAddress').value = '';
								                }
								
								               
								                document.getElementById('zipCode').value = data.zonecode;
								                document.getElementById('address').value = addr;
								                
								                document.getElementById('addrGroup').style.display = 'block';
								                document.getElementById('detailAddress').focus();
								            }
								        }).open();
								    }
								</script>
				                        
				                        
				                    </div>
				                    <br>
				                    
				                    
			                    
		<% for(Address ad : list){ %>  
         <div class="wrap-div" id="address-div" style=" cursor: pointer;" onclick="test2(<%= ad.getUserNo()%>, <%=ad.getAddresNo()%> );">
         		
         		
         		<input type="hidden" id="userNo" value="<%= ad.getUserNo()%>">
         		
            <div class="sell-product-div1">
                <div class="img" id="sell-img">
                    <%=ad.getAddress1() %>
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
    	
    	
    	function test2(e1,e2){
    		
    		location.href = "<%=contextPath%>/updateBasicAddress.us?userNo=" + e1 + "&addressNo=" + e2;
    	}
    </script>
			                    
				                    
				                    
				                </div>
				                
				            </div>
				           
				            
				
				        </div>
   				 
			</div>
</body>
</html>