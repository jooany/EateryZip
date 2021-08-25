<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
<div class="container">
   
   <p> 
      <strong>${param.g_id }</strong> 회원님 가입 되었습니다. <!-- signup form의 name 값을 활용 param으로  -->
      <a href="${pageContext.request.contextPath}/users/g_login_form.do">로그인 하러가기</a>
      <!-- 나중에 회원가입 이용약관 경로로 변경 필요 -->
   </p> 
</div>   
</body>
</html>