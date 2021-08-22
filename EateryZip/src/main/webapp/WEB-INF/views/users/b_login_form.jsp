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
   <h1>로그인 폼 입니다.</h1>
   <form action="${pageContext.request.contextPath}/users/b_login.do" method="post">
      <div>
         <label for="b_id">사업자번호</label>
         <input type="text" name="b_id" id="b_id"/>
      </div>
      <div>
         <label for="b_pwd">비밀번호</label>
         <input type="password" name="b_pwd" id="b_pwd"/>
      </div>
      <button type="submit">로그인</button>
      <a href="${pageContext.request.contextPath}/users/g_login_form.do">일반회원 로그인으로 이동</a>	
   </form>
</div>
</body>
</html>