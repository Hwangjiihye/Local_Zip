<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meeting</title>
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
	background-color: #fbe5c0;
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
	display: flex;
	padding: 0 20px;
	justify-content: space-between; 
	align-items: center;
	box-sizing: border-box;
}

.categoryDiv {
	border: 1px solid #A66A3F;
	font-size: 15px;
	width: 100%;
	height: 50px;
	margin-top: 7px;
	display: flex;
	align-items: center;
	gap: 10px;    
	border: none;
}

.categoryBtnAll {
	margin-left: 10px;
	background-color: #FFB300;
	border-radius: 10px;
	border: 1px solid #FFB300;
	color: #3e5e40;
	height: 30px;
	padding: 0 15px;
	cursor: pointer;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transition: all 0.2s ease;
}

.categoryBtnAll:hover, .navicon:hover, .topBtn:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.categoryBtnAll:active, .navicon:active, .topBtn:active{
	transform: translateY(2px); /* 아래로 눌림 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.categoryBtnAll:first-child {
	margin-left: 25px;
}

.topBtn{
	 margin-left:auto;
	 background-color: #ffb300;
     color: #5e361a;
     border: 1px solid #ffb300;
     border-radius: 10px;
     font-weight: bold;
     width: 100px;
	 height: 40px;
	 box-shadow: 0 4px 10px rgba(0,0,0,0.3);
}

.bottomBar {
	border: 1px solid #A66A3F;
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 60px;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 1000;
	border-top: 2px solid #A66A3F;
	background-color: #F2D3A2;
	gap: 200px;
}

.meeting-card {
    width: 330px;
    border: 2px solid #A66A3F;
    border-radius: 10px;
    background-color: #fbe5c0;
    padding: 35px;
    margin-left: 30px;
    margin-top: 220px;
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: bold;
    font-size:20px;
    color: #5e361a;
}

.reportDiv{
	position: relative;
	display: inline-flex;
    align-items: center;
    gap: 5px;
    cursor: pointer;
}



.category {
    display: inline-block;
    line-height : 23px;
    font-size: 12px;
    padding: 3px 8px;
    border-radius: 5px;
    margin-top: 18px;
    margin-bottom: 10px;
    background-color: #FFB300;
    height: 20px;
    color: #5e361a;
}

.desc {
    margin-bottom: 10px;
    color: #5e361a;
}

.info {
    font-size: 13px;
    color: #555;
    margin-bottom: 10px;
    color: #5e361a;
}

.card-footer {
    text-align: center;
    color: #5e361a;
}

.join-btn {
    width: 100%;
    height: 40px;
    background-color: #FFB300;
    border:none;
    border-radius: 10px;
    color: #5e361a;
}

.report{
	display:none;
	position: absolute;
    top: 30px;
    left: 0;
    width: 150px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    z-index: 10;
    
    font-family: 'GMarketSans';
    border: 1px solid #A66A3F;
    border-radius: 5px;
    background-color: #F2D3A2;
    color: #A66A3F;
    font-size: 12px;
    padding: 2px;
    outline: none;
}

.report-menu{
	 font-family: 'GMarketSans';
     border: 1px solid #A66A3F;
     border-radius: 5px;
     background-color: #F2D3A2;
     color: #A66A3F;
     font-size: 12px;
     padding: 2px;
     outline: none;
}


.gauge-wrap {
	width: 100%;
	height: 12px;
	background-color: #f3d9a6;
	border-radius: 999px;
	overflow: hidden;
	margin-bottom: 8px;
	border: 1px solid #d7a25a;
}

.gauge-bar {
	height: 100%;
	background-color: #7BB8C9;
	border-radius: 999px;
}

.gauge-text {
	font-size: 12px;
	color: #5e361a;
	margin-bottom: 10px;
	text-align: right;
}

.nowBtn{
          	background-color: #fecc56;
            color: #A66A3F;

            transform: translateY(-3px);
            /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            
            
            height: 30px;

            border-radius: 10px;
            border: 1px solid #FFB300;

            align-items: center;
            /* 수직 중앙 정렬 */

            vertical-align: middle;
            /* 버튼들끼리 줄이 안 맞을 때를 대비 */

            cursor: pointer;
            transition: 0.3s;
        }

</style>
</head>
<body>

	<div class="container">
		<div class="top-section">
			<div class="mainTitle">
			<span>동네 모임.zip</span>
			<a href="/meeting/meetCreate"><button class="topBtn" type="button">+ 모임 만들기</button></a>
			</div>
			
			<div class="categoryDiv">
				<button class="categoryBtnAll nowBtn">
					<i class="fa-solid fa-house fa-lg"></i> 전체
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-dumbbell fa-lg"></i> 운동
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-film fa-lg"></i> 문화
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-palette fa-lg"></i> 취미
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-book fa-lg"></i> 스터디
				</button>
			</div>
		</div>
			
			<c:forEach var="i" items="${list}">
				<div class="meeting-card" data-seq="${i.meet_seq}">
					<div class="card-header">
						<div class="title">${i.meet_title}</div>
							<div class="reportDiv">
				<img src="/resources/images/free-icon-siren1.png" class="reportIcon" style="width: 25px; height: 25px; margin-bottom:5px" ></img>
								<select class="report">
									<option class="report-menu" disabled selected>신고 사유</option>
									<option class="report-menu">부적절한 컨텐츠</option>
									<option class="report-menu">욕설/비방</option>
									<option class="report-menu">광고/스팸</option>
								</select>
							</div>
					</div>
				
					<div class="category">${i.meet_category}</div>
					<div class="desc">${i.meet_introcontents}</div>
					
					
					<div class="info">	
						<div class="location">📍 ${i.mem_address1}</div>	
						<div class="count">👥 ${i.meet_maxpeople}</div>
					</div>
					
					<div class="card-footer">
						<div class="gauge-wrap">
							<div class="gauge-bar" style="width: 60%;"></div>
						</div>
						<div class="gauge-text">6 / 10명 참여중</div>
						<button class="join-btn">참여신청</button>
					</div>
				</div>
		</c:forEach>
		
	</div>
		<div class="bottomBar">
			<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a>
			<a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
			<a href="/meeting/list"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a>
			<a><i class="navicon fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a>
			<a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
		</div>
		
	<script>
			$(".reportIcon").on("click", function (e) {
			    e.stopPropagation();
			    $(this).siblings(".report").css("display", "block");
			});
			
			$(".report").on("click", function (e) {
			    e.stopPropagation();
			});
			
			$(document).on("click", function () {
			    $(".report").hide();
			});
			
			$(document).on("click", ".meeting-card", function(){
			    let seq = $(this).data("seq");
			    location.href = "/meeting/meetingDetail?seq=" + seq;
			});
			
			$(document).on("click", ".join-btn, .reportIcon", function (e) {
				e.stopPropagation();
			});
	</script>
</body>
</html>