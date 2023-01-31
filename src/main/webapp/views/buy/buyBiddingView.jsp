<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.product.model.vo.*, java.util.ArrayList, com.scale.bidding.model.vo.Bidding, java.text.DecimalFormat" %>
<% 
	Product p = (Product)request.getAttribute("p");
	ArrayList<Bidding> pList = (ArrayList<Bidding>)request.getAttribute("pList");
	DecimalFormat formatter = new DecimalFormat("###,###");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>      
        .line{
            border: 0.5px solid gray;
            width: 500px;
            margin: auto;
        }
        #sizes{
            text-align: center;
        }
        .size-list{
            padding-left: 60px;
        }
        #sizes label{
            display: inline-block;
            width: 150px;
            height: 60px;
            margin-top: 15px;
            margin-left: 5px;
            margin-right: 5px;
        }
        .outer{width: 600px; margin: auto; border: 1px solid gray; background-color: whitesmoke;}
        .product-info{height: 180px; padding-left: 30px; padding-top: 15px;}
        .product-info img{width: 150px;}
        .product-img{text-align:right;}
        #product-brand{font-weight: bold;}
        #product-eng-name{font-size: 14px;}
        #product-kor-name{
            font-size: 14px;
            color: gray;
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
        .btn-group{
            width: 80%;
        }
        #buy-immediately, #buy-bidding{
            font-weight: bold;
        }
        .title{
            padding-left: 60px;
            font-size: 20px;
        }
        .buy-price{
            padding-left: 400px;
            font-size: 25px;
            font-style: italic;
        }
        .price{
            width: 130px;
            height: 30px;
            border: none;
            background-color: whitesmoke;
        }
        #step{
            padding-left: 60px;
            font-size: 12px;
            color: gray;
        }
        #total-price{
            margin-left: 60px;
            font-size: 14px;
            
        }
        #next-page{
            margin-left: 300px;
            font-size: 12px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <br><br><br>
    <div class="outer">
        <form action="<%= contextPath %>/buyDetail.bi">
        	<input type="hidden" name="co" value="<%= p.getProductCode() %>">
            <div class="product">
            	<% if(p != null) { %>
	                <div class="product-info row">
	                    <div class="product-img col-sm-4">
	                        <img src="<%= contextPath %>/<%= p.getProductImgM() %>">
	                    </div>
	                    <div class="product-name col-sm-8">
	                        <br>
	                        <div id="product-brand"><%= p.getBrandName() %></div>
	                        <div id="product-eng-name"><%= p.getProductNameEng() %></div>
	                        <div id="product-kor-name"><%= p.getProductNameKo() %></div>
	                        <span id="product-size" name="size" hidden>사이즈</span>
	                    </div>
	                </div>
                <% } %>
                <div class="line"></div>
                <br>
            </div>

            <div class="select-size">
                <div class="size-chart">
                    <div id="sizes">
                        <div class="btn-group-toggle size-list" data-toggle="buttons" align="left">
                        	<!--
                            <label class='btn btn-outline-secondary'>
                                <input type='radio' name='size' value='사이즈'>사이즈
                            </label>
                            -->

                        </div>
                    </div>
                    <script>
                        function toMoney(num) {
                            return num.toLocaleString('ko-KR');
                            }

                        $(function(){
                            var pSizeArr = "<%= p.getProductSize() %>".split(", ");
                            var sizeOption = "";
                            
                            var size = "";
                            var price = "";
                            <% if(pList != null && pList.size() != 0) { %> 
                                <% for(int i=0; i<(pList.size()-1); i++){ %>
                                    size += <%= (pList.get(i)).getpSize() %> + ", ";
                                    price += "<%= (pList.get(i)).getbPrice() %>" + "/ ";
                                <% } %>
                                size += <%= (pList.get(pList.size()-1)).getpSize() %>;
                                price += "<%= (pList.get(pList.size()-1)).getbPrice() %>";
                            <% } %>
                            var sizeArr = size.split(", ");
                            var priceArr = price.split("/ ");
                            let index = "";
                            for(let i=0; i<pSizeArr.length; i++){
                                index = sizeArr.indexOf(pSizeArr[i]);
                                if(index != -1){
                                    sizeOption += "<label class='btn btn-outline-secondary'>"
                                        +       "<input type='radio' name='size' value='" + pSizeArr[i] + "'>" + pSizeArr[i] + "<br>" + toMoney(parseInt(priceArr[index])) + "원</label>";
                                } else{
                                    sizeOption += "<label class='btn btn-outline-secondary'>"
                                        +       "<input type='radio' name='size' value='" + pSizeArr[i] + "'>" + pSizeArr[i] + "<br>-</label>";
                                }
                                
                            }
                            $(".size-list").html(sizeOption);
        
                        })
                    </script>

                </div>
                <br>
                <div align="center">
                    <button type="button" data-dismiss="modal" class="btn btn-outline-secondary">취소</button>
                    <button type="button" class="btn btn-outline-warning" id="goToTerm" disabled>다음단계</button>
                </div>
                
                <br><br>
            </div>

            <script>
                
                $(function(){
                    var sizes = $(".size-chart input");
                    let flag = true;
                    let checkedSize = "";
                    sizes.change(function(){
                        for(let i=0; i<sizes.length; i++){
                            if(sizes[i].checked == true){
                                flag = false;
                                checkedSize = $(this).val();
                            }
                        }
                        $("#goToTerm").attr("disabled", flag);
                        $("#product-size").html(checkedSize);

                        var size = "";  
                        var price = "";
                        <% if(pList != null && pList.size() != 0) { %> 
                            <% for(int i=0; i<(pList.size()-1); i++){ %>
                                size += <%= (pList.get(i)).getpSize() %> + ", ";
                                price += "<%= (pList.get(i)).getbPrice() %>" + "/ ";
                            <% } %>
                            size += <%= (pList.get(pList.size()-1)).getpSize() %>;
                            price += "<%= (pList.get(pList.size()-1)).getbPrice() %>";
                        <% } %>
                        var sizeArr = size.split(", ");
                        var priceArr = price.split("/ ");
                        let index = sizeArr.indexOf(checkedSize);
                        console.log(index);
                        if(index != -1){
                            $("#priceI").val(toMoney(parseInt(priceArr[index])));
                        } else{
                            $("#check1").click();
                            $("#check2").attr("disabled", true);
                            $("#priceB").change(function(){
                                let value = $("#priceB").val();
                                let priceI = $("#priceI").val();
                                value = value.replace(/[^0-9]/g,'');
                                value = value.replace(/[^0-9]/g,'');
                                
                                $("#priceB").val(value.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
                            })
                        }
                    })
                    
                })
            </script>

            <div class="term" hidden>
                <div class="buy-terms">
                    <table id="buy-terms">
                        <tr>
                            <td>
                                <div class="terms">
                                    구매하려는 상품이 맞습니다.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term1"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br>
                                <div class="line"></div>
                                <br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms">
                                    국내/해외에서 발매한 정품 · 새상품입니다.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term2"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다. 국내 발매 상품 여부는 확인드리지 않습니다.</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br>
                                <div class="line"></div>
                                <br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms">
                                    제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.
                                </div>
                            </td>
                            <th rowspan="3"><input type="checkbox" id="term3"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">박스/패키지와 상품 컨디션에 민감하시다면 검수 기준을 반드시 확인하시기 바랍니다.</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail"><a href="">검수기준 보기</a></div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br>
                                <div class="line"></div>
                                <br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms">
                                    KREAM의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.
                                </div>
                            </td>
                            <th rowspan="3"><input type="checkbox" id="term4"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail"><a href="">이용정책 보기</a></div>
                            </td>
                        </tr>
                    </table>
                </div>
                <br><br>
                <div align="center">
                    <button type="button" class="btn btn-outline-secondary">취소</button>
                    <button type="button" class="btn btn-outline-warning" id="goToBuyOption" disabled>다음단계</button>
                </div>
                <br><br>
            </div>

            <div class="buy-option" hidden>

                <div class="" align="center">
                    <div class="frame-wrap">
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-outline-warning">
                                <input type="radio" name="options" id="check1" value="buyB"> 구매입찰
                            </label>
                            <label class="btn btn-outline-warning">
                                <input type="radio" name="options" id="check2" value="buyI" checked> 즉시구매
                            </label>
                        </div>
                    </div>
                </div>
                <br><br>
                
                <div id="buy-immediately">
                    <div class="title">즉시 구매가</div>
                    <br>
                    <div class="buy-price"><input type="text" id="priceI" class="price" name="priceI" value="" readonly>원</div>
                    <br>
                    <div class="line"></div>
                    <br>
                    <div id="step">총 결제금액은 다음 화면에서 결제됩니다.</div>
                    <br>
                    <span id="total-price">총 결제금액</span>
                    <span id="next-page">다음 화면에서 확인</span>
                    <br>
                    <br><br>
                    <div align="center">
                        <button type="button" class="btn btn-outline-secondary">취소</button>
                        <button type="submit" class="btn btn-outline-warning">다음단계</button>
                    </div>
    
                </div>
                
                
    
                <!-- 구매 입찰 클릭 시 -->
                <div id="buy-bidding" hidden>
                    <div class="title">구매 희망가</div>
                    <br>
                    <div class="buy-price"><input type="text" id="priceB" class="price" name="priceB" placeholder="희망가격" value="">원</div>
                    <br>
                    <div class="line"></div>
                    <br>
                    <div id="step">총 결제금액은 다음 화면에서 결제됩니다.</div>
                    <br>
                    <span id="total-price">총 결제금액</span>
                    <span id="next-page">다음 화면에서 확인</span>
                    <br>
                    <br><br>
                    <div align="center">
                        <button type="button" class="btn btn-outline-secondary">취소</button>
                        <button type="submit" class="btn btn-outline-warning goToPayment" disabled>다음단계</button>
                    </div> 
                </div>
				
                <br><br>
            </div>
        
        </form>
    </div>
    <script>
        $(function(){
            var checkboxes = $("input[type='checkbox']");
                
            checkboxes.click(function(){
                if($("#term1").is(":checked") && $("#term2").is(":checked") 
                        && $("#term3").is(":checked") && $("#term4").is(":checked")){
                    $("#goToBuyOption").attr("disabled", false);
                } else{
                    $("#goToBuyOption").attr("disabled", true);
                }
            })

            $("#goToTerm").click(function(){
                $(".select-size").attr("hidden", true);
                $("#product-size").attr("hidden", false);
                $(".term").attr("hidden", false);
            })
            $("#check1").click(function(){
                $("#buy-immediately").attr("hidden", true);
                $("#buy-bidding").attr("hidden", false);
            })
            $("#check2").click(function(){
                $("#buy-immediately").attr("hidden", false);
                $("#buy-bidding").attr("hidden", true);
            })
            $("#priceB").on('input', function(){
                if($("#priceB").val() == ''){
                    $(".goToPayment").attr("disabled", true);
                } else{
                    $(".goToPayment").attr("disabled", false);
                }
            })
            $("#goToBuyOption").click(function(){
                $(".term").attr("hidden", true);
                $(".buy-option").attr("hidden", false);
            })

            $("#priceB").change(function(){
                let value = $("#priceB").val();
                let priceI = $("#priceI").val();
                value = value.replace(/[^0-9]/g,'');
                value = value.replace(/[^0-9]/g,'');
                priceI = priceI.replace(/[^0-9]/g,'');
                priceI = priceI.replace(/[^0-9]/g,'');
                if(parseInt(value) >= parseInt(priceI)){
                    value="";
                    $("#priceB").val(value);
                    $("#check2").click();
                }

                $("#priceB").val(value.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
            })
            
        })

        
    </script>
</body>
</html>