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
 	width:100%;
 	height: 40px;
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
 	height: 40px;
 	flex:1;
 	width:auto;
 	min-width:0;
 	min-height: 40px;
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
 	align-items:flex-start;
 	gap:10px;
}

.qaReply{
	padding: 10px 15px;
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


.pageBox {
        text-align: center;
        padding: 20px;
        font-size: 18px;
        color: #A66A3F;
        transform: translateX(-20px);
    }
.pageBox span { margin: 0 10px; cursor: pointer; }
 
.answerBtnDiv{
 	margin: 30px auto 0 auto;
 	display: flex;
 	justify-content: center;
 	align-items: center;
 	gap: 100px;
 }
 
.answerBtnDiv>button{
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
		
		<div class="answerBtnDiv">
				<button class="navicon filterBtn" data-status="all">전체 ${qaAllCount}</button>
				<button class="navicon filterBtn" data-status="0">답변대기 ${qaCount}</button>
				<button class="navicon filterBtn" data-status="1">답변완료 ${qaDoneCount}</button>
		</div>
		
		<div id="qaListWrap"></div>
		
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
			let currentStatus = "all";
	
			$(function(){
			    loadQaList("all", 1);
			});
			
			
			function loadQaList(status,cpage){
				currentStatus = status;
				
			    $.ajax({
			        url : "/admin/qaList",
			        type : "get",
			        data : { 
			        	status : status,
			        	cpage : cpage
			        },
			        dataType : "json",
			        success : function(resp){
			        	console.log(resp);
			            console.log(resp.pageNavi);
			            drawQaList(resp.list);
			            drawPageNavi(resp.pageNavi);
			        }
			    });
			}
			
			$(document).on("click", ".filterBtn", function(){
			    let status = $(this).data("status");
			    loadQaList(status, 1);
			});
			
			$(document).on("click", ".pageLink", function(){
			    let page = $(this).data("page");
			    loadQaList(currentStatus, page);
			});
			
			function drawPageNavi(pageNavi){
			    $(".pageBox").empty();
			    let html = "";
			    
			    if(pageNavi.needPrev){
			    	html += `
			            <a href="javascript:void(0)" class="pageLink" data-page="\${pageNavi.startNavi - 1}">
			                <i class="fa-solid fa-chevron-left"></i>
			            </a>
			        `;
			    }

			    for(let i = pageNavi.startNavi; i <= pageNavi.endNavi; i++){
			        let activeClass = (i == pageNavi.cpage) ? "active" : "";

			        html += `
			            <a href="javascript:void(0)" class="pageLink \${activeClass}" data-page="\${i}">
			                \${i}
			            </a>
			        `;
			    }

			    if(pageNavi.needNext){
			    	html += `
			            <a href="javascript:void(0)" class="pageLink" data-page="\${pageNavi.endNavi + 1}">
			                <i class="fa-solid fa-chevron-right"></i>
			            </a>
			        `;
			    }
			    $(".pageBox").html(html);
			}

			function drawQaList(list){
				$("#qaListWrap").empty();
				
				if(list.length == 0){
					$("#qaListWrap").append(`
						<div class="postBox">
							<div class="postBody">문의글이 없습니다.</div>
						</div>		
					`);
					return;
				}
				
				for(let i of list){
					
					let categoryText = "";
					
					if(i.qa_category == 0){
						categoryText = "계정/로그인";
					}else if(i.qa_category == 1){
						categoryText = "이용문의";
					}else if(i.qa_category == 2){
						categoryText = "기타";
					}
					
					let replyHtml = "";
					
					if(i.qa_status == 0){
						replyHtml = `
							<div class="qaReply">
		        				<div class="qaReplyRow">
					        		<div class="adminProfileDiv">
					        			<div class="replyAdminId">관리자</div>
				        			</div>
			        				<form action="/admin/answer" method="post">
			        					<input type="hidden" name="qa_seq" value="\${i.qa_seq}">
			        			
				        				<div class="replyTextAndBtn">
							            	<textarea placeholder="댓글을 입력하세요." maxlength="1000" class="inputQaReply" name="admin_answer"></textarea>
											<button class="replyBtn" type="submit">등록</button>
										</div>
									</form>
			        			</div>  
			        		</div> 
			        	`;
					}else {
						replyHtml = `
							<div class="qaReply">
	        					<div class="qaReplyRow">
				        			<div class="adminProfileDiv">
				        				<div class="replyAdminId">관리자</div>
			        				</div>
			        				<div class="replyTextAndBtn">
				            			<div class="answerDiv">\${i.admin_answer}</div>
					            		<div class="adminBtnArea">
					            			<button class="adminBtn updateBtn" type="button" data-seq="\${i.qa_seq}">수정</button>
					            			<button class="adminBtn deleteBtn" type="button" data-seq="\${i.qa_seq}">삭제</button>
					            			<button class="UpdateBtn saveBtn replyBtn" type="button" data-seq="\${i.qa_seq}" style="display:none">저장</button>
					            			<button class="UpdateBtn cenBtn replyBtn" type="button" data-seq="\${i.qa_seq}" style="display:none">취소</button>
						            	</div>
				            		</div>
				            	</div>
		        			</div>
	        			`;
					}
					
					let html = `
						<div class="postBox" data-status="${i.qa_status}">
				        	<div class="postHeader">
				       			<div class="categoryAndWriter">
				           			<div class="writer">작성자: \${i.mem_id}</div> 
			           				<div class="category">\${categoryText}</div>
				           		</div>
				           	
				           			<div class="writeData">\${i.qa_create_date}</div> 
		
				        	</div>
				        	
		        			<div class="postBody">
		            			<div class="rowItem1">
					                <span class="labelName">제목</span>
					                <div class="titleContent">\${i.qa_title}</div>
		            			</div>
		           				<div class="rowItem2">
				                	<span class="labelName">내용</span>
					                <div class="textContent">\${i.qa_contents} </div>
		            			</div>
		        			</div>
		        			\${replyHtml}
						</div>
					`;
					
					$("#qaListWrap").append(html);
				}
			}
			
			$(document).on("click", ".updateBtn", function(){
				let parentRow = $(this).closest(".replyTextAndBtn");
				let answerDiv = parentRow.find(".answerDiv");
				let originText = answerDiv.text().trim();
				let seq = $(this).data("seq");
				
				answerDiv.data("origin", originText);
				
				answerDiv.addClass("editing");
				answerDiv.html(`
					<textarea class="inputQaReply inputUpdate" id="inputUpdate_\${seq}" data-origin="\${originText}" style="height:40px">\${originText}</textarea>		
				`);
				
				let textarea = $("#inputUpdate_" + seq)[0];
				textarea.style.height = "auto";
			    textarea.style.height = 40+"px";
			    
					parentRow.find(".adminBtn").hide();
					parentRow.find(".UpdateBtn").show();
				});
			
				$(document).on("click", ".cenBtn", function(){
					let parentRow = $(this).closest(".replyTextAndBtn");
				    let answerDiv = parentRow.find(".answerDiv");
				    
				    let originalText = answerDiv.data("origin");
				    answerDiv.html(originalText);
				    answerDiv.removeClass("editing");
				    
				    parentRow.find(".saveBtn, .cenBtn").hide();
				    parentRow.find(".updateBtn, .deleteBtn").show();
				});
				
				$(document).on("click", ".saveBtn", function(){
					let btn = $(this);
					let seq = btn.data("seq");
					let updateContents = $("#inputUpdate_" + seq).val();
					
					if(updateContents.trim() == ""){
						alert("내용을 입력해 주세요.");
						return;
					}
					
					$.ajax({
						url : "/admin/answerUpdate",
						type : "post",
						data : {
							qa_seq : seq,
							admin_answer : updateContents
						},
						success : function(resp){
							
								let parentRow = btn.closest(".replyTextAndBtn");
							    let answerDiv = parentRow.find(".answerDiv");
							    
								alert("수정되었습니다.");
								answerDiv.removeClass("editing");
								answerDiv.html(updateContents);
								
								parentRow.find(".saveBtn, .cenBtn").hide();
				                parentRow.find(".updateBtn, .deleteBtn").show();
							
						},
						error : function(){
							alert("수정 실패");
						}
					});
				});
				
			$(document).on("click", ".deleteBtn", function(){
				let seq = $(this).data("seq");
				if(confirm("정말 삭제하시겠습니까?")){
					$.ajax({
						url : "/admin/answerReset",
						type : "post",
						data : {qa_seq : seq},
						success : function(resp){
							alert("삭제되었습니다.");
							location.reload();
						}
					});
				}
			});
	</script>
</body>
</html>