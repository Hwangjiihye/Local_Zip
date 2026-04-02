<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ad57018f836bb74c10d919e862f189a&libraries=clusterer"></script>
</head>

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
		    width: 56.5%;
		    border-radius: 10px;
		    background-color: #fbe5c0;
		    padding: 35px;
		 	margin-top: 30px;
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
			display: flex;
		    flex-direction: column;
		    gap: 8px;
		    padding: 10px;
		    border-bottom: 1px dotted #A66A3F;
		}
		
		.openChatWrapper{
			display:flex;
			gap: 50px;
		}
		
		.bottomBtn {
		    display: flex;
		    justify-content: center;
		    gap: 20px;
		    margin-top: 20px;
		    margin-bottom: 10px;
		}
		
		.requestBtn, .backBtn{
			width: 350px;
		    height: 40px;
		    background-color: #FFB300;
		    border:none;
		    border-radius: 10px;
		    color: #5e361a;
		    font-size: 17px;
		    font-weight: bold;
		}
		
		.requestBtn:hover, .backBtn:hover {
			transform: translateY(-3px);
			box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
		}
		
		.requestBtn:active, .backBtn:active{
			transform: translateY(2px);
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
		}
		
		.clubName{
			width: 970px;
			height: 35px;
			top: 30px;
		    left: 0;
		    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
		    z-index: 10;
		    font-family: 'GMarketSans';
		    border-radius: 5px;
		    background-color: #fbe5c0;
		    color: #A66A3F;
		    font-size: 12px;
		    padding: 2px;
		    outline: none;
		}
		
		.detailContent{
			width: 970px;
			height: 300px;
			top: 30px;
		    left: 0;
		    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
		    z-index: 10;
		    font-family: 'GMarketSans';
		    border: 1px solid #A66A3F;
		    border-radius: 5px;
		    background-color: #fbe5c0;
		    color: #A66A3F;
		    font-size: 12px;
		    padding: 2px;
		    outline: none;
		}
		
		.categoryGuide{
			font-size: 14px;
    		color: #5e361a;
		}
		
		.report{
			display: none;
			width: 200px;
    		height: 32px;
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
		
		textarea{
		    resize: none;
		}
		
		.kakaotalk{
			width: 600px;
			height: 35px;
			top: 30px;
		    left: 0;
		    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
		    z-index: 10;
		    font-family: 'GMarketSans';
		    border: 1px solid #A66A3F;
		    border-radius: 5px;
		    background-color: #fbe5c0;
		    color: #A66A3F;
		    font-size: 12px;
		    padding: 2px;
		    outline: none;
		}
		
		.kakaotalkPw {
			width: 300px;
			height: 35px;
			top: 30px;
		    left: 0;
		    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
		    z-index: 10;
		    font-family: 'GMarketSans';
		    border: 1px solid #A66A3F;
		    border-radius: 5px;
		    background-color: #fbe5c0;
		    color: #A66A3F;
		    font-size: 12px;
		    padding: 2px;
		    outline: none;
		}
	
	</style>
<body><!-- /meeting/test -->
<form action="/meeting/meetGenerate" class="frm" method="post">
	<div class="container">
		<div class="top-section">
			<div class="mainTitle">
			<span>새 모임 만들기</span>
			</div>
			
			
			</div>
			
				<div class="meetingDetail">
					<div class="titleDiv">
						<div class="title">모임명</div>
						<div class="titleDetail"><input name="meet_title" class="clubName" maxlength="50" type="text" style="border: #fbe5c0" placeholder="모임명을 작성해주세요."></div>
					</div>
					
					<div class="categoryDiv">
						<div class="category">카테고리</div>
							<div class="categoryGuide">카테고리를 선택하세요  <i class="icon fa-solid fa-sort fa-lg" style="color: #A66A3F;"></i></div>
							<select name="meet_category" class="report">
								<option class="report-menu">운동</option>
								<option class="report-menu">문화</option>
								<option class="report-menu">취미</option>
								<option class="report-menu">스터디</option>
							</select>
					</div>
					
					<div class="descDiv">
						<div class="desc">간단한 한 줄 소개</div>
						<div class="descDetail"><input name="meet_introcontents" class="clubName" maxlength="100" style="border: #fbe5c0" type="text" placeholder="한 줄 소개를 작성해주세요"></div>
					</div>
					
					<div class="descTextDiv">
						<div class="descText">자세한 소개글</div>
						<div class="descTextDetail"><textarea name="meet_detailcontents" class="detailContent" maxlength="1000" style="border: #fbe5c0" type="text" placeholder="모임을 소개해주세요"></textarea></div>
					</div>
					
					<div class="locationDiv">	
						<div class="location">활동지역</div>	
						<div class="locationDetail"><input name="mem_address1" class="clubName" maxlength="33" type="text" style="border: #fbe5c0" placeholder="활동지역을 입력해주세요"></div>
					</div>
					
					<div class="openChatWrapper">
						<div class="openChatLinkDiv">	
							<div class="openChatLink">카톡 오픈채팅 링크</div>	
							<div class="inputLink"><input name="meet_kakaolink" class="kakaotalk" maxlength="100" type="text" style="border: #fbe5c0" placeholder="카톡 오픈채팅 링크를 붙여넣어주세요"></div>
						</div>
						
						<div class="openChatPwDiv">
							<div class="openChatPw">카톡 오픈채팅 패스워드</div>
							<div class="inputPw"><input name="meet_kakaopw" class="kakaotalkPw" maxlength="8" type="text" style="border: #fbe5c0" placeholder="카톡 오픈채팅 비밀번호를 넣어주세요"></div>
						</div>
					</div>
			</div>
	</div>
		<div class="bottomBtn">
			<button class="requestBtn" type="submit">추가하기</button>
			
			<a href="/meeting/test"><button class="backBtn" type="button">뒤로가기</button></a>
		</div>   
</form>
		
		<script>
		$(".icon").on("click", function (e) {
		    $(".report").css({"display" : "inline"});
		});
		</script>

</body>
</html>