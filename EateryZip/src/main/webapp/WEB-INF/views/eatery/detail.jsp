<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 상세 페이지</title>
<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
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
</style>
</head>
<body>
<div id="banner">
	<div id="bannerBtnsWrap">
		<button id="scrapBtn">
		</button>
		<div id="slideBtnsWrap">
			<button id="leftBtn">
			</button>
			<button id="rightBtn">
			</button>
		</div>
		
	</div>
	<div id="imgList">
		<img src="${tmp1.store_img }" alt="음식점 대표 이미지" />
	</div>
</div>


<h1>음식점 정보 : ${dto } / 이름은  ${dto.b_name }</h1>
<h1>음식점 이미지</h1>
<c:forEach var="tmp1" items="${storeImgList }">
	<p>
		${tmp1.store_img };
	</p>
</c:forEach>
<h1>메뉴 리스트</h1>
<c:forEach var="tmp2" items="${menuList }">
	<p>
		${tmp2.menu_name }
	</p>
</c:forEach>
<h1>리뷰 리스트 안나와!</h1>
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



<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

</script>
</body>
</html>