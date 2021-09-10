<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 상세 페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
/* 공통 */
*{
    font-family: 'Gothic A1', sans-serif;
}
a{
   color:black!important;
   text-decoration:none!important;
}
img,svg{
   vertical-align:baseline!important;
}
button{
   border:none;
   background-color:rgba(0,0,0,0);
}
.navbar{
	margin:0 auto;
	border-bottom: 1px solid #999;
}
.inner{
   width:1100px;
   margin:0 auto;
}
/*네비바 덮어 쓰기*/
#container_nav{
	width: 1125px!important;

}
.content_logo{
	margin-left:15px!important;
}
.btnF{
	padding:12px 16px!important;
}
.btnS{
	padding:12px 16px!important;
}

/*배너*/
#banner{
   height:400px;
   position:relative;
   display:flex;
   overflow:hidden;
}

#imgList{
   display:flex;
   transition:.5s;   
}
#imgList img{   
}

#blackEffect{
   height:400px;
   background: linear-gradient(to bottom,rgba(0,0,0,.03) 30%,rgba(0,0,0,.7));
   position:absolute;
   width:100%;
}

#bannerBtnsWrap{
   position:absolute;
   z-index:99;
   width:100%;
}
#bannerBtnsWrap #scrapBtn{
   margin-top:20px;
}
#bannerBtnsWrap #scrapBtn>i{
   color:white;
   font-size:34px;
}
#bannerBtnsWrap #slideBtnsWrap{
   top:200px;
   display:flex;
   justify-content:space-between;
   margin-top:140px;
   margin-bottom:10px;

}
#bannerBtnsWrap #slideBtnsWrap>button{
   font-size:24px;
   color:rgba(255,255,255,.6);
   margin:0 10px;
}

#storeInfo{
   color:white;
}
#storeInfo #storeName>span:nth-child(1){
   font-size:38px;
   font-weight:600;
}
#storeInfo #storeName>span:nth-child(2){
   color:rgb(240, 240, 240);
   fint-size:15px;
   font-weight:600;
}
#storeInfo #presentKeys{
   margin-top:10px;
   display:flex;
}
#storeInfo #presentKeys .key_btn{
   font-size:14px;
   padding:6px 12px;
   border-radius:50px;
   background-color:rgba(228, 228, 228, 0.88);
   color:black;
   margin-right:6px;
}
#storeInfo #presentKeys .key_btn>span:nth-child(2){
   color:rgb(51, 51, 51);
   font-weight:600;
}
#storeInfo  #intro{
   margin-top:20px;
   margin-bottom:10px;
   font-weight:600;
}
#storeInfo #activeTime span:nth-child(1){
   font-weight:700;
   color:rgb(253, 83, 0);
}
#storeInfo #activeTime span:nth-child(2){
   font-weight:600;
}
#detailWrap{
   line-height:60px;
   height:60px;
   width:750px;
   border-bottom:1px solid rgb(224, 224, 224);
   font-size:14px;
}

#content{
   display:flex;
   justify-content:space-between;
   font-size:14px;
}
#leftContent{
   width:750px;
}
/* 메뉴 */
#menuHeader{
   margin-top:25px;
   height:30px;
   display:flex;
   align-items:flex-end;
}
#menuHeader>span{
   font-size:22px;
   font-weight:600;
}
#menuHeader>a{
}
#slideBtnsWrap2{
   width:750px;
   position:absolute;
   display:flex;
   justify-content:space-between;
   margin-top:80px;
}
#slideBtnsWrap2 button{
   font-size:20px;
   color:rgb(240,240,240);
}
#menuListWrap{
   overflow:hidden;
}
#menuList{
   display:flex;
   margin-top:15px;
   overflow:hidden;
   transition:.5s;   
}
#menuItem{
   margin-right:10px;
}
#menuItem:nth-child(4n){
   margin-right:0px;
}
#menuItem img{
   width:180px;
   height:150px;
}
#menuItem>p:nth-child(2){
   margin-left:2px;
   margin-top:10px;
   font-size:14px;
}
#menuItem>p:nth-child(3){
   margin-left:2px;
   margin-top:6px;
   font-size:13px;
   color:rgb(253, 83, 0);
   font-weight:600;
}

/*위치 및 시간*/
#timePlaceWrap{
   border-top:1px solid rgb(224, 224, 224);
   border-bottom:1px solid rgb(224, 224, 224);
   margin-top:25px;
}
#timePlaceHeader{
   margin-top:25px;
   margin-bottom:15px;
   font-size: 22px;
    font-weight: 600;
}
#timePlaceContent{
   display:flex;
   padding:0 5px;
   margin-bottom:25px;
}
#placeWrap #placeInfo{
   margin-top:10px;
}
#placeWrap #placeInfo p:nth-child(1){
   font-weight:600;
   font-size:14px;
   margin-bottom:7px;
}
#placeWrap #placeInfo p:nth-child(2){
   font-size:12px;
}
#timeWrap{
   width:400px;
   height:230px;
   display:flex;
   justify-content:center;
   align-items:center;
}
#timeWrap #timeDate{
   display:flex;
   flex-direction:column;
   justify-content:center;
   align-items:center;
}
#timeWrap #timeDate>i{
   font-size:35px;
   margin-bottom:25px;
}
#timeDate #timeInfo>span:nth-child(1){
   font-weight:600;
   margin-right:3px;
}
/* 사진 리뷰 */
#photoWrap{
   margin-top:25px;
   padding-bottom:25px;
   border-bottom:1px solid rgb(224, 224, 224);
}
#photoWrap #photoHeader{
   font-size: 22px;
    font-weight: 600;
    margin-bottom:15px;
}
#photoListWrap{
   width:748px;
   overflow:hidden;
}
#slideBtnsWrap3{
   width:750px;
   height:100px;
   display:flex;
   justify-content:space-between;
   position:absolute;
   align-items:center;
}
#slideBtnsWrap3>button{
   font-size:20px;
   color:rgba(255,255,255,.8);
}
#photoList{
   display:flex;
}
.photo_item{
   margin-right:8px;
}
.photo_item:nth-child(7n){
   margin-right:0;
}
/* 리뷰  */
#reviewWrap{
   margin-top:25px;
   margin-bottom:30px;
}
#reviewHeader{
   margin-bottom:15px;
   font-size: 22px;
    font-weight: 600;
}
#reviewBanner{
   border-radius:4px;
   border:1px solid rgb(224, 224, 224);
   width:750px;
   height:210px;
   background-color:rgba(224, 224, 224, 0.18);
   display:flex;
   justify-content:space-around;
}
#totalReviewCount{
   display:flex;
   flex-direction:column;
   align-items:center;
   justify-content:center;
}
#totalReviewCount p{
   margin:10px 0px;
}
#totalReviewCount p:nth-child(1){
   font-size:15px;
}
#totalReviewCount p:nth-child(2){
   font-size:40px;
}
#totalReviewCount p:nth-child(3){
   font-size:25px;
   font-weight:600
}
#peopleKeyword{
   margin:auto 0;
   padding:10px 0;
}
#peopleKeywordHeader{
   text-align:center;
}
#peopleKeywordHeader>span{
   font-size:15px;
}
#peopleKeywordHeader>button{
   font-size:18px;
   color:rgb(127, 127, 127);
}
#keywordGraphWrap{
}
#keywordGraph{
   width:300px;
   border:1px solid rgb(190, 190, 190);
   border-radius:4px;
   background-color:white;
   margin-top:8px;
}
#graphText{
   padding:10px 12px;
   position:absolute;
}
#graphText>span:nth-child(1){
   font-weight:600;
}
#graphText>span:nth-child(2){
   font-weight:700;
   color:rgb(253, 83, 0);
}
.bar{
   width:160px;
   height:36px;
   background-color:rgba(255, 133, 59, 0.8);
}
/* 리뷰 필터 및 리스트 */
#reviewFilter{
   margin-top:35px;
   display:flex;
   justify-content:space-between;
   align-items:center;
   border-bottom:1px solid rgb(224, 224, 224);
   padding:10px 0px;
}
#reviewFilter #arrayFilter>a{
   margin-right:10px;
}
#reviewFilter #latest1{
   font-size:14px;
   color:rgb(253, 83, 0);
}

