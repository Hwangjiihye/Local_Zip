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
* {box-sizing: border-box;}

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
	padding-top: 160px;
	padding-bottom: 65px;
}

.top-section {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background-color: #fbe5c0;
	z-index: 1000;
	border-bottom: 2px solid #A66A3F;
	border: none;
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
	margin-left: 20px;
	background-color: #FFB300;
	border-radius: 10px;
	border: 1px solid #FFB300;
	color: #286708;
	height: 30px;
	padding: 0 15px;
	cursor: pointer;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transition: all 0.2s ease;
	line-height: 30px;
}

.categoryBtnAll:hover, .navicon:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.categoryBtnAll:active, .navicon:active {
	transform: translateY(2px); /* 아래로 눌림 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
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

.categoryAndWriterDiv{
 	width: 100%; 
 	background-color:#F2D3A2;
 	display:flex;
 	justify-content: space-between;
 	align-items: center;
 	font-size: 14px;
 	border:none;
 	padding: 10px 15px;
 	margin:0;
}

.replyAdminId{
	padding-bottom: 10px;
	font-size: 14px;
	color: #5e361a;
	font-weight: bold;
}

.categoryAndWriter{
 	display:flex;
 	gap:20px;
 	align-items: center;
}

.inputQaReply{
 	padding:5px;
 	background-color: #F2D3A2;
 	color: #A66A3F;
 	border-radius: 10px;
 	border:none;
 	margin: 0 0 5px 0;
 	font-size:15px;
 	width: 835px;
 	height: 40%;
 	word-break: break-all;
 	white-space: normal;
 	resize: none;
 	outline: none;
 	font-family: 'GMarketSans';
}

.answerDiv{
	padding:5px;
 	background-color: #F2D3A2;
 	color: #A66A3F;
 	border-radius: 10px;
 	border:none;
 	margin: 0 0 5px 0;
 	font-size: 15px;
 	width: 970px;
 	height: 40%;
 	font-family: 'GMarketSans';
}

.replyBtn{
 	 margin: 0 0 7px 15px;
 	 background-color: #ffb300;
     color: #5e361a;
     border: 1px solid #ffb300;
     border-radius: 10px;
     width: 100px;
 	 height: 40px;
 	 box-shadow: 0 4px 10px rgba(0,0,0,0.3);
 	 font-size:15px;
}

.replyTextAndBtn{
 	display:flex;
 	align-items: center;
 	gap:10px;
}

.qaReply{
	padding: 10px 15px;
/* 	margin: 0 10px 10px 15px; */
	border-radius: 10px;
}

