<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${b_name}님의 사업자번호는 ${find_id }입니다.
	<a href="${pageContext.request.contextPath}/home.do" type="button" class="btn btn-primary">메인으로</a>

</body>
</html>