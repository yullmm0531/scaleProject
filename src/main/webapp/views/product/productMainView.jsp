<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.scale.product.model.vo.*"%>
    
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	ArrayList<Brand> blist = (ArrayList<Brand>)request.getAttribute("blist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style>
        div *{
            box-sizing: border-box;
            margin:auto;
          
        }

		ul, li {  
		list-style:none;
  	 	padding-left:0px;
  	 	}
  	 	
        .pwrap{
            width:1200px;
            
            margin:auto;
        }
        .pwrap>div{width:100%;}

        #pheader{height:30%;}
        #pcontent{height:60%;}
        #pfooter{height:10%;}

        #pheader>div{
           width:100%;
           float:left;
        }
		
        #pcontent>div{
            height:100%;
            float:left;
        }

        #pheader-1{height:20%; line-height:10px;}
        #pheader-2{height:60%;}
        #pheader-3{height:20%;}

        #pcontent-1{width:20%;}
        #pcontent-2{width:80%;}

        .img-box > img {
            width:175px;
            display:block;
            
        }
        .row::after {
            content:"";
            display:block;
            clear:both;
        }
        .cell {
            float:left;
            box-sizing:border-box
        }
        .cell {
            width:20%;
            padding:0 10px;
            margin-top:20px;
            cursor:pointer;
        }
        .listbox .row {
            margin:0 -10px;
        }
        .listbox.cell > .prod-name, .list-box-1 .cell > .prod-price {
            text-align:center;
            font-weight:bold;
            margin-top:5px;
        }
		.cell:hover{
    	opacity: 0.7;
    	cursor : pointer;
    	}
        
  </style>
