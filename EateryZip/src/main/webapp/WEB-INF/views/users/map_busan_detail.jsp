<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e12e99f90ddd040d29c835f01fcaa837"></script>
</head>
<body>
	<!-- 나현님 map 지도(서울) 테스트 가로 320 , 세로 530 -->
	<div id="Detail_map" style="width:350px;height:470px;"></div>
	<br />
	
	<script>
	// 이미지 지도에서 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.55275, 126.97620); 

	// 이미지 지도에 표시할 마커입니다
	// 이미지 지도에 표시할 마커는 Object 형태입니다
	var marker = {
	    position: markerPosition
	};

	var staticMapContainer  = document.getElementById('Detail_map'), // 이미지 지도를 표시할 div  
	    staticMapOption = { 
	        center: new kakao.maps.LatLng(37.55275, 126.97620), // 이미지 지도의 중심좌표
	        level: 3, // 이미지 지도의 확대 레벨
	        marker: marker // 이미지 지도에 표시할 마커 
	    };    

	// 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>
</body>
</html>