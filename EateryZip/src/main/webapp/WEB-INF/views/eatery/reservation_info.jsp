<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
</head>
<style>
	.reservation{
		width: 50%;
		margin: 0 auto;
	}
</style>
<body>
<div class="reservation">
	<h2> > 예약 정보 확인 페이지</h2>
	<p>
		<span>${dto.b_store_name}</span>
		<br />
		<span>${dto.b_store_addr}</span>
	</p>
	<p>날짜 : ${dto.reservation_date}</p>
	<p>시간 : ${dto.reservation_time}</p>
	<p>인원 : ${dto.reservation_people}</p>
	<p>이름 : ${dto.reservation_name}</p>
	<p>전화번호 : ${dto.reservation_phone}</p>
	<p>요청사항 : ${dto.reservation_memo}</p>
	<button></button>
</div>
</body>
</html>