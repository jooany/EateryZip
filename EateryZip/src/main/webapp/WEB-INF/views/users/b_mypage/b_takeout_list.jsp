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
	<h1>포장내역</h1>
	<div id="container">
		<div class="content_To">
			<div class="wrap_date_To">
				<p>픽업일</p>
				<p>${tmp.takeout_date }</p>
			</div>
			<div class="wrap_time_To">
				<p>픽업시간</p>
				<p>${tmp.takeout_time }</p>
			</div>
			<div class="wrap_name_To">
				<p>주문자</p>
				<p>${tmp.takeout_name }</p>
			</div>
			<div class="wrap_price_To">
				<p>가격</p>
				<p>${tmp.takeout_price }</p>
			</div>
			<div class="wrap_detail_To">
				<p>자세히보기</p>
				<button type="button" class="takeout_btn" data-takeoutnum="${tmp.takeout_num}" data-id="${tmp.b_id}">포장내역보기</button>
			</div>
		</div>
	</div>
	<table>
		<thead>
			<tr>
				<th>픽업일</th>
				<th>픽업시간</th>
				<th>성함</th>
				<th>가격</th>
				<th>자세히보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.takeout_date }</td>
					<td>${tmp.takeout_time }</td>
					<td>${tmp.takeout_name }</td>
					<td>${tmp.takeout_price }</td>
					<td>
						<button type="button" class="takeout_btn" data-takeoutnum="${tmp.takeout_num}" data-id="${tmp.b_id}">포장내역보기</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(".takeout_btn2").click(function(){
			let takeNum=$(".takeout_btn").attr("data-takeoutnum");
			let bId=$(".takeout_btn").attr("data-id");
		window.open("${pageContext.request.contextPath}/eatery/takeout_info.do?takeout_num="+takeNum+"&b_id="+bId, "포장내역보기", "width=520px,height=751px");
		});
		
	</script>
</body>
</html>