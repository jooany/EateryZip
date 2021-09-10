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
		background-color: #efefef
	}
	
	.inner{
		width:1100px;
		height: 690px;
		margin:0 auto;
		display:flex;
		justify-content: space-between;
		margin-top: 40px;
	}
/*-------------------------------------------------------------------------*/


/*------------------------------side nav start------------------------------*/

	#left_content {
		background-color: #fff;
		min-width: 200px;
		list-style:none;
		border: 1px solid rgba(0,0,0,.1);
		height: fit-content;
	}
	
	#left_content a {
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
	}
	
	#left_content a:hover {
		background-color: rgba(253,83,0);
		color : white;
	}

/*------------------------------side nav end------------------------------*/

/*------------------------------right_content start------------------------------*/
	#right_content{
		margin-right: 100px;
		width: 650px;
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
<div id="container" class="inner">
	
	<div id="left_content">
		<p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage.do">마이페이지</a></p>
		<p class="position"><a href="${pageContext.request.contextPath}/store/store_insertform.do">가게정보등록</a></p>
		<p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/menu_insertform.do">메뉴등록</a></p>
		<p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage_updateform.do">개인정보수정</a></p>
		<p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/b_takeout_list.do">포장주문내역</a></p>
		<p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/b_reservation_list.do">예약내역</a></p>
	</div>
	<div id="right_content">
		<h3>가입 정보 수정</h3>
		<form action="${pageContext.request.contextPath}/users/b_mypage/update.do" method="post" id="updateForm">
			<div class="innerdiv">
				<label class="b_id" for="b_id">사업자번호</label>
				<input type="text" id="b_id" value="${b_id }" disabled/>
			</div>
			<div class="innerdiv">
				<label for="b_name">이름</label>
				<input type="text" name="b_name" id="b_name" value="${dto.b_name }"/>
				
			</div>
			<div class="innerdiv">
				<label for="b_address">주소</label>
				<input type="text" name="b_address" id="b_address" value="${dto.b_address }"/>
			</div>
			<div class="innerdiv">
				<label class="col-form-label" for="b_email">이메일</label>
				<div class="innerIndiv">
					<input class="form-control" type="text" name="b_email" id="b_email" placeholder="이메일을 입력해주세요."/>
				</div>
				<div class="innerIndiv">
					<select class="form-select" name="b_email2" id="b_email2"> 
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
				<input type="text" name="b_phone" id="b_phone" value="${dto.b_phone }"/>
			</div>
			<button id="submitBtn" type="button" class="btn float-right">수정반영</button>
		</form>
	</div>
</div>
<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
<script>

	//등록 버튼을 눌렀을때 form 을 강제 submit 시키기
	document.querySelector("#submitBtn").addEventListener("click", function(){
		document.querySelector("#updateForm").submit();
	});

	
</script>
</body>
</html>










