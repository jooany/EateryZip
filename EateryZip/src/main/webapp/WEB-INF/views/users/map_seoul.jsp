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
	<div id="list_map" style="width:320px;height:530px;"></div>
	<br />
	
	<script>
	var mapContainer = document.getElementById('list_map'), // 지도를 표시할 div  
	mapOption = { 
	     center: new kakao.maps.LatLng(37.53951, 127.00163), // 지도의 중심좌표
	     level: 7 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '앞구정 역 위 마크업', 
	        latlng: new kakao.maps.LatLng(37.52709, 127.02575)
	    },
	    {
	        title: '반포역 우상 위 마크업', 
	        latlng: new kakao.maps.LatLng(37.51145, 127.01744)
	    },
	    {
	        title: '한남 더힐 아래 마크업', 
	        latlng: new kakao.maps.LatLng(37.53368, 127.01016)
	    },
	    {
	        title: '서울역 옆 마크업',
	        latlng: new kakao.maps.LatLng(37.55275, 126.97620)
	    },
	    {
	        title: '충무로 옆 오른쪽 마크업',
	        latlng: new kakao.maps.LatLng(37.56265, 126.99453)
	    },
	    {
	        title: '충무로 옆 왼쪽 마크업',
	        latlng: new kakao.maps.LatLng(37.56160, 126.98932)
	    }
	];
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
	</script>
</body>
</html>