<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>예약내역</h1>
	<div id="container">
		<div class="content_Rs">
			<c:forEach var="tmp" items="${list }">
			<div class="wrap_date_Rs">
				<p>예약일</p>
				<p>${tmp.reservation_date }</p>
			</div>
			<div class="wrap_time_Rs">
				<p>예약시간</p>
				<p>${tmp.reservation_time }</p>
			</div>
			<div class="wrap_name_Rs">
				<p>예약자</p>
				<p>${tmp.reservation_name }</p>
			</div>
			<div class="wrap_price_Rs">
				<p>예약인원</p>
				<p>${tmp.reservation_people }</p>
			</div>
			<div class="wrap_detail_Rs">
				<p>자세히보기</p>
				<button type="button" class="reservation_btn" data-reservation="${tmp.reservation_num}" data-id="${tmp.b_id}">예약내역보기</button>
			</div>
			</c:forEach>
		</div>
	</div>
	<table>
		<thead>
			<tr>
				<th>픽업일</th>
				<th>픽업시간</th>
				<th>성함</th>
				<th>가격</th>
				<th>예약내역 자세히보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.reservation_date }</td>
					<td>${tmp.reservation_time }</td>
					<td>${tmp.reservation_name }</td>
					<td>${tmp.reservation_people }</td>
					<td>
						<button type="button" class="reservation_btn" data-reservation="${tmp.reservation_num}" data-id="${tmp.b_id}">예약내역보기</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(".reservation_btn").click(function(){
			let reservationNum=$(".reservation_btn").attr("data-reservation");
			let bId=$(".reservation_btn").attr("data-id");
		window.open("${pageContext.request.contextPath}/eatery/reservation_info.do?reservation_num="+reservationNum+"&b_id="+bId, "예약내역보기", "width=520px,height=751px");
		});
		
	</script>
</body>
</html>