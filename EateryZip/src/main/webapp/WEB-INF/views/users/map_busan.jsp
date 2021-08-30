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
				  // 광안리 우 상단 마크업
				  position : new kakao.maps.LatLng(35.15585, 129.12110),
				  text: "주소 입력 가능"
			},    // 광안리 좌 하단 마크업
				{ position : new kakao.maps.LatLng(35.15210, 129.11656),
				  text : "광안리 해수욕장"
			},
			      //수영역 좌측 마크업
				{ position : new kakao.maps.LatLng(35.16717, 129.11071)
			},
			      //센텀역 위 마크업
				{ position : new kakao.maps.LatLng(35.18198, 129.12438)
				  
			},	  //연산 LG 아마트 좌측 마크업
				{ position : new kakao.maps.LatLng(35.18644, 129.10019)
			},    //코스트코 근처 마크업
				{ position : new kakao.maps.LatLng(35.17421, 129.11632)
			}
		];
		var staticMapContainer  = document.getElementById('list_map'), // 이미지 지도를 표시할 div  
		    staticMapOption = { 
		        center: new kakao.maps.LatLng(35.18009, 129.11161), // 이미지 지도의 중심좌표
		        level: 7, // 이미지 지도의 확대 레벨
		        marker: markers // 이미지 지도에 표시할 마커
		    };    
	
		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>
</body>
</html>