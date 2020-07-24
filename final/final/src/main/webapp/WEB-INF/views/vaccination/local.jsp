<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>geolocation으로 마커 표시하기</title>
</head>
<body>
	<h1>[현재위치 근처 동물병원]</h1>
	<div id="map3" style="width:800px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a382b7b4cb477ebc8804e2f12197a4be&libraries=services"></script>
	<script>
	var mapContainer2 = document.getElementById('map3'), // 지도를 표시할 div 
	    mapOption2 = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨 
	    }; 
	var map3 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 
	
	// 키워드로 장소를 검색합니다
	ps.keywordSearch('미추홀구 동물병원', placesSearchCB); 
	
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	
	        for (var i=0; i<data.length; i++) {
	            displayMarker1(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map3.setBounds(bounds);
	    } 
	}
	function displayMarker1(place) {
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
		// 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
		var infowindow1 = new kakao.maps.InfoWindow({zIndex:1});
		
	    // 마커를 생성하고 지도에 표시합니다
	    var marker2 = new kakao.maps.Marker({
	        map: map3,
	        position: new kakao.maps.LatLng(place.y, place.x),
	        image : markerImage
	    });
	    
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker2, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow1.setContent('<div style="padding:5px;font-size:12px;">' +place.place_name+ '</div>');
	        infowindow1.open(map3, marker2);
	    });
	    kakao.maps.event.addListener(marker2, 'mouseover', makeOverListener(map3, marker2, infowindow1));
	    kakao.maps.event.addListener(marker2, 'mouseout', makeOutListener(infowindow1));
	}
	
	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map3, marker2, infowindow1) {
	    return function() {
	        infowindow.open(map3, marker2);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow1) {
	    return function() {
	        infowindow1.close();
	    };
	}
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	      });
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	    displayMarker(locPosition, message);
	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
	
	    // 마커를 생성합니다
	    var marker5 = new kakao.maps.Marker({  
	        map: map3, 
	        position: locPosition
	    });
	    
	 	var iwContent = message, // 인포윈도우에 표시할 내용
     	iwRemoveable = true;
	
	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable,
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map3, marker5);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map3.setCenter(locPosition);      
	}    
	</script>
</body>
</html>