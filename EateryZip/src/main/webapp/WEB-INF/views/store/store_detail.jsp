<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/store/store_detail</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body>
<div class="container">
	<h1>가게정보페이지 입니다.</h1>
	<table>
		<tr>
			<th>사업자번호</th>
			<td>${dto.b_id}</td>
		</tr>
		<tr>
			<th>상호명</th>
			<td>${dto.b_name}</td>
		</tr>
		<tr>
			<th>가게주소</th>
			<td>${dto.b_Store_Address}</td>
		</tr>
		<tr>
			<th>업종</th>
			<td>${dto.intro}</td>
		</tr>
		<tr>
			<th>소개글</th>
			<td>${dto.intro}</td>
		</tr>
		<tr>
			<th>대표이미지</th>
			<td>
				<img src="${pageContext.request.contextPath}${dto.b_img_f }" />
			</td>
		</tr>
		<tr>
			<th>가게연락처</th>
			<td>${dto.b_Store_phone}</td>
		</tr>
		<tr>
			<th>영업일</th>
			<td>${dto.b_Store_date}</td>
			<th>오픈시간</th>
			<td>${dto.b_open}</td>
			<th>마감시간</th>
			<td>${dto.b_close}</td>
			<th>휴무일</th>
			<td>${dto.b_holiday}</td>
		</tr>
		<tr>
			<th>공지사항</th>
			<td>${dto.notice}</td>
		</tr>
		<tr>
			<th>서비스</th>
			<td>${dto.service}</td>
		</tr>
		<tr>
			<th>편의사항 / 기타</th>
			<td>${dto.ex_keyword}</td>
		</tr>
	</table>
	<ul>
		<c:if test="${dto.b_id eq b_id }">
			<li><a href="store/store_updateform.do?b_id=${dto.b_id }">수정</a></li>
			<li><a href="store/store_insertform.do?b_id=${dto.b_id }">가게등록</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>





