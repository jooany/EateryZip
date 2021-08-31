<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비즈니스회원 로그인</title>
</head>
<body>
<div class="container">
   <h1>알림</h1>
   <c:choose>
   		<c:when test="${not empty sessionScope.b_id }">
		   	  <p>
		         <strong>${sessionScope.b_id }</strong>사업자님 로그인 되었습니다.
		         <a href="${pageContext.request.contextPath}/users/b_mypage.do">비즈니스 마이페이지</a> 
		         <a href="${pageContext.request.contextPath}/users/b_mypage/menu_insertform.do">메뉴insertform</a> 

		         <!-- 우선은 메인화면으로 이동, 추후 마이페이지로 이동-->
		      </p>
   		</c:when>
   		<c:otherwise>
   		<p>
         	아이디 혹은 비밀 번호가 틀려요
         	<a href="${pageContext.request.contextPath}/users/b_login_form.do">다시 시도</a>
      	</p>
   		</c:otherwise>
   </c:choose>
</div>   
</body>
</html>




