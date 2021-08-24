<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/eatery/list.jsp</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
<style>
	* {
       	margin: 0;
       	padding: 0; 
        border: 0; 
        /* font-size: 100%;
        vertical-align: baseline; */
	}
	html, body {
       	height: 100%;
	}
	header {
       	width: 100%; 
       	height: 100px;
	}
	.header_container {
      	display: flex;
       	padding: 10px;
       	font-size: 22px;
       	text-align: center;
	}
	.search_box{
       	margin-left: 30px;
      	border: 1px solid black;
       	border-radius: 30px;
	}
	.header_container>.search_box {
       	flex: 1;
      	min-width: 0;
      	min-height: 0;
      	display: block;
	}
	.my_wrap{
      	margin-left: 30px;
	}
	.main_left{
       	padding: 10px;
       	float: left;
       	position: relative;
	}
	.features{
        margin-top: 20px;
	}
	.category_area{
        margin-top: 20px;
	}
	.main_middle{
        padding: 10px;
        position: relative;
	}
	.main_right{
    	padding: 10px;
		float: right;
       	position: relative;
 	}
	footer{
      	width: 100%; 
       	height: auto; 
       	margin: auto;
      	position: relative;
		text-align: center; 
		margin-bottom: 50px;
       	color: white;
        background-color: black;
	}
	/* 모바일(~576px) */
	@media screen and (max-width: 576px) {
		header {
        	height: 20vw;
		}
        .search_box {
        	width: 80vw; 
         	height: 15vw; 
           	margin-bottom: 5vw;
		}
		footer {
          	width: 100%; 
        	height: auto; 
        	text-align: center; 
         	margin-bottom: 50px;
		}
	}
</style>
</head>
<body>
<div class="main_container">
	<div class="main_left">
		<div class="price_area">
			<h5>가격필터</h5>
			<div class="price_btn btn-group" role="group" aria-label="Basic outlined example">
            	<button type="button" class="btn btn-outline-primary">\</button>
                <button type="button" class="btn btn-outline-primary">\\</button>
                <button type="button" class="btn btn-outline-primary">\\\</button>
                <button type="button" class="btn btn-outline-primary">\\\\</button>
            </div>
		</div>
		<div class="ex_area">
			<h5>편의사항</h5>
			<input class="check-input" type="checkbox" id="roofTop"/>
			<label class="check-label" for="roofTop">루프탑</label>
			<br />
			<input class="check-input" type="checkbox" id="privateRoom"/>
			<label class="check-label" for="privateRoom">프라이빗 룸</label>
			<br />
			<input class="check-input" type="checkbox" id="groups"/>
			<label class="check-label" for="groups">단체석</label>
			<br />
			<input class="check-input" type="checkbox" id="dogsAllowed"/>
			<label class="check-label" for="dogsAllowed">반려견 동반 가능</label>
			<br />
			<input class="check-input" type="checkbox" id="wifi"/>
			<label class="check-label" for="wifi">와이파이</label>
			<br />
			<input class="check-input" type="checkbox" id="parkingSpot"/>
			<label class="check-label" for="parkingSpot">주차공간</label>
			<br />
			<input class="check-input" type="checkbox" id="smokingRoom"/>
			<label class="check-label" for="smokingRoom">흡연실</label>
			<br />
			<input class="check-input" type="checkbox" id="kidsZone"/>
			<label class="check-label" for="kidsZone">키즈존</label>
			<br />
			<input class="check-input" type="checkbox" id="noKidsZone"/>
			<label class="check-label" for="noKidsZone">노키즈존</label>
			<br />
			<input class="check-input" type="checkbox" id="restrooms"/>
			<label class="check-label" for="restrooms">남/녀 화장실 구분</label>
		</div>
		<div class="category_area">
			<h5>카테고리</h5>
			<img src="" alt="음식점 대표 이미지" />
			<button><img src="images/bibimbap.png"> 한식</button>
            <button><img src="images/sushi.png"> 일식</button>
            <br>
            <button><img src="images/xiao-long-bao.png"> 중식</button>
            <button><img src="images/steak.png"> 양식</button>
            <br>
            <button><img src="images/pancake.png"> 브런치</button>
            <button><img src="images/cocktail.png"> Bar</button>
            <br>
            <button><img src="images/coffee-cup.png"> 카페</button>
		</div>
	</div>
	<div class="main_middle">
		<div class="eatery_list">
			<div class="title">
            	<span><h2>추천 맛집</h2></span>
            </div>
            <div class="btn_area">
            	<button id="whole_btn" class="btn btn-outline-dark btn-sm" type="button">전체</button>
                <button id="reservation_btn" class="btn btn-outline-dark btn-sm" type="button">예약</button>
                <button id="takeout_btn" class="btn btn-outline-dark btn-sm" type="button">방문포장</button>
            </div>
            <div class="card w-50">
                <div class="card-body">
                    <img src="${pageContext.request.contextPath}/" class="rounded float-start" width="150" height="150">
                    <h5 class="card-title">${tmp.title }</h5>
                    	<ol class="list-group list-group-numbered">
                        	<li class="list-group-item d-flex justify-content-between align-items-start">
                            	<div class="ms-2 me-auto">
                                	<div class="fw-bold">특별한 메뉴가 있어요</div>
                                </div>
                                <span class="badge bg-primary rounded-pill">149</span>
                                <div class="ms-2 me-auto">
                                    <div class="fw-bold">뷰가 좋아요</div>
                                </div>
                                <span class="badge bg-primary rounded-pill">112</span>
                                <div class="ms-2 me-auto">
                                    <div class="fw-bold">친절해요</div>
                                </div>
                                <span class="badge bg-primary rounded-pill">95</span>
                            </li>
                       </ol>
                    <p class="card-text">${tmp.content }</p>
                </div>
        	</div>
		</div>
		<form action="list.jsp" method="get"> 
			<label for="condition">검색조건</label>
			<select name="condition" id="condition">
				<option value="title_content" ${condition eq 'popularity' ? 'selected' : '' }>인기순</option>
				<option value="title" ${condition eq 'reviews' ? 'selected' : '' }>리뷰순</option>
			</select>
		</form>	
	</div>
	<div class="main_right">
		<p>map</p>
	</div>
	<footer></footer>
</div>
</body>
</html>