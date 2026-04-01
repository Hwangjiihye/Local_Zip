<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfo</title>
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
    }
    .divTotal{
        padding-top: 30px;
        border: 2px solid #A66A3F;
        margin: auto;
        margin-top: 20px;
        width: 1000px;
        height: 750px;
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
    .searchBtn, .updateBtn, .deleteBtn, .completeBtn, .cancelBtn, .backBtn{
        background-color: #ffb300;
        color: #5e361a;
        border: 1px solid #ffb300;
        border-radius: 10px;
        font-weight: bold;
    }
    .completeBtn, .cancelBtn{
    	display: none;
    }
    hr{
        margin-top: 20px;
        width: 700px;
        border-color: #A66A3F;
    }
</style>
</head>
<body>
	<div class="container">
	    <div class="topBar">
	    	<div class="mainTitle">내 정보.zip</div>
	    	<div><a href="/members/mypage"><input class="backBtn" type="button" value="내.zip가기"></a></div>
	    </div>
	    <form>
	        <div class="divTotal">
	            <div class="form-row">
	                <label>· NAME : </label>
	                <div class="name">${list.mem_name}</div>
	            </div>
	            <div class="form-row">
	                <label>· ID : </label>
	                <div class="id">${loginId }</div>
	            </div>
	            <div class="form-row">
	                <label>·NICKNAME : </label>
	                <div class="nickname">${list.mem_nickname}</div>
	            </div>
	            <div class="form-row">
	                <label>· EMAIL : </label>
	                <div class="email">${list.mem_email}</div>
	            </div>
	            <div class="form-row">
	                <label>· PHONE : </label>
	                <div class="phone">${list.mem_phone}</div>
	            </div>
	            <div class="form-row">
	                <label>·ZONECODE : </label>
	                <div class="zonecode">${list.mem_zip_code}</div>
	                <input class="searchBtn" type="button" value="찾기">
	            </div>
	            <div class="form-row">
	                <label>·ADDRESS : </label>
	                <div class="address1">${list.mem_address1}</div>
	            </div>
	            <div class="form-row">
	                <label>· DETAIL : </label>
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