#reviewFilter #latest2{
   font-weight:600;
}
#reviewFilter #popular1{
   font-size:14px;
   color:rgb(190, 190, 190);
}
#reviewFilter #popular2{
   font-weight:600;
   color:rgb(190, 190, 190);
}
.fa-check-square{
   color:rgb(158, 158, 158);
}
/* 리뷰  */
.review_header{
   display:flex;
   align-items:center;
}
.writer_info{
   margin-left:15px;
}
.writer_info>p:nth-child(1){
   font-weight:600;
   font-size:14px;
   margin-bottom:2px;
}
.writer_info>p:nth-child(2){
   font-size:12px;
   color:rgb(94, 94, 94);
   margin-bottom:5px;
}
.profile_wrap>i{
   color:rgb(190, 190, 190);
}
#reviews{
   margin:0 15px;
}
.review{
   margin-top:35px;
}
.review_content{
   margin:15px 0;
   width:620px;
}
.review_img{
   margin-bottom:15px;
}
.review_key_wrap{
   display:flex;
}
.review_key_wrap .review_key{
   padding:5px 10px;
   border:1px solid rgb(190, 190, 190);
   border-radius:50px;
   font-size:13px;
   margin-right:4px;
   color:rgb(94, 94, 94);
}
.good_wrap{
   margin-top:15px;
   display:flex;
}
.good_wrap i{
   font-size:18px;
   margin-right:4px;
}
.good_wrap span:nth-child(2){
   font-weight:600;
   margin-right:4px;
   line-height:23px;
}
.good_wrap span:nth-child(3){
   color:rgb(94, 94, 94);
   line-height:23px;
}

/* 오른쪽 영역 */
#rightContent{
   width: 300px;
   height:300px;
}
#bulletin{
   padding:7px 15px;
   background-color:rgb(243, 240, 240);
   border:1px solid rgb(224, 224, 224);
   border-radius:4px;
   margin-bottom:20px;
   display:flex;
   align-items:center;
}
#bulletin>span:nth-child(1){
   color:rgb(253, 83, 0);
   font-weight:600;
   font-size:14px;
}
#bulletin>span:nth-child(2){
   margin-left:10px;
   font-size:13px;
}
#etcInfo{
   margin-top:20px;
   border:1px solid rgb(224, 224, 224);
   border-radius:4px;
}
#etcInfo>li{
   padding:10px 0;
}
#etcInfo #callNum{
   border-bottom:1px solid rgb(224, 224, 224);
   display:flex;
   align-items:center;
}
#etcInfo #convenience{
   display:flex;
   align-items:center;
}
#etcInfo span:nth-child(1){
   margin-left:20px;
   font-size:16px;
}
#etcInfo #callNum span:nth-child(2){
   margin-left:15px;
   font-size:14px;
}
#etcInfo #convenience span:nth-child(2){
   margin-left:10px;
   padding-right:10px;
   font-size:13px;
   line-height:20px;
}

.review_img{
   overflow: hidden;
    width: 144px;
    height: 144px;
    border-radius: 4px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}

#pagination{
   width:750px;
   margin-top:60px;
   display:flex;
   justify-content:center;
}
#pagination li{
   border-radius:4px;
   margin:0 4px;
}
#pagination li a{
   border-radius:4px;
   padding:10px 15px;
   background-color:rgb(234, 231, 231);
}
.active{
   background-color:rgb(253, 83, 0)!important;
   color:white!important;
}
button:hover{
   cursor:pointer!important;
}
.fixed{
   top:7
}
/* 형우 부분 */
#container{
   width: 300px;
   margin: 0 auto;
   border: 0.5px solid rgb(224, 224, 224);
   border-radius: 4px;
   height: auto!important;
}
/* 방문예약 / 포장예약 tab css */
ul.tabs{
   margin-top:10px;
   padding: 0 7px;
   list-style: none;
   margin-bottom:10px;
}
ul.tabs li{
   background: none;
   border-bottom: 2px solid rgba(0,0,0,.2);
   color: #222;
   display: inline-block;
   padding: 10px 15px;
   cursor: pointer;
   margin-left: 15px;
   font-weight: bold;
   font-size: 15px;
}

ul.tabs li.current{
   background: #white;
   color: #222;
   margin-left: 15px;
   border-bottom: 2px solid #fd5300;
}

.tab-content{
   display: none;
   background: #white;
   padding: 15px;
    width: 300px;
    
}
.tab-content.current{
   display: inherit;
}
/* 시간 버튼  */
.r_time label{
   cursor:pointer;
   }
.r_time .hide{
   display:none;
   }
