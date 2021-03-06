<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="https://kit.fontawesome.com/eda0c6c5f7.js" crossorigin="anonymous"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
   /* 공통 */
   *{
    font-family: 'Gothic A1', sans-serif;
    margin-top:0;
    }
	body{
		background-color:rgba(0,0,0,.04)!important;
	}
	
	.inner{
		width:1000px;
		height: 700px;
		margin:0 auto;
		display:flex;
		justify-content: space-between;
		margin-top: 40px;
	}
/*-------------------------------------------------------------------------*/
/*------------------------------right_content start------------------------------*/

	#right_content{
		width: 700px;
		background-color: white;
		height: fit-content;
		padding: 10px 40px 26px 80px;
	}
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#g_profileImage{
		width: 50px;
		height: 50px;
		border-radius: 50%;
	}
	#image{
		display: none;
	}

	label {
		text-align: left;
		width: 100px;
	}

	.innerdiv #id{
		width: 200px;
	}
	.innerdiv #name{
		width: 200px;
	}
	.innerdiv #address{
		width: 420px;
	}

	.innerdiv #phone{
		width: 200px;
		margin-bottom: 20px;
	}
	
	.innerdiv{
		display:flex;
		margin-top: 20px;
	}
	
	.innerIndiv #email{
		width: 200px;
		margin-right:20px;
	}
	.innerIndiv #email2{
		width: 200px;
	}
	
/*------------------------------right_content end------------------------------*/	
/*------------------------------btn start------------------------------*/
	#submitBtn{
		width: 200px;
		border: 1px solid rgba(283,83,0);
		color: rgba(283,83,0);
		margin-left: 300px;
	}
	#submitBtn:hover{
		background-color:rgba(283,83,0);
		color: white;
	}

/*------------------------------btn end------------------------------*/
</style>
</head>
<body>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
	<div id="container" class="inner" style="display:flex; justify-content:space-between;">
	<jsp:include page="/navbar/sideBar/g_sideBar.jsp"></jsp:include>
	
	<div id="right_content">
		<h3>개인정보 수정</h3>
		<div class="innerdiv">
			<label for="g_profileLink">프로필</label>
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
		</div>
		<form action="${pageContext.request.contextPath}/users/g_mypage/update.do" method="post" id="updateForm">
			<input type="hidden" name="g_profile" value="${ empty dto.g_profile ? '' : dto.g_profile }"/>
			<div class="innerdiv">
				<label for="g_id">아이디</label>
				<input type="text" id="g_id" value="${g_id }" disabled/>
			</div>
			<div class="innerdiv">
				<label for="g_name">이름</label>
				<input type="text" name="g_name" id="name" value="${dto.g_name }"/>
			</div>
			<div class="innerdiv">
				<label for="g_address">주소</label>
				<input type="text" name="g_address" id="address" value="${dto.g_address }"/>
			</div>
			<div class="innerdiv">
				<label class="col-form-label" for="g_email">이메일</label>
				<div class="innerIndiv">
					<input class="form-control" type="text" name="g_email" id="email" value="${dto.g_email }" placeholder="이메일을 입력해주세요."/>
				</div>
				<div class="innerIndiv">
					<select class="form-select" name="g_email2" id="email2"> 
						<option value="No" selected>도메인을 선택해주세요.</option>
						<option value="@gmail.com" ${dto.g_email2 eq '@gmail.com' ? 'selected' : ''}>@gmail.com</option>
						<option value="@naver.com" ${dto.g_email2 eq '@naver.com' ? 'selected' : ''}>@naver.com</option>
						<option value="@daum.net" ${dto.g_email2 eq '@daum.net' ? 'selected' : ''}>@daum.net</option>
						<option value="@nate.com" ${dto.g_email2 eq '@nate.com' ? 'selected' : ''}>@nate.com</option>
						<option value="@kakao.com" ${dto.g_email2 eq '@kakao.com' ? 'selected' : ''}>@kakao.com</option>
					</select>
				</div>
			</div>
			<div class="innerdiv">
				<label for="g_phone">연락처</label>
				<input type="text" name="g_phone" id="phone" value="${dto.g_phone }"/>
			</div>
			<button id="submitBtn" type="submit" class="btn float-right">수정반영</button>
		</form>
		
		<form action="${pageContext.request.contextPath}/users/g_mypage/ajax_g_profile_upload.do" method="post" id="imageForm" enctype="multipart/form-data">
			<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
		</form>
	</div>
</div>
<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
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
	
	document.querySelector("#updateForm").addEventListener("submit", function(e){
		// 내용 검증하고 
		const name=document.querySelector("#name").value;
		//만일 폼 제출을 막고 싶으면  e.preventDefault();
		if(name.length < 1){
			alert("이름을 입력하세요!");
			e.preventDefault();
		}
	});
	
	document.querySelector("#updateForm").addEventListener("submit", function(e){
		// 내용 검증하고 
		const address=document.querySelector("#address").value;
		//만일 폼 제출을 막고 싶으면  e.preventDefault();
		if(address.length < 1){
			alert("주소를 입력하세요!");
			e.preventDefault();
		}
	});

	document.querySelector("#updateForm").addEventListener("submit", function(e){
		// 내용 검증하고 
		const email=document.querySelector("#email").value;
		//만일 폼 제출을 막고 싶으면  e.preventDefault();
		if(email.length < 1){
			alert("이메일을 입력하세요!");
			e.preventDefault();
		}
	});
	
	document.querySelector("#updateForm").addEventListener("submit", function(e){
		// 내용 검증하고 
		const email2=document.querySelector("#email2").value;
		//만일 폼 제출을 막고 싶으면  e.preventDefault();
		if(email2 == "No"){
			alert("도메인을 선택하세요!");
			e.preventDefault();
		}
	});
	
	document.querySelector("#updateForm").addEventListener("submit", function(e){
		// 내용 검증하고 
		const phone=document.querySelector("#phone").value;
		//만일 폼 제출을 막고 싶으면  e.preventDefault();
		if(phone.length < 1){
			alert("전화번호를 입력하세요!");
			e.preventDefault();
		}
	});
</script>
</body>
</html>










