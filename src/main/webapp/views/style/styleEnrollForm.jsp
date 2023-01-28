<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.scale.product.model.vo.Product, java.util.ArrayList" %>
<%
	ArrayList<Product> listAll = (ArrayList<Product>)request.getAttribute("listAll");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>form>table{width: 1000px;}

    #style-box{
        width: 300px;
        height: 300px;
        border: 1px solid lightgray;
    }
    #styleImg{
        width: 300px;
        height: 300px;
        box-sizing: border-box;
    }

    #input-td{height: 70px; padding: 15px;}
    #content-td, #hashtag-td{border-top: 2px solid lightgray;}

    #thumbnail-td{
        width: 700px;
        height: 300px;
    }
    #input-box{
        width: 660px; 
        height: 300px;
        box-sizing: border-box;
        border: 1px solid lightgray;
        margin-left: 15px;
        text-align: center;
        padding-top: 26px;
    }
    .thumbnail-box{
        width: 110px;
        height: 110px;
        position: relative;
        display: inline-block;
        text-align: center;
        border: 5px dotted lightgray;
        margin: 5px;
    }
    .thumbnail{
        width: 100%;
        height: 100%;
        box-sizing: border-box;
    }
    .delete-btn{
        width: 20px;
        height: 20px;
        position: absolute;
        font-size: 15px;
        right: 0px;
        top: 0px;
        background-color: none;
        text-align: center;
        display: none;
    }
    .delete-btn:hover{
        cursor: pointer;
    }

    #search{
        width: 1000px;
        height: 70px;
    }

    #pd-thumbnail-td{
        width: 1000px;
        height: 0px;
    }

    #hashtag{
        width: 1000px;
        height: 100px;
    }

    #search-input{
        width: 465px;
        margin: 10px;
        border: 1px solid lightgray;
        border-radius: 0.3em;
        padding-left: 5px;
    }
    #search-input:focus {outline: none;}
    #pd-box{
        overflow: auto; 
        width: 480px;
        height: 400px;
    }
    #pd-box>div{
        margin-top: 20px;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
    }
    .pd-img{
    	width: 80px;
    	height: 80px;
    }
    .brand{
        font-size: 15px;
        font-weight: bold;
    }
    .name-ko, .name-eng{
        font-size: 12px;
    }
    .brand, .name-ko, .name-eng{
    	width: 320px;
    	height: 20px;
    	margin-left: 10px;
    	text-overflow:ellipsis; 
    	overflow:hidden;
    	white-space:nowrap;
    }
    .pd{width: 420px; margin: 15px;}
    .text{
    	 width: 340px;
    	 height: 26px;
    }
    .pd:hover{cursor: pointer;}
    .pd-thumbnail{
        display: inline-block;
        list-style-type : none;
        padding: 0px;
        width: 100px;
        height: 160px;
        margin-right: 5px;
        position: relative;
    }
    .pd-thumbnail img{
        width: 100px;
        height: 100px;
        box-sizing: border-box;
    }
    .delete-pd{
        position: absolute;
        font-size: 10px;
        top: 5px;
        right: 5px;
    }
    .delete-pd:hover{cursor: pointer;}
    .li-brand, .li-ko, .li-eng{
        height: 20px;
        font-size: 12px;
        font-weight: bold;
        text-overflow:ellipsis; 
    	overflow:hidden;
    	white-space:nowrap;
    }

    #content{
        width: 1000px;
        height: 200px;
        margin-top: 10px;
    }
    #content:focus {outline:none;}

    #tag-box{margin-top: 10px;}
    #tag-input{
        margin-left: 5px;
        border: 1px solid gray;
        border-radius: 0.3em;}
    #tag-input:focus{outline: none;}
    #tag-list{
        margin-top: 10px;
        height: 30px;
        list-style-type : none;
        line-height: 30px;
        padding: 0px;
    }
    #tag-list li{
        display: inline-block;
        background-color: gray;
        color: white;
        border-radius: 0.3em;
        padding-left: 7px;
        padding-right: 7px;
        font-size: 15px;
        height: 30px;
    }
    .tag-delete{
        display: inline-block;
        background-color: none;
        margin-right: 15px;
        font-size: 10px;
        height: 30px;
        box-sizing: border-box;
        line-height: 30px;
    }
    .tag-delete:hover{cursor: pointer;}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    	<% if(loginUser == null) { %>
    		<script>
    		alert("로그인 후 이용가능한 페이지입니다.");
    		location.href = "<%= contextPath %>/loginForm.us";
    		</script>
    	<% } %>
    <div class="outer" align="center">
        <br>
        <h2 style="font-size: 30px;"><b>스타일 등록</b></h2>
        <br>

        <form action="<%= contextPath %>/insert.st" method="post" enctype="multipart/form-data">
		<!-- 첨부파일 정보를 넘기고싶으면 반드시 enctype="multipart/form-data" 속성 작성해야함 -->

            <div id="file-area" style="display: none;">
                <input type="file" name="file1" onchange="loadImg(this, 1);">
                <input type="file" name="file2" onchange="loadImg(this, 2);">
                <input type="file" name="file3" onchange="loadImg(this, 3);">
                <input type="file" name="file4" onchange="loadImg(this, 4);">
                <input type="file" name="file5" onchange="loadImg(this, 5);">
                <input type="file" name="file6" onchange="loadImg(this, 6);">
                <input type="file" name="file7" onchange="loadImg(this, 7);">
                <input type="file" name="file8" onchange="loadImg(this, 8);">
                <input type="file" name="file9" onchange="loadImg(this, 9);">
                <input type="file" name="file10" onchange="loadImg(this, 10);">
            </div>

            <table>
                <tr>
                    <td id="style-box">
                        <div style="text-align: center;">
                            <span style="font-size: 30px; color: lightgray; ">대표 이미지</span>
                        </div>
                    </td>
                    <td id="thumbnail-td">
                        <div id="input-box">
                            <div class="thumbnail-box">
                                <img id="thumbnail1" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(1);">
                                <div class="delete-btn" id="btn1">❌</div>
                            </div>
                            <div class="thumbnail-box">
                                <img id="thumbnail2" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(2);">
                                <div class="delete-btn" id="btn2">❌</div>
                            </div>
                            <div class="thumbnail-box">
                                <img id="thumbnail3" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(3);">
                                <div class="delete-btn" id="btn3">❌</div>
                            </div>
                            <div class="thumbnail-box">
                                <img id="thumbnail4" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(4);">
                                <div class="delete-btn" id="btn4">❌</div>
                            </div>
                            <div class="thumbnail-box">
                                <img id="thumbnail5" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(5);">
                                <div class="delete-btn" id="btn5">❌</div>
                            </div>
                            <div class="thumbnail-box">
                                <img id="thumbnail6" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(6);">
                                <div class="delete-btn" id="btn6">❌</div>
                            </div>
                            <div class="thumbnail-box">
                                <img id="thumbnail7" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(7);">
                                <div class="delete-btn" id="btn7">❌</div>
                            </div>
                            <div class="thumbnail-box">
                                <img id="thumbnail8" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(8);">
                                <div class="delete-btn" id="btn8">❌</div>
                            </div>
                            <div class="thumbnail-box">
                                <img id="thumbnail9" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(9);">
                                <div class="delete-btn" id="btn9">❌</div>
                            </div>
                            <div class="thumbnail-box">
                                <img id="thumbnail10" class="thumbnail" src="<%= contextPath %>/resources/images/style/plus.png" onclick="clickFile(10);">
                                <div class="delete-btn" id="btn10">❌</div>
                            </div>
                        </div>

                        <script>
                            function clickFile(num){
                                $("input[name=file" + num + "]").click();
                            }

                            function loadImg(inputFile, num){
                                console.log("dd");
                                if(inputFile.files.length == 1){ 
                                    
                                    const reader = new FileReader();
                                    
                                    reader.readAsDataURL(inputFile.files[0]);

                                    reader.onload = function(e){
                                        $("#thumbnail" + num).attr("src", e.target.result);
                                        $("#thumbnail" + num).parent().css("border", "none");
                                        $("#thumbnail" + num).next().show();

                                        if(num == 1){
                                            if($("#style-box>div>img") == null){
                                                $img = $("<img id='styleImg'>");
                                                $("#style-box span").css("display", "none");
                                                $("#style-box>div").append($img);
                                                $("#styleImg").attr("src", e.target.result);
                                                $("#style-box").css("border", "none");
                                            } else {
                                                $("#style-box>div>img").remove();
                                                $img = $("<img id='styleImg'>");
                                                $("#style-box span").css("display", "none");
                                                $("#style-box>div").append($img);
                                                $("#styleImg").attr("src", e.target.result);
                                                $("#style-box").css("border", "none");
                                            }
                                            
                                        }
                                    }
   
                                } else {
                                    $("#thumbnail" + num).attr("src", "<%= contextPath %>/resources/images/style/plus.png");
                                    $("#thumbnail" + num).parent().css("border", "5px dotted lightgray");
                                    $("#thumbnail" + num).next().css("display", "none");
                                    if(num == 1){
                                        $("#style-box").css("border", "1px solid lightgray");
                                        $("#styleImg").remove();
                                        $("#style-box span").show();
                                    }
                                }

                            }

                            $(document).on("click", ".delete-btn", function(){
                                $(this).prev().attr("src", "<%= contextPath %>/resources/images/style/plus.png");
                                $(this).parent().css("border", "5px dotted lightgray");
                                $(this).css("display", "none");
                                
                                if($(this).attr("id").substring(3) == 1){
                                    $("#style-box").css("border", "1px solid lightgray");
                                    $("#styleImg").remove();
                                    $("#style-box span").show();
                                }
                            })
                            
                            
                            

                        </script>

                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="search">
                        <a href="" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#myModal">상품태그 검색</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="pd-thumbnail-td">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="content-td">
                        <textarea name="context" id="content" maxlength="1000" style="resize: none; border: none;" placeholder="아이템과 스타일을 자랑해보세요..."></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="hashtag-td">
                        <div id="tag-box">
                            <span style="color: gray;">태그 입력 : </span>
                            <input type="text" id="tag-input" size="20" placeholder="해쉬태그 입력">
                            <ul id="tag-list">
                            </ul>
                            <script>
	                            $("#tag-input").keydown(function() { // 'input[type="text"]'
                                    if(event.keyCode == 13 || event.keyCode == 32) {
                                        event.preventDefault();
                                        let tag;

                                        if($(this).val() == ""){
                                            alert("태그 내용을 입력해주세요.");
                                            return;
                                        }

                                        if($(this).val().charAt(0) == "#"){
                                            tag = $(this).val();
                                        } else {
                                            tag = "#" + $(this).val();
                                        }

                                        if($("#tag-list").children().length == 0){ // li 요소가 없을 때
                                            $("#tag-list").append($("<li name='tag'>" + tag + "</li><div class='tag-delete'>❌</div>"));
                                            $(this).val("");
                                        } else { // li 요소가 있을 때
                                            for(let i=0; i<$("#tag-list").children().length; i++){
                                                if($("#tag-list").children().eq(i).text() == tag){
                                                    alert("중복된 태그입니다.");
                                                    $(this).val("");
                                                    return;
                                                }
                                            }
                                            $("#tag-list").append($("<li name='tag'>" + tag + "</li><div class='tag-delete'>❌</div>"));
                                            $(this).val("");
                                        }
                                    }
                                });

                                $(document).on("click", ".tag-delete", function(){
                                    console.log($(this).prev());
                                    $(this).prev().remove();
                                    $(this).remove();
                                })
                            </script>
                        </div>
                    </td>
                </tr>
            </table>
            <br>

            <div>
                <button type="submit" class="btn btn-secondary">작성하기</button>
            </div>

        </form>
    </div>

    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <!-- Modal Header -->
                    <input type="text" placeholder="상품이름 검색" id="search-input" onkeyup="search();">
                    <input type="text" style="display: none;">
                    <!-- Modal body -->
                    <div id="pd-box">
                        <% for(Product pd : listAll) { %>
                            <table class="pd">
                                <tr>
                                    <input type="hidden" value="<%= pd.getProductCode() %>">
                                </tr>
                                <tr>
                                    <td rowspan="4" class="img-td">
                                        <img class="pd-img" src="<%= pd.getProductImgM() %>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text">
                                        <div class="brand"><%= pd.getBrandName() %></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text">
                                    <div class="name-ko"><%= pd.getProductNameKo() %></div> 
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text">
                                        <div class="name-eng"><%= pd.getProductNameEng() %></div>
                                    </td>
                                </tr>
                            </table>
                        <% } %>
                    </div>
                    <!-- Modal footer -->
                        <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" id="close-btn">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function search(){
            $.ajax({
                url:"<%= contextPath %>/searchPd.st",
                data:{keyword:$("#search-input").val()},
                success:function(result){
                    let value = "";
                    if(result.length == 0){
                    	let value = "<div>" + "조회된 상품이 없습니다." + "</div>";
                        $("#pd-box").html(value);
                    } else {
                        for(let i=0; i<result.length; i++){
                            value += "<table class='pd'>"
                                        + "<tr>"
                                            + "<td>"
                                                + "<input type='hidden' value=" + result[i].productCode + ">"
                                            + "</td>" 
                                        + "</tr>"
                                        + "<tr>"
                                            + "<td rowspan='4' class='img-td'>"
                                                + "<img class='pd-img' src=" + result[i].productImgM + ">"
                                            + "</td>"
                                        + "</tr>"
                                        + "<tr>"
                                            + "<td class='text'>"
                                                + "<div class='brand'>" + result[i].brandName + "</div>"
                                            + "</td>"
                                        + "</tr>"
                                        + "<tr>"
                                            + "<td class='text'>"
                                                + "<div class='name-ko'>" + result[i].productNameKo + "</div>"
                                            + "</td>"
                                        + "</tr>"
                                        + "<tr>"
                                            + "<td class='text'>"
                                                + "<div class='name-eng'>" + result[i].productNameEng + "</div>"
                                            + "</td>"
                                        + "</tr>"
                                    + "</table>"
                        }
                        $("#pd-box").html(value);
                        $(".pd").click(function(){
                            $.ajax({
                                url: "<%= contextPath %>/searchPCode.st",
                                data:{pCode:$(this).children().children().children().children().val()},
                                success:function(result){
                                    $("#close-btn").click();
                                    $ul = $("<ul class='pd-thumbnail'><li><input type='hidden' name='pCode'  value='" + result.productCode + "'><li><img src='" + result.productImgM + "'><div class='delete-pd'>❌</div></li><li class='li-brand'>"+ result.brandName +"</li><li class='li-ko'>" + result.productNameKo + "</li><li class='li-eng'>" + result.productNameEng + "</li></ul>");
                                    $("#pd-thumbnail-td").append($ul);
                                },
                                error:function(){
                                    console.log("통신실패");
                                }
                            })
                        })
                    }
                    
                },
                error:function(){
                    console.log("통신실패");
                }
            })
        }

        $(".modal").on("hide.bs.modal", function() {
            $("#search-input").val("");
            $("#pd-box").empty();
            let value = "";
            <% for(Product pd : listAll) { %>
            	value += "<table class='pd'>"
            				+ "<tr>"
            					+ "<input type='hidden' value=" + <%= pd.getProductCode() %> + ">"
            				+ "</tr>"
            				+ "<tr>"
            					+ "<td rowspan='4' class='img-td'>"
            						+ "<img class='pd-img' src=" + "<%= pd.getProductImgM() %>" + ">"
            					+ "</td>"
            				+ "</tr>"
            				+ "<tr>"
	                			+ "<td class='text'>"
	                				+ "<div class='brand'>" + "<%= pd.getBrandName() %>" + "</div>"
	                			+ "</td>"
	                		+ "</tr>"
	                		+ "<tr>"
	                			+ "<td class='text'>"
	                				+ "<div class='name-ko'>" + "<%= pd.getProductNameKo() %>" + "</div>"
	                			+ "</td>"
	                    	+ "</tr>"
	                    	+ "<tr>"
	                    		 + "<td class='text'>"
	                    		 	+ "<div class='name-eng'>" + "<%= pd.getProductNameEng() %>" + "</div>"
	                    		+ "</td>"
	                		+ "</tr>"
	                    + "</table>"
        	<% } %>
        	$("#pd-box").html(value);
        });

        $(".modal").on("show.bs.modal", function(){
            $(".pd").click(function(){
                $.ajax({
                    url: "<%= contextPath %>/searchPCode.st",
                    data:{pCode:$(this).children().children().children().val()},
                    success:function(result){
                        $("#close-btn").click();
                        $ul = $("<ul class='pd-thumbnail'><li><input type='hidden' name='pCode' value='" + result.productCode + "'></li><li><img src='" + result.productImgM + "'><div class='delete-pd'>❌</div></li><li class='li-brand'>"+ result.brandName +"</li><li class='li-ko'>" + result.productNameKo + "</li><li class='li-eng'>" + result.productNameEng + "</li></ul>");
                        $("#pd-thumbnail-td").append($ul);
                    },
                    error:function(){
						console.log("통신실패");
                    }
                })
            })
        })

        $(document).on("click", ".delete-pd", function(){
            $(this).parent().parent().remove();
        })

    </script>

</body>
</html>