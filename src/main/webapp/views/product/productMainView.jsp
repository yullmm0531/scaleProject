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
            display:inline-block;
        }

        #pheader-1{height:20%; line-height:9px;}
        #pheader-2{height:60%;}
        #pheader-3{height:20%;}

        #pcontent-1{width:20%;}
        #pcontent-2{width:80%;}
        
		
		div.plist{
			display:inline-block;
		}
		
		ul.row{
			margin:0px;
		}
		
        .img-box > img {
            width:175px;
            display:block;
            float:left;
        }

        .row {
            margin:auto;
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
            width:70%;
            padding:10px;
            margin-top:20px;
            cursor:pointer;
            font-size:7px;
          	display:block;
        }
        
        .plist.row {
            margin:0 -10px;
        }
        
		.cell:hover{
	    	opacity: 0.7;
	    	cursor : pointer;
    	}
    	
    	#top{
    		float:right;
    	}
        
  </style>
</head>
<body>
	 <%@ include file="../common/menubar.jsp" %> 
	  <div class="pwrap">
        <div id="pheader">
            <div id="pheader-1">
            	<br>
                <button type="button" class="btn btn-secondary" id="topBtn" >신발</button>
                <button type="button" class="btn btn-secondary" id="topBtn1">지갑</button>
                <button type="button" class="btn btn-secondary" id="topBtn2">테크</button>
            </div>
            <div id="pheader-2">
            	
            	 <% for(Brand b : blist){ %>
         		 <div class="thumbnail-1" style="float:left;">
         		 		
                        <img src="<%= contextPath %>/<%= b.getBrandImg() %>" width="70" height="70">
                        <p align="center" ><%= b.getBrandName() %></p>
                      	
                 </div>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <% } %>
                  
            </div>
            <div id="pheader-3"></div>
        </div>
      

        <div id="pcontent">
            <div id="pcontent-1">
                 <span><h3>필터</h3></span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
                 <div class="category-box">
                    <li class="cate" style="cursor:pointer">
                        카테고리
                        <ul class="sub" style="display:none">
                        	<li><input type="radio" id="ckb" class="chk">전체</li>
                            <li><input type="radio" id="ckb1" class="chk">신발</li>
                            <li><input type="radio" id="ckb2" class="chk">지갑</li>
                            <li><input type="radio" id="ckb3" class="chk">테크</li>
                        </ul>
                    </li>
                    <li class="brand" style="cursor:pointer">
                        브랜드
                        <ul class="sub1" style="display:none">
                            <div id="b-box" style="overflow:auto; width:120px; height:100px">
                             <% for(Brand b : blist){ %>
                            <li><input type="radio" class="chk"><%= b.getBrandName() %></li>
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
                    <!-- 
                    <li class="price" style="cursor:pointer">
                        가격
                        <ul class="sub3" style="display:none">
                        	<li><input type="radio"  class="chk">전체</li>
                            <li><input type="radio"  class="chk">10만원이하</li>
                            <li><input type="radio"  class="chk">10만원~30만원이하</li>
                            <li><input type="radio"  class="chk">30만원~50만원이하</li>
                            <li><input type="radio"  class="chk">50만원이상</li>
                        </ul>
                    </li>
                     -->
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
                        <select name="sortlist" id="sort">
                            <option value="popular">인기순</option>
                            <option value="newest" onclick="location.href='<%= contextPath %>/psort.pd'">최신순</option>
                            
                        </select>
                    </div>
                </div>

                <div id="plist">
                   
                </div>
                
                <button id="top" class="btn btn-primary">TOP ^</button>
                
                
            </div>
        </div>

        <div id="pfooter"> </div>

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
                $("#ckb1").attr("checked", "checked");
            });
            $("#topBtn1").click(function(){
                let check = $("ckb1").is(":checked");
                $("#ckb2").attr("checked", "checked");
            });
            $("#topBtn2").click(function(){
                let check = $("ckb2").is(":checked");
                $("#ckb3").attr("checked", "checked");
            });
        });
        
        $("#top").click(function(){
            window.scrollTo({ top: 0 });
        })
        
    </script>

    
    <!-- 무한스크롤 -->
    <script>
    	let cpage = 0;
    	$(function(){
    		$(window).scroll();
    	})
    	
    	$(window).scroll(function(){
    		if($(window).scrollTop() + $(window).height() == $(document).height()){
    			cpage++;
    			ProductList();
    		} 
    	});
    	
    	function ProductList(){
    		$.ajax({
    			url:"<%= contextPath%>/productList.pd",
    			type:"get",
    			data:{"cpage":cpage},
    			success:function(pl){
    				let list = pl.list;
    				let clickLike = pl.clickLike;
    				
    				let value = "";
                    for(let i =0; i<list.length; i++){
                        value = "<div class='plist'>"
                            		+"<ul class ='row'>"
                           			 +"<li class='cell'>"
                             		 +"<input type='hidden' class='pNo' value='"+ list[i].productCode +"'>"
                             		 +"<input type='hidden' value='"+ list[i].productCategory+"'>"
                                	 +"<div class='img-box'><img src='<%= contextPath %>/"+ list[i].productImgM +"'></div>"
                                   
                                	 + "<div class='brand-name'>" + list[i].brandName + "</div>"
                                	 +  "<div class='product-name-eng'>" + list[i].productNameEng + "</div>"
                                	 +  "<div class='product-name-ko'>" + list[i].productNameKo + "</div>"
                                 	
                                     + "<div class='like'>";
                           if(clickLike[i] == 0){
                                       value += "<a class='heart'>♡</a>"
                                    	+ "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
                                			 + "<span>" + list[i].count + "</span>"
                                  } else {
                                           value += "<a class='heart'>♥</a>"
                                        	   value +=  "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
                                    			 + "<span>" + list[i].count + "</span>"
                                  }     
                                           
                                   + "</div>"
                                           
                              +"</li>"
                           + "</ul>"
                       + "</div>";
                        $("#plist").append(value);
                       }
                                    
                    },	
    			
                    error:function(){
                        console.log("fail");
                    }
    				
    		})
    	}
    	
        
	 
    <!-- Like -->

    	$(document).on("click", ".heart", function(){
    		let e = $(this);
            let like = e.text();
         
    			<% if(loginUser == null) { %>
	                alert("로그인 후 이용가능한 페이지입니다.");
	                location.href = "<%= contextPath %>/loginForm.us";
            	<% } else { %>
                	let userNo = <%= loginUser.getUserNo() %>;
    			$.ajax({
    			    url: "plike.pd",
    			    data: {"userNo":userNo, "productCode":$(this).next().val()}, 
    			    success:function(result){
    			    	if(like == "♡"){
    			    		e.text("♥")
    			    		e.next().next().text(Number(e.next().next().text()) + 1);
    			    		
    			    	}else{
    			    		e.text("♡")
    			    		e.next().next().text(Number(e.next().next().text()) - 1);
    			    	}
    			    },   
    			    error:function (){  
    			      alert("실패");                  
    			    }
    			  })
    		<% } %>
    		})
    		
    </script>
    
    <script>
    
    	$(document).on("click", ".cell", function(){
    		location.href = "<%= contextPath %>/detail.pd?co=" + $(this).children().eq(0).val();
    	})
				
	</script>
    
	<!-- 클릭 -->    
    <script>
		$(function(){
			
			$(".btn btn-secondary").on('click', function(){
				$.ajax({
					url: "<%= contextPath%>/productList.pd",
					type:"post",
					data:{"cpage":cpage, "filter":filter
					},
					success : function(pl){
	    				let list = pl.list;
	    				let filter = pl.filter;
	    				let value = "";
	    				
	    				
	    				
	                    for(let i =0; i<list.length; i++){
	                        value = "<div class='plist'>"
	                            		+"<ul class ='row'>"
	                           			 +"<li class='cell'>"
	                             		 +"<input type='hidden' value='"+ list[i].productCode +"'>"
	                             		 
	                             		for(let j=0; j<list.length; j++){{
	        		    					switch(list[j].filter){
	        		    					case "Shoes" : list[j].filter = "Shoes" ; break;
	        		    					case "Wallet" : list[j].filter = "Wallet" ; break;
	        		    					case "Tech" : list[j].filter = "Tech" ; break;
	        	    					}
	        	    				}
	                               value += "<input type='hidden' value='"+ list[j].productCategory+"'>"
	                                	 +"<div class='img-box'><img src='<%= contextPath %>/"+ list[i].productImgM +"'></div>"
	                                   
	                                	 + "<div class='brand-name'>" + list[i].brandName + "</div>"
	                                	 +  "<div class='product-name-eng'>" + list[i].productNameEng + "</div>"
	                                	 +  "<div class='product-name-ko'>" + list[i].productNameKo + "</div>"
	                                 	
	                                     + "<div class='like'>";
	                           if(clickLike[i] == 0){
	                                       value += "<a class='heart'>♡</a>"
	                                    	+ "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
	                                			 + "<span>" + list[i].count + "</span>"
	                                  } else {
	                                           value += "<a class='heart'>♥</a>"
	                                        	   value +=  "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
	                                    			 + "<span>" + list[i].count + "</span>"
	                                  }     
	                                           
	                                   + "</div>"
		                                           
		                              +"</li>"
		                           + "</ul>"
		                       + "</div>";
	                    	}
	                        $("#plist").append(value);
	                       }
	                    },
					error : function(data){
						alert('error');
					}
				})
			})
		})
    
    </script>
    
    <script>
                
		$(function(){
			$("#cell").click(function(){
			location.href = "<%=contextPath%>/detail.pd?co=" + $(this).children('input').val();
			})
		})
		
	</script>

    
</body>
</html>