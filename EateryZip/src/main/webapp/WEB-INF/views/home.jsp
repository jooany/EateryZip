<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>


<script src="https://kit.fontawesome.com/eda0c6c5f7.js" crossorigin="anonymous"></script>
    <style>
        /* 메인 슬라이드 이미지 */

        /* HTML5 display-role reset for older browsers */
        /*
        article, aside, details, figcaption, figure,
        footer, header, hgroup, menu, nav, section {
            display: block;
        }
        */

        html, body, div, span, applet, object, iframe,
        h1, h2, h3, h4, h5, h6, p, blockquote, pre,
        a, abbr, acronym, address, big, cite, code,
        del, dfn, em, img, ins, kbd, q, s, samp,
        small, strike, strong, sub, sup, tt, var,
        b, u, i, center,
        dl, dt, dd, ol, ul, li,
        fieldset, form, label, legend,
        table, caption, tbody, tfoot, thead, tr, th, td,
        article, aside, canvas, details, embed,
        figure, figcaption, footer, header, hgroup,
        menu, nav, output, ruby, section, summary,
        time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }
        body {
            line-height: 1;
        }
        ol, ul {
            list-style: none;
        }
        blockquote, q {
            quotes: none;
        }
        blockquote:before, blockquote:after,
        q:before, q:after {
            content: '';
            content: none;
        }
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }
        
        /* ---------위쪽코드는 reset.css------------ */
        ul{
            list-style:none;
        }
        #container{
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-size: cover;
        }
        .content{
            width: 100%;
            height: 600px;
            position: relative;
            overflow: hidden;
            margin: 0 auto;	
            display:flex;
            justify-content:center;
     		align-items:center;
        }
        .content_slider{
            display: flex;
            position: absolute;
            top: 0;
            left: 0;
            vertical-align: middle;
        }
        .item{
        	margin-top:-300px;
            width:100%;
            height:100%;
            font-size: 35px;
            text-align: center;	    
		    object-fit:cover;
        }
        .content ul{
            -webkit-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
            -o-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
            transition: all 0.25s cubic-bezier(1, .01, .32, 1);
        }
        .item>img{
            width: 100%;
            height: 100%;
        }
        /* 검색창 스타일 */
        .content_search {
            display: flex;
            justify-content:center;
            position: absolute;
        }
        #testForm{
        	margin:0 auto;
        }
        .content_search .search_wrap_wrap {
            width: 100%;
            vertical-align: middle;
            display: flex;
            align-items: revert;
            z-index:1;
        }
        
        .search_wrap input {
        	width: 820px;
	   		height: 50px;
	   		opacity:0.8;
	   		border: 1px solid #fff;
	   		border-radius:4px 0 0 4px;
        }
        .search_wrap_wrap button {
            padding: 5px 10px;
            text-align: center;
            background-color: rgba(253,83,0);
			color: white;
			width: 50px;
			height: 50px;
			border-radius: 0px 4px 4px 0px;
			border: 1px solid rgba(253,83,0);
        }
        /* 도시 추천 스타일 */
        .content_city.city_wrap{
            width: 1100px;
            display: flex;
            align-items: flex-start;
            justify-content: space-evenly;
        }
        .city_wrap button{
            width: 110px;
            height: 30px;
            background-color: white!important;
            border: 1px solid rgba(253,83,0);
            margin :20px 20px;
            
        }
        .city_wrap button a{
        	text-decoration:none;
        	color: black!important;
        }
        
        .city_wrap button:hover {
        	background-color: rgba(253,83,0);
        }
        
        
        /* 도시추천 이미지 */
        .best_wrap .best_box {
            display: flex;
            justify-content: space-evenly;
        }
        .best_wrap .best_box img{
            width: 100px;
            height: 100px;
            border: 1px solid #000;
        }
        .moreBtn{
            text-align: right;
        }
        .container_nav{
        	width:900px!important;
        }
    </style>
