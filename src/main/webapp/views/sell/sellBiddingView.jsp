<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        #sizes label{
            width: 150px;
        }
        .outer{width: 600px; margin: auto; border: 1px solid gray; background-color: whitesmoke;}
        .product-info{height: 180px; padding-left: 30px; padding-top: 15px;}
        .product-info img{width: 150px;}
        #product-brand{font-weight: bold;}
        #product-eng-name{font-size: 14px;}
        #product-kor-name{
            font-size: 14px;
            color: gray;
        }
        .sell-terms, .total-price-info{
            padding-left: 50px;
        }
        .terms{width: 450px;}
        .terms-detail{
            width: 450px;
            font-size: 12px;
        }
        .sell-terms th{
            width: 30px;
            text-align: right;
        }
        .sell-terms td{font-size: 15px;}
        .btn-group{
            width: 80%;
        }
        #sell-immediately, #sell-bidding{
            font-weight: bold;
        }
        .title{
            padding-left: 60px;
            font-size: 20px;
        }
        .sell-price{
            padding-left: 400px;
            font-size: 25px;
            font-style: italic;
        }
        .price{
            width: 110px;
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
        <form action="">
            <div class="product">
                <div class="product-info row">
                    <div class="product-img col-sm-4">
                        <img src="<%= contextPath %>/resources/images/product/nike1.png" alt="">
                    </div>
                    <div class="product-name col-sm-8">
                        <br>
                        <span id="product-brand">NIKE</span><br>
                        <span id="product-eng-name">(W) Nike Dunk Low Wolf Grey Rosewood</span><br>
                        <span id="product-kor-name">(W) 나이키 덩크 로우 울프 그레이 로즈우드</span> <br>
                        <span id="product-size" name="size" hidden>사이즈</span>
                    </div>
                </div>
                <div class="line"></div>
                <br><br>
            </div>

            <div class="select-size">
                <div class="size-chart">
                    <div id="sizes">
                        <div class="btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="size" value="사이즈">사이즈
                            </label>
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="size" value="사이즈">사이즈
                            </label>
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="size" value="사이즈">사이즈
                            </label>
                            <br><br>
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="size" value="사이즈">사이즈
                            </label>
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="size" value="사이즈">사이즈
                            </label>
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="size" value="사이즈">사이즈
                            </label>
                            <br><br>
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="size" value="사이즈">사이즈
                            </label>
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="size" value="사이즈">사이즈
                            </label>
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="size" value="사이즈">사이즈
                            </label>

                        </div>
                    </div>
                    
                </div>
                <br>
                <div align="center">
                    <button type="button" data-dismiss="modal" class="btn btn-outline-secondary">취소</button>
                    <button type="button" class="btn btn-outline-success" id="goToTerm" disabled>다음단계</button>
                </div>
                
                <br><br>
            </div>

            <script>
                
                $(function(){
                    var size = $(".size-chart input");
                    let flag = true;
                    size.change(function(){
                        for(let i=0; i<size.length; i++){
                            if(size[i].checked == true){
                                flag = false;
                            }
                        }
                        $("#goToTerm").attr("disabled", flag);
                    })
                })
            </script>
                

            <div class="term" hidden>
                <div class="sell-terms">
                    <table id="sell-terms">
                        <tr>
                            <td>
                                <div class="terms">
                                    판매하려는 상품이 맞습니다.
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
                                <div class="terms-detail">모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다. 손상/오염/사용감 있는 상품은 판매가 불가능합니다.</div>
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
                                    박스/패키지의 상태를 확인합니다.
                                </div>
                            </td>
                            <th rowspan="3"><input type="checkbox" id="term3"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">박스/패키지 상태에 따른 검수 기준을 확인했습니다.</div>
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
                                    이중 포장하여 선불 발송합니다.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term4"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">반드시 이중 포장하여 택배 상자에 담아 선불 발송합니다. 합배송은 권장하지 않으며 이로 인한 박스/패키지 훼손은 판매자의 책임입니다.</div>
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
                                    KREAM의 최신 이용정책을 모두 확인하였으며, 판매를 계속합니다.
                                </div>
                            </td>
                            <th rowspan="3"><input type="checkbox" id="term5"></th>
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
                    <button type="button" class="btn btn-outline-success" id="goToBuyOption" disabled>다음단계</button>
                </div>
                <br><br>
            </div>

            <div class="sell-option" hidden>

                <div class="" align="center">
                    <div class="frame-wrap">
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-outline-success">
                                <input type="radio" name="options" id="check1" value="sellB"> 판매입찰
                            </label>
                            <label class="btn btn-outline-success">
                                <input type="radio" name="options" id="check2" value="sellI" checked="checked"> 즉시판매
                            </label>
                        </div>
                    </div>
                </div>
                <br><br>
                
                <div id="sell-immediately">
                    <div class="title">즉시 판매가</div>
                    <br>
                    <div class="sell-price"><input type="text" id="priceI" class="price" name="priceI" value="203000">원</div>
                    <br>
                    <div class="line"></div>
                    <br>
                    <div id="step">총 정산금액은 다음 화면에서 확인가능합니다.</div>
                    <br>
                    <span id="total-price">총 정산금액</span>
                    <span id="next-page">다음 화면에서 확인</span>
                    <br>
                    <br><br>
                    <div align="center">
                        <button type="button" class="btn btn-outline-secondary">취소</button>
                        <button type="submit" class="btn btn-outline-success">다음단계</button>
                    </div>
    
                </div>
                
                
    
                <!-- 구매 입찰 클릭 시 -->
                <div id="sell-bidding" hidden>
                    <div class="title">판매 희망가</div>
                    <br>
                    <div class="sell-price"><input type="text" id="priceB" class="price" name="priceB" placeholder="희망가격">원</div>
                    <br>
                    <div class="line"></div>
                    <br>
                    <div id="step">총 정산금액은 다음 화면에서 확인가능합니다.</div>
                    <br>
                    <span id="total-price">총 정산금액</span>
                    <span id="next-page">다음 화면에서 확인</span>
                    <br>
                    <br><br>
                    <div align="center">
                        <button type="button" class="btn btn-outline-secondary">취소</button>
                        <button type="submit" class="btn btn-outline-success goToPayment" disabled>다음단계</button>
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
                        && $("#term3").is(":checked") && $("#term4").is(":checked") && $("#term5").is(":checked")){
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
                $("#sell-immediately").attr("hidden", true);
                $("#sell-bidding").attr("hidden", false);
            })
            $("#check2").click(function(){
                $("#sell-immediately").attr("hidden", false);
                $("#sell-bidding").attr("hidden", true);
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
                $(".sell-option").attr("hidden", false);
            })
            
        })

        
    </script>

</body>
</html>