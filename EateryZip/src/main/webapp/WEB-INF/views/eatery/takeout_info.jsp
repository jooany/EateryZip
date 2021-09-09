<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
</head>
<style>
	.takeout{
		width: 50%;
		margin: 0 auto;
	}
</style>
<body>
<div class="takeout">
	<h2> <i class="fas fa-angle-right"></i>포장 예약 정보 확인 페이지</h2>
	<p>
		<span>${dto.takeout_num}</span>
		<br />
		<span>${dto.b_id}</span>
	</p>
	<p>날짜 : ${dto.takeout_date}</p>
	<p>픽업 시간 : ${dto.takeout_time}</p>
	<p>이름 : ${dto.takeout_name}</p>
	<p>전화번호 : ${dto.takeout_phone}</p>
	<div>
		<table>
			<thead>
				<th>메뉴</th>
				<th>수량</th>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.menu_name}</td>
						<td>${tmp.menu_count }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<p>총 가격 : ${dto.takeout_price }원</p>
	<p>요청사항 : ${dto.takeout_memo}</p>
	
	<p>※결제 후 10분까지 취소 가능(10분뒤 취소 불가능)</p>
	<button>확인</button>
</div>
</html>