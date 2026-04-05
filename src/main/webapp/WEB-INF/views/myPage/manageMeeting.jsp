<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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
		}
		
		body {
			margin: 0;
			background-color: #fbe5c0;
		}
		
		.container {
			width: 100%;
			margin-bottom: 200px;
		}
		
		.top-section {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			z-index: 1000;
			border-bottom: 2px solid #A66A3F;
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
			padding: 0 20px;
			box-sizing: border-box;
		}
        
        .bottomBar{
            border: 2px solid #A66A3F;
            background-color: #F2D3A2;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            gap: 200px;
        }
        
        .meetingDetail:hover,
        .deleteBtn:hover,
        .outBtn:hover,
        .myMeetingBtn:hover,
        .manageBtn:hover{
            transform: translateY(-3px); /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }

        .meetingDetail:active,
        .deleteBtn:active,
        .outBtn:active,
        .myMeetingBtn:active,
        .manageBtn:active{
            transform: translateY(2px); /* 아래로 눌림 */
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        
		.manageMeeting{
			display: flex;
			gap: 20px;
			align-items: center;
			background-color: #fbe5c0;
		}
		
		.myMeetingBtn, .manageBtn{
			width: 48%;
		    height: 70px;
		    border: none;
		    color: #5e361a;
		    font-weight: bold;
		    font-size: x-large;
		    border-radius: 10px;
		    margin-top: 10px;
			margin-bottom: 10px;
			color: #5e361a;
		}
		.myMeetingBtn{
			margin-left: 30px;
			background-color: #E5D3B3;
		}
		.manageBtn{
		 	background-color: #FFB300;
		}
		.emptyMeeting{
			text-align: center;
			font-weight: bold;
			font-size: large;
		}
		.meetingListDiv{
			margin-top: 230px;
			font-weight: 500;
			color: #5e361a;
		}
		.completeMeeting{
			font-weight: 500;
			color: #5e361a;
			margin-top: 20px;
		}
		.acceptBtn, .rejectBtn{
			color: #5e361a;
			width: 40%;
		    height: 35px;
		    border:none;
		    border-radius: 10px;
		    font-size: large;
		    color: #f5f5f5;
		}
		.acceptBtn{
			margin-left: 155px;
			margin-right: 10px;
		    background-color: #7BB8C9;
		}
		.rejectBtn{
		    background-color: #FF000080;
		}
		.acceptedBtn, .rejectedBtn{
			color: #5e361a;
		    height: 35px;
		    border:none;
		    border-radius: 10px;
		    font-size: large;
		    color: #f5f5f5;
		    width: 80%;
		}
		.acceptedBtn{
			background-color: #7BB8C9;
			margin-left: 150px;
			display: none;
		}
		.rejectedBtn{
			background-color: #FF000080;
			margin-left: 150px;
			display: none;
		}
		.completeComments{
			font-weight: bold;
			font-size: large;
			text-align: center;
			background-color: #F2D3A2;
			margin-top: 50px;
			color: #5e361a;
		}
		.meeting-card, .completeMeeting-card{
			width: 80%;
			margin-left: 185px;
			padding-bottom: 20px;
			margin-top: 20px;
			border-radius: 10px;
			box-shadow: 0 6px 15px rgba(0,0,0,0.3);
		}
		.nickname, .com_nickname{
			margin-top: 5px;
			min-height: 50px;
			font-weight: bold;
			font-size: x-large;
			background-color: #F2D3A2;
			padding-left: 20px;
			padding-top: 7px;
		}
		.title, .com_title{
			min-height: 40px;
			font-weight: bold;
			font-size: large;
			padding-left: 20px;
			margin-top: 7px;
		}
		.info, .com_info{
			min-height: 40px;
			font-size: large;
			padding-left: 20px;
		}
		.btnDiv, .comBtnDiv{
			margin-top: 20px;
		}
</style>
</head>
<body>
	<div class="container">
		<div class="top-section">
			<div class="mainTitle">내 모임.zip</div>
			<div class="manageMeeting">
				<input class="myMeetingBtn" type="button" value="참여 중인 모임">
				<input class="manageBtn" type="button" value="신청 관리">
			</div>
		</div>
		<div class="meetingListDiv">
<%-- 			<c:choose> --%>
<%-- 				<c:when test=""><div class="emptyMeeting">관리 중인 모임이 없습니다.</div></c:when> --%>
<%-- 			</c:choose> --%>
			<div class="meeting-card">
				<div class="nickname">신청자 닉네임</div>
				<div class="title">모임 제목</div>
				<div class="info">신청자 한 줄 소개</div>
				<div class="btnDiv">
					<button class="acceptBtn" type="button"><i class="fa-solid fa-circle-check fa-lg" style="color: #f5f5f5"></i> 승인</button>
					<button class="rejectBtn" type="button"><i class="fa-solid fa-circle-xmark fa-lg" ></i> 거절</button>
				</div>
			</div>
		</div>
		<div class="completeComments">처리 완료</div>
		<div class="completeMeeting">
			<div class="completeMeeting-card">
				<div class="com_nickname">신청자 닉네임</div>
				<div class="com_title">모임 제목</div>
				<div class="com_info">신청자 한 줄 소개</div>
				<div class="comBtnDiv">
					<div class="acceptedBtnDiv">
						<button class="acceptedBtn" type="button">
							<i class="fa-solid fa-circle-check fa-lg" style="color: #f5f5f5"></i> 승인됨
						</button>
					</div>
					<div class="rejectedBtnDiv">
						<button class="rejectedBtn" type="button">
							<i class="fa-solid fa-circle-xmark fa-lg" ></i> 거절됨
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bottomBar">
		<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a>
		<a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
		<a href="/meeting/list"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a>
		<a href="/feedback/feedbackHome"><i class="fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a>
		<a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
	</div>
	
	<script>
		$(".myMeetingBtn").on("click", function(){
		    location.href = "/meeting/myMeeting";
		});
	</script>
</body>
</html>