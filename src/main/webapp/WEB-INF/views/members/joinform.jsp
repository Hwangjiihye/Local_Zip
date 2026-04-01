<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinform</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

.topBar {
	padding-left: 20px;
	font-weight: bold;
	color: #A66A3F;
	border-bottom: 2px solid #A66A3F;
	height: 100px;
	line-height: 100px;
	background-color: #F2D3A2;
	display: flex;
}
.mainTitle{
	font-size: 50px;
}
.backBtnDiv{
	margin-left: 1300px;
}
.divTotal {
	padding-top: 30px;
	margin: auto;
	margin-top: 20px;
	width: 1000px;
	height: 750px;
	text-align: center;
	border-radius: 60px;
	background-color: #F2D3A2;
	box-shadow: 0 6px 15px rgba(0,0,0,0.3);
}

.form-row {
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

.id, .email, .code {
	margin-right: 10px;
}

.id, .pw1, .pw2, .name, .nickname, .phone, .id_num, .email, .code,
	.zonecode, .address1, .address2 {
	width: 300px;
	padding: 5px;
}

.code {
	margin-left: 89px;
}

.zonecode {
	margin-top: 15px;
	margin-right: 15px;
	width: 100px;
}

.zonecodeLabel {
	margin-top: 15px;
}

.searchBtn {
	margin-top: 15px;
}

.readonly {
	background-color: rgb(232, 190, 127);
}

.agreeBtn {
	width: 15px;
	height: 15px;
	margin-top: 20px;
}

hr {
	margin-top: 20px;
	width: 700px;
	border-color: #A66A3F;
}

.signUpDiv {
	margin-top: 30px;
}

.duplCheck, .signUpBtn, .authCheck, .confirmBtn, .searchBtn, .backBtn {
	background-color: #ffb300;
	color: #5e361a;
	border: 1px solid #ffb300;
	border-radius: 10px;
	font-weight: bold;
}

.signUpBtn {
	height: 40px;
	width: 90px;
}

.agreeDiv {
	font-size: small;
}

.use, .notUse, .correct, .incorrect, .ok, .no {
	display: none;
	font-size: small;
	margin-top: -15px;
}

.use, .correct, .ok {
	color: #286708;
}

.notUse, .incorrect, .no {
	color: #de4f28;
}

.duplCheck:hover,
.authCheck:hover,
.confirmBtn:hover,
.searchBtn:hover,
.signUpBtn:hover,
.backBtn:hover{
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0,0,0,0.3);
}

.duplCheck:active,
.authCheck:active,
.confirmBtn:active,
.searchBtn:active,
.signUpBtn:hover,
.backBtn:hover{
	transform: translateY(2px); /* 아래로 눌림 */
	box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}

