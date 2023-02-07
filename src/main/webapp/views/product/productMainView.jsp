<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.scale.product.model.vo.*"%>
    
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	ArrayList<Brand> blist = (ArrayList<Brand>)request.getAttribute("blist");
	ArrayList<Like> likeList = (ArrayList<Like>)request.getAttribute("likeList");
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
        .product-name-ko, .product-name-eng{
    		width:170px;
    	}
    	
    	.brandN{
    		width:70px;
    		font-size:10px;
    	}
        .thumbnail-1{
            display:inline-block;
            margin:5px;
        }

        .like{
        	font-size:15px;
        }
        
        .bannerimg{
            box-sizing:border-box;
            width:100%;
            height:600px;
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
	  <div class="pwrap">
        <div id="pheader">
            <div id="pheader-1">
            	<br>
                <button type="button" class="btn btn-secondary topBtn" id="topBtn" >신발</button>
                <button type="button" class="btn btn-secondary topBtn" id="topBtn1">지갑</button>
                <button type="button" class="btn btn-secondary topBtn" id="topBtn2">테크</button>
            </div>
            <div id="pheader-2">
            	
            	 <% for(Brand b : blist){ %>
         		 <div class="thumbnail-1" >
         		 	<table>
         		 		<tr>
         		 		<td>
                        	<img src="<%= contextPath %>/<%= b.getBrandImg() %>" width="70" height="70" style="box-sizing:border-box">
                        </td>
                      	</tr>
                      	<tr>
                      	 <td>
                        	 <div align="center" class="brandN" ><%= b.getBrandName() %></div>
                        </td>
                        </tr>
                     </table>
                 </div>
                 <% } %>
                  
            </div>
            <div id="pheader-3"></div>
        </div>
      

        <div id="pcontent">
            <div id="pcontent-1" style="margin-top:60px">
                 <div class="banner">
                    <image src="resources/images/banner1.jpg" class="bannerimg"></image>
                </div>
            </div>
            <div id="pcontent-2">
                <div id="psort">
                    <span class="btnBox" id="btnBox">
                        <button id="cbtn" style="display:none;" class="shbtn">카테고리</button>
                        <button id="bbtn" style="display:none;" class="shbtn">브랜드</button>
                        <button id="sbtn" style="display:none;" class="shbtn">사이즈</button>
                    </span>
                    
                    <div class="sortbar" align="right"> 
                        <select name="sortlist" id="sort">
                            <option value="popular" class="popular">인기순</option>
                            <option value="newest" class="newest" >최신순</option>
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
                    let userLike = pl.userLike;
                    console.log(list);
    				console.log(clickLike);
                    console.log(userLike);
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
                            value += "<a class='heart'>♡</a>"
                                    	+ "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
                                			 + "<span>" + list[i].count + "</span>"

                               /* 
                           if(clickLike[i] == 0){
                                       
                                  } else {
                                           value += "<a class='heart'>♥</a>"
                                        	   value +=  "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
                                    			 + "<span>" + list[i].count + "</span>"
                                  }     */
                                          
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
    			    data: {"userNo":userNo, "pCode":$(this).next().val()}, 
    			    success:function(countLike){
    			    	if(like == "♡"){
    			    		e.text("♥")
    			    		e.next().next().text(countLike + 1);
    			    		
    			    	}else{
    			    		e.text("♡")
    			    		e.next().next().text(countLike - 1);
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
    	
        // 최신순, 인기순 정렬 
    	$("#sort").change(function(){
            let sortFilter = $(this).val();
        	// location.href = "<%= contextPath %>/psort.pd?sortFilter=" + sortFilter; 
            cpage = 1;
            $.ajax({
    			url:"<%= contextPath%>/psort.pd",
    			type:"get",
    			data:{"cpage":cpage, "sortFilter":sortFilter},
    			success:function(pl){
    				 $("#plist").empty();
    				let list = pl.list;
    				let clickLike = pl.clickLike;
                    let userLike = pl.userLike;
                    
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
                            value += "<a class='heart'>♡</a>"
                                    	+ "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
                                			 + "<span>" + list[i].count + "</span>"

                               /* 
                           if(clickLike[i] == 0){
                                       
                                  } else {
                                           value += "<a class='heart'>♥</a>"
                                        	   value +=  "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
                                    			 + "<span>" + list[i].count + "</span>"
                                  }     */
                                          
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
            
        )
    	
	</script>
    
	<!-- 카테고리 -->    
   
    <script>

            $(".topBtn").click(function(){
                let filter = $(this).text();
                switch(filter){
                    case "신발": filter = "Shoes"; break;
                    case "지갑": filter = "Wallet"; break;
                    case "테크": filter = "Tech"; break;
                }
                $.ajax({
					url: "<%= contextPath%>/filter.pd",
					type:"get",
					data:{"cpage":cpage, "filter":filter
					},
					success : function(pl){
                        $("#pcontent-2").empty();
	    				let list = pl.list;
	    				let filter = pl.filter;
	    				let value = "";
                        let clickLike = pl.clickLike;
	    				
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
                            value += "<a class='heart'>♡</a>"
                                    	+ "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
                                			 + "<span>" + list[i].count + "</span>"

                               /* 
                           if(clickLike[i] == 0){
                                       
                                  } else {
                                           value += "<a class='heart'>♥</a>"
                                        	   value +=  "<input type='hidden' class='productCode' value='" + list[i].productCode + "'>"
                                    			 + "<span>" + list[i].count + "</span>"
                                  }     */
                                          
                                   + "</div>"
                                           
                              +"</li>"
                           + "</ul>"
                       + "</div>";
                        $("#pcontent-2").append(value);
                       }
	                    
	                }, error : function(data){
						alert('error');
					}
                })
            })
            
		
		
	</script>

    
</body>
</html>