/* 내부 css */
.r_date{
   margin-bottom: 10px;
   padding-bottom:7px;
   border-bottom:1px solid rgba(0,0,0,.1);
}
#datepicker{
   margin-left:12px;
   font-size: 14px;
   border:none;
}
.r_time{
   margin-bottom: 10px;
   padding-bottom:7px;
   border-bottom:1px solid rgba(0,0,0,.1);
}
#choice{
   padding:1px 2px;
   margin-left: 10px;
   font-size: 14px;
   width:200px;
}
.r_person{
   margin-bottom:5px;   
}
#person{
   margin-left:10px;
   font-size:14px;
   border:1px solid rgba(0,0,0,.1);
   width:50px;
   height:30px;
}
#r_info{
   font-size:14px;
   margin-bottom: 3px;
}
.r_name{
   margin-bottom:5px;
}
.r_name label{
   font-size: 14px;
}
#name{
   height:30px;
   line-height:30px;
   border:1px solid rgba(0,0,0,.15);
   width:184px;
   font-size: 14px;
   margin-left:19px;
}
#name::placeholder{
   font-size:13px;
}
#phone::placeholder{
   font-size:13px;
}
.r_phone{
   margin-bottom:8px;
}
.r_phone label{
   font-size: 14px;
}
#phone{
   height:30px;
   line-height:30px;
   border:1px solid rgba(0,0,0,.1);
   width:184px;
   font-size: 14px;
   margin-left:5px;
}
#rBtn{
   width:250px;
   /* display: block;
   margin:auto; */
   background-color: #fd5300;
    border: 1px solid;
    color: white;
    font-size: 14px;
    height: 33px;
    border-radius: 3px;
}
.rBtn{
   text-align:center;
}
#tBtn{
   width:200px;
   display: block;
   margin:auto;
   background-color: #fd5300;
    border: 1px solid;
    color: white;
    font-size: 14px;
    height: 33px;
    border-radius: 3px;
}
.timeSelect{
   background-color: #fd5300;
    color: white;
    font-size: 14px;
    border: 1px;
    border-radius: 3px;
    margin: 1px;
}
#am{
   font-size: 14px;
    margin-left: 3px;
}
#pm{
   font-size: 14px;
    margin-left: 3px;
}
#reservation_form{
   width:250px;
}
.down_ico{
   font-size:17px;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e12e99f90ddd040d29c835f01fcaa837"></script>
</head>
<body>
<jsp:include page="/navbar/header/navbar_list.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<div id="banner">
   <!-- 이미지 슬라이드 담기 -->
   <ul id="imgList">
      <c:forEach var="tmp1" items="${reviewList  }">
      <c:if test="${not empty tmp1.review_image}">
      <li>
         <img class="img_item" src="${pageContext.request.contextPath}${tmp1.review_image }" alt="음식점 대표 이미지" height="400px"/>
      </li>
      </c:if>
      </c:forEach>
   </ul>
   <div id="blackEffect"></div>
   <div id="bannerBtnsWrap">
      <div id="scrapBtnWrap" class="inner">
      <c:choose>
         <c:when test="${isScrap eq 0 or empty isScrap}">
            <button id="scrapBtn" data-isscrap="">
               <i class="far fa-bookmark"></i>
            </button>
         </c:when>
         <c:otherwise>
            <button id="scrapBtn" data-isscrap="true">
               <i class="fas fa-bookmark"></i>
            </button>
         </c:otherwise>
      </c:choose>
      </div>
      <div id="slideBtnsWrap">
         <button id="leftBtn">
            <i class="fas fa-chevron-circle-left"></i>
         </button>
         <button id="rightBtn">
            <i class="fas fa-chevron-circle-right"></i>
         </button>
      </div>
      <div id="storeInfo" class="inner">
         <div id="storeName">
            <span>${dto.b_name }</span>
            <span>| ${dto.b_kind }</span>
         </div>
         <div id="presentKeys">
         </div>
         <p id="intro">${dto.intro}</p>
         <div id="activeTime">
            <span>${dto.b_Store_date }</span>
            <span>${dto.b_open }~${dto.b_close }</span>
         </div>
      </div>      
   </div>
</div>
<!-- 배너 끝 -->

<div class="inner">
   <div id="detailWrap">
      <span>상세보기 |</span> <a href="#reviewWrap">리뷰(${totalRow})</a>
   </div>
</div>

<div id="content" class="inner">
   <div id="leftContent">
       <div id="menuWrap">
         <div id="menuHeader" style="display:flex; justify-content:space-between;">
            <span>메뉴</span>
            <form action="${pageContext.request.contextPath}/eatery/takeout_insertform.do" method="post">
                     <input type="hidden" id="b_id" name="b_id" value="${dto.b_id }"/>
                     <input type="hidden" id="b_store_name" name="b_store_name" value="${dto.b_name }"/>
                     <input type="hidden" id="b_store_addr" name="b_store_addr" value="${dto.b_Store_Address }"/>
                  <button id="allBtn" type="submit">전체 메뉴 보기</button>
               </form>
         </div>
         <div id="menuListWrap">
            <div id="slideBtnsWrap2">
               <button id="leftBtn2">
                  <i class="fas fa-chevron-circle-left"></i>
               </button>
               <button id="rightBtn2">
                  <i class="fas fa-chevron-circle-right"></i>
               </button>
            </div>
            <ul id="menuList">
               <c:forEach var="menuItem" items="${menuList }">
               <li id="menuItem">
                  <img src="${pageContext.request.contextPath}${menuItem.menu_image }" alt="" />
                  <p>${menuItem.menu_name }</p>
                  <p>${menuItem.menu_price }원</p>
               </li>
               </c:forEach>
            </ul>
         </div>
      </div>
      <!-- 위치 및 시간 -->
      <div id="timePlaceWrap">
         <p id="timePlaceHeader">위치 및 시간</p>


			<div id="timePlaceContent">
				<div id="placeWrap">
					<div id="Detail_map" style="width:350px; height:230px;">
					
					</div>
					<div id="placeInfo">
						<p>${dto.b_name }</p>
						<p>${dto.b_Store_Address }</p>
					</div>
				</div>
				<div id="timeWrap">
					<div id="timeDate">
						<i class="far fa-clock"></i>
						<div id="timeInfo">
							<span>${dto.b_Store_date }</span>
							<span>${dto.b_open }-${dto.b_close }</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- timePlaceWrap.end -->
		<div id="photoWrap">
			<p id="photoHeader">사진 리뷰</p>
			<div id="photoListWrap">
				<div id="slideBtnsWrap3">
					<button id="leftBtn3">
						<i class="fas fa-chevron-circle-left"></i>
					</button>
					<button id="rightBtn3">
						<i class="fas fa-chevron-circle-right"></i>
					</button>
				</div>
				<ul id="photoList">
					<c:forEach var="tmp3" items="${reviewList }">
						<c:if test="${not empty tmp3.review_image}">
							<li>
								<a href="#">
									<img src="${pageContext.request.contextPath}${tmp3.review_image}" class="photo_item" width="100px" height="100px"/>
								</a>
							</li>
						</c:if>
					</c:forEach>
					
				</ul>
			</div>
		</div>
		<!-- photoWrap.end -->
		<div id="reviewWrap">
			<p id="reviewHeader">리뷰</p>
			<div id="reviewBanner">
				<div id="totalReviewCount">
					<p>전체 리뷰 수</p>
					<p><i class="fas fa-user-friends"></i></p>
					<p>${totalRow }</p>
				</div>
				<div id="peopleKeyword">
					<div id="peopleKeywordHeader">
						<span>이용 고객이 선택한 키워드</span>
						<button type="button" id="showKeywordBtn">
							<i class="fas fa-chevron-circle-down"></i>		
						</button>
					</div>
					<div id="keywordGraphWrap">
						<!-- 그래프 하나씩 -->
					</div>
				</div>
				<!-- peopleKeyword.end -->
			</div>
			<!-- reviewBanner.end -->
			<div id="reivewListWrap">
				<div id="reviewFilter">
					<div id="arrayFilter">
						<button type="button" id="latestBtn" data-only="all">
							<span id="latest1"><i class="fas fa-caret-down"></i></span>
							<span id="latest2">최신순</span>
						</button>
						<button type="button" id="popularBtn" data-only="all">
							<span id="popular1"><i class="fas fa-caret-down"></i></span>
							<span id="popular2">인기순</span>
						</button>
					</div>
					<div id="photoFilter">
						<button type="button" id="onlyBtn" data-array="latest" data-isClicked="">
							<span id="onlyCheck"><i class=" ${only eq 'all' ? 'far fa-check-square' : 'fas fa-check-square' }"></i></span>
							<span>사진 리뷰만</span>
						</button>
					</div>
				</div>
				<!-- reviewFilter.end -->
				<div id="reviews">
				<c:forEach var="listR" items="${reviewList }">
				<!--  <p>스크랩 유무 : ${listR.is_user_good }</p>-->
					<div class="review">
						<div class="review_header">
							<div class="profile_wrap">
							<c:choose>
								<c:when test="${empty listR.profile }">
									<i class="fas fa-user-circle" style="font-size:40px;"></i>
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}${listR.profile }" alt="${listR.writer }" class="profile" style="width:50px; height:50px;"/>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="writer_info">
								<p>${listR.writer }</p>
								<p>${listR.regdate } | ${listR.review_kind eq 'reserve'?'예약':'포장'}</p>
							</div>
						</div>
						<p class="review_content">${listR.review_content }</p>
						<c:if test="${not empty listR.review_image }">
							<div class="review_img" style="background-image:url('${pageContext.request.contextPath}${listR.review_image}');"></div>
						</c:if>
						<div class="review_key_wrap" data-num="${listR.review_num }" data-key="${listR.keyword_review}">
						</div>
						<div class="good_wrap">
							<button type="button" class="goodBtn" data-num="${listR.review_num }" data-isGoodNum="${listR.is_user_good }" data-goodCount="${listR.good_count }">
								<c:choose>
									<c:when test="${listR.is_user_good eq 0 }">
										<i class="far fa-thumbs-up"></i>
									</c:when>
									<c:otherwise>
										<i class="fas fa-thumbs-up" style="color:rgb(253, 83, 0);"></i>
									</c:otherwise>
								</c:choose>
							</button>
							<span> ${listR.good_count }</span>
							<span> 명이 추천했어요!</span>
						</div>
					</div>
					</c:forEach>
					<div class="page-ui clearfix">
						<ul id="pagination">
							<c:if test="${startPageNum ne 1 }">
								<li>
									<a href="${pageContext.request.contextPath}/eatery/ajax_detail.do?b_id=${dto.b_id}&array=${array }&only=${only }&pageNum=${startPageNum-1 }">Prev</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
								<li>
									<c:choose>
										<c:when test="${pageNum eq i }">
											<a class="active pageBtn" href="javascript:;" data-array="latest" data-only="all" data-pageNum="${i }">${i }</a>
										</c:when>
										<c:otherwise>
											<a class="pageBtn" href="javascript:;" data-array="latest" data-only="all" data-pageNum="${i }">${i }</a>
										</c:otherwise>
									</c:choose>
								</li>
							</c:forEach>
							<c:if test="${endPageNum lt totalPageCount }">
								<li>
									<a href="${pageContext.request.contextPath}/eatery/ajax_detail.do?b_id=${dto.b_id}&array=${array }&only=${only }&pageNum=${endPageNum+1 }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
					<div style="clear:both;"></div>
				</div>
				<!-- reviews.end (ajax 내용 들어갈 곳)-->
			</div>
			<!-- reviewListWrap.end -->
		</div>
		<!-- reviewWrap.end -->
		
		
		
	</div>
	<!-- leftContent.end -->
	<div id="rightContent">
		<div id="bulletin">
			<span>알림</span>
			<span>${dto.notice }</span>
		</div>
		
		<div>
			<div id="container">
		        <ul class="tabs">
		            <li class="tab-link current" data-tab="tab-1">예약</li>
		            <li class="tab-link" data-tab="tab-2">포장</li>
		        </ul>
		    
		        <div id="tab-1" class="tab-content current">
		            <form style="margin:0 auto;" action="${pageContext.request.contextPath}/eatery/reservation_insertform.do" method="post" id="reservation_form" onsubmit="return confirm('예약 하시겠습니까?');">
		            	<input type="hidden" id="b_id" name="b_id" value=${dto.b_id }/><!-- ${dto.b_id} -->
		            	<input type="hidden" id="reservation_time" name="reservation_time"/>
		            	<input type="hidden" id="b_store_name" name="b_store_name" value="${dto.b_name }"/>
		            	<input type="hidden" id="b_store_addr" name="b_store_addr" value="${dto.b_Store_Address }"/>
		                <div class="r_date" style="display:flex; align-items:center;">
		                    <label for="datepicker"><i class="far fa-calendar-alt" style="font-size:20px;"></i></label>
		                    <input style="width:200px;" class="calendar font-size:15px;" type="text" name="datepicker" id="datepicker" placeholder="날짜 입력" />  
		                    <i class="down_ico fas fa-angle-down"></i> 
		                </div>
		                
		                <div class="r_time">
		                	
		                	<div><label id="timeLabel" for="time" style="display:flex;"><i class="far fa-clock" style="font-size:20px;"></i><div id="choice">시간 선택</div><i class="down_ico fas fa-angle-down"></i></label></div>
		                
		                	<div class="hide">
		                		<span id="am">AM</span>
			                    <br />
			                    <script>
					                  let a="${dto.b_open}";
					                  let b=a.split(":");
					                  let hour=parseInt(b[0]);
					                  console.log(hour);
					                  let min=parseInt(b[1]);
					                  console.log(b[1]);
					                  if(min==30){
					                     min=1;
					                  }else{
					                     min=0;
					                  }
					                  console.log(min);
					                  hour = hour *2;
					                  let f = hour+min;
					                  console.log(f);
					                        
					                  for(let i=f; i<26; i++){
					                     let hour="";
					                     let min=":00";
					                     if((Math.ceil(i/2))<13){
					                        hour = (Math.floor(i/2));
					                     }else{
					                        hour = (Math.floor(i/2));
					                     }
					                     hour = (Math.floor(i/2));
					                     if(hour<10){
					                        hour = "0"+hour;
					                     }
					                     if(i%2 != 0){
					                        min=":30";
					                     }
					                     document.write('<button id="row_" type="button" class="timeSelect" value = "AM ' + hour + min +'">'
					                        + hour
					                        + min
					                        + '</button>');
					                  }
					            </script>
			               		<br />
			               		<span id="pm">PM</span>
			               		<br />
			                    <script>
									for(let i=2; i<17; i++){ 
									   let hour="";
									   let min=":00";
									   if((Math.ceil(i/2))<13){
									      hour = (Math.floor(i/2));
									   }else{
									      hour = (Math.floor(i/2));
									   }
									   hour = (Math.floor(i/2));
									   if(hour<10){
									      hour = "0"+hour;
									   }
									   if(i%2 != 0){
									      min=":30";
									   }
									   document.write('<button id="row_" type="button" class="timeSelect" value = "PM  ' + hour + min +'">'
									      + hour
									      + min
									      + '</button>');
									}
			                  	</script>
		                	</div>
		                	
		                </div>
		                <div class="r_person">
		                    <label for="personAdd"><i class="far fa-user" style="font-size:20px;"></i></label>
		                    <select name="person" id="person">
		                         <option value="1">1</option>
		                         <option value="2">2</option>
		                         <option value="3">3</option>
		                         <option value="4">4</option>
		                         <option value="5">5</option>
		                         <option value="6">6</option>
		                         <option value="7">7</option>
		                         <option value="8">8</option>
		                      </select>
		                </div>
		                <div class="r_info_wrap" style="margin-top:30px;">
		                <div style=" border-bottom:1px solid rgba(0,0,0,.5); padding-bottom:10px;">
		               		<span id="r_info" style="font-weight:600;">예약자 정보</span>
		                </div>
		                <div class="r_name" style="margin-top:10px;">
		                    <label for="name">예약자</label>
		                    <input type="text" name="name" id="name" placeholder="이름 입력">
		                </div>  
		                <div class="r_phone">
		                    <label for="phone">전화번호</label>
		                    <input type="text" name="phone" id="phone" placeholder="번호 입력">
		                </div>
		                </div>    
		                <div class="rBtn">
		                	 <button id="rBtn" type="submit">예약</button>
		                </div>
		            </form>  
		        </div>
		        <div id="tab-2" class="tab-content">
		            <form action="${pageContext.request.contextPath}/eatery/takeout_insertform.do" method="post">
		               	<input type="hidden" id="b_id" name="b_id" value=${dto.b_id }/>
		               	<input type="hidden" id="b_store_name" name="b_store_name" value="${dto.b_name }"/>
		            	<input type="hidden" id="b_store_addr" name="b_store_addr" value="${dto.b_Store_Address }"/>
		            	<p style="text-align:center; ">※직접 가져가실 수 있게 준비 됩니다.</p>
		            	<br />
		               	<button id="tBtn" type="submit">포장</button>
		            </form>
		        </div>
		    </div>
		</div>
		
		<ul id="etcInfo">
			<li id="callNum">
				<span><i class="fas fa-phone-alt"></i></span>
				<span>${dto.b_Store_phone }</span>
			</li>
			<li id="convenience">
				<span><i class="fas fa-store-alt"></i></span>
				<span>${dto.ex_keyword }</span>
			</li>
		</ul>
	</div>

