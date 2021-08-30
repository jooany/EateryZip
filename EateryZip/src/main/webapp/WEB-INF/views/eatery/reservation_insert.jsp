<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
		alert("${param.reservation_name}님  ${param.reservation_date} ${param.reservation_time} 예약 완료 되셨습니다.");
		location.href="${pageContext.request.contextPath}/eatery/reservation_info.do?reservation_num=${num}";
</script>
</body>
</html>