</head>
<body>
    <div id="container">
        <div class="content">
            <ul class="content_slider">
                <li class="item">
                    <img src="https://t1.daumcdn.net/cfile/tistory/995C643D5E61B5202C" alt="">
                </li>
                <li class="item">
                    <img src="https://cdn.onul-hoi.com/uploads/store_package/image/705/a162ec_210329025035.jpg" alt="">
                </li>
                <li class="item">
                    <img src="http://db.kookje.co.kr/news2000/photo/2021/0611/L20210611.22014003298i1.jpg" alt="">
                </li>
            </ul>
            <div class="content_search">
	            <form id="testForm" action="${pageContext.request.contextPath}/eatery/list.do?keyword=" class="search_wrap_wrap search_wrapper"> <!-- 가게리스트로 연결 -->
	                <div class="search_wrap">
	                    <input type="text" class="keyword" placeholder="  통합검색" name="keyword">
	                </div>
	                <button type="submit" id="searchBtn">
	                    <i class="fas fa-search"></i>
	                </button>
	            </form>
	        </div>
        </div>
        <div class="content_city">
            <div class="city_wrap">
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=서울">서울</a></button>
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=부산">부산</a></button>
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=경기">경기</a></button>
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=강원">강원</a></button>
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=부산">부산</a></button>
                <br>
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=제주">제주</a></button>
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=인천">인천</a></button>
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=경상북도">경북</a></button>
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=충청북도">충북</a></button>
                <button class="city"><a href="${pageContext.request.contextPath}/eatery/list.do?keyword=충청남도">충남</button>
            </div>
            <div class="best_wrap">
            <h1>추천 음식점</h1>
                <div class="best_box">
                    <img src="#" alt="">
                    <img src="#" alt="">
                    <img src="#" alt="">
                </div>
                <div class="moreBtn"> <!-- 추천 등 해당 선택내용 검색조건으로 리스트 들어가기 -->
                    <a class="more" href="${pageContext.request.contextPath}/eatery/list.do?recommend=${dto.recommend}">더보기</a>
                </div>
            </div>
        </div>
    </div>
    
  <h1>메인페이지</h1>
	<h2>형우 테스트 링크</h2>
	<a href="${pageContext.request.contextPath}/eatery/reservation_form.do">예약 폼</a>
	<h2>주연 테스트 링크</h2>
	<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=1111111111">음식점 상세 페이지(사업자번호 1111111111)</a>
	<a href="${pageContext.request.contextPath}/users/b_mypage/menu_insertform.do">menu_insertform</a>
	<a href="${pageContext.request.contextPath}/users/g_mypage/reserve_List.do">예약내역</a>
	<a href="${pageContext.request.contextPath}/users/g_mypage/takeout_list.do">포장내역</a>
	<h2>혜림 테스트 링크</h2>
	<a href="${pageContext.request.contextPath}/store/store_insertform.do">가게등록</a>
	<a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage.do">비즈니스회원정보</a>
	<a href="${pageContext.request.contextPath}/users/b_mypage/b_takeout_list.do">비즈니스 포장내역</a>
	<a href="${pageContext.request.contextPath}/users/b_mypage/b_reservation_list.do">비즈니스 포장내역</a>
	<h2>나현 테스트 링크</h2>
	<a href="${pageContext.request.contextPath}/eatery/list.do?keyword=">list</a>
	
	<h2>민재 테스트 링크</h2>
	<a href="${pageContext.request.contextPath}/users/map_seoul.do">서울 테스트</a>
	<a href="${pageContext.request.contextPath}/users/map_busan.do">부산 테스트</a>
	<a href="${pageContext.request.contextPath}/users/map_seoul_detail.do">서울 세부 테스트</a>
	<a href="${pageContext.request.contextPath}/users/map_busan_detail.do">부산 세부 테스트</a>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    <jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
 
    	$("#searchBtn").click(function(){
    		let src=$("#testForm").attr("action");
    		let key=$(".keyword").val();
    		console.log(src);
    		console.log($(".keyword").val());
    		let realSrc=src+key;
    		$("#testForm").attr("action",realSrc);
    	});
   
    	
        // 이미지 슬라이드 스크립트
        var slideContainer = document.querySelector('.content');
        var slides = document.querySelectorAll('.item');
        var totalSlides = slides.length; // item의 갯수

        var content_sliderWidth = slideContainer.clientWidth; // content width
        var slideIndex = 0;
        var content_slider = document.querySelector('.content_slider');

        content_slider.style.width = content_sliderWidth * totalSlides + 'px';

        showSlides()

        function showSlides() {
            for(var i=0;i<slides.length;i++){
                content_slider.style.left = -(content_sliderWidth * slideIndex) + 'px';    
            }
            slideIndex++;
            if (slideIndex === totalSlides) {
                slideIndex = 0;
            }
            setTimeout(showSlides, 5000); 
        }
    </script>
</body>
</html>