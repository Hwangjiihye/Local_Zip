<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Page</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
@font-face {
	font-family: 'GMarketSans';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-weight: 300;
	font-display: swap;
}

@font-face {
	font-family: 'GMarketSans';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: 500;
	font-display: swap;
}

@font-face {
	font-family: 'GMarketSans';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: 700;
	font-display: swap;
}

button, body {
	font-family: 'GMarketSans', sans-serif;
	color: #5e361a;
}

body {
	margin: 0;
	background-color: #F2D3A2;
}

.container {
	width: 100%;
	min-height: 100vh;
	background-color: #fbe5c0;
}

.mainTitle {
	font-weight: bold;
	font-size: 50px;
	color: #A66A3F;
	border-bottom: 2px solid #A66A3F;
	height: 100px;
	line-height: 100px;
	background-color: #F2D3A2;
}

.divTotal {
	padding: 20px 0;
	margin: 195px auto 0;
	width: 800px;
	min-height: 380px;
	border-radius: 60px;
	background-color: #F2D3A2;
	position: relative;
	text-align: center;
	box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.form-row {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
	justify-content: center;
}

label {
	width: 70px;
	text-align: right;
	margin-right: 10px;
	font-weight: bold;
}

.id, .pw {
	width: 300px;
	padding: 5px;
}

hr {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: 120px;
	width: 700px;
	border-color: #A66A3F;
}

.loginBtn, .JoinBtn {
	background-color: #ffb300;
	color: #5e361a;
	border: 1px solid #ffb300;
	border-radius: 10px;
	font-weight: bold;
	height: 40px;
	width: 90px;
}

.backBtn {
	position: absolute;
	left: 44%;
	bottom: 35px;

	background-color: #ffb300;
	color: #5e361a;
	border: 1px solid #ffb300;
	border-radius: 10px;
	font-weight: bold;
	height: 40px;
	width: 90px;
}

.loginBox {
	display: flex;
	justify-content: center;
	margin-top: 25px;
	margin-left: 23px;
	gap: 40px;
}

.inputArea{
	position: absolute;
    top: 90px;  
    left: 48%;
    transform: translateX(-50%);
}

.linkDiv{
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: 100px;   

	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 15px;
}
		.loginBtn:hover,
        .JoinBtn:hover,
        .backBtn:hover{
            transform: translateY(-3px); /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }

        .loginBtn:active,
        .JoinBtn:active,
        .backBtn:active{
            transform: translateY(2px); /* 아래로 눌림 */
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
.linkText{
	display: flex;
	gap: 60px;
	font-size: 14px;
	font-weight: 500;
	margin-left: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="mainTitle">우리 동네.zip 로그인</div>
		<form action="/members/login" class="frm" method="post">
			<div class="divTotal">
				<div class="inputArea">
					<div class="form-row">
						<label>· ID : </label><input name="mem_id" class="id" type="text" placeholder="아이디를 입력해주세요.">
					</div>
	
					<div class="form-row">
						<label>· PW : </label><input name="mem_password" class="pw" type="password" placeholder="비밀번호를 입력해주세요.">
					</div>
					
				<div class="loginBox">
					<!-- submit 버튼 -->
					<div class="signUpDiv">
						<button class="loginBtn" type="submit">Login</button>
					</div>
					<!-- 일반 버튼 -->
					<div class="signUpDiv">
						<a href="/members/join"><button class="JoinBtn" type="button">Join</button></a>
					</div>
				</div>
			</div>
				<hr>
				<div class="linkDiv">
					<div class="linkText">
						<a href=""><div>Forgot   Id?</div></a>
						<div>Forgot password?</div>
					</div>
				</div>
				<div>
					<a href="/"><button class="backBtn" type="button">Back</button></a>
				</div>
			</div>
		</form>
	</div>
	
	<script>
		let msg = "${msg}";
		
		if(msg == "empty"){
			alert("아이디와 비밀번호를 입력해주세요");
		} else if(msg == "pwFail") {
			alert("비밀번호가 틀립니다.");
		} else if(msg == "idFail") {
			alert("존재하지 않는 계정입니다.");
		}
	</script>
	
</body>
</html>