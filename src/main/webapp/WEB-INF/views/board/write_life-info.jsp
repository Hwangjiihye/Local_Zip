<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


<style>
/* 폰트 */
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

* {
	box-sizing: border-box;
}

body, html {
	margin: 0;
	padding: 0;
}

/* 폰트 지정 */
button, body, div, input {
	font-family: 'GMarketSans', sans-serif;
}

.container {
	width: 100%;
	min-height: 100vh;
	/* 최소 높이 지정 : 브라우저 */
	background-color: #fbe5c0;
}

.headBox {
	width: 100%;
	height: 100px;
	padding-left: 20px;
	font-weight: bold;
	font-size: 50px;
	color: #A66A3F;
	background-color: #F2D3A2;
	border-bottom: 2px solid #A66A3F;
	/* 아래쪽만 줄 그음 */
	line-height: 100px;
	z-index: 1000;
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
	width: 80%;
	border-radius: 10px;
	background-color: #fbe5c0;
	padding: 35px;
	margin-top: 30px;
	background-color: #F2D3A2;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}


.titleDiv, .categoryDiv, .fileDiv, .locationDiv, .TextDiv {
	padding: 10px;
	border-bottom: 1px dotted #A66A3F;
}

.TextDetail {
/* 	width: 70%; */
/* 	padding-left: 3px; */
/* 	border-radius: 8px; */
/* 	background-color: #f0d8af; */
	
	min-height: 300px;


	border: 1px solid #A66A3F;
	background-color: #fbe5c0;
	width: 970px;
	height: 35px;
	top: 30px;
	left: 0;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	z-index: 10;
	font-family: 'GMarketSans';
	border-radius: 5px;
	color: #A66A3F;
	font-size: 15px;
	padding: 2px;
	outline: none;
	
	
}

.fileDetail {
	width: 70%;
	padding-left: 3px;
	border-radius: 8px;
}



.openChatLinkDiv, .openChatPwDiv {
	padding: 10px;
}

.TextTitle {
	font-weight: bold;
	font-size: 23px;
	color: #5e361a;
	border: none;
	padding-left: 2px;
}

.title, .category, .file, .location, .openChatLink, .openChatPw {
	font-weight: bold;
	font-size: 23px;
	color: #5e361a;
}

.inputLink, .inputPw {
	padding: 5px;
	background-color: #fbe5c0;
	border-radius: 10px;
	border: none;
	font-size: 15px;
	width: 400px;
	word-break: break-all;
	white-space: normal;
}

.openChatWrapper {
	display: flex;
	gap: 300px;
}

.openChatPwDiv {
	padding-left: 50px;
}

.bottomBtn {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-top: 20px;
	margin-bottom: 10px;
}

.requestBtn, .backBtn {
	width: 350px;
	height: 40px;
	background-color: #FFB300;
	border: none;
	border-radius: 10px;
	color: #5e361a;
	font-size: 17px;
	font-weight: bold;
}

.requestBtn:hover, .backBtn:hover {
	transform: translateY(-3px);
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.requestBtn:active, .backBtn:active {
	transform: translateY(2px);
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.categoryGuide {
	font-size: 14px;
	color: #5e361a;
}

.report {
	display: none;
	width: 200px;
	height: 32px;
	top: 30px;
	left: 0;
	width: 150px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	z-index: 10;
	font-family: 'GMarketSans';
	border: 1px solid #A66A3F;
	border-radius: 5px;
	background-color: #F2D3A2;
	color: #A66A3F;
	font-size: 15px;
	padding: 2px;
	outline: none;
}

.inputBox {
	border: 1px solid #A66A3F;
	background-color: #fbe5c0;
	width: 970px;
	height: 35px;
	top: 30px;
	left: 0;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	z-index: 10;
	font-family: 'GMarketSans';
	border-radius: 5px;
	color: #A66A3F;
	font-size: 15px;
	padding: 2px;
	outline: none;
}
</style>



</head>
<body>

	<div class="container">
		<div class="headBox">새 게시글 작성</div>

		<form action="">
			<div class="meetingDetail">
				<div class="titleDiv">
					<div class="title">제목</div>
					<div class="titleContent"><input class="inputBox" maxlength="50" type="text" style="border: #fbe5c0" placeholder="제목을 입력해주세요"></div>
					
				</div>
	
				<div class="categoryDiv">
					<div class="category">카테고리</div>
					<div class="categoryGuide">
						카테고리를 선택하세요 <i class="icon fa-solid fa-sort fa-lg" style="color: #A66A3F;"></i>
					</div>
					<select class="report">
						<option class="report-menu">생활정보</option>
						<option class="report-menu">맛집/카페</option>
						<option class="report-menu">고민/이야기</option>
						<option class="report-menu">미용/패션</option>
					</select>
				</div>
	
	
	
				<div class="fileDiv">
					<div class="file">
						첨부파일 <i class="fa-solid fa-file-circle-plus fa-sm"></i>
					</div>
					<div class="fileDetail">
						<input class="fileBtn" type="file" name="files" multiple>
					</div>
				</div>
	
				<div class="TextDiv">
					<div class="TextTitle">내용</div>
					<textarea class="TextDetail" type="text" placeholder="내용을 작성해주세요" maxlength="1000" style="border: #fbe5c0"></textarea>
				</div>
	
	
			</div>
	
				<div class="bottomBtn">
					<button class="requestBtn">작성 완료</button>
					<a href="/"><button class="backBtn" type="button">뒤로가기</button></a>
				</div>

		</form>

	</div>

	<script>
		$(".icon").on("click", function(e) {
			$(".report").css({
				"display" : "inline"
			});
		});
	</script>


</body>
</html>