</div>
<span id="goTop"></span>

<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
<!-- 키워드 데이터 뽑아오기 위한 코드 -->
<c:forEach var="test" items="${keyList }">
   <div id="test" style="display:none; " > ${test.good_count }/${test.key_word}</div>
</c:forEach>
<!-- 테스트장소 -->

<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 형우 부분 추가 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   let g_id = '<c:out value="${g_id}"/>';
   //사업자번호
   let b_id = '<c:out value="${dto.b_id}"/>';
   let goNum=0;
   
   //top 으로 가는 버튼 
   $(window).scroll(function() {
      if($(this).scrollTop() > 150) {
         let btnHtml=`<a style=" width:44px; height:44px; border:1px solid rgba(0,0,0,.15); background-color:white; display:flex; justify-content:center; flex-direction:column; align-items:center;position:fixed; top:800px; right:50px" href="#"><i style="font-size:15px;" class="fas fa-chevron-up"></i><div style="font-size:13px;">TOP</div></a></div>`;
         if(goNum==0){
            $("#goTop").append(btnHtml);
            goNum=1;
         }
      }else{
         $("#goTop").html('');
         goNum=0;
      }
   });
   
   // 예약&포장 스크롤 fix 하기 
   $(window).scroll(function() {
        
      if($(this).scrollTop() > 460) {
         $("#rightContent").css({'position':'fixed',
                           'margin-left':'800px',
                           'top':'60px'});
      }
      else {
         $("#rightContent").css({'position':'',
                           'margin-left':'',
                           'top':''});
      }
   });
   
   //페이지 번호 클릭시
   function pagination(sel){
      $(sel).click(function(){
         let nowArray=$(this).attr("data-array");
         let nowOnly=$(this).attr("data-only");
         let nowPage=$(this).attr("data-pageNum");
         let pageBtn=$(this);
         
         ajaxPromise("ajax_detail.do","get",
               "b_id="+b_id+"&array="+nowArray+"&only="+nowOnly+"&pageNum="+nowPage)
         .then(function(response){
            return response.text();
         })
         .then(function(data){
            $("#reviews").html(data);
            keywordSplit(".review_key_wrap");
            reviewGood(".goodBtn");
            pagination(".pageBtn");
            //$(".active").removeClass('active');
            //pageBtn.addClass('active');
         });
      });
   }
   pagination(".pageBtn");
   
   function latestArray(sel){
      //최신순 클릭
      $(sel).click(function(){
         let nowOnly=$(this).attr("data-only");
         ajaxPromise("ajax_detail.do","get",
               "b_id="+b_id+"&array=latest&only="+nowOnly)
         .then(function(response){
            return response.text();
         })
         .then(function(data){
            $("#reviews").html(data);
            $("#onlyBtn").removeAttr("data-array");
            $("#onlyBtn").attr('data-array','latest');
            
            $("#latest1").css("color","rgb(253,83,0)");
            $("#latest2").css("color","black");
            $("#popular1").css("color","rgb(190, 190, 190)");
            $("#popular2").css("color","rgb(190, 190, 190)");
         
            keywordSplit(".review_key_wrap");
            reviewGood(".goodBtn");
            pagination(".pageBtn");
         });
      });
   }
   latestArray("#latestBtn");

   function popularArray(sel){
      //인기순 클릭
      $(sel).click(function(){
         let nowOnly=$(this).attr("data-only");
         ajaxPromise("ajax_detail.do","get",
               "b_id="+b_id+"&array=popular&only="+nowOnly)
         .then(function(response){
            return response.text();
         })
         .then(function(data){
            $("#reviews").html(data);
            $("#onlyBtn").removeAttr("data-array");
            $("#onlyBtn").attr('data-array','popular');
            
            $("#latest1").css("color","rgb(190, 190, 190)");
            $("#latest2").css("color","rgb(190, 190, 190)");
            $("#popular1").css("color","rgb(253,83,0)")
            $("#popular2").css("color","black");

            keywordSplit(".review_key_wrap");
            reviewGood(".goodBtn");
            pagination(".pageBtn");
         });   
         
      });
   }
   popularArray("#popularBtn");
   
   function onlyFilter(sel){
      //사진 리뷰만 클릭 
      $(sel).click(function(){
         
         let isClicked=$(this).attr("data-isClicked");
         
         if(!isClicked){ //클릭하지 않은 상태라면 
            let nowArray=$(this).attr("data-array");
            ajaxPromise("ajax_detail.do","get",
                  "b_id="+b_id+"&array="+nowArray+"&only=photo")
            .then(function(response){
               //json 이 아닌 html 문자열을 응답받았기 때문에  return response.text() 해준다.
               return response.text();
            })
            .then(function(data){
               $("#reviews").html(data);
               $("#latestBtn").removeAttr("data-only");
               $("#latestBtn").attr('data-only','all');
               $("#popularBtn").removeAttr("data-only");
               $("#popularBtn").attr('data-only','all');
               $("#onlyBtn").removeAttr("data-isClicked");
               $("#onlyBtn").attr('data-isClicked','true');
               
               $("#onlyCheck").html(`<i class="fas fa-check-square"></i>`);
               

               keywordSplit(".review_key_wrap");
               reviewGood(".goodBtn");
               pagination(".pageBtn");
            });      
         }else{ //사진 리뷰를 클릭했다면 
            let nowArray=$(this).attr("data-array");
            ajaxPromise("ajax_detail.do","get",
                  "b_id="+b_id+"&array="+nowArray+"&only=all")
            .then(function(response){
               //json 이 아닌 html 문자열을 응답받았기 때문에  return response.text() 해준다.
               return response.text();
            })
            .then(function(data){
               $("#reviews").html(data);
               $("#latestBtn").removeAttr("data-only");
               $("#latestBtn").attr('data-only','all');
               $("#popularBtn").removeAttr("data-only");
               $("#popularBtn").attr('data-only','all');
               $("#onlyBtn").removeAttr("data-isClicked");
               $("#onlyBtn").attr('data-isClicked','');
               
               $("#onlyCheck").html(`<i class="far fa-check-square"></i>`);
               
               keywordSplit(".review_key_wrap");
               reviewGood(".goodBtn");
               pagination(".pageBtn");
            });         
         };
      });
   }
   onlyFilter("#onlyBtn");

   //리뷰 키워드 추천 이벤트 리스너
   function reviewGood(sel){
      let goodBtns=document.querySelectorAll(sel);
      
      for(let i=0;i<goodBtns.length;i++){
         goodBtns[i].addEventListener("click",function(){
            let reviewNum=$(goodBtns[i]).attr("data-num");
            let isGoodNum=$(goodBtns[i]).attr("data-isGoodNum");
            let btn=$(goodBtns[i]);
            
            if(!g_id){
               alert("로그인이 필요합니다.");
            }else{
               if(isGoodNum=="0"){ //추천하지 않았다면
         
                  ajaxPromise("private/ajax_good_insert_r.do", "get", "review_num="+reviewNum)
                  .then(function(response){
                     return response.json();
                  })
                  .then(function(data){
                     if(data.isDoReviewGood){//유저가 테이블에 추가되었다면 
                        btn.html(`<i class="fas fa-thumbs-up" style="color:rgb(253, 83, 0);"></i>`);
                        btn.removeAttr("data-isGoodNum");
                        btn.attr('data-isGoodNum','1');
                        let goodCountActive=parseInt(btn.next().text())+1;
                        btn.next().html(goodCountActive);
                     }
                  });   
   
               }else{ //추천했다면 
                  ajaxPromise("private/ajax_good_delete_r.do", "get", "review_num="+reviewNum)
                  .then(function(response){
                     return response.json();
                  })
                  .then(function(data){
                     if(data.isNotReviewGood){//유저가 테이블에 추가되었다면 
                        btn.html("<i class='far fa-thumbs-up'></i>");
                        btn.removeAttr("data-isGoodNum");
                        btn.attr('data-isGoodNum','0');
                        let goodCountActive=parseInt(btn.next().text())-1;
                        btn.next().html(goodCountActive);
                     }
                  });   
               }; //if 함수 끝 
            };//로그인 함수 끝
         }); //클릭 끝 
      }//for함수 끝
   }//function 끝
   
   reviewGood(".goodBtn");


   //리뷰 키워드 나열 
   function keywordSplit(sel){
      let keyWraps=document.querySelectorAll(sel);

      for(let i=0;i<keyWraps.length;i++){   
         //배열 선언
         let saveKey=$(keyWraps[i]).attr("data-key");
         let keyarr2=[];
         keyarr2=saveKey.split(",");
         
         for(let j=0;j<keyarr2.length;j++){
            let keyHtml=`<div class="review_key">
                        <span><i class="fas fa-check"></i></span>
                        <span>`+keyarr2[j]+`</span>
                     </div>`;
            $(keyWraps[i]).append(keyHtml);
         };
      };
   }
   keywordSplit(".review_key_wrap");
   
   //키워드 + 키워드 순서 추출
   let keyarr=[];
   tests=document.querySelectorAll("#test");
   
   //리뷰 수
   let totalR = '<c:out value="${totalRow}"/>';
   
   for(let i=0;i<tests.length;i++){
      keyarr.push(tests[i].innerText);
   }
   //키워드 내림차순 정렬
   keyarr.sort();
   
   //키워드 오름차순으로 배열 저장
   for(let i=keyarr.length-1;i>=0;i--){
      let arr1=[];

      arr1=keyarr[i].split("/");
   
      if(arr1[0]!=0&&i>7){
         let keyHtml=`<div class="key_btn">
                     <span>`+arr1[1]+`</span>
                     <span>`+arr1[0]+`</span>
                  </div>`;
         $("#presentKeys").append(keyHtml);
      }
      //리뷰키워드
      if(i>7){
         let graphKeyHtml=`<div id="keywordGraph">
                           <div id="graphText">
                           <span>`+arr1[1]+`</span>
                           <span>`+arr1[0]+`</span>
                        </div>
                        <div class="bar" id="bar`+i+`">
                        </div>
                      </div>`
         
                      let barWidth=(arr1[0]/totalR)*300;
         let colorOpacity=arr1[0]/totalR;
         $("#keywordGraphWrap").append(graphKeyHtml);
         $("#bar"+i).css({"color":"rgba(255, 133, 59, "+colorOpacity+")",
                      "width":barWidth});
                      
      }
   }
   
   //키워드 그래프 
   let isOpen=false;

   $("#showKeywordBtn").click(function(){
      if(isOpen){
         $(".addGraph").remove();
         $("#reviewBanner").css("height","210px");
         //버튼 바꾸기
         $("#showKeywordBtn").html(`<i class="fas fa-chevron-circle-down"></i>`);
         isOpen=false;
      }else{
         for(let i=keyarr.length-4;i>=0;i--){
            let arr1=[];

            arr1=keyarr[i].split("/");

            //리뷰키워드
            if(arr1[0]!=0){
               let graphKeyHtml=`<div id="keywordGraph" class="addGraph">
                                 <div id="graphText">
                                 <span>`+arr1[1]+`</span>
                                 <span>`+arr1[0]+`</span>
                              </div>
                              <div class="bar" id="bar`+i+`">
                              </div>
                            </div>`
               
             
               let barWidth=(arr1[0]/totalR)*300;
               let colorOpacity=arr1[0]/totalR;
               $("#keywordGraphWrap").append(graphKeyHtml);
               $("#bar"+i).css({"color":"rgba(255, 133, 59, "+colorOpacity+")",
                            "width":barWidth});
            }
         }
         $("#reviewBanner").css("height","fit-content");
         
         //버튼 바꾸기
         $("#showKeywordBtn").html(`<i class="fas fa-chevron-circle-up"></i>`);
         isOpen=true;
      };
   });

   //스크랩 버튼 
      $("#scrapBtn").click(function(){

         
         let btn=$(this);
         let isScrap=$(this).attr("data-isscrap");
         
         if(!g_id){
            alert("로그인이 필요합니다.");
         }else{
            if(!isScrap){ //추천안했다면
               ajaxPromise("private/ajax_good_insert.do", "get", "b_id="+b_id)
               .then(function(response){
                  return response.json();
               })
               .then(function(data){
                  if(data.isDoScrap){//유저가 테이블에 추가되었다면 
                     console.log(data);
                     btn.removeAttr("data-isscrap");
                     btn.attr('data-isscrap','true');
                     $("#scrapBtn").html(`<i class="fas fa-bookmark"></i>`);
                  }
                  console.log(data.isDoScrap+"은?");
               });   
            }else{ //추천했다면
               ajaxPromise("private/ajax_good_delete.do", "get", "b_id="+b_id)
               .then(function(response){
                  return response.json();
               })
               .then(function(data){
                  if(data.isNotScrap){//유저가 테이블에 삭제되었다면
                     btn.removeAttr("data-isscrap");
                     btn.attr('data-isscrap','');   
                     $("#scrapBtn").html(`<i class="far fa-bookmark"></i>`);
                  }
               });   
            }
         }
      });
   
   //배너 슬라이드
   let bannerMargin=0;
   
   let bannerWidth=$("#banner").width();
   let imgListWidth=$("#imgList").width();
   
   
   let imgCount=$(".img_item").length;
   let oneMove=bannerWidth/imgCount;
   
   let maxMargin=imgListWidth-bannerWidth-oneMove;
   
   function leftHide(){
      if(bannerMargin==0){
         $("#leftBtn").css('visibility','hidden');
      }else{
         $("#leftBtn").css('visibility','visible');
      };
   };
   leftHide();
   
   if(bannerMargin==0){
      $("#rightBtn").css('visibility','hidden');
   }
   
   $("#rightBtn").click(function(){
      if(bannerMargin>-maxMargin){
         bannerMargin-=oneMove;
         $("#imgList").css({
              marginLeft:bannerMargin
          });
         leftHide();
         $("#rightBtn").css('visibility','visible')
         if(bannerMargin<=-maxMargin){
            $("#rightBtn").css('visibility','hidden');
         }
      }else{
         $("#rightBtn").css('visibility','hidden');
      }
   });
   $("#leftBtn").click(function(){
      if(bannerMargin<0){
         bannerMargin+=oneMove;
         $("#imgList").css({
              marginLeft:bannerMargin
          });
         $("#rightBtn").css('visibility','visible');
         leftHide();
      }else{
         $("#rightBtn").css('visibility','hidden');
      }
   });
      
   //메뉴 슬라이드
   let menuMargin=0;
   let menuListWidth=$("#menuList").width();
   
   function leftHide2(){
      if(menuMargin==0){
         $("#leftBtn2").css('visibility','hidden');
      }else{
         $("#leftBtn2").css('visibility','visible');
      };
   };
   leftHide2();
   
   
   $("#rightBtn2").click(function(){
      if(menuMargin>=-menuListWidth){
         menuMargin-=750;
         $("#menuList").css({
              marginLeft:menuMargin
          });
         leftHide2();
         if(menuMargin<-menuListWidth){
            $("#rightBtn2").css('visibility','hidden');
         }
      }else{
         $("#rightBtn2").css('visibility','hidden');
      }
      
   });
   $("#leftBtn2").click(function(){
      if(menuMargin<0){
         menuMargin+=750;
         $("#menuList").css({
              marginLeft:menuMargin
          });
         $("#rightBtn2").css('visibility','visible');
         leftHide2();
      }else{   
         $("#rightBtn2").css('visibility','hidden');
      }
   });
   
   //사진 리뷰 슬라이드
   let phMargin=0;
   let phListWidth=$("#photoList").width();
   
   function leftHide3(){
      if(phMargin==0){
         $("#leftBtn3").css('visibility','hidden');
      }else{
         $("#leftBtn3").css('visibility','visible');
      };
   };
   leftHide3();
   
   
   $("#rightBtn3").click(function(){
      if(phMargin>=-phListWidth){
         phMargin-=750;
         $("#photoList").css({
              marginLeft:menuMargin
          });
         leftHide2();
         if(phMargin<-phListWidth){
            $("#rightBtn3").css('visibility','hidden');
         }
      }else{
         $("#rightBtn3").css('visibility','hidden');
      }
      
   });
   $("#leftBtn3").click(function(){
      if(phMargin<0){
         phMargin+=750;
         $("#photoList").css({
              marginLeft:menuMargin
          });
         $("#rightBtn3").css('visibility','visible');
         leftHide3();
      }else{   
         $("#rightBtn3").css('visibility','hidden');
      }
   });
   

   //형우 부분 script
   // 달력
      var holidays = {
              "0101":{type:0, title:"신정", year:""},
              "0301":{type:0, title:"삼일절", year:""},
              "0505":{type:0, title:"어린이날", year:""},
              "0606":{type:0, title:"현충일", year:""},
              "0815":{type:0, title:"광복절", year:""},
              "1003":{type:0, title:"개천절", year:""},
              "1009":{type:0, title:"한글날", year:""},
              "1225":{type:0, title:"크리스마스", year:""},
   
              "0211":{type:0, title:"설날", year:"2021"},
              "0212":{type:0, title:"설날", year:"2021"},
              "0213":{type:0, title:"설날", year:"2021"},
              "0920":{type:0, title:"추석", year:"2021"},
              "0921":{type:0, title:"추석", year:"2021"},
              "0922":{type:0, title:"추석", year:"2021"},
              "1004":{type:0, title:"대체공휴일", year:"2021"},
              "1011":{type:0, title:"대체공휴일", year:"2021"},
              "0519":{type:0, title:"석가탄신일", year:"2021"}
          };

    // 달력
    $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd(DD)' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
             ,beforeShowDay: function(day) {
                  var result;
                  // 포맷에 대해선 다음 참조(http://docs.jquery.com/UI/Datepicker/formatDate)
                  var holiday = holidays[$.datepicker.formatDate("mmdd",day )];
                  var thisYear = $.datepicker.formatDate("yy", day);

                  // exist holiday?
                  if (holiday) {
                  if(thisYear == holiday.year || holiday.year == "") {
                      result =  [false, "date-holiday", holiday.title];
                  }
                  }

                  if(!result) {
                  switch (day.getDay()) {
                      case 0: // is sunday?
                      result = [true, "date-sunday"];
                      break;
                      case 6: // is saturday?
                      result = [true, "date-saturday"];
                      break;
                      default:
                      result = [true, ""];
                      break;
                  }
                  }

                  return result;
               }
         });                        
      
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
      });


    
    //예약,포장 버튼 바꾸는 함수
    $(document).ready(function(){
    
        $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');
    
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
    
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');
        })
    });
   
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $("#timeLabel").parent().click(function(){
            var submenu = $(this).next("div");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    }); 
    
    
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        //시간 버튼 누르면 값 바뀌는 함수
        $('.timeSelect').click(function(){
          var id_check = $(this).attr("id"); //버튼의 id를 가져온 후
          var id_value = $(this).val(); // 가져온 아이디의  value 값을 넣어준다.
          console.log(id_check)
          console.log(id_value)
          
          //var timevalue = $(id_check).val(); 
           $("#choice").text(id_value); //span에 읽어온 id의 value 값을 넣어준다.
           $("#reservation_time").val(id_value)//span은 폼전송이 어려움으로 input type hidden에 value값 전달
      });
    }); 
    
   // 동적 생성 버튼에 id 값 부여
    $("[id~=row_]").each(function(index) { // row_로 시작하는 id값을 가진 모든 것들을
        var idx = index + 1; // 1을 더해준다.
        $(this).attr('id', 'row_'+idx);
    });
      
   //예약 한번 더 확인 하는 alert 띄우는 함수
    function showConfirm() {
       
       var rtn;
       
       rtn=confirm("예약 하시겠습니까?");
       
       if (rtn){
          document.getElementById('reservation_form').submit();
        }else{
           return false;
        }
    };

   //지도
   let lattitude = '<c:out value="${dto.lattitude}"/>';
   let longitude= '<c:out value="${dto.longitude}"/>';
   let b_name='<c:out value="${dto.b_name}"/>';
   
   var mapContainer = document.getElementById('Detail_map'), // 지도를 표시할 div  

   mapOption = { 
         center: new kakao.maps.LatLng(lattitude, longitude), // 지도의 중심좌표
         level: 3 // 지도의 확대 레벨
   };
   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   
   var positions = [
           {
              latlng: new kakao.maps.LatLng(lattitude, longitude)
          }
      ];
   
   var markerPosition  = new kakao.maps.LatLng(lattitude, longitude); 
   
   // 이미지 지도에 표시할 마커입니다
   // 이미지 지도에 표시할 마커는 Object 형태입니다
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
   marker.setMap(map);
   
   var iwContent = '<div style="padding:4px;width:100px;">'+b_name+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(lattitude, longitude); //인포윈도우 표시 위치입니다
    iwRemoveable = true;
    
   // 인포윈도우를 생성합니다
   var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent,
    removable : iwRemoveable
   });
  
   // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
   infowindow.open(map, marker); 


   
</script>


</body>
</html>