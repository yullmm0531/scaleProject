<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        box-sizing: border-box;
        /*border: 1px solid lightgray;*/
    }
    .wrap{
        width: 1200px;
        height: 1000px;
        margin: auto;
        padding: auto;
    }

    .wrap>div{width: 100%;}

    #header{height: 10%;}
    #navigator{height: 3%;}

    #header-1{width: 25%; position: relative;}
    #header-2{width: 50%; position:relative}
    #header-3{width: 25%;}

    #header>div{
        height: 100%;
        float: left;
    }

    #header img{
            width:80%;
            height:100%;
            position:absolute;
            margin: auto;
            top : 0;
            bottom:0;
            left: 0;
            right: 0;
        }

    #login-etc{
        text-align: center;
        margin: auto;
        margin-top: 30px;
        color: gray;
        
       }
    #login-etc a{
        text-decoration: none;
        margin: auto;
        color: gray;
        vertical-align:middle;
        letter-spacing:1px;
        font-size: 13px;
        
       
        }
     #login-etc a:hover{
        color: rgb(1, 13, 50);
        font-weight: 800;
     }


     #navigator{
        margin: auto;

     }

    #navi{
        list-style-type: none;
        padding: 0;
        margin: 0;
        width: 100%;
        height: 100%;

    }
    #navi>li{
        float: left;
        width: 4%;
        height: 100%;
        margin-left: 50px;
        
        
       
        }

    #navi a{
        font-family: 'Noto Sans KR', sans-serif;
        text-decoration: none;
        color: rgb(1, 13, 50);
        font-size: 20px;
        font-weight: 600;
        width: 100%;
        height: 100%;
        display: block;
        line-height: 35px;
        letter-spacing:2px;
        
        
    }
    #navi a:hover{
        font-weight: 800;
        color: rgb(97, 97, 97);
        }
        
    .search_box {
    box-sizing: border-box;
    width: 600px;
    height: 40px rgb(255, 255, 255);
    border: 2px solid #040116;
    display: flex;
    margin-top: 20px;
    }
    
    .search_box input {
        box-sizing: border-box;
        width: 100%;
        height: 40px;
        padding-left: 12px;
        padding-right: 12px;
        border: none;
        outline: none;
        font-size: 18px;
        
    }

    .search_box i {
        box-sizing: border-box;
        color: rgb(244, 244, 244);
        font-size: 22px;
        text-align: center;
    }
    
    #keyboard {
        box-sizing: border-box;
        color: rgb(238, 238, 238);
        font-size: 20px;
        text-align: center;
        width: 10%;
        padding-top:12px;
    }
    
    hr {
    border: none;
    border-top: 1px solid #E3E7EB;
    overflow: visible;
    text-align: center;
    margin-top: 25px;
    height: 11px;
	}
</style>
</head>
<body>

	<div class="wrap">
	    <div id="header">
	        <br clear="both">
	        <div id="header-1">
	            <img src="../../resources/images/logo.png" alt="">
	        </div>
	        <div id="header-2">
	
	            <div class="search_box">
	                
	                <input type="text" maxlength="225"> <i id="keyboard" class="fa fa-keyboard-o"></i>
	                <button type="submit" class="btn btn-light">search</button>
	                </button>
	            </div>
	        </div>
	        <div id="header-3">
	            <div id="login-etc">
		            <a href="">로그인  &nbsp&nbsp</a> 
		            <a href="">회원가입 &nbsp&nbsp </a> 
		            <a href="">고객센터 </a>
	        	</div>
	        </div>
	    </div>
	    <hr id="hr1">               
	
	    <div id="navigator">
	        <ul id="navi">
	            <li><a href="<%= contextPath %>/list.st">STYLE</a></li>
	            <li><a href="">SHOP</a></li>
	        </ul>
	    </div>
	    <hr>
	
	    <div id="content"></div>
	    <div id="footer"></div>
	</div>

</body>
</html>