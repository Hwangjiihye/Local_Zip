<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Joinform</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <div class="container">
	    <div class="mainTitle">우리 동네.zip 회원가입</div>
        <div class="divTotal">
            <div class="form-row">
                <label>· ID : </label>
                <input class="id" type="text" placeholder="아이디를 입력해주세요.">
                <input class="duplBtn" type="button" value="중복확인">
            </div>
            <!-- <div class="use">사용 가능한 아이디입니다.</div> -->
            <!-- <div class="notUse">이미 사용 중인 아이디입니다.</div> -->
            <div class="form-row">
                <label>· PW : </label>
                <input class="pw1" type="password" placeholder="비밀번호를 입력해주세요.">
            </div>
            <div class="form-row">
                <label>· PW 확인 : </label>
                <input class="pw2" type="password" placeholder="비밀번호를 동일하게 입력해주세요.">
            </div>
            <!-- <div class="correct">비밀번호가 일치합니다.</div> -->
            <!-- <div class="incorrect">비밀번호가 일치하지 않습니다.</div> -->
            <div class="form-row">
                <label>· NAME : </label>
                <input class="name" type="text" placeholder="이름을 입력해주세요.">
            </div>
            <div class="form-row">
                <label>·NICKNAME : </label>
                <input class="nickname" type="text" placeholder="닉네임을 입력해주세요.">
            </div>
            <div class="form-row">
                <label>· PHONE : </label>
                <input class="phone" type="text" placeholder="휴대폰 번호를 입력해주세요. ('-' 제외)">
            </div>
            <div class="form-row">
                <label>·ID NUMBER : </label>
                <input class="id_num" type="text" placeholder="주민등록번호를 입력해주세요. ('-' 포함)">
            </div>
            <div class="form-row">
                <label>· EMAIL : </label>
                <input class="email" type="text" placeholder="이메일 주소를 입력해주세요.">
                <input class="authCheck" type="button" value="인증번호 전송">
            </div>
            <div>
                <input class="code" type="text" placeholder="인증번호를 입력해주세요.">
                <input class="confirmBtn" type="button" value="인증">
                <!-- <div>인증되었습니다.</div>
                <div>인증번호가 맞지 않습니다.</div> -->
            </div>
            <div class="form-row">
                <label class="zonecodeLabel">·ZONECODE:</label>
                <input class="zonecode readonly" type="text" readonly>
                <input class="searchBtn" type="button" value="찾기">
            </div>
            <div class="form-row">
                <label>· ADDRESS :</label>
                <input class="address1 readonly" type="text" readonly>
            </div>
            <div class="form-row">
                <label>· DETAIL :</label>
                <input class="address2" type="text" placeholder="상세 주소를 입력해주세요.">
            </div>
            <div class="agreeDiv">
                <input class="agreeBtn" type="checkbox">I agree to the Terms of Use and Privacy Policy (필수)
            </div>
            <hr>
            <div class="signUpDiv"><button class="signUpBtn">Sign Up</button></div>
        </div>
    </div>
    <script>

        // id 중복체크 기능
		// $("#idCheck").on("click",function() {
		// 	if ($("#id").val() == "") {
		// 		alert("아이디를 먼저 입력해주세요.");
		// 	}else {
		// 		$.ajax({
		// 			url:"/members/duplCheck",
		// 			dataType:"json",
		// 			data:{id:$("#id").val()}
		// 		}).done(function(resp){
		// 			if(resp == "0"){
		// 				$(".ok").show();
		// 				$(".no").hide();
		// 			}else{
		// 				$(".no").show();
		// 				$(".ok").hide();
		// 				return false;
		// 			}
		// 		});
		// 	}
		// });
    </script>
</body>
</html>