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
	padding-top: 30px;
	border: 2px solid #A66A3F;
	margin: auto;
	margin-top: 195px;
	width: 800px;
	height: 400px;
	text-align: center;
	border-radius: 60px;
	background-color: #F2D3A2;
}

.form-row {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
	justify-content: center;
}

label {
	width: 50px;
	text-align: right;
	margin-right: 10px;
	/* 	        margin-left: 120px; */
	font-weight: bold;
}

.id {
	margin-right: 10px;
}

.id, .pw {
	width: 300px;
	padding: 5px;
}

hr {
	margin-top: 70px;
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
	background-color: #ffb300;
	color: #5e361a;
	border: 1px solid #ffb300;
	margin-top: 8px;
	border-radius: 10px;
	font-weight: bold;
	height: 20px;
	width: 60px;
}

.loginBox {
	width: 700px;
	display: flex;
	justify-content: center;
	margin-top: 145px;
	margin-left: 45px;
	gap: 40px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="mainTitle">우리 동네.zip 로그인</div>
		<form action="/members/login" class="frm" method="post">
			<div class="divTotal">
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
				<hr>
				<div class="linkDiv">Forgot Id? Forgot password?</div>
				<div>
					<a href="/"><button class="backBtn" type="button">Back</button></a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>