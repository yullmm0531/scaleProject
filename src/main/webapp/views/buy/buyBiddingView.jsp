<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.product.model.vo.*, java.util.ArrayList, com.scale.bidding.model.vo.Bidding, java.text.DecimalFormat, com.scale.policy.model.vo.*" %>
<% 
	Product p = (Product)request.getAttribute("p");
	ArrayList<Bidding> pList = (ArrayList<Bidding>)request.getAttribute("pList");
    Policy t = (Policy)request.getAttribute("t");
    Policy I = (Policy)request.getAttribute("i");
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
        .yellow{
        	color: rgb(234, 179, 29);
            font-size: 14px;
        }
        #priceI, #priceB{
        	font-style: italic;
        }
        .terms-detail span{
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
                alert("????????? ???????????? SHOP ?????????????????????.");
                location.href = "<%= contextPath %>";
            <% } %>
        })
    </script>
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
	                        <span id="product-size" name="size" hidden>?????????</span>
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
                                <input type='radio' name='size' value='?????????'>?????????
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
                                size += "<%= (pList.get(pList.size()-1)).getpSize() %>";
                                price += "<%= (pList.get(pList.size()-1)).getbPrice() %>";
                            <% } %>
                            
                            var sizeArr = size.split(", ");
                            var priceArr = price.split("/ ");
                            let index = "";
                            for(let i=0; i<pSizeArr.length; i++){
                                index = sizeArr.indexOf(pSizeArr[i]);
                                if(index != -1){
                                    sizeOption += "<label class='btn btn-outline-secondary'>"
                                        +       "<input type='radio' name='size' value='" + pSizeArr[i] + "'>" + pSizeArr[i] + "<br><span class='yellow'>" + toMoney(parseInt(priceArr[index])) + "???</span></label>";
                                } else{
                                    sizeOption += "<label class='btn btn-outline-secondary'>"
                                        +       "<input type='radio' name='size' value='" + pSizeArr[i] + "'>" + pSizeArr[i] + "<br><span class='yellow'>????????????</span></label>";
                                }
                                
                            }
                            $(".size-list").html(sizeOption);
        
                        })
                    </script>

                </div>
                <br>
                <div align="center">
                    <button type="button" data-dismiss="modal" class="btn btn-outline-secondary" onclick="history.back();">??????</button>
                    <button type="button" class="btn btn-outline-warning" id="goToTerm" disabled>????????????</button>
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
                                
                                $("#priceB").val(value.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // ???????????? ???????????? 3?????? ?????? , ?????? 
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
                                    ??????????????? ????????? ????????????.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term1"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">?????? ?????????, ????????????, ?????????, ?????????, ???????????? ??? ??? ??? ??????????????????.</div>
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
                                    ??????/???????????? ????????? ?????? ?? ??????????????????.
                                </div>
                            </td>
                            <th rowspan="2"><input type="checkbox" id="term2"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">?????? ???????????? ???????????????, ??? ?????? ???????????? ?????? ???????????????????????????. ?????? ?????? ?????? ????????? ??????????????? ????????????.</div>
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
                                    ??????????????? ???????????? ???????????? ?????? ????????? ????????? ???????????? ????????????.
                                </div>
                            </td>
                            <th rowspan="3"><input type="checkbox" id="term3"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">??????/???????????? ?????? ???????????? ?????????????????? ?????? ????????? ????????? ??????????????? ????????????.</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail"><span data-toggle="modal" data-target="#modal-i">???????????? ??????</span></div>
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
                                    SCALE??? ?????? ??????????????? ?????? ??????????????????, ????????? ???????????????.
                                </div>
                            </td>
                            <th rowspan="3"><input type="checkbox" id="term4"></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail">???????????? ????????? ????????? ?????? ????????? ???????????? ??? ?????????, ?????????, ???????????? ?????? ??????????????? ??????????????????.</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="terms-detail"><span data-toggle="modal" data-target="#modal-t">???????????? ??????</span></div>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- SCALE ????????? ???????????? -->
					<div class="modal" id="modal-t">
                        <div class="modal-dialog modal-dialog-scrollable">
                          <div class="modal-content">
                      
                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">SCALE ????????? ????????????</h4>
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


                <!-- ???????????? -->
					<div class="modal" id="modal-i">
                        <div class="modal-dialog modal-dialog-scrollable">
                          <div class="modal-content">
                      
                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">SCALE ????????????</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                      
                            <!-- Modal body -->
                            <% if(I != null) {%>
                               <div class="modal-body"><%= I.getPolicyContent() %></div>
                            <%}else{ %>
                               <div class="modal-body"><%= I.getPolicyContent() %></div>
                            <%} %>
                          </div>
                        </div>
                      </div>

                <br><br>
                <div align="center">
                    <button type="button" class="btn btn-outline-secondary" onclick="history.back();">??????</button>
                    <button type="button" class="btn btn-outline-warning" id="goToBuyOption" disabled>????????????</button>
                </div>
                <br><br>
            </div>

            <div class="buy-option" hidden>

                <div class="" align="center">
                    <div class="frame-wrap">
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-outline-warning">
                                <input type="radio" name="options" id="check1" value="buyB"> ????????????
                            </label>
                            <label class="btn btn-outline-warning">
                                <input type="radio" name="options" id="check2" value="buyI" checked> ????????????
                            </label>
                        </div>
                    </div>
                </div>
                <br><br>
                
                <div id="buy-immediately">
                    <div class="title">?????? ?????????</div>
                    <br>
                    <div class="buy-price"><input type="text" id="priceI" class="price" name="priceI" value="" readonly>???</div>
                    <br>
                    <div class="line"></div>
                    <br>
                    <div id="step">??? ??????????????? ?????? ???????????? ???????????????.</div>
                    <br>
                    <span id="total-price">??? ????????????</span>
                    <span id="next-page">?????? ???????????? ??????</span>
                    <br>
                    <br><br>
                    <div align="center">
                        <button type="button" class="btn btn-outline-secondary" onclick="history.back();">??????</button>
                        <button type="submit" class="btn btn-outline-warning">????????????</button>
                    </div>
    
                </div>
                
                
    
                <!-- ?????? ?????? ?????? ??? -->
                <div id="buy-bidding" hidden>
                    <div class="title">?????? ?????????</div>
                    <br>
                    <div class="buy-price"><input type="text" id="priceB" class="price" name="priceB" placeholder="????????????" value="">???</div>
                    <br>
                    <div class="line"></div>
                    <br>
                    <div id="step">??? ??????????????? ?????? ???????????? ???????????????.</div>
                    <br>
                    <span id="total-price">??? ????????????</span>
                    <span id="next-page">?????? ???????????? ??????</span>
                    <br>
                    <br><br>
                    <div align="center">
                        <button type="button" class="btn btn-outline-secondary" onclick="history.back();">??????</button>
                        <button type="submit" class="btn btn-outline-warning goToPayment" disabled>????????????</button>
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

                $("#priceB").val(value.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // ???????????? ???????????? 3?????? ?????? , ?????? 
            })
            
        })

        
    </script>
</body>
</html>