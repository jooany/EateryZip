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
}
.inner{
	width:1100px;
	margin:0 auto;
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



</style>
</head>
<body>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<div id="banner">
	<!-- 이미지 슬라이드 담기 -->
	<ul id="imgList">
		<c:forEach var="tmp1" items="${storeImgList }">
		<li>
			<img src="${pageContext.request.contextPath}${tmp1.store_img }" alt="음식점 대표 이미지" height="400px"/>
		</li>
		</c:forEach>
	</ul>
	<div id="blackEffect"></div>
	<div id="bannerBtnsWrap">
		<div id="scrapBtnWrap" class="inner">
		<c:choose>
			<c:when test="${isScrap eq 0}">
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
				<span>월,화,수,목,금</span>
				<span>${dto.b_open }~${dto.b_close }</span>
			</div>
		</div>		
	</div>
	
</div>




<!-- 테스트장소 -->
<h1>메뉴 리스트</h1>
<c:forEach var="tmp2" items="${menuList }">
	<p>
		${tmp2.menu_name }
	</p>
</c:forEach>
<h1>리뷰 리스트 최신순</h1>
<c:forEach var="tmp3" items="${reviewList }">
	<p>
		${tmp3.review_image }
		${tmp3.keyword_review }
	</p>
</c:forEach>

<div class="page-ui clearfix">
	<ul>
		<c:if test="${startPageNum ne 1 }">
			<li>
				<a href="list.do?pageNum=${startPageNum-1 }">Prev</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<li>
				<c:choose>
					<c:when test="${pageNum eq i }">
						<a  class="active" href="list.do?pageNum=${i }">${i }</a>
					</c:when>
					<c:otherwise>
						<a href="list.do?pageNum=${i }">${i }</a>
					</c:otherwise>
				</c:choose>
			</li>
		</c:forEach>
		<c:if test="${endPageNum lt totalPageCount }">
			<li>
				<a href="list.do?pageNum=${endPageNum+1 }">Next</a>
			</li>
		</c:if>
	</ul>
</div>
<div style="clear:both;"></div>


<c:forEach var="test" items="${keyList }">
<div id="test" style="display:none;">${test.good_count }/${test.key_word}</div>
</c:forEach>




<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//키워드 + 키워드 순서 추출
	let keyarr=[];
	tests=document.querySelectorAll("#test");
	
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
	}



	//스크랩 버튼 
	let b_id = '<c:out value="${dto.b_id}"/>';
	let g_id = '<c:out value="${g_id}"/>';
	
		$("#scrapBtn").click(function(){
			let btn=$(this);
			let isScrap=$(this).attr("data-isscrap");
			
			if(!isScrap){ //추천안했다면
				console.log("ajax실행전!!");
				ajaxPromise("private/ajax_good_insert.do", "get", "b_id="+b_id)
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					if(data.isDoScrap){//유저가 테이블에 추가되었다면 
						btn.removeAttr("data-isscrap");
						btn.attr('data-isscrap','true');
						$("#scrapBtn").html(`<i class="fas fa-bookmark"></i>`);
					}
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
		});
</script>


</body>
</html>