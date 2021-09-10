<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/updateform.jsp</title>
<style>

</style>
</head>
<body>
<div id="container">
	<h1>가입 정보 수정</h1>
	<form action="${pageContext.request.contextPath}/users/b_mypage/update.do" method="post">
		<div>
			<label for="b_id">사업자번호</label>
			<input type="text" id="b_id" value="${b_id }" disabled/>
		</div>
		<div>
			<label for="b_name">대표자</label>
			<input type="text" name="b_name" id="b_name" value="${dto.b_name }"/>
		</div>
		<div>
			<label for="b_address">주소지</label>
			<input type="text" name="b_address" id="b_address" value="${dto.b_address }"/>
		</div>
		<div class="mb-2 row">
			<label class="col-form-label mb-1" for="b_email">이메일</label>
			<div class="invalid-feedback">이메일을 입력해주세요.</div>
			<div class="col-md-6">
				<input class="form-control" type="text" name="b_email" id="b_email" placeholder="이메일을 입력해주세요."/>
			</div>
			<div class="col-md-6">
				<select class="form-select" name="b_email2" id="b_email2"> 
					<option value="No" selected>도메인을 선택해주세요.</option>
					<option value="@gmail.com">@gmail.com</option>
					<option value="@naver.com">@naver.com</option>
					<option value="@daum.net">@daum.net</option>
					<option value="@nate.com">@nate.com</option>
					<option value="@kakao.com">@kakao.com</option>
				</select>
				<div class="invalid-feedback">도메인을 선택해주세요.</div>
			</div>
		</div>
		<div>
			<label for="b_phone">연락처</label>
			<input type="text" name="b_phone" id="b_phone" value="${dto.b_phone }"/>
		</div>
		<button type="submit">수정반영</button>
	</form>
</div>
<script>
	let isEmailValid=false;
	let isEmailValid2=false;
	
	//이메일을 입력했을때 실행할 함수 등록
	document.querySelector("#b_email").addEventListener("input", function(){
		   document.querySelector("#b_email").classList.remove("is-valid");
		   document.querySelector("#b_email").classList.remove("is-invalid");
		   
	   //1. 입력한 이메일을 읽어와서
	   const inputEmail=this.value;
	   //2. 이메일을 검증할 정규 표현식 객체를 만들어서
	   const reg_email=/^.{1,20}$/;
	   //3. 정규표현식 매칭 여부에 따라 분기하기
	   if(reg_email.test(inputEmail)){//만일 매칭된다면
	      //document.querySelector(".invalid-feedback3").style.display="none";
	      isEmailValid=true;
		     document.querySelector("#b_email").classList.add("is-valid");
	   }else{
	      //document.querySelector(".invalid-feedback3").style.display="block";
	      isEmailValid=false;
	      document.querySelector("#b_email").classList.add("is-invalid");
	   }
	});
	
	document.querySelector("#b_email2").addEventListener("change",function(){
		  document.querySelector("#b_email2").classList.remove("is-valid");
		  document.querySelector("#b_email2").classList.remove("is-invalid");
		  
		  const changeEmail = this.value;
		  if(changeEmail=="No"){
			  isEmailValid2=false;
			  document.querySelector("#b_email2").classList.add("is-invalid");
		  }else{
			  isEmailValid2=true;
			  document.querySelector("#b_email2").classList.add("is-valid");
		  }
	});
</script>
</body>
</html>










