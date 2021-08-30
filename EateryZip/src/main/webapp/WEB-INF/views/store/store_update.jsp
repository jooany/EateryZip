<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/store/store_update.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style type="text/css">
	#container{
		width: 80%;
		margin:0 10% ;
	}
</style>
</head>
<body>
	<p>
		<strong>${dto.b_name }</strong> 의 가게정보가 수정되었습니다.
		<a href="${pageContext.request.contextPath}/store/store_detail.do">가게정보</a>
	</p>
</body>
</html>