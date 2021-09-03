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
		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다
		var markers = [ 
				{ 
				  // 앞구정 역 위 마크업
				  position : new kakao.maps.LatLng(37.52709, 127.02575)
			},    // 반포역 우상위 마크업
				{ position : new kakao.maps.LatLng(37.51145, 127.01744)
			},
			      //한남더힐 아래 마크업
				{ position : new kakao.maps.LatLng(37.53368, 127.01016)
			},
			      //서울역 옆 마크업
				{ position : new kakao.maps.LatLng(37.55275, 126.97620)
				  
			},	  //충무로 역 오른쪽 마크업
				{ position : new kakao.maps.LatLng(37.56265, 126.99453)
			},    //충무로 역 왼쪽 마크업
				{ position : new kakao.maps.LatLng(37.56160, 126.98932)
			}
		];
		var staticMapContainer  = document.getElementById('list_map'), // 이미지 지도를 표시할 div  
		    staticMapOption = { 
		        center: new kakao.maps.LatLng(37.53951, 127.00163), // 이미지 지도의 중심좌표
		        level: 7, // 이미지 지도의 확대 레벨
		        marker: markers // 이미지 지도에 표시할 마커
		    };    
	
		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>
</body>
</html>