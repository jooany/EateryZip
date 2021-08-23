<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/store/store_insert.jsp</title>
</head>
<body>
	<div class="container">
		<p>
			<strong>${param.b_name }</strong>으로 가게정보가 등록되었습니다.
			<a href="${pageContext.request.contextPath}/store/mypageform.do">마이페이지 가기</a>
		</p>
	</div>
</body>
</html>