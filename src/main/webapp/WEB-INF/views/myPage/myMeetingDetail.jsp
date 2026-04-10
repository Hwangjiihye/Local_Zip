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
	
	*{box-sizing: border-box;}
	
	button, body {
		font-family: 'GMarketSans', sans-serif;
	}
	
	body {
		margin: 0;
		background-color: #fbe5c0;
	}
	
	.container {
		width: 100%;
	}
	
	.mainTitle {
		width: 100%;
		font-weight: bold;
		font-size: 50px;
		color: #A66A3F;
		border-bottom: 2px solid #A66A3F;
		background-color: #F2D3A2;
		height: 100px;
		line-height: 100px;
		display: flex;
		padding: 0 20px;
		justify-content: space-between; 
		align-items: center;
		box-sizing: border-box;
	}
	
	.meetingDetail {
		margin: auto;
	    width: 70%;
	    border-radius: 10px;
	    background-color: #fbe5c0;
	    padding: 35px;
	 	margin-top: 60px;
	    background-color: #F2D3A2;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	}
	
	.card-header {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    font-weight: bold;
	    font-size:20px;
	    color: #5e361a;
	}
	
	.titleDiv, .categoryDiv, .descDiv, .locationDiv, .descTextDiv{
		padding:10px;
		border-bottom: 1px dotted #A66A3F;
	}
	
	.openChatLinkDiv, .openChatPwDiv{
		padding:10px;
	}
	
	.descText{
		font-weight: bold;
	    font-size: 23px;
	    color: #5e361a;
	    border: none;
	    padding-left: 2px;
	}
	
	.descTextDetail{
		padding-top: 10px;
		border: none;
		width: 70%;
		padding-left: 2px;
	}
	
	.title, .category, .desc, .location, .openChatLink, .openChatPw{
		font-weight: bold;
	    font-size: 23px;
	    color: #5e361a;
	}
	
	.categoryDiv{
		display:flex;
		gap:10px;
	}
	
	.inputLink, .inputPw{
		padding:5px;
		background-color: #fbe5c0;
		border-radius: 10px;
		border:none;
		font-size:15px;
		width: 400px;
		word-break: break-all;
		white-space: normal; 
	}
	
	.openChatWrapper{
		display:flex;
		gap: 300px;
	}
	
	.openChatPwDiv{
		padding-left: 50px;
	}
	
	.categoryDetail {
	    display: inline-block;
	    line-height : 25px;
	    font-size: 12px;
	    padding: 3px 8px;
	    border-radius: 5px;
	    background-color: #FFB300;
	    height: 28px;
	    color: #3e5e40;
	    font-weight: bold;
	}
	
	.bottomBtn {
	    margin-top: 20px;
	    margin-bottom: 10px;
	    align-items: center;
	}
	
	.backBtn{
		width: 350px;
	    height: 40px;
	    background-color: #FFB300;
	    border:none;
	    border-radius: 10px;
	    color: #5e361a;
	    font-size: 17px;
	    font-weight: bold;
	    margin-left: 750px;
	}
	
	.backBtn:hover {
		transform: translateY(-3px);
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
	}
	
	.backBtn:active{
		transform: translateY(2px);
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	}
	
	.leftImg, .rightImg{
		position: absolute;
		width: 450px;
		height: 170px;
		z-index: 10;
		bottom: 0;
	}
	.leftImg{
	    left: 0;
	}
	.rightImg{
		right: 0;
	}
	.descTextDetail{
		white-space: pre-wrap;
	}
</style>
</head>
<body>

	<div class="container">
		<div class="top-section">
			<div class="mainTitle">
				<span>모임 상세</span>
			</div>
			
			
		</div>
			<c:forEach var="i" items="${list}">
				<div class="meetingDetail">
					<div class="titleDiv">
						<div class="title">모임명</div>
						<div class="titleDetail">${i.meet_title}</div>
					</div>
					
					<div class="categoryDiv">
						<div class="category">카테고리</div>
						<div class="categoryDetail">${i.meet_category}</div>
					</div>
					
					<div class="descDiv">
						<div class="desc">간단한 한 줄 소개</div>
						<div class="descDetail">${i.meet_introcontents}</div>
					</div>
					
					<div class="descTextDiv">
						<div class="descText">자세한 소개글</div>
						<div class="descTextDetail">${i.meet_detailcontents}</div>
					</div>
					
					<div class="locationDiv">	
						<div class="location">활동지역</div>	
						<div class="locationDetail">${i.mem_address1}</div>
					</div>
					
					<div class="openChatWrapper">
						<div class="openChatLinkDiv">	
							<div class="openChatLink">카톡 오픈채팅 링크</div>	
							<div class="inputLink">${i.meet_kakaolink}</div>
						</div>
						
						<div class="openChatPwDiv">
							<div class="openChatPw">카톡 오픈채팅 패스워드</div>
							<div class="inputPw">${i.meet_kakaopw}</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<img class="leftImg" src="/resources/images/왼쪽 모서리 풀.png">
    		<img class="rightImg" src="/resources/images/오른쪽 모서리 풀.png">
	</div>
	<div class="bottomBtn">
			<a href="/meeting/myMeeting"><button class="backBtn" type="button">뒤로가기</button></a>
	</div>
</body>
</html>