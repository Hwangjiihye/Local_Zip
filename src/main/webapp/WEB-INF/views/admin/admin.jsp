<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ad57018f836bb74c10d919e862f189a&libraries=clusterer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
	min-height: 100vh;
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
	padding-left: 20px;
}

.categoryDiv {
	border: 1px solid #A66A3F;
	font-size: 15px;
	width: 100%;
	height: 50px;
	margin-top: 13px;
	display: flex;
	align-items: center;
	gap: 10px;
	border: none;
}

.categoryBtnAll {
	margin-left: 10px;
	font-weight: bold;
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

.categoryBtnAll:hover, .navicon:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.categoryBtnAll:active, .navicon:active {
	transform: translateY(2px); /* 아래로 눌림 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.categoryBtnAll:first-child {
	margin-left: 25px;
}

.menuDiv{
	width: 1600px;
	margin: 200px auto 30px auto;
	border: 1px solid black;
	display:flex;
}
.menuDetail{
	border: 1px solid black;
	width: 20%;
	margin: 0 auto 0 auto;
}

.chart-box {
	width: 80%;
	height: 400px;
	border: 1px solid #999;
	padding: 35px;
	box-sizing: border-box;
	background-color: white;
	margin:auto auto 90px auto;
}

.chart-row {
	width: 80%;
	display: flex;
	gap: 30px;
	margin: 30px auto;
	position: relative;
	padding-top: 45px; 
}

.rowText{
	width: 100px;
	height: 40px;
	position: absolute;
    top: -20px;
    left: 10px;
	text-align: center;
	border: 1px solid black;
    padding: 3px 10px;
    font-weight: bold;
}


.chart-box.small {
	width: 50%;
	height: 290px;
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


.membersIcon, .visitantIcon, .askIcon{
	font-size:30px;
	padding: 10px 10px 0 20px;
}

.allMembersDiv, .visitantDiv, .askDiv{
	display: flex;
	flex-direction: column;
	padding: 10px;
}

.members, .visitant, .ask{
	display: flex;
	align-items: center;
	gap:10px;
}
</style>
</head>

<body>

	<div class="container">
		<div class="top-section">
			<div class="mainTitle">관리자.zip</div>
			<div class="categoryDiv">
				<button class="categoryBtnAll">
					<i class="fa-solid fa-chart-column"> 대시보드</i>
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-user"> 회원관리</i>
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-headset"> 고객지원</i>
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-bullhorn"> 공지사항</i>
				</button>
			</div>
		</div>

		<div class="menuDiv">

			<div class="members menuDetail">
				<div class="membersIcon"><i class="fa-solid fa-user"></i></div>
				<div class="allMembersDiv">
					<div class="allMembers">총 회원</div>
					<div class="membersCount">1,234</div>
				</div>
			</div>
			
			<div class="visitant menuDetail">
				<div class="visitantIcon"><i class="fa-solid fa-chart-column"></i></div>
				<div class="visitantDiv">
					<div class="allVisitant">오늘 방문자</div>
					<div class="visitantCount">750</div>
				</div>
			</div>
			
			<div class="ask menuDetail">
				<div class="askIcon"><i class="fa-solid fa-headset"></i></div>
				<div class="askDiv">
					<div class="allAsk">대기 문의</div>
					<div class="askCount">12</div>
				</div>
			</div>


		</div>


		<div class="chart-box">
			<div>일별 방문자</div>
			<canvas id="visitChart"></canvas>
		</div>
	
		
		<div class="chart-row">
			<div class="rowText">연령대별</div>
			<div class="chart-box small">
				<canvas id="ageChart"></canvas>
			</div>
			
			<div class="rowText">성별별</div>
			<div class="chart-box small">
				<canvas id="genderChart"></canvas>
			</div>
		</div>

		<div class="chart-box">
			<div>카테고리별 게시글 현황</div>
			<canvas id="categoryChart"></canvas>
		</div>


		<div class="bottomBar">
			<a href="/"><i class="navicon fa-solid fa-house fa-2xl"
				style="color: #A66A3F"></i></a> <a href="/map/test"><i
				class="navicon fa-solid fa-map-location-dot fa-2xl"
				style="color: #A66A3F"></i></a> <a href="/meeting/test"><i
				class="navicon fa-solid fa-people-group fa-2xl"
				style="color: #A66A3F"></i></a> <a><i
				class="fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a> <a
				href="/admin/test"><i class="navicon fa-solid fa-user fa-2xl"
				style="color: #A66A3F"></i></a>
		</div>
	</div>

	<script>
			let visitCtx = document.getElementById('visitChart'); // 선 차트
			
			new Chart(visitCtx, {
			    type: 'line',
			    data: {
			        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			        datasets: [
			            {
			                label: '총 방문자',
			                data: [120, 180, 250, 300, 420, 500, 650, 780, 720, 810, 760, 690],
			                borderColor: '#555',
			                backgroundColor: 'rgba(85,85,85,0.2)',
			                tension: 0.3
			            },
			            {
			                label: '신규 방문자',
			                data: [80, 140, 210, 260, 380, 470, 560, 510, 490, 620, 710, 860],
			                borderColor: '#bbb',
			                backgroundColor: 'rgba(180,180,180,0.2)',
			                tension: 0.3
			            }
			        ]
			    },
			    options: {
			        responsive: true,
			        maintainAspectRatio: false
			    }
			});
	
			let ageCtx = document.getElementById('ageChart'); // 연령대 도넛 차트
			
			new Chart(ageCtx, {
			    type: 'doughnut',
			    data: {
			        labels: ['10대', '20대', '30대', '40대'],
			        datasets: [{
			            data: [12, 35, 30, 23],
			            backgroundColor: ['#d9d9d9', '#bfbfbf', '#999999', '#666666']
			        }]
			    },
			    options: {
			        responsive: true,
			        maintainAspectRatio: false
			    }
			});
			
			let genderCtx = document.getElementById('genderChart'); // 연령대 성별 차트

			new Chart(genderCtx, {
			    type: 'doughnut',
			    data: {
			        labels: ['남성', '여성'],
			        datasets: [{
			            data: [420, 580],
			            backgroundColor: ['#999999', '#dddddd']
			        }]
			    },
			    options: {
			        responsive: true,
			        maintainAspectRatio: false
			    }
			});
			
			let categoryCtx = document.getElementById('categoryChart'); // 카테고리별 게시글 현황

			new Chart(categoryCtx, {
			    type: 'bar',
			    data: {
			        labels: ['운동', '스터디', '취미', '문화', '기타'],
			        datasets: [
			            {
			                label: '게시글 수',
			                data: [32, 21, 18, 27, 15],
			                backgroundColor: '#4caf50'
			            },
			            {
			                label: '신청 수',
			                data: [45, 17, 40, 38, 42],
			                backgroundColor: '#ffeb3b'
			            },
			            {
			                label: '신고 수',
			                data: [8, 7, 6, 5, 6],
			                backgroundColor: '#f44336'
			            }
			        ]
			    },
			    options: {
			        responsive: true,
			        maintainAspectRatio: false
			    }
			});
</script>
</body>
</html>