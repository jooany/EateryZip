<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장 리뷰 내역</title>
<jsp:include page="/navbar/header/navbar_list.jsp"></jsp:include>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	#container{
		width: 1100px;
	}
	.tOtable{
		width: 700px;
		height: 300px;
		background-color: #ccc;
	}
	.toList{
		width: 700px;
		height: 350px;
		background-color: #ccc;
	}
</style>
</head>
<body>
<div id="container">
	<h1>포장내역입니다.</h1>
	<table class="tOtable">
		<thead class="tOthead">
			<tr class="tOtrh">
				<th class="tOno">포장번호</th>
				<th class="tOtime">방문시간</th>
				<th class="tOname">상호명</th>
				<th class="tOprice">가격</th>
				<th class="tOreview">리뷰</th>
				<th class="tOdetail">내역</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr class="tOtrd">
					<td class="tOno">${tmp.takeout_num }</td>
					<td class="tOtime">${tmp.takeout_date } ${tmp.takeout_time }</td>
					<td class="tOname">
						<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${tmp.b_id}">${tmp.b_name }</a>
					</td>
					<td class="tOprice">${tmp.takeout_price }</td>
					<td class="tOreview">
						<c:choose>
							<c:when  test="${tmp.did_it == 0 }">
								<button type="button" class="takeout_btn" data-takeoutnum="${tmp.takeout_num}" data-id="${tmp.b_id}">리뷰작성</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="takeout_btn" data-takeoutnum="${tmp.takeout_num}" data-id="${tmp.b_id}">리뷰수정</button>
							</c:otherwise>
						</c:choose>
					</td>
					<td class="tOdetail">
						<button type="button" class="takeout_btn2" data-takeoutnum2="${tmp.takeout_num}" data-id2="${tmp.b_id}">포장내역보기</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<c:forEach var="tmp" items="${list }">
		<div class="toList">
			<div class="content_num">
				<p>포장번호</p>
				<p>${tmp.takeout_num }</p>
			</div>
			<div class="content_date">
				<p>방문시간</p>
				<p>${tmp.takeout_date } ${tmp.takeout_time }</p>
			</div>
			<div class="content_name">
				<p>상호명</p>
				<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${tmp.b_id}">${tmp.b_name }</a>
			</div>
			<div class="content_price">
				<p>가격</p>
				<p>${tmp.b_name }</p>
			</div>
			<div class="content_review">
				<c:choose>
					<c:when  test="${tmp.did_it == 0 }">
						<button type="button" class="takeout_btn" data-takeoutnum="${tmp.takeout_num}" data-id="${tmp.b_id}">리뷰작성</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="takeout_btn" data-takeoutnum="${tmp.takeout_num}" data-id="${tmp.b_id}">리뷰수정</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="content_detail">
				<button type="button" class="takeout_btn2" data-takeoutnum2="${tmp.takeout_num}" data-id2="${tmp.b_id}">포장내역보기</button>
			</div>
		</div>
	</c:forEach>
</div>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
		$(".takeout_btn").click(function(){
			let takeNum=$(this).attr("data-takeoutnum");
			let bId=$(this).attr("data-id");
		window.open("${pageContext.request.contextPath}/users/g_mypage/review_takeout_form.do?takeout_num="+takeNum+"&b_id="+bId, "리뷰 작성", "width=520px,height=751px");
		});
		$(".takeout_btn2").click(function(){
			let takeNum2=$(".takeout_btn2").attr("data-takeoutnum2");
			let bId2=$(".takeout_btn2").attr("data-id2");
		window.open("${pageContext.request.contextPath}/eatery/takeout_info.do?takeout_num="+takeNum2+"&b_id="+bId2, "포장내역보기", "width=520px,height=751px");
		});
		
</script>

</body>
</html>