<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/g_mypage/reserve_List.jsp</title>
<jsp:include page="/navbar/header/navbar_list.jsp"></jsp:include>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	#container{
		width:1100px!important;
		margin:auto;
	}
	
	
</style>
</head>
<body>
	<div id="container">
		<h1>포장내역입니다.</h1>
		<table class="rStable">
			<thead class="rSthead">
				<tr class="rStrh">
					<th class="rSno">예약번호</th>
					<th class="rStime">예약일</th>
					<th class="rSname">예약자 성함</th>
					<th class="rSbname">상호명</th>
					<th class="rSpeople">인원</th>
					<th class="rSreview">리뷰</th>
					<th class="rSdetail">내역</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr class="rStrd">
						<td class="rSno">${tmp.reservation_num }</td>
						<td class="rStime">${tmp.reservation_date } ${tmp.reservation_time }</td>
						<td class="rSname">${tmp.reservation_name }</td>
						<td class="rSbname">
							<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${tmp.b_id}">${tmp.b_name }</a>
						</td>
						<td class="rSpeople">${tmp.reservation_people }</td>
						<td class="rSreview">
							<c:choose>
								<c:when  test="${tmp.did_it == 0 }">
									<button type="button" class="reservation_btn" data-reservationnum="${tmp.reservation_num}" data-id="${tmp.b_id}">리뷰작성</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="reservation_btn" data-reservationnum="${tmp.reservation_num}" data-id="${tmp.b_id}">리뷰수정</button>
								</c:otherwise>
							</c:choose>
						</td>
						<td class="rSdetail">
							<button type="button" class="reservation_btn2" data-reservationnum2="${tmp.reservation_num}" data-id2="${tmp.b_id}">예약내역보기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<c:forEach var="tmp" items="${list }">
			<div class="rSList">
				<div class="content_num">
					<p>예약번호</p>
					<p>${tmp.reservation_num }</p>
				</div>
				<div class="content_date">
					<p>방문시간</p>
					<p>${tmp.reservation_date } ${tmp.reservation_time }</p>
				</div>
				<div>
					<p>예약자</p>
					<p>${tmp.reservation_name }</p>
				</div>
				<div class="content_name">
					<p>상호명</p>
					<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${tmp.b_id}">${tmp.b_name }</a>
				</div>
				<div class="content_people">
					<p>인원</p>
					<p>${tmp.reservation_people }</p>
				</div>
				<div class="content_review">
					<c:choose>
						<c:when  test="${tmp.did_it == 0 }">
							<button type="button" class="reservation_btn" data-reservationnum="${tmp.reservation_num}" data-id="${tmp.b_id}">리뷰작성</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="reservation_btn" data-reservationnum="${tmp.reservation_num}" data-id="${tmp.b_id}">리뷰수정</button>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="content_detail">
					<button type="button" class="reservation_btn2" data-reservationnum2="${tmp.reservation_num}" data-id2="${tmp.b_id}">포장내역보기</button>
				</div>
			</div>
		</c:forEach>
	</div>




<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
		$(".reservation_btn").click(function(){
			let reservNum=$(this).attr("data-reservationnum");
			let bId=$(this).attr("data-id");
		window.open("${pageContext.request.contextPath}/users/g_mypage/review_reservation_form.do?reservation_num="+reservNum+"&b_id="+bId, "리뷰 작성", "width=520px,height=751px");
		});
		$(".reservation_btn2").click(function(){
			let reservNum2=$(this).attr("data-reservationnum2");
			let bId2=$(this).attr("data-id2");
		window.open("${pageContext.request.contextPath}/eatery/reservation_info.do?reservation_num="+reservNum2+"&b_id="+bId2, "포장내역보기", "width=520px,height=751px");
		});
		
		$("#btn").click(function(){
			window.open("${pageContext.request.contextPath}/users/g_mypage/review_reservation_form.do?reservation_num=161&b_id=1111111111", "리뷰 작성", "width=520px,height=751px");
			
		});

		function openNav() {
		  document.getElementById("mySidenav").style.width = "250px";
		}
		
		function closeNav() {
		  document.getElementById("mySidenav").style.width = "0";
		}
		
</script>

</body>
</html>