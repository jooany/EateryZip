<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/updateform.jsp</title>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#imageForm{
		display: none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>가입 정보 수정 폼 입니다.</h1>
	<a id="profileLink" href="javascript:">
		<c:choose>
			<c:when test="${empty b_dto.b_profile }">
				<i id="b_profileImage" class="far fa-user fa-3x"></i>
			</c:when>
			<c:otherwise>
				<img id="b_profileImage" src="${pageContext.request.contextPath}${b_dto.b_profile }" />
			</c:otherwise>
		</c:choose>
	</a>
	<form action="${pageContext.request.contextPath}/users/ajax_profile_upload.do" method="post" id="b_imageForm" enctype="multipart/form-data">
		<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
	</form>
	<form action="${pageContext.request.contextPath}/users/update.do" method="post">
		<input type="hidden" name="b_profile" value="${ empty b_dto.b_profile ? '' : b_dto.b_profile }"/>
		<div>
			<label for="b_id">사업자번호</label>
			<input type="text" id="b_id" value="${b_dto.b_id }" disabled/>
		</div>
		<div>
			<label for="b_name">대표자</label>
			<input type="text" name="b_name" id="b_name" value="${b_dto.b_name }"/>
		</div>
		<div>
			<label for="b_address">주소</label>
			<input type="text" id="b_address" value="${b_dto.b_address }"/>
		</div>
		<div>
			<label for="b_email">이메일</label>
			<input type="text" name="b_email" id="b_email" value="${b_dto.b_email }"/>
		</div>
		<div>
			<label for="b_phone">연락처</label>
			<input type="text" id="b_phone" value="${b_dto.b_phone }"/>
		</div>
		<button type="submit">수정반영</button>
	</form>
	
	
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//프로필 이미지 링크를 클릭하면 
	document.querySelector("#profileLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#b_imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {b_imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			let img=`<img id="b_profileImage" src="${pageContext.request.contextPath}\${data.b_imagePath}"/>`;
			document.querySelector("#profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			document.querySelector("input[name=b_profile]").value=data.imagePath;
		});
	});
</script>
</body>
</html>