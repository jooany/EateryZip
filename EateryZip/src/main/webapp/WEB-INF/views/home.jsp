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
        /* 나나나나나나 잠만
        #container{
        	display: flex;
		    justify-content: center;
		    align-items: inherit;
		    flex-direction: column;
		    background-size: cover;
        }
        */
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
        
        
        /* 추천순 이미지 */
        .best_wrap .best_box {
        	width: 800px;
            display: flex;
            justify-content: space-between;
            border-radius:4px;
            margin-bottom: 40px;
        }
        .best_wrap .best_box img{
            width: 200px;
            height: 200px;
            border: 1px solid #ccc;
            border-radius:4px;
            object-fit:cover;
            box-shadow: 5px 5px 5px 0px #ccc;
            margin-bottom: 10px;
        }
        .moreBtn{
            text-align: right;
            display: flex;
    		justify-content: space-between;
    		margin:40px 0 20px;
        }
        .container_nav{
        	width:900px!important;
        }
        .bestwraptitle{
        	font-size: 36px;
        }
        .more{
        	text-decoration:none;
        	color: black;
        	font-size: 18px;
        	align-self: flex-end;
        }
        a{
			text-align: center;
			text-decoration:none!important;
			color: black;
        }
    </style>
</head>
<body>
    <div id="container">
        <div class="content">
            <ul class="content_slider">
                <li class="item">
                    <img src="https://t1.daumcdn.net/cfile/tistory/995C643D5E61B5202C" alt="">
                    <p></p>
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
	                    <input type="text" class="keyword" placeholder="     통합검색" name="keyword">
	                </div>
	                <button type="submit" id="searchBtn">
	                    <i class="fas fa-search"></i>
	                </button>
	            </form>
	        </div>
        </div>
        <div class="best_wrap">
			<div class="moreBtn"> <!-- 추천 등 해당 선택내용 검색조건으로 리스트 들어가기 -->
				<p class="bestwraptitle">추천 음식점</p>
				<a class="more" href="${pageContext.request.contextPath}/eatery/list.do?recommend=${dto.recommend}">더보기</a>
			</div>
			<div class="best_box">
				<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=4444444444">
					<img src="https://img.siksinhot.com/place/1628060355715382.jpg?w=307&h=300&c=Y" alt="">
					</br>영광정 메밀국수
				</a>
				<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=0147258369">
					<img src="https://mblogthumb-phinf.pstatic.net/MjAxOTAzMjZfNjAg/MDAxNTUzNTkzMTYwMzIz.JCd8zSxd-G8kX67oFcwpdBR4H-GoWqVu-PvSkZSyWkgg.sLSBAFgu92ZhbTYHd7-yrfODkHMji9YYW-ozzzMqB9og.JPEG.donusdy/SE-09a736b1-5ea2-4338-b441-140fcf0c973a.jpg?type=w800" alt="">
					</br>갓덴스시 강남역점
				</a>
				<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=1111177777">
					<img src="https://mblogthumb-phinf.pstatic.net/MjAyMTAzMjFfMTgz/MDAxNjE2MzMwODU3ODgw.lgOm_PLojKgyO0MI9j93y7tyIpBLhCB5mR4gLV-P1kEg.myG2JmtFPZ0QfVfRGEgZydChZrs5gM4cE-kHF8zbafkg.JPEG.nablogging/DSC09776%EF%BC%BFcopy%EF%BC%BF1600x1067.jpg?type=w800" alt="">
					</br>구옥,날다
				</a>
			</div>
        </div>
    </div>
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