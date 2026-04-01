<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfo</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
    .topBar{
        font-weight: bold;
        font-size: 50px;
        color: #A66A3F;
        border-bottom: 2px solid #A66A3F;
        height: 100px;
        line-height: 100px;
        background-color: #F2D3A2;
        padding-left: 20px;
        display: flex;
    }
    .backBtnDiv{
    	margin-left: 1500px;
    	margin-top: 10px;
    }
    .divTotal{
        padding-top: 60px;
        border: 2px solid #A66A3F;
        margin: auto;
        margin-top: 20px;
        width: 1000px;
        height: 600px;
        text-align: center;
        border-radius: 60px;
        background-color: #F2D3A2;
    }
    .form-row{
        display: flex;
        align-items: center;
        margin-bottom: 30px;
        margin-left: 90px;
    }
    
    .form-row div{
    	margin-left: 30px;
    }
    label {
        width: 120px;
        text-align: left;
        margin-right: 10px;
        margin-left: 230px;
        font-weight: bold;
    }
    .btnDiv{
    	margin-top: 30px;
    }
    .searchBtn{
    	margin-left: 10px;
    }
    .searchBtn, .backBtn{
        background-color: #ffb300;
        color: #5e361a;
        border: 1px solid #ffb300;
        border-radius: 10px;
        font-weight: bold;
    }
    .updateBtn, .deleteBtn, .completeBtn, .cancelBtn{
    	background-color: #ffb300;
        color: #5e361a;
        border: 1px solid #ffb300;
        border-radius: 10px;
        font-weight: bold;
        font-size: medium;
        width: 80px;
        height: 40px;
    }
    .completeBtn, .cancelBtn, .searchBtn{
    	display: none;
    }
    .updateBtn{
    	margin-right: 30px;
    }
    .backBtn{
    	height: 30px;
    	font-weight: bold;
    }
    .searchBtn:hover,
    .updateBtn:hover,
    .deleteBtn:hover,
    .completeBtn:hover,
    .cancelBtn:hover,
    .backBtn:hover{
	    transform: translateY(-3px); /* 살짝 위로 뜸 */
	    box-shadow: 0 6px 15px rgba(0,0,0,0.3);
    }

    .searchBtn:active,
    .updateBtn:active,
    .deleteBtn:active,
    .completeBtn:active,
    .cancelBtn:active,
    .backBtn:active{
    	transform: translateY(2px); /* 아래로 눌림 */
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }
    
    hr{
        margin-top: 30px;
        width: 700px;
        border-color: #A66A3F;
    }
    .iconDiv{
    
    }
/*     .icon{ */
    
/*     	margin-right: 5px; */
/*     } */
</style>
</head>
<body>
	<div class="container">
	    <div class="topBar">
	    	<div class="mainTitle">내 정보.zip</div>
	    	<div class="backBtnDiv">
	    		<a href="/members/mypage">
	    			<input class="backBtn" type="button" value="내.zip으로 가기">
	    		</a>
	    	</div>
	    </div>
	    <form>
	        <div class="divTotal">
	            <div class="form-row">
	            	<div class="iconDiv"><i class="fa-solid fa-user fa-lg icon"></i></div>
	                <label> NAME : </label>
	                <div class="name">${list.mem_name}</div>
	            </div>
	            <div class="form-row">
	            	<div class="iconDiv"><i class="fa-solid fa-address-card fa-lg icon"></i></div>
	                <label> ID : </label>
	                <div class="id">${loginId }</div>
	            </div>
	            <div class="form-row">
	                <label><i class="fa-solid fa-user-pen fa-lg icon"></i>NICKNAME : </label>
	                <div class="nickname">${list.mem_nickname}</div>
	            </div>
	            <div class="form-row">
	                <label><i class="fa-solid fa-envelope fa-lg icon"></i> EMAIL : </label>
	                <div class="email">${list.mem_email}</div>
	            </div>
	            <div class="form-row">
	                <label><i class="fa-solid fa-phone fa-lg icon"></i> PHONE : </label>
	                <div class="phone">${list.mem_phone}</div>
	            </div>
	            <div class="form-row">
	                <label><i class="fa-solid fa-house-chimney fa-lg icon"></i>ZONECODE :</label>
	                <div class="zonecode">${list.mem_zip_code}</div>
	                <input class="searchBtn" type="button" value="찾기">
	            </div>
	            <div class="form-row">
	                <label>ADDRESS : </label>
	                <div class="address1">${list.mem_address1}</div>
	            </div>
	            <div class="form-row">
	                <label> DETAIL : </label>
	                <div class="address2">${list.mem_address2}</div>
	            </div>
	            <hr>
	            <div class="btnDiv">
	            	<input class="updateBtn" type="button" value="정보 수정">
	            	<input class="deleteBtn" type="button" value="회원 탈퇴">
	            	<input class="completeBtn" type="submit" value="수정 완료">
	            	<input class="cancelBtn" type="button" value="수정 취소">
	            </div>
	        </div>
    	</form>
    </div>
</body>
</html>