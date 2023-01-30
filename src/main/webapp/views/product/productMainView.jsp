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
            height:1000px;
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
	                            <div class="p-like" id = "like"><a href="">♡</a></div>
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
    
    <!-- 필터 클릭 버튼  -->
    <script>
		$(function(){
			$(".chk").click(function(){
	    		$(".shbtn").show()
	    	});
			
		});
    </script>

    <!-- 모두 지우기(체크박스 해제) -->
    <script>
    	$(function(){
    		
    	})
    </script>
    
    <!-- 무한스크롤 -->
    <script>
	
    $(function(){
    	 var intersectionObserver = new IntersectionObserver(function(entries) {
       	  // If intersectionRatio is 0, the target is out of view
       	  // and we do not need to do anything.
       	  if (entries[0].intersectionRatio <= 0) return;

       	  loadItems(12);
       	  console.log('Loaded new items');
       	});
       	// start observing
       	intersectionObserver.observe(document.querySelector('.scrollerFooter'));

       	const io = new IntersectionObserver((entries, observer) => {
       		entries.forEach(entry => {
       		  if (!entry.isIntersecting) return; 
       			//entry가 interscting 중이 아니라면 함수를 실행하지 않습니다.
       		  if (page._scrollchk) return;
       			//현재 page가 불러오는 중임을 나타내는 flag를 통해 불러오는 중이면 함수를 실행하지 않습니다.
       	    observer.observe(document.getElementById('sentinel'));
       			//observer를 등록합니다.
       	    page._page += 1;
       			//불러올 페이지를 추가합니다.
       	    page.list.search();
       			//페이지를 불러오는 함수를 호출합니다.
       		});
       	});

       	io.observe(document.getElementById('sentinel'));
       	
       	$.ajax({
       		url: "/scale/plist.pd",
       		method: "GET",
       		dataType: "json",
       		success: function (result) {
       		  console.log(result);
       		},
       		error: function (err) {
       		  console.log(err);
       		},
       		beforeSend: function () {
       	    _scrollchk = true; 
       			//데이터가 로드 중임을 나타내는 flag입니다.
       			document.getElementById('list').appendChild(skeleton.show());
       			//skeleton을 그리는 함수를 이용해 DOM에 추가해줍니다.
       	    $(".loading").show();
       			//loading animation을 가진 요소를 보여줍니다.
       		},
       		complete: function () {
       	    _scrollchk = false;
       			//데이터가 로드 중임을 나타내는 flag입니다.
       	    $(".loading").hide();
       	    skeleton.hide();
       			//loading animation 요소와 skeleton을 지우는 함수를 이용해 DOM에서 지워줍니다.
       		}
       	});
	});
    
    
   		
    
    </script>
    
    
    
    <!-- Like -->
    <script>
	    $(function like(){
	  	  $.ajax({
			    url: "/scale/plist.pd",
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    data: $('#like_form').serialize(), 
			    success: 
			    function(data){      					
			    	alert("'좋아요'가 반영되었습니다!") ;  
	                $("#like_result").html(data.like); 
			    },   
			    
			    error: 
			    function (request, status, error){  
			      alert("ajax실패")                  
			    }
			  });
	}
    
    
    </script>
    
    
    
    
</body>
</html>