</style>
</head>
<body>
	<div class="container">
		<div class="topBar">
			<div class="mainTitle">우리 동네.zip 회원가입</div>
			<div class="backBtnDiv">
				<a href="/"><input class="backBtn" type="button" value="뒤로가기"></a>
			</div>
		</div>
		<form action="/members/signup" class="frm">
			<div class="divTotal">
				<div class="form-row">
					<label>· ID : </label> <input name="mem_id" class="id" type="text"
						placeholder="아이디를 입력해주세요."> <input class="duplCheck"
						type="button" value="중복확인">
				</div>
				<div class="use">중복되지 않은 아이디입니다.</div>
				<div class="notUse">이미 사용 중인 아이디입니다.</div>
				<div class="form-row">
					<label>· PW : </label> <input name="mem_password" class="pw1"
						type="password" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="form-row">
					<label>· PW 확인 : </label> <input class="pw2" type="password"
						placeholder="비밀번호를 동일하게 입력해주세요.">
				</div>
				<div class="correct">비밀번호가 일치합니다.</div>
				<div class="incorrect">비밀번호가 일치하지 않습니다.</div>
				<div class="form-row">
					<label>· NAME : </label> <input name="mem_name" class="name"
						type="text" placeholder="이름을 입력해주세요.">
				</div>
				<div class="form-row">
					<label>·NICKNAME : </label> <input name="mem_nickname"
						class="nickname" type="text" placeholder="닉네임을 입력해주세요.">
				</div>
				<div class="form-row">
					<label>· PHONE : </label> <input name="mem_phone" class="phone"
						type="text" placeholder="휴대폰 번호를 입력해주세요. ('-' 제외)">
				</div>
				<div class="form-row">
					<label>·ID NUMBER : </label> <input name="mem_ssn" class="id_num"
						type="text" placeholder="주민등록번호를 입력해주세요. ('-' 포함)">
				</div>
				<div class="form-row">
					<label>· EMAIL : </label> <input name="mem_email" class="email"
						type="text" placeholder="이메일 주소를 입력해주세요."> <input
						class="authCheck" type="button" value="인증번호 전송">
				</div>
				<div>
					<input class="code" type="text" placeholder="인증번호를 입력해주세요.">
					<input class="confirmBtn" type="button" value="인증">
				</div>
				<div class="form-row">
					<label class="zonecodeLabel">·ZONECODE:</label> <input
						name="mem_zip_code" class="zonecode readonly" type="text" readonly>
					<input class="searchBtn" type="button" value="찾기">
				</div>
				<div class="form-row">
					<label>· ADDRESS :</label> <input name="mem_address1"
						class="address1 readonly" type="text" readonly>
				</div>
				<div class="form-row">
					<label>· DETAIL :</label> <input name="mem_address2"
						class="address2" type="text" placeholder="상세 주소를 입력해주세요.">
				</div>
				<div class="agreeDiv">
					<input class="agreeBtn" type="checkbox">I agree to the
					Terms of Use and Privacy Policy (필수)
				</div>
				<hr>
				<div class="signUpDiv">
					<button class="signUpBtn">Sign Up</button>
				</div>
			</div>
		</form>
	</div>

	<script>
		// id 중복체크 기능
		let idChecked = false;

		$(".duplCheck").on("click", function() {
			if ($(".id").val() == "") {
				alert("아이디를 먼저 입력해주세요.");
				return false;
			} else {
				$.ajax({
					url : "/members/duplCheck",
					dataType : "json",
					data : {
						mem_id : $(".id").val()
					}
				}).done(function(resp) {
					if (resp == "0") {
						$(".use").show();
						$(".notUse").hide();
						idChecked = true;
					} else {
						$(".notUse").show();
						$(".use").hide();
						idChecked = false;
					}
				});
			}
		});

		$(".id").on("input", function() {
			idChecked = false;
			$(".use").hide();
			$(".notUse").hide();
		});

		//인증번호 전송
		$(".authCheck").on("click", function() {
			if ($(".email").val() == "") {
				alert("아이디를 먼저 입력해주세요.");
				return false;
			} else {
				$.ajax({
					url : "/auth/mailCheck",
					type: "post",
					data : {
						email : $(".email").val(),
						auth_type : 1
					}
				}).done(function(resp) {
					if (resp == "success") {
						alert("이메일로 인증번호를 발송했습니다.");
					} else {
						alert("인증번호 발송 실패했습니다.");
					}
				});
			}
		});

		//인증번호 확인
		$(".confirmBtn").on("click", function() {
			$.ajax({
				url : "/auth/verify",
				type: "post",
				data : {
					email : $(".email").val(),
					auth_code : $(".code").val()
				}
			}).done(function(resp) {
				if (resp == "success") {
					alert("인증되었습니다.");
				} else {
					alert("인증에 실패하셨습니다. 다시 시도 부탁드립니다.");
				}
			});
		});
		
		
		

		// 주소(찾기)
		let searchBtn = document.getElementsByClassName("searchBtn")[0];
		searchBtn.onclick = function() {
			new kakao.Postcode(
					{
						oncomplete : function(data) {
							document.getElementsByClassName("zonecode")[0].value = data.zonecode;
							document.getElementsByClassName("address1")[0].value = data.roadAddress;
						}
					}).open();
		}

		// 정규표현식 검사
		let frm = document.getElementsByClassName("frm")[0];
		frm.onsubmit = function(e) {
			//기본 제출 막기
			e.preventDefault();
			
			// id
			let id = document.getElementsByClassName("id")[0];

			if (id.value == "") {
				alert("아이디를 입력해주세요.");
				id.focus();
				return false;
			} else {
				let regex = /^[a-z\d_]{4,12}$/;
				let idResult = regex.test(id.value);
				if (!idResult) {
					alert("아이디를 다시 설정해주세요.\n4~12자의 영문 소문자, 숫자, 언더바만 사용 가능");
					id.value = "";
					id.focus();
					return false;
				}
			}

			if (!idChecked) {
				alert("아이디 중복확인을 해주세요.");
				return false;
			}

			// pw
			let pw1 = document.getElementsByClassName("pw1")[0];
			let pw2 = document.getElementsByClassName("pw2")[0];
			let correct = document.getElementsByClassName("correct")[0];
			let incorrect = document.getElementsByClassName("incorrect")[0];

			if (pw1.value == "" || pw2.value == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else {
				let regex = /^[A-Za-z\d!@#$%^&*]{8,16}$/;
				let pwResult = regex.test(pw1.value);
				if (!pwResult) {
					alert("비밀번호를 다시 설정해주세요.\n8~16자의 영문 대소문자,숫자,특수문자(!@#$%^&*) 사용 가능");
					pw1.value = "";
					pw1.focus();
					return false;
				} else if (pw1.value != pw2.value) {
					incorrect.style.display = "block";
					correct.style.display = "none";
					return false;
				} else {
					correct.style.display = "block";
					incorrect.style.display = "none";
				}
			}

			// name
			let name = document.getElementsByClassName("name")[0];
			if (name.value == "") {
				alert("이름을 입력해주세요.");
				name.focus();
				return false;
			} else {
				let regex = /^[가-힣]{2,10}$|^[a-z]{2,10}$/;
				nameResult = regex.test(name.value);
				if (!nameResult) {
					alert("2~10글자의 이름만 등록 가능합니다.");
					name.value = "";
					name.focus();
					return false;
				}
			}

			// nickname
			let nickname = document.getElementsByClassName("nickname")[0];
			if (nickname.value == "") {
				alert("닉네임을 입력해주세요.");
				name.focus();
				return false;
			} else {
				let regex = /^[가-힣]{2,30}$|^[a-z]{2,30}$/;
				nicknameResult = regex.test(nickname.value);
				if (!nicknameResult) {
					alert("2~30글자의 닉네임만 등록 가능합니다.");
					nickname.value = "";
					nickname.focus();
					return false;
				}
			}

			// phone
			let phone = document.getElementsByClassName("phone")[0];
			if (phone.value == "") {
				alert("전화번호를 입력해주세요.");
				phone.focus();
				return false;
			} else {
				let regex = /^010[\d]{8}$/;
				let phoneResult = regex.test(phone.value);
				if (!phoneResult) {
					alert("연락처 형식은 010********(8자) 입니다.");
					phone.value = "";
					phone.focus();
					return false;
				}
			}

			// ssn
			let ssn = document.getElementsByClassName("id_num")[0];
			if (ssn.value == "") {
				alert("주민등록번호를 입력해주세요.");
				ssn.focus();
				return false;
			} else {
				let regex = /^[\d]{6}-[1234]{1}[\d]{6}$/;
				let ssnResult = regex.test(ssn.value);
				if (!ssnResult) {
					alert("주민등록번호는 생년월일(6글자)-(뒷자리7글자)로 입력바랍니다.");
					ssn.value = "";
					ssn.focus();
					return false;
				}
			}

			// email
			let email = document.getElementsByClassName("email")[0];

			if (email.value == "") {
				alert("이메일을 입력해주세요.");
				email.focus();
				return false;
			} else {
				let regex = /^[a-z\d_]+@[a-z]+\.[a-z]+\.?[a-z]+?$/;
				let emailResult = regex.test(email.value);
				if (!emailResult) {
					alert("잘못된 이메일 형식입니다.");
					email.value = "";
					email.focus();
					return false;
				}
			}

			// code
			let code = document.getElementsByClassName("code")[0];
			if (code.value == "") {
				alert("인증코드를 입력해주세요.");
				code.focus();
				return false;
			}

			// zonecode
			let zonecode = document.getElementsByClassName("zonecode")[0];
			if (zonecode.value == "") {
				alert("우편번호 찾기를 눌러주세요.");
				zonecode.focus();
				return false;
			}

			// agreeBtn
			let agreeBtn = document.getElementsByClassName("agreeBtn")[0];
			if (!agreeBtn.checked) {
				alert("약관 동의는 필수입니다.");
				agreeBtn.focus();
				return false;
			}
			
			//이메일 인증 최종확인(회원가입 버튼 눌렀을 때)
		
			
			
			$.ajax({
				url : "/auth/isVerified",
				type : "post",
				data : {email : $(".email").val()}
			}).done(function(resp){
				if(resp=="1"){
					alert("회원가입을 축하드립니다.");
					frm.submit();
				}else{
					alert("이메일 인증이 완료되지 않았거나 만료되었습니다. 다시 인증해주세요.");
				}
			});
			return false;
		}
		
		
	</script>
</body>
</html>