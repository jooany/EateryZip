<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<script src="https://kit.fontawesome.com/eda0c6c5f7.js" crossorigin="anonymous"></script>
<style>

</style>
</head>
<body>
<div class="container">
	<h1>가입 정보 입니다.</h1>
	<table>
		<tr>
			<th>사업자번호</th>
			<td>${dto.b_id }</td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td>
				<c:choose>
					<c:when test="${empty dto.b_profile }">
						<i id="b_profileImage" class="far fa-user fa-3x"></i>
					</c:when>
					<c:otherwise test="${!empty dto.b_profile }">
						<img id="b_profileImage" src="${pageContext.request.contextPath}${dto.b_profile}"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a href="${pageContext.request.contextPath}/users/b_pwd_updateform.do">수정하기</a></td>
		</tr>
		<tr>
			<th>대표자</th>
			<td>${dto.b_name }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${dto.b_address }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.b_email }</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${dto.b_phone }</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.b_regdate }</td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage_updateform.do">개인정보 수정</a>
</div>
</body>
</html>