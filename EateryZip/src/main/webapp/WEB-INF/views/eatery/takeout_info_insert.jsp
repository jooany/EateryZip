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
	alert("${param.takeout_name}님  ${param.takeout_time}까지 포장 예약 완료 되셨습니다.");
	location.href="${pageContext.request.contextPath}/eatery/takeout_info.do?takeout_num=${num}";
</script>
</body>
</html>