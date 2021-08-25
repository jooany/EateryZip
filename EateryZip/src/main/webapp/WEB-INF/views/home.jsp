<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
</head>
<body>

<h1>메인페이지 입니다.</h1> 
	<h2>형우 테스트 링크</h2>
	<a href="${pageContext.request.contextPath}/eatery/reservation_form.do">예약 폼</a>
	<h2>주연 테스트 링크</h2>
	<a href="${pageContext.request.contextPath}/users/b_mypage/menu_insertform.do">menu_insertform</a>
	
	<a href="${pageContext.request.contextPath}/store/store_insertform.do">가게등록</a>
	<a href="${pageContext.request.contextPath}/store/store_detail.do">가게정보</a>
	
	<a href="${pageContext.request.contextPath}/eatery/list.do">list</a>
	
	<a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage.do">비즈니스회원정보</a>
 
</body>
</html>