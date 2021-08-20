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

<div class="container">

   <h1>인덱스 페이지 입니다.</h1>
   
   <h2>공지사항</h2>
   <ul>
      <c:forEach var="tmp" items="${notice }">
         <li>${tmp }</li>
      </c:forEach>
   </ul>
   <a href="${pageContext.request.contextPath}/eatery/list.do">list</a>
   <a href="${pageContext.request.contextPath}/eatery/menu_insertform.do">menu_insertform</a>
</div>

</body>
</html>







