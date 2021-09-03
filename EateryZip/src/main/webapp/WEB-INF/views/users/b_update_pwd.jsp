<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_update.jsp</title>
</head>
<body>
<div class="container">
         <strong>${requestScope.b_id }</strong> 님 비밀번호를 수정하고 로그 아웃되었습니다. <!-- 로그아웃되었기때문에 id 확인 불가 -->
         <a href="${pageContext.request.contextPath}/users/b_login_form.do">다시 로그인 하러 가기</a>
</div>
</body>
</html>