</head>
<body>
	 <%@ include file="../common/menubar.jsp" %> 
	  <div class="pwrap">
        <div id="pheader">
            <div id="pheader-1">
            	<br>
                <button type="button" class="btn btn-secondary" id="topBtn">신발</button>
                <button type="button" class="btn btn-secondary" id="topBtn1">지갑</button>
                <button type="button" class="btn btn-secondary" id="topBtn2">테크</button>
            </div>
            <div id="pheader-2">
            	
            	 <% for(Brand b : blist){ %>
         		 <div class="thumbnail-1" style="float:left;">
         		 		
                        <img src="<%= contextPath %>/<%= b.getBrandImg() %>" width="70" height="77">
                        <p><%= b.getBrandName() %></p>
                        	
                 </div>
                 <% } %>
                  
            </div>
            <div id="pheader-3">
            
                <img src="" alt="">배너
                   
            </div>
        </div>
      

        <div id="pcontent">
            <div id="pcontent-1">
                 <span><h3>필터</h3></span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <span id="eraser"><u>모두지우기</u></span>
                 <div class="category-box">
                    <li class="cate" style="cursor:pointer">
                        카테고리
                        <ul class="sub" style="display:none">
                            <li><input type="checkbox" id="ckb" class="chk">신발</li>
                            <li><input type="checkbox" id="ckb1" class="chk">지갑</li>
                            <li><input type="checkbox" id="ckb2" class="chk">테크</li>
                        </ul>
                    </li>
                    <li class="brand" style="cursor:pointer">
                        브랜드
                        <ul class="sub1" style="display:none">
                            <div id="b-box" style="overflow:auto; width:120px; height:100px">
                             <% for(Brand b : blist){ %>
                            <li><input type="checkbox" class="chk"><%= b.getBrandName() %></li>
                             <% } %>
                            </div>
                        </ul>
                    </li>
                    <li  class="size" style="cursor:pointer">
                        사이즈
                        <ul class="sub2" style="display:none">
                            <li><button>220</button><button>225</button><button>230</button></li>
                            <li><button>235</button><button>240</button><button>245</button></li>
                            <li><button>250</button><button>255</button><button>260</button></li>
                            <li><button>265</button><button>270</button><button>275</button></li>
                            <li><button>280</button><button>285</button><button>290</button></li>
                            <li><button>295</button><button>300</button></li>
                        </ul>
                    </li>
                    <li class="price" style="cursor:pointer">
                        가격
                        <ul class="sub3" style="display:none">
                            <li><input type="checkbox"  class="chk">10만원이하</li>
                            <li><input type="checkbox"  class="chk">10만원~30만원이하</li>
                            <li><input type="checkbox"  class="chk">30만원~50만원이하</li>
                            <li><input type="checkbox"  class="chk">50만원이상</li>
                        </ul>
                    </li>
                </div>
            </div>
            <div id="pcontent-2">
                <div id="psort">
                    <span class="btnBox" id="btnBox">
                        <button id="cbtn" style="display:none;" class="shbtn">카테고리</button>
                        <button id="bbtn" style="display:none;" class="shbtn">브랜드</button>
                        <button id="sbtn" style="display:none;" class="shbtn">사이즈</button>
                        <button id="phbtn" style="display:none;" class="shbtn">가격</button>
                        
                    </span>
                    <div class="sortbar" align="right"> 
                        <select name="sort" id="sort">
                            <option value="popular">인기순</option>
                            <option value="newest">최신순</option>
                        </select>
                    </div>
                </div>

                <div id="plist">
                    <ul class="row">
                        <% for(Product p : list){ %>
	                        <li class="cell">
	                        	<input type="hidden" value="<%= p.getProductCode() %>">
	                            <div class="img-box">
	                                <img src="<%= contextPath %>/<%= p.getProductImgM() %>">
	                            </div>
	                            
	                            <div class="brand-name"><%= p.getBrandName() %></div>
	                            <div class="product-name-eng"><%= p.getProductNameEng() %> </div>
	                            <div class="product-name-ko"><%= p.getProductNameKo() %> </div>
	                            <div class="product-price">즉시구매가</div>
	                            <div class="p-like" id = "like">♡</div>
	                        </li>
                        <% } %>

                    </ul>
                </div>
                
                <script>
					$(function(){
						$(".cell").click(function(){
							location.href = "<%=contextPath%>/detail.pd?co=" + $(this).children('input').val();
						})
					})
				</script>
                
                
            </div>
        </div>

        <div id="pfooter">
           
        </div>

    </div>

    <!-- 필터바 -->
    <script>
        $(".cate").click(function(){
            if($(".sub").is(":visible")){
                $(".sub").slideUp();
            }else{
                $(".sub").slideDown();
            }
        })
        $(".brand").click(function(){
            if($(".sub1").is(":visible")){
                $(".sub1").slideUp();
            }else{
                $(".sub1").slideDown();
            }
        })
        $(".size").click(function(){
            if($(".sub2").is(":visible")){
                $(".sub2").slideUp();
            }else{
                $(".sub2").slideDown();
            }
        })
        $(".price").click(function(){
            if($(".sub3").is(":visible")){
                $(".sub3").slideUp();
            }else{
                $(".sub3").slideDown();
            }
        })
    </script>

    <!-- 탑버튼 -->
    <script>
        $(function(){
            $("#topBtn").click(function(){
                let check = $("ckb").is(":checked");
                $("#ckb").attr("checked", "checked");
            });
            $("#topBtn1").click(function(){
                let check = $("ckb1").is(":checked");
                $("#ckb1").attr("checked", "checked");
            });
            $("#topBtn2").click(function(){
                let check = $("ckb2").is(":checked");
                $("#ckb2").attr("checked", "checked");
            });
        });
    </script>
    
    <!-- 필터  -->
    <script>
	
	
	
    
    </script>

    <!-- 필터 모두 해제 -->
    <script>
    	
    </script>
    
    <!-- 무한스크롤 -->
    <script>
         $(document).ready(function() {      
            $('.carousel').carousel('pause');
        });


    	let cpage = 0;
    	$(function(){
    		$(window).scroll();
    	})
    	
    	$(window).scroll(function(){
    		if($(window).scrollTop() + $(window).height() == $(document).height(){
    			cpage++;
    			ProductList();
    		} 
    	});
    	
    	function ProductList(){
    		$.ajax({
    			url"<%= contextPath%>/productList.pd",
    			type:"get",
    			data:{"cpage":cpage, "userNo":userNo},
    			success:function(pl){
    				let list = pl.list;
    				let checkLike = pl.chechLike;
    				
    				let value = "";
                    for(let i =0; i<list.length; i++){
                        value = "<table class='set'>"
                                +"<tr>"
                                    +"<td colspan='2' class='style-img'>"
                                        +"<div id='demo"+ i + (12 * (cpage -1)) + "'class='carousel '>"
                                            +"<div class='carousel-inner' data-interval='false'>";

                                                value += "</div>"
                                                    + "<a class='carousel-control-prev' href='#demo" +  i + (12 * (cpage - 1)) + "' data-slide='prev'>"
                                                    + "<span class='carousel-control-prev-icon'></span>"
                                                    + "</a>"
                                                    + "<a class='carousel-control-next' href='#demo" + i + (12 * (cpage - 1)) + "' data-slide='next'>"
                                                    + "<span class='carousel-control-next-icon'></span>" 
                                                    + "</a>"
                                                + "</div>"
                                            + "</td>"
                                        + "</tr>"
                                        + "<tr>"
                                            + "<td class='like'>";
                                    /*if(clickLike[i] == 0){
                                                value += "<a class='btn smile'>🤍</a>"
                                                } else {
                                                    value += "<a class='btn smile'>❤</a>"
                                                }     
                                                    value += "<input type='hidden' class='styleNo' value='" + list[i].styleNo + "'>"
                                                            + "<span>" + list[i].count + "</span>"
                                                        + "</td>"
                                                    + "</tr>"
                                                    + "<tr>"
                                                        + "<td colspan='2' class='tag-area'>"
                                                            + "<div class='text'>"; 
                                }*/
                                    
                    },
                    error:function(){
                        console.log("fail");
                    }
    				
    		})
    	}
	    
    </script>
    
    
    
    <!-- Like -->
    <script>
    	$(function(){
    		$("#like").click(function(){
    			<% if(loginUser == null) { %>
	                alert("로그인 후 이용가능한 페이지입니다.");
	                location.href = "<%= contextPath %>/loginForm.us";
            	<% } else { %>
                	let userNo = <%= loginUser.getUserNo() %>;
    			$.ajax({
    			    url: "/plike.pd",
    			    type: "POST",
    			    dataType: "json",
    			    data: {"userNo":userNo, "productCode":$(this).next().val()}, 
    			    success:function(result){
    			    	if(result == "♡"){
    			    		e.text("♥")
    			    		alert("'좋아요'가 반영되었습니다!");
    			    		e.next().next().text(Number(e.next().next().text()) + 1);
    			    	}else{
    			    		e.text("♡")
    			    		alert("'좋아요'가 취소되었습니다!");
    			    		e.next().next().text(Number(e.next().next().text()) - 1);
    			    	}
    			    	 
    	                
    			    },   
    			    
    			    error:function (result){  
    			      alert("실패");                  
    			    }
    			  })
    			<% } %>
    		})
    		
    	})
	  	  
	
    
    
    </script>
    
    
    
    
</body>
</html>