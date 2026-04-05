<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myMeeting</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ad57018f836bb74c10d919e862f189a&libraries=clusterer"></script>
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
			display: grid;
			grid-template-columns:repeat(4, 1fr);
			gap:20px;
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
        
        .meeting-card {
		    width: 300px;
		    border: 2px solid #A66A3F;
		    border-radius: 10px;
		    background-color: #fbe5c0;
		    padding: 35px;
		    margin-left: 30px;
		    margin-top: 230px;
		}
		
		.card-header {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    font-weight: bold;
		    font-size:20px;
		    color: #5e361a;
		}
		
		.category, .isLeader {
		    display: inline-block;
		    line-height : 23px;
		    font-size: 12px;
		    padding: 3px 8px;
		    border-radius: 5px;
		    margin-top: 18px;
		    margin-bottom: 10px;
		    background-color: #FFB300;
		    height: 20px;
		    color: #286708;
		}
		
		.desc {
		    margin-bottom: 10px;
		    color: #5e361a;
		}
		
		.info {
		    font-size: 13px;
		    color: #555;
		    margin-bottom: 20px;
		    color: #5e361a;
		}
		
		.card-footer {
		    display:flex;
		    gap: 8px;
		    color: #5e361a;
		    font-weight: bold;
		}
		
		.meetingDetail {
		    width: 47%;
		    height: 30px;
		    background-color: #FFB300;
		    border:none;
		    border-radius: 10px;
		    color: #5e361a;
		}
		
		.deleteBtn{
			width: 47%;
		    height: 30px;
		    background-color: #FFB300;
		    border:none;
		    border-radius: 10px;
		    color: #5e361a;
		}
		
		.outBtn{
			display: none;
			width: 45%;
		    height: 30px;
		    background-color: #FFB300;
		    border:none;
		    border-radius: 10px;
		    color: #5e361a;
		}
		.tagDiv{
			display: flex;
			gap: 7px;
		}
		
		.manageMeeting{
			display: flex;
			gap: 20px;
			align-items: center;
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
		}
		.myMeetingBtn{
			margin-left: 30px;
			background-color: #A66A3F;
			color: white;
		}
		.manageBtn{
		 	background-color: #E5D3B3;
		 	color: #5e361a;
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
	<%--     	<c:forEach var="i" items="${list}"> --%>
	<%--  data-seq="${i.meet_seq}" 아래 태그에 추가하기--%>
					<div class="meeting-card">
						<div class="card-header">
							<div class="title">모임 제목</div>
						</div>
						<div class="tagDiv">
							<div class="category">카테고리</div>
							<div class="isLeader">관리자</div>
						</div>
						
						<div class="desc">한줄소개</div>
						
						<div class="info">
							<div class="location">📍 위치</div>	
							<div class="count">👥 정원수</div>
						</div>
						
						<div class="card-footer">
							<button class="meetingDetail" type="button">자세히 보기</button>
							<button class="deleteBtn" type="button">모임 삭제</button>
							<button class="outBtn" type="button">모임 탈퇴</button>
						</div>
					</div>
	<%-- 		</c:forEach> --%>
			
	</div>
	<div class="bottomBar">
		<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a>
		<a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
		<a href="/meeting/list"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a>
		<a href="/feedback/feedbackHome"><i class="fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a>
		<a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
	</div>
		
	<script>
			$(".meetingDetail").on("click", function(){
			    let seq = $(this).data("seq");
			    location.href = "/meeting/meetingDetail?seq=" + seq;
			});
	</script>
</body>
</html>