<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<style>
		@font-face {
	    font-family: 'GMarketSans';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
	    font-weight: 300;
	    font-display: swap;
		}
		
		@font-face {
		    font-family: 'GMarketSans';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: 500;
		    font-display: swap;
		}
		
		@font-face {
		    font-family: 'GMarketSans';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
		    font-weight: 700;
		    font-display: swap;
		}
		
		button, body {
		    font-family: 'GMarketSans', sans-serif;
	        color: #5e361a;
		}
	    body{
	        margin: 0;
	        background-color: #F2D3A2;
	    }
	    .container{
	        width: 100%;
	        min-height: 100vh;
	        background-color: #fbe5c0;
	    }
	    .mainTitle{
	        font-weight: bold;
	        font-size: 50px;
	        color: #A66A3F;
	        border-bottom: 2px solid #A66A3F;
	        height: 100px;
	        line-height: 100px;
	        background-color: #F2D3A2;
	    }
	    .divTotal{
	        padding-top: 30px;
	        border: 2px solid #A66A3F;
	        margin: auto;
	        margin-top: 20px;
	        width: 700px;
	        height: 300px;
	        text-align: center;
	        border-radius: 60px;
	        background-color: #F2D3A2;
	    }
	    .form-row{
	        display: flex;
	        align-items: center;
	        margin-bottom: 15px;
	    }
	    label {
	        width: 120px;
	        text-align: right;
	        margin-right: 10px;
	        margin-left: 100px;
	        font-weight: bold;
	    }
	    .id {
	        margin-right: 10px;
	    }
	    
	    .id, .pw1  {
	        width: 300px;
	        padding: 5px;
	    }
	    .code{
	        margin-left: 89px;
	    }
	    
	    .readonly{
	        background-color: rgb(232, 190, 127);
	    }
	    hr{
	        margin-top: 20px;
	        width: 700px;
	        border-color: #A66A3F;
	    }
	    .loginDiv{
	        margin-top: 30px;
	    }
	    .duplCheck, .signUpBtn, .authCheck, .confirmBtn, .searchBtn{
	        background-color: #ffb300;
	        color: #5e361a;
	        border: 1px solid #ffb300;
	        border-radius: 10px;
	        font-weight: bold;
	    }
	    .signUpBtn{
	        height: 40px;
	        width: 90px;
	    }
	    .use, .notUse, .correct, .incorrect, .ok, .no{
	    	display: none;
	    	font-size: small;
	    	margin-top:-15px;
	    }
	    .loginBtn, .JoinBtn{
        background-color: #ffb300;
        color: #5e361a;
        border: 1px solid #ffb300;
        border-radius: 10px;
        font-weight: bold;
    	}
	</style>
</head>
<body>
	<div class="container">
	    <div class="mainTitle">우리 동네.zip 회원가입</div>
	    <form action="/members/login" class="frm">
	        <div class="divTotal">
	            <div class="form-row">
	                <label>· ID : </label>
	                <input name="mem_id" class="id" type="text" placeholder="아이디를 입력해주세요.">
	            </div>
	            
	            <div class="form-row">
	                <label>· PW : </label>
	                <input name="mem_password" class="pw1" type="password" placeholder="비밀번호를 입력해주세요.">
	            </div>
	            
	            <div class="signUpDiv"><button class="loginBtn">Login</button></div>
	            <div class="signUpDiv"><button class="JoinBtn">Join</button></div>
	            <hr>
	            
	            <div class="linkDiv">
	                Forgot Id?    Forgot password?
	            </div>
	            
	            
	        </div>
    	</form>
    </div>

</body>
</html>