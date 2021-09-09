<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="https://kit.fontawesome.com/eda0c6c5f7.js" crossorigin="anonymous"></script>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#g_profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#image{
		display: none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>가입 정보 수정 폼 입니다.</h1>
	<a id="g_profileLink" href="javascript:">
		<c:choose>
			<c:when test="${empty dto.g_profile }">
				<i id="g_profileImage" class="far fa-user fa-3x"></i>
			</c:when>
			<c:otherwise>
				<img id="g_profileImage" src="${pageContext.request.contextPath}${dto.g_profile }" />
			</c:otherwise>
		</c:choose>
	</a>
	<form action="${pageContext.request.contextPath}/users/g_mypage/update.do" method="post">
		<input type="hidden" name="g_profile" value="${ empty dto.g_profile ? '' : dto.g_profile }"/>
		<div>
			<label for="g_id">사업자번호</label>
			<input type="text" id="g_id" value="${g_id }" disabled/>
		</div>
		<div>
			<label for="g_name">대표자</label>
			<input type="text" name="g_name" id="g_name" value="${dto.g_name }"/>
		</div>
		<div>
			<label for="g_address">주소지</label>
			<input type="text" name="g_address" id="g_address" value="${dto.g_address }"/>
		</div>
		<div>
			<label for="g_email">이메일</label>
			<input type="text" name="g_email" id="g_email" value="${dto.g_email }"/>
		</div>
		<div>
			<label for="g_phone">연락처</label>
			<input type="text" name="g_phone" id="g_phone" value="${dto.g_phone }"/>
		</div>
		<button type="submit">수정반영</button>
	</form>
	
	<form action="${pageContext.request.contextPath}/users/g_mypage/ajax_g_profile_upload.do" method="post" id="imageForm" enctype="multipart/form-data">
		<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
	</form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//프로필 이미지 링크를 클릭하면 
	document.querySelector("#g_profileLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			let img=`<img id="g_profileImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			document.querySelector("#g_profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			document.querySelector("input[name=g_profile]").value=data.imagePath;
		});
	});
</script>
</body>
</html>










