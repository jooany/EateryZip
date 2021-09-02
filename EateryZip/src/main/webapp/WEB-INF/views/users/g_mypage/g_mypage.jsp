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
	<a href="${pageContext.request.contextPath}/home.do">(임시)메인페이지가기</a>
	<h1>가입 정보 입니다.</h1>
	<div id="container">
		<div class="left_content">
			<ul class="left_menu">
				<li>마이페이지</li>
				<li>예약내역</li>
				<li>포장내역</li>
				<li>스크랩</li>
				<li>회원탈퇴</li>
			</ul>
		</div>
		<h1>${BUserDto.g_profile }</h1>
		<div class="right_content">
		<input type="hidden" name="g_profile" value="${ empty dto.g_profile ? '' : dto.g_profile }"/>
			<table>
				<tr>
					<th>아이디</th>
					<td>${g_id }</td>
				</tr>
				<tr>
					<th>프로필 이미지</th>
					<td>
					<c:choose>
						<c:when test="${not empty dto.g_profile }">
							
							<img id="g_profileImage" src="${pageContext.request.contextPath}${dto.g_profile}"/>
						</c:when>
						<c:otherwise>
							<i id="g_profileImage" class="far fa-user fa-3x"></i>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><a href="${pageContext.request.contextPath}/users/g_pwd_updateform.do">수정하기</a></td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.g_name }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${dto.g_address }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.g_email }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${dto.g_phone }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${dto.g_regdate }</td>
				</tr>
			</table>
		</div>
	</div>
	<a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage_updateform.do">개인정보 수정</a>
</div>
</body>
</html>