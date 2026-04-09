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
	display: flex;
    align-items: center;
    gap : 5px;
}

.categoryBtnAll:hover, .navicon:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
} 

.categoryBtnAll:active, .navicon:active {
	transform: translateY(2px); /*아래로 눌림*/
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); 
}

.nowBtn{
	background-color: #fecc56;
	color: #A66A3F;
	transform: translateY(-3px);
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
	height: 30px;
	border: 1px solid #FFB300;
	align-items: center;
	vertical-align: middle;
	cursor: pointer;
	transition: 0.3s;
}

.categoryBtnAll:active{
    transform: translateY(2px);
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

.postBox {
        width: 95%;
        max-width: 1000px;
        margin: 20px auto 0 auto;
        background-color: #fbe5c0;
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

.reportWriter {
    margin-left: 10px;
}

.postBody {
        padding: 15px 15px 5px 15px;
}

.rowItem2 {
        border: 0px solid #ccc;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        padding: 10px;
        border-radius: 5px;
}
    

/* .reportReason { font-weight: bold; font-size: 18px; color: #5e361a; } */
.reportReason { font-size: 18px; color: #444; min-height: 60px; color: #5e361a;}

.pageBox {
        text-align: center;
        padding: 20px;
        font-size: 18px;
        color: #A66A3F;
        transform: translateX(-20px);
    }
.pageBox span { margin: 0 10px; cursor: pointer; }
 
.reportBtnDiv{
 	margin: 30px auto 0 auto;
 	display: flex;
 	justify-content: center;
 	align-items: center;
 	gap: 100px;
 }
 
.reportBtnDiv>button{
 	 background-color: #fbe5c0;
     color: #5e361a;
     font-weight: bold;
     border:none;
     width: 100px;
 	 height: 40px;
 	 font-size:15px;
 } 
 
.adminBtnArea{
 	display:flex;
	gap:10px;
	flex-shrink:0;
 }
.adminBtn, .replyBtn{
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
 
.pageBox{
    text-align: center;
    padding: 20px;
    font-size: 18px;
    color: #A66A3F;
}

.pageBox a{
    display: inline-block;
    min-width:35px;
    padding:6px 10px;
    margin: 0 8px;
    text-decoration: none;
    color: #A66A3F;
    border-radius:6px;
    transition:0.2s;
    font-weight: normal;
    cursor: pointer;
}

.pageBox a.active{
	background-color:#fecc56;
    font-weight: bold;
    color: #5e361a;
}

.pageBox a:hover{
    background-color:#F2D3A2;
}

.answerDiv.editing {
    background-color: transparent !important;
    padding: 0 !important;
    border: none !important;
}


a{
	text-decoration: none;
}

img{
	width: 16.67px;
	height: 16.10px;
}

.reportAndBlackBtnDiv{
	display:flex;
	justify-content: center;
 	align-items: center;
 	padding-left:20px;
}

.reportCheckBtn, .blackOnBtn, .blackOffBtn, .blackOffCheckBtn{
	width: 250px;
	color: #5e361a;
    height: 35px;
    border:none;
    border-radius: 10px;
    font-size: small;
    color: #f5f5f5;
    margin:20px 20px 20px 20px;
}

.reportCheckBtn{
    background-color: #7BB8C9;
}

.blackOnBtn{
    background-color: #FF000080;
}

.blackOffBtn{
	width: 270px;
	background-color: #6DBE45;
}

.blackOffCheckBtn{
	width: 270px;
	background-color: #6DBE45;
}


.endOption{
    width: 100px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    z-index: 10;
    font-family: 'GMarketSans';
    border: 1px solid #A66A3F;
    border-radius: 5px;
    background-color: #F2D3A2;
    color: #A66A3F;
    font-size: 12px;
    outline: none;
}

.end_date{
	 font-family: 'GMarketSans';
     border: 1px solid #A66A3F;
     border-radius: 5px;
     background-color: #F2D3A2;
     color: #A66A3F;
     font-size: 12px;
     padding: 2px;
     outline: none;
}

</style>
</head>

<body>
	
	<div class="container">
		<div class="top-section">
			<div class="mainTitle">관리자.zip</div>
			<div class="categoryDiv">
				<a href="/admin/adminPage"><button class="categoryBtnAll ${menu == 'dashboard' ? 'nowBtn' : ''}">
					<i class="fa-solid fa-chart-column fa-lg"></i> 대시보드
				</button></a>
				<a href="/admin/adminBlackList"><button class="categoryBtnAll ${menu == 'report' ? 'nowBtn' : ''}"> 
					<img src="/resources/images/adminSiren.png"></img> 신고관리
				</button></a>
				<a href="/admin/adminQA"><button class="categoryBtnAll ${menu == 'qa' ? 'nowBtn' : ''}">
					<i class="fa-solid fa-headset fa-lg"></i> 고객지원
				</button></a>
				<a href="/admin/toAdminNotice?cPage=1"><button class="categoryBtnAll ${menu == 'notice' ? 'nowBtn' : ''}">
					<i class="fa-solid fa-bullhorn fa-lg"></i> 공지사항
				</button></a>
			</div>
		</div>
		
		<div class="reportBtnDiv">
				<button class="navicon filterBtn" data-status="all">전체 ${allCount}</button>
				<button class="navicon filterBtn" data-status="4">미처리 ${count}</button>
				<button class="navicon filterBtn" data-status="3">처리완료 ${handleCount}</button>
		</div>
		
		<div id="reportListWrap"></div>
		
		<div class="pageBox"></div>
    	
		<div class="bottomBar">
			<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> 
			<a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
			<a href="/meeting/list?category=all"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a> 
			<a><i class="fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a> 
			<a href="/admin/adminPage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
		</div>
	</div>
	
	<script>

				
			// 신고목록 출력
			// 버튼 클릭시 status값 컨트롤러로 전달
			$(document).on("click", ".filterBtn", function(){
			    let status = $(this).data("status");
			
			
			    $.ajax({
					url : "/admin/getReportList",
					type : "get",
					data : {
						status : status
					},
					dataType : "json",
					success : function(resp){
						drawreportList(resp.list);
					}
				});
			});
			
			$(document).on("click", ".filterBtn", function(){
			    // 1. 모든 필터 버튼에서 활성화 클래스 제거 (기존 navicon 효과 등 포함)
			    $(".filterBtn").removeClass("nowBtn");
			    
			    // 2. 클릭한 버튼에만 활성화 클래스 추가
			    $(this).addClass("nowBtn");
			});

			// 페이지 로드 시 '전체' 버튼에 기본으로 클래스 넣어주기
			$(function(){
			    $(".filterBtn[data-status='all']").addClass("nowBtn");
			    loadQaList("all", 1);
			});
			
			// 페이지 진입시 전체 목록 출력
			loadDefaultList();
			function loadDefaultList() {
			    $.ajax({
			        url: "/admin/getReportList",
			        type: "get",
			        data: { status: "all" },
			        success: function(resp) {
			            drawreportList(resp.list);
			        }
			    });
			}
			
				
			// status값으로 처리완료/미처리 리스트 출력
			function drawreportList(list){
				$("#reportListWrap").empty();
				
				
				if(list.length == 0){
					$("#reportListWrap").append(`
						<div class="postBox">
							<div class="postBody">처리할 신고 내역이 없습니다.</div>
						</div>		
					`);
					return;
				}
				
			for(let i of list){
					let html = "";
				 	let btnHtml = "";
				 	let selectHtml = "";
				 	
				 	if(i.reports_status == 4){
				 		btnHtml = `
				 			<button class="onBtn reportCheckBtn" data-reports_seq ="\${i.reports_seq}">반려</button>
	        				<button class="onBtn blackOnBtn" data-target_id="\${i.target_id}" data-reports_reason="\${i.reports_reason}" data-reports_status="\${i.reports_status}" data-target_seq="\${i.target_seq}">블랙리스트</button>
	        				<button class="offBtn blackOffBtn" style="display:none;" data-target_id="\${i.target_id}">해제</button>
			 			`;
				 	
				 		selectHtml = `
				 			<div class="endDiv">
		        				<select class="endOption">
		        					<option class="end_date" disabled selected>정지일수</option>
		        					<option class="end_date" value="3">3일</option>
		        					<option class="end_date" value="7">7일</option>
		        					<option class="end_date" value="30">30일</option>
		        					<option class="end_date" value="-1">영구정지</option>
		        				</select>
	        				</div>
        				`;
				 	}else if(i.reports_status == 3){
				 		btnHtml = `
				 			<button class="offBtn blackOffBtn" data-target_id="\${i.target_id}">해제</button>
        				`;
        				selectHtml = "";
				 	}else if(i.reports_status == 5){
				 		btnHtml = `
				 			<button class="blackOffCheckBtn" disabled>해제완료</button>
        				`;
        				selectHtml = "";
				 	}
				 	
						html = `
							<div class="postBox">
					        	<div class="postHeader">
					       			<div class="reportWriter">
					           			<div class="writer">신고자: \${i.mem_id}</div> 
					           			<div class="writeData">신고 시간 : \${i.reports_date}</div> 
					        		</div>
					        	</div>
			        			<div class="postBody">
			            			<div class="rowItem2">
						                <div class="reportReason">
						                	<신고 대상 SEQ : \${i.target_seq} >
						                	<신고 대상 종류 : \${i.target_type_name} >
						                	<신고 대상 ID : \${i.target_id} >
						                	<신고 내용 : \${i.target_content} >
						                	<신고 사유 : \${i.reports_reason} >
						                </div>
			            			</div>
			        			</div>
			        			<div class="reportAndBlackBtnDiv">
			        				<div class="reportAndBlackBtnDiv">
				        				\${btnHtml}
			        				</div>
			        					\${selectHtml}
			        			</div>
							</div>
						`;
						$("#reportListWrap").append(html);
					}
				}
			
			
			// 블랙리스트 버튼을 눌렀을 때
			$(document).on("click", ".blackOnBtn",  function(){
				let btn = $(this)
				let mem_id = btn.data("target_id");
				let day = btn.closest(".postBox").find(".endOption").val();
				let reports_reason = btn.data("reports_reason");
				let reports_status = btn.data("reports_status");
				let target_seq = btn.data("target_seq");
				
				if(day == null){
					alert("정지일수를 먼저 선택해 주세요.");
					return;
				}
				
				$.ajax({
					url : "/admin/blackOn",
					type : "get",
					data : { 
						mem_status : 4,
						target_id : mem_id,
						target_seq : target_seq,
						black_option : reports_reason,
						reports_status : 3,
						day : day
					},
					success : function(resp){
						alert(mem_id + "님을 블랙리스트에 등록했습니다.");
						btn.hide();
						btn.siblings(".reportCheckBtn").hide();
						btn.closest(".postBox").find(".endOption").hide();
						btn.siblings(".blackOffBtn").show();
					}
				});
			});
			
			$(document).on("click", ".blackOffBtn",  function(){
				let btn = $(this)
				let target_id = btn.data("target_id");
				
				$.ajax({
					url : "/admin/blackOff",
					type : "get",
					data : {
						mem_status : 3,
						target_id : target_id,
						reports_status : 5
					},
					success : function(resp){
						alert(target_id + "님을 블랙리스트에서 해제했습니다.");
						btn.hide();
						btn.closest(".reportAndBlackBtnDiv").html(`
								<button class="blackOffCheckBtn" disabled>해제완료</button>
						`);
					}
				});
			});
			
			$(document).on("click", ".reportCheckBtn", function(){ // 반려버튼 눌렀을 때, 신고목록 삭제 / 리스트 미출력
				let btn = $(this);
				let reports_seq = btn.data("reports_seq");
				
				if(confirm("정말 반려 처리하시겠습니까?")){
					$.ajax({
						url : "/admin/reportReject",
						type : "get",
						data : {
							reports_seq : reports_seq
						},
						success : function(resp){
							alert("반려 처리가 완료되었습니다.");
							btn.closest(".postBox").remove(); // 반려 처리된 목록 바로 제거 ( 새로고침해도 DB는 연동되어 목록 출력되지 않음. )
						}
					});
				}
			});
	</script>
</body>
</html>
