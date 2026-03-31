<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAP</title>
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

.categoryBtnAll:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.categoryBtnAll:active {
	transform: translateY(2px); /* 아래로 눌림 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.categoryBtnAll:first-child {
	margin-left: 25px;
}

.mapDiv {
	border: 1px solid #A66A3F;
	margin: 15px auto;
	width: 90%;
	max-width: 1800px;
	height: 380px;
	background-color: #fff;
	display: flex;
	align-items: center;
	justify-content: center;
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
}

.facilityDiv {
	width: 91%;
	max-width: 1800px;
	margin: 0 auto;
	padding-top: 565px;
	padding-bottom: 80px;
}

.facilityAll {
	border: 1px solid #A66A3F;
	margin-left: 14px;
	width: 200px;
	height: 40px;
	margin-top: 20px;
	line-height: 45px;
	padding-left: 10px;
	background-color: #F2D3A2;
	box-sizing: border-box;
	border-radius: 10px;
	border:none;
}

.facility {
	border: 2px solid #A66A3F;
	margin: 14px 0 0 14px;
	width: 98%;
	padding: 12px;
	line-height: 1.9;
	background-color: #fbe5c0;
	color: black;
	box-sizing: border-box;
	border-radius: 10px;
}

.bottomBar {
	gap: 200px;
}
</style>
</head>

<body>

	<div class="container">
		<div class="top-section">
			<div class="mainTitle">우리 동네 지도.zip</div>
			<div class="categoryDiv">
				<button class="categoryBtnAll">
					<i class="fa-solid fa-house"> 전체</i>
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-shield-halved"> 치안</i>
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-person-running"> 대피소</i>
				</button>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-restroom"> 공중화장실</i>
				</button>
			</div>

			<div class="mapDiv" id="map"></div>
		</div>

		<div class="facilityDiv">
			<div class="facilityAll">
				주변 시설 (<span id="facilityCount">0</span>)
			</div>
			<div id="facilityList"></div>
		</div>


		<div class="bottomBar">
			<i class="fa-solid fa-house fa-2xl" style="color: #A66A3F"></i> <i
				class="fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i>
			<i class="fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i>
			<i class="fa-solid fa-volume-high fa-2xl" style="color: #A66A3F"></i>
			<i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i>
		</div>
	</div>

	<script>
			
		    let mapContainer = document.getElementById("map");
		    let mapOption = {
		        center: new kakao.maps.LatLng(37.5665, 126.9780),
		        level: 5
		    };
		
		    let map = new kakao.maps.Map(mapContainer, mapOption);
		
		    let markers = [];
		    let allFacilities = [];
		    
		    let clusterer = new kakao.maps.MarkerClusterer({
		    	map : map,
		    	averageCenter : true,
		    	minLevel : 6
		    })
		
		    function clearMarkers() {
		        for (let marker of markers) {
		            marker.setMap(null);
		        }
		        markers = [];
		    }
			
		    
		    
		    function renderFacilities(type = "전체") {
		        clearMarkers();
		        clusterer.clear();
		        $("#facilityList").empty();
		
		        let filtered = allFacilities;
		
		        if (type !== "전체") {
		            filtered = allFacilities.filter(item => item.fac_type === type);
		        }
			
		        $("#facilityCount").text(filtered.length);
		        let bounds = new kakao.maps.LatLngBounds();
		
		        for (let dto of filtered) {
		            let lat = dto.fac_lat;
		            let lng = dto.fac_lng;
			
		            if(!lat || !lng) continue;
		            
		            let markerPosition = new kakao.maps.LatLng(lat, lng);
		            let markerImage = getMarkerImage(dto.fac_type);
		            
		            let marker = new kakao.maps.Marker({
		                position: markerPosition,
		                image: markerImage
		            });
		
		            markers.push(marker);
		            bounds.extend(markerPosition);
		            
		            $("#facilityList").append(
		            	    "<div class='facility'>"
		            	    + dto.fac_name + "<br>"
		            	    + dto.fac_address + "<br>"
		            	    + dto.fac_type
		            	    + "</div>"
		            	);
		            
		            let infoContent = `
		                <div style="padding:6px; font-size:12px;">
		                    <b>${dto.fac_name}</b><br>
		                    ${dto.fac_type}<br>
		                    ${dto.fac_address}
		                </div>
		            `;
		
		            let infowindow = new kakao.maps.InfoWindow({
		                content: infoContent
		            });
		
		            kakao.maps.event.addListener(marker, "click", function () {
		                infowindow.open(map, marker);
		            });
		        }
		        clusterer.addMarkers(markers);
		
		        if(filtered.length > 0){
		        	map.setBounds(bounds);
		        }
		    }
		
		    $(function () {
		        $.ajax({
		            url: "/map/getFacilities",
		            type: "get"
		        }).done(function (resp) {
		        	
		            allFacilities = resp;
		            renderFacilities("전체");
		        }).fail(function () {
		            alert("시설 데이터를 불러오지 못했습니다.");
		        });
		
		        $(".categoryBtnAll").eq(0).on("click", function () {
		            renderFacilities("전체");
		        });
		
		        $(".categoryBtnAll").eq(1).on("click", function () {
		            renderFacilities("치안시설");
		        });
		
		        $(".categoryBtnAll").eq(2).on("click", function () {
		            renderFacilities("대피소");
		        });
		
		        $(".categoryBtnAll").eq(3).on("click", function () {
		            renderFacilities("공중화장실");
		        });
		    });
		    
		    function getMarkerImage(fac_type) {
		        let imageSrc = "";
		        
		        if (fac_type === "치안시설") {
		            imageSrc = "/resources/images/free-icon-police-2542262.png";
		        } else if (fac_type === "대피소") {
		            imageSrc = "/resources/images/free-icon-shelter-14036088.png";
		        } else if (fac_type === "공중화장실") {
		            imageSrc = "/resources/images/free-icon-bathroom-6543661.png";
		        }

		        if (!imageSrc) return null;

		        let imageSize = new kakao.maps.Size(36, 40);
		        let imageOption = { offset: new kakao.maps.Point(18, 40) };

		        return new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		    }
	</script>
</body>
</html>