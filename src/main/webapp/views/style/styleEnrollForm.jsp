<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #content, #hashtag{border-top: 1px solid lightgray;}

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

    #pd-thumbnail{
        width: 1000px;
        height: 100px;
        display: none;
    }

    #hashtag{
        width: 1000px;
        height: 100px;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer" align="center">
        <br>
        <h2 style="font-size: 30px;"><b>스타일 등록</b></h2>
        <br>

        <form action="<%= contextPath %>/insert.bo" method="post" enctype="multipart/form-data">
		<!-- 첨부파일 정보를 넘기고싶으면 반드시 enctype="multipart/form-data" 속성 작성해야함 -->

            <div id="file-area" style="display: none;">
                <input type="file" name="file1" onchange="loadImg(this, 1);" required>
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

                                if(inputFile.files.length == 1){ 
                                    
                                    const reader = new FileReader();
                                    
                                    reader.readAsDataURL(inputFile.files[0]);
                                    
                                    reader.onload = function(e){
                                        $("#thumbnail" + num).attr("src", e.target.result);
                                        $("#thumbnail" + num).parent().css("border", "none");
                                        $("#thumbnail" + num).next().show();

                                        if(num == 1){
                                            $img = $("<img id='styleImg'>");
                                            $("#style-box span").css("display", "none");
                                            $("#style-box>div").append($img);
                                            $("#styleImg").attr("src", e.target.result);
                                            $("#style-box").css("border", "none");
                                        }
                                    }
   
                                }

                            }

                            $(function(){
                                $(".delete-btn").click(function(){
                                    $(this).siblings().attr("src", "<%= contextPath %>/resources/images/style/plus.png");
                                    $(this).parent().css("border", "5px dotted lightgray");
                                    $(this).css("display", "none");
                                    
                                    if($(this).attr("id").substring(3) == 1){
                                        $("#style-box").css("border", "1px solid lightgray");
                                        $("#styleImg").remove();
                                        $("#style-box span").show();
                                    }
                                })
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
                    <td colspan="2" id="pd-thumbnail">
                        <div>
                            
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="content">
                        <textarea name="" id="" cols="130" rows="3" style="resize: none; border: none;" placeholder="#아이템과 #스타일을 자랑해보세요..."></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="hashtag">
                        <input type="text" placeholder="해쉬태그 입력">
                    </td>
                </tr>
            </table>
            <br>

            <div>
                <button type="submit" class="btn btn-secondary">작성하기</button>
                <button type="reset" class="btn btn-secondary">취소하기</button>
            </div>

        </form>
    </div>

    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <input type="text" placeholder="상품이름 검색" style="width: 470px; margin: 10px;">
                <!-- Modal body -->
                <div style="margin: 10px;">
                    <img src="" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <div style="margin: 10px;">
                    <img src="" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <!-- Modal footer -->
                    <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
        
            </div>
        </div>
    </div>
</body>
</html>