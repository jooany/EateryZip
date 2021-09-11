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
		padding: 10px 40px 26px;
	}

	label {
		text-align: left;
		width: 100px;
	}

	.innerdiv #b_id{
		width: 200px;
	}
	.innerdiv #b_name{
		width: 200px;
	}
	.innerdiv #b_address{
		width: 420px;
	}

	.innerdiv #b_phone{
		width: 200px;
		margin-bottom: 20px;
	}
	
	.innerdiv{
		display:flex;
		margin-top: 20px;
	}
	
	.innerIndiv #b_email{
		width: 200px;
		margin-right:20px;
	}
	.innerIndiv #b_email2{
		width: 200px;
	}

/*------------------------------right_content end------------------------------*/
/*------------------------------btn start------------------------------*/
	#submitBtn{
		width: 200px;
		border: 1px solid rgba(283,83,0);
		color: rgba(283,83,0);
		margin-left: 325px;
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
	<jsp:include page="/navbar/sideBar/b_sideBar.jsp"></jsp:include>

	<div id="right_content">
		<h3>가입 정보 수정</h3>
		<form action="${pageContext.request.contextPath}/users/b_mypage/update.do" method="post" id="updateForm">
			<div class="innerdiv">
				<label class="b_id" for="b_id">사업자번호</label>
				<input type="text" id="b_id" value="${b_id }" disabled/>
			</div>
			<div class="innerdiv">
				<label for="b_name">이름</label>
				<input type="text" name="b_name" id="name" value="${dto.b_name }"/>
				
			</div>
			<div class="innerdiv">
				<label for="b_address">주소</label>
				<input type="text" name="b_address" id="address" value="${dto.b_address }"/>
			</div>
			<div class="innerdiv">
				<label class="col-form-label" for="b_email">이메일</label>
				<div class="innerIndiv">
					<input class="form-control" type="text" name="b_email" id="email" placeholder="이메일을 입력해주세요."/>
				</div>
				<div class="innerIndiv">
					<select class="form-select" name="b_email2" id="email2"> 
						<option value="No" selected>도메인을 선택해주세요.</option>
						<option value="@gmail.com">@gmail.com</option>
						<option value="@naver.com">@naver.com</option>
						<option value="@daum.net">@daum.net</option>
						<option value="@nate.com">@nate.com</option>
						<option value="@kakao.com">@kakao.com</option>
					</select>
				</div>
			</div>
			<div class="innerdiv">
				<label for="b_phone">연락처</label>
				<input type="text" name="b_phone" id="phone" value="${dto.b_phone }"/>
			</div>
			<button id="submitBtn" type="submit" class="btn float-right">수정반영</button>
		</form>
	</div>
</div>
<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
<script>

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










