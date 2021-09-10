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
	#b_profileImage{
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
			<div class="d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab">마이페이지</button>
					<button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab">가게정보등록</button>
					<button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab">
						<a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage_updateform.do">개인정보수정</a>
					</button>
					<button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab">포장주문내역</button>
					<button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab">예약내역</button>
				</div>
				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel">...</div>
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel">...</div>
					<div class="tab-pane fade" id="v-pills-messages" role="tabpanel">...</div>
					<div class="tab-pane fade" id="v-pills-settings" role="tabpanel">...</div>
				</div>
			</div>

			<ul class="left_menu">
				<li>마이페이지</li>
				<li>가게정보등록</li>
				<li><a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage_updateform.do">개인정보수정</a></li>
				<li>포장주문내역</li>
				<li>예약내역</li>
				<li><a href="javascript:deleteConfirm()">회원탈퇴</a></li>
			</ul>
		</div>
		<h1>${BUserDto.b_profile }</h1>
		<div class="right_content">
		<input type="hidden" name="b_profile" value="${ empty dto.b_profile ? '' : dto.b_profile }"/>
			<table>
				<tr>
					<th>사업자번호</th>
					<td>${b_id }</td>
				</tr>
				<tr>
					<th>프로필 이미지</th>
					<td>
					<c:choose>
						<c:when test="${empty dto.b_profile }">
							<i id="b_profileImage" class="far fa-user fa-3x"></i>
						</c:when>
						<c:otherwise>
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
		</div>
	</div>
	<a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage_updateform.do">개인정보 수정</a>
</div>
<script>
	function deleteConfirm(){
	    const isDelete=confirm("${b_id} 님 탈퇴 하시겠습니까?");
	    if(isDelete){
	  	 fetch("${pageContext.request.contextPath}/users/b_mypage/ajax_b_delete.do")
	  	 .then(function(response){
	  		 return response.json();
	  	 })
	  	 .then(function(data){
	  		 console.log(data);
	  		 if(data.isSuccess){
	  			alert(data.b_id+"님 회원탈퇴 처리 되었습니다.");
	  			location.href="${pageContext.request.contextPath}/home.do";
	  		 }
	  	 }); 
	    }
	 }
</script>
</body>
</html>