.replyRow {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.adminProfileDiv{
 	margin-left: 0;
}

.category{
 	font-size:14px;
    height: 25px;
 	background-color: #FFB300;
	border-radius: 10px;
 	border: 1px solid #FFB300;
 	color: #3e5e40;
 	align-items: center;
 	vertical-align: middle;
 	line-height: 18px;
 	padding:5px;
}

.postBox {
        width: 95%;
        max-width: 1000px;
        margin: 20px auto 0 auto;
        background-color: #fbe5c0; /* 와이어프레임의 흰색 배경 느낌 */
        border-radius: 5px;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0,0,0,0.3);
    }

    .postHeader {
        background-color: #F2D3A2;
        padding: 10px 15px;
        font-size: 14px;
        border-bottom: 1px solid #A66A3F;
        color: #A66A3F;
        display: flex;
        justify-content: space-between;
    }

    .postBody {
        padding: 15px 15px 5px 15px;
    }

    .rowItem1 {
        border: 0px solid #ccc;
        margin-bottom: 10px;
        padding: 10px;
        border-radius: 5px;
        background-color: #F2D3A2;
    }

    .rowItem2 {
        border: 0px solid #ccc;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        padding: 10px;
        border-radius: 5px;
    }
    
    .labelName {
        font-size: 12px;
        color: #5e361a;;
        display: block;
        margin-bottom: 5px;
    }

    .titleContent { font-weight: bold; font-size: 18px; color: #5e361a; }
    .textContent { font-size: 15px; color: #444; min-height: 60px; color: #5e361a;}

    /* 답변 영역 (와이어프레임의 하단 칸) */
    .answerBox {
        background-color: #F2D3A2;
        border-top: 1px solid #A66A3F;
        padding: 15px;
        color : #5e361a;
    }
    .answerLabel {
        font-weight: bold;
        color: #5e361a;
        margin-bottom: 5px;
        display: block;
    }

    /* 하단 페이지네이션 */
    .pageBox {
        text-align: center;
        padding: 20px;
        font-size: 18px;
        color: #A66A3F;
        transform: translateX(-20px);
    }
    .pageBox span { margin: 0 10px; cursor: pointer; }
 
</style>
</head>

<body>
	
	<div class="container">
		<div class="top-section">
			<div class="mainTitle">관리자.zip</div>
			<div class="categoryDiv">
				<a href="/admin/adminPage"><button class="categoryBtnAll">
					<i class="fa-solid fa-chart-column fa-lg"></i> 대시보드
				</button></a>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-user fa-lg"></i> 회원관리
				</button>
				<a href="/admin/adminQA"><button class="categoryBtnAll">
					<i class="fa-solid fa-headset fa-lg"></i> 고객지원
				</button></a>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-bullhorn fa-lg"></i> 공지사항
				</button>
			</div>
		</div>
		
		
		<c:forEach var="i" items="${list}">
			<div class="postBox">
		        <div class="postHeader">
		        <div class="categoryAndWriter">
		           
		           		<div class="writer">작성자: ${i.mem_id}</div> 
	           		<c:choose>
	           			<c:when test="${i.qa_category == 0}"><div class="category">계정/로그인</div></c:when>
	           			<c:when test="${i.qa_category == 1}"><div class="category">이용문의</div></c:when>
	           			<c:when test="${i.qa_category == 2}"><div class="category">기타</div></c:when>
	             	</c:choose>
		           	</div>
		           	
		           	<div class="writeData">${i.qa_create_date}</div> 

		        </div>
        	<div class="postBody">
            	<div class="rowItem1">
	                <span class="labelName">제목</span>
	                <div class="titleContent">${i.qa_title}</div>
            	</div>
           		<div class="rowItem2">
                	<span class="labelName">내용</span>
	                <div class="textContent">
	                  ${i.qa_contents}
	                </div>
            	</div>
        		</div>
      	<c:choose>
      		<c:when test="${i.qa_status == 0}">
        	<div class="qaReply">
        			<div class="qaReplyRow">
			        	<div class="adminProfileDiv">
			        		<div class="replyAdminId">관리자</div>
		        		</div>
	        		<form action="/admin/answer" method="post">
	        			<input type="hidden" name="qa_seq" value="${i.qa_seq}">
	        			
		        		<div class="replyTextAndBtn">
			            	<textarea placeholder="댓글을 입력하세요." maxlength="1000" class="inputQaReply" name="admin_answer"></textarea>
							<button class="replyBtn" type="submit">등록</button>
						</div>
					</form>
	        		</div>  
	        	</div> 
        	</c:when>
        	<c:when test="${i.qa_status == 1}">
	        	<div class="qaReply">
        			<div class="qaReplyRow">
			        	<div class="adminProfileDiv">
			        		<div class="replyAdminId">관리자</div>
		        		</div>
			            	<div class="answerDiv">${i.admin_answer}</div>
	        		</div>  
	        	</div> 
        	</c:when>
        	</c:choose>
    		</div>
   			
  		
		</c:forEach>
		<div class="pageBox">
		        <i class="fa-solid fa-chevron-left"></i>
		        <span>1</span> <span>2</span> <span>3</span>
		        <i class="fa-solid fa-chevron-right"></i>
    	</div>
    	
		<div class="bottomBar">
			<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> 
			<a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
			<a href="/meeting/test"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a> 
			<a><i class="fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a> 
			<a href="/admin/adminPage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
		</div>
	</div>
	
	<script>
			$(".inputQaReply").on("input", function(){
			    this.style.height = "auto";              // 초기화
			    this.style.height = this.scrollHeight + "px";  // 내용만큼 늘림
			});
	
	</script>
</body>
</html>