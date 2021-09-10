<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<script src="https://kit.fontawesome.com/eda0c6c5f7.js" crossorigin="anonymous"></script>


<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />  -->
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
	   /* 공통 */
   *{
    font-family: 'Gothic A1', sans-serif;
    }
	body{
		background-color: #efefef
	}
	
	.inner{
		width:1100px;
		height: 700px;
		margin:0 auto;
	}
/*------------------------------side nav start------------------------------*/
	#container{
		position:relative;
		margin-top: 40px;
	}

	#left_content {
		position: absolute;
		background-color: #fff;
		min-width: 160px;
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
	
	#left_content{
		list-style:none;
		width: 150px;
		border: 1px solid #ccc;
		position: absolute;
	}
/*------------------------------side nav end------------------------------*/
/*------------------------------table start------------------------------*/
	#right_content table{
		width: 400px;
		border: 1px solid #fff;
		background-color: #fff;
		position: absolute;
		text-align: -webkit-center;
		margin-left: 40%;
		line-height: 36px;
		padding-top: 20px;
		display:flex;
		justify-content: space-evenly;
	}
	
	#right_content th{
		text-align: left;
		padding-right:60px;
		height: 65px;
	}
	
	
	#right_content td{
		text-align: left;
		height: 65px;
	}
	
	table{
		width:700px;
	}
	
	table, td, th {
		border-bottom : 1px solid #efefef;
		border-collapse : collapse;
	};

/*------------------------------table end------------------------------*/	
	/* 안내사항
	.introduce {
	    text-align: center;
	    margin-left: 180px;
	    padding-top: 500px;
	    color:rgba(253,83,0);
	}
	*/
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
		<table>
			<tr>
				<th>사업자번호</th>
				<td>${b_id }</td>
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
				<td>${dto.b_email } ${dto.b_email2 }</td>
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
	<!-- 안내사항 <div class="introduce">회원탈퇴는 담당자에게 문의 부탁드립니다. 02-333-3333</div> -->
</div>
</body>
<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
</html>