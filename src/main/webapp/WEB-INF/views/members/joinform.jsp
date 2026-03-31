<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinform</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        padding-top: 50px;
        border: 2px solid #A66A3F;
        margin: auto;
        margin-top: 50px;
        width: 1000px;
        height: 700px;
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
        margin-left: 230px;
        font-weight: bold;
    }
    .id, .email, .code{
        margin-right: 10px;
    }
    .id, .pw1, .pw2, .name, .nickname, .phone, .id_num, .email, .code, .zonecode, .address1, .address2  {
        width: 300px;
        padding: 5px;
    }
    .code{
        margin-left: 89px;
    }
    .zonecode{
        margin-top: 15px;
        margin-right: 15px;
        width: 100px;
    }
    .zonecodeLabel{
        margin-top: 15px;
    }
    .searchBtn{
        margin-top: 15px;
    }
    .readonly{
        background-color: rgb(232, 190, 127);
    }
    .agreeBtn{
        width: 15px;
        height: 15px;
        margin-top: 20px;
    }
    hr{
        margin-top: 20px;
        width: 700px;
        border-color: #A66A3F;
    }
    .signUpDiv{
        margin-top: 30px;
    }
    .checkIdBtn, .signUpBtn, .authCheck, .confirmBtn, .searchBtn{
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
    .agreeDiv{
        font-size: small;
    }
</style>
</head>
<body>
    <div class="container">
	    <div class="mainTitle">우리 동네.zip 회원가입</div>
	    <form>
	        <div class="divTotal">
	            <div class="form-row">
	                <label>· ID : </label>
	                <input name="mem_id" class="id" type="text" placeholder="아이디를 입력해주세요.">
	                <input class="checkIdBtn" type="button" value="중복확인">
	            </div>
	            <div class="use">사용 가능한 아이디입니다.</div>
	            <div class="notUse">이미 사용 중인 아이디입니다.</div>
	            <div class="form-row">
	                <label>· PW : </label>
	                <input name="mem_password" class="pw1" type="password" placeholder="비밀번호를 입력해주세요.">
	            </div>
	            <div class="form-row">
	                <label>· PW 확인 : </label>
	                <input class="pw2" type="password" placeholder="비밀번호를 동일하게 입력해주세요.">
	            </div>
	            <div class="correct">비밀번호가 일치합니다.</div>
	            <div class="incorrect">비밀번호가 일치하지 않습니다.</div>
	            <div class="form-row">
	                <label>· NAME : </label>
	                <input name="mem_name" class="name" type="text" placeholder="이름을 입력해주세요.">
	            </div>
	            <div class="form-row">
	                <label>·NICKNAME : </label>
	                <input name="mem_nickname" class="nickname" type="text" placeholder="닉네임을 입력해주세요.">
	            </div>
	            <div class="form-row">
	                <label>· PHONE : </label>
	                <input name="mem_phone" class="phone" type="text" placeholder="휴대폰 번호를 입력해주세요. ('-' 제외)">
	            </div>
	            <div class="form-row">
	                <label>·ID NUMBER : </label>
	                <input name="mem_ssn" class="id_num" type="text" placeholder="주민등록번호를 입력해주세요. ('-' 포함)">
	            </div>
	            <div class="form-row">
	                <label>· EMAIL : </label>
	                <input name="mem_email" class="email" type="text" placeholder="이메일 주소를 입력해주세요.">
	                <input class="authCheck" type="button" value="인증번호 전송">
	            </div>
	            <div>
	                <input class="code" type="text" placeholder="인증번호를 입력해주세요.">
	                <input class="confirmBtn" type="button" value="인증">
	                <div>인증되었습니다.</div>
	                <div>인증번호가 맞지 않습니다.</div>
	            </div>
	            <div class="form-row">
	                <label class="zonecodeLabel">·ZONECODE:</label>
	                <input name="mem_zip_code" class="zonecode readonly" type="text" readonly>
	                <input class="searchBtn" type="button" value="찾기">
	            </div>
	            <div class="form-row">
	                <label>· ADDRESS :</label>
	                <input name="mem_address1" class="address1 readonly" type="text" readonly>
	            </div>
	            <div class="form-row">
	                <label>· DETAIL :</label>
	                <input name="mem_address2" class="address2" type="text" placeholder="상세 주소를 입력해주세요.">
	            </div>
	            <div class="agreeDiv">
	                <input class="agreeBtn" type="checkbox">I agree to the Terms of Use and Privacy Policy (필수)
	            </div>
	            <hr>
	            <div class="signUpDiv"><button class="signUpBtn">Sign Up</button></div>
	        </div>
    	</form>
    </div>
    
    <script>

        // id 중복체크 기능
		$(".checkIdBtn").on("click",function() {
			if ($(".id").val() == "") {
				alert("아이디를 먼저 입력해주세요.");
			}else {
				$.ajax({
					url:"/members/duplCheck",
					dataType:"json",
					data:{id:$("#id").val()}
				}).done(function(resp){
					if(resp == "0"){
						$(".ok").show();
						$(".no").hide();
					}else{
						$(".no").show();
						$(".ok").hide();
						return false;
					}
				});
			}
		});
    </script>
</body>
</html>