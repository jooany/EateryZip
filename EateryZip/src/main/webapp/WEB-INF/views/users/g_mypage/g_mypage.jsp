<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<script src="https://kit.fontawesome.com/eda0c6c5f7.js" crossorigin="anonymous"></script>
<style>
	#g_profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
</head>
<body>
<div class="container">
	<a href="${pageContext.request.contextPath}/home.do">(임시)메인페이지가기</a>
	<h1>가입 정보 입니다.</h1>
	<div id="container">
		<div class="left_content">
			<ul class="left_menu">
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage_updateform.do">개인정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/reserve_List.do">예약내역</a></li>
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/takeout_list.do">포장내역</a></li>
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/scrap_List.do">스크랩</a></li>
				<li><a href="javascript:deleteConfirm()">회원탈퇴</a></li>
			</ul>
		</div>
		<h1>${GUserDto.g_profile }</h1>
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
						<c:when test="${empty dto.g_profile }">
							<i id="g_profileImage" class="far fa-user fa-3x"></i>
						</c:when>
						<c:otherwise>
							<img id="g_profileImage" src="${pageContext.request.contextPath}${dto.g_profile}"/>
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
<script>
	function deleteConfirm(){
	    const isDelete=confirm("${g_id} 님 탈퇴 하시겠습니까?");
	    if(isDelete){
	  	 fetch("${pageContext.request.contextPath}/users/g_mypage/ajax_g_delete.do")
	  	 .then(function(response){
	  		 return response.json();
	  	 })
	  	 .then(function(data){
	  		 console.log(data);
	  		 if(data.isSuccess){
	  			alert(data.g_id+"님 회원탈퇴 처리 되었습니다.");
	  			location.href="${pageContext.request.contextPath}/home.do";
	  		 }
	  	 }); 
	    }
	 }
</script>


</body>
</html>