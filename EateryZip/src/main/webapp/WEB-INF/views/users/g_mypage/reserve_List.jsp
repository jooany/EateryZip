<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/g_mypage/reserve_List.jsp</title>
<style>
	body {
	  font-family: "Lato", sans-serif;
	}
	
	.sidenav {
	  height: 100%;
	  width: 0;
	  position: fixed;
	  z-index: 1;
	  top: 0;
	  left: 0;
	  background-color: #111;
	  overflow-x: hidden;
	  transition: 0.5s;
	  padding-top: 60px;
	}
	
	.sidenav a {
	  padding: 8px 8px 8px 32px;
	  text-decoration: none;
	  font-size: 25px;
	  color: #818181;
	  display: block;
	  transition: 0.3s;
	}
	
	.sidenav a:hover {
	  color: #f1f1f1;
	}
	
	.sidenav .closebtn {
	  position: absolute;
	  top: 0;
	  right: 25px;
	  font-size: 36px;
	  margin-left: 50px;
	}
	
	@media screen and (max-height: 450px) {
	  .sidenav {padding-top: 15px;}
	  .sidenav a {font-size: 18px;}
	}
</style>
</head>
<body>
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="#">마이페이지</a>
		<a href="#">스크랩</a>
		<a href="#">예약내역</a>
		<a href="#">포장내역</a>
		<a href="#">회원탈퇴</a>
	</div>
	
	<h2>${g_id }님의 마이페이지</h2>
	<p>Click on the element below to open the side navigation menu.</p>
	<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; 메뉴</span>
	
<button type="button" id="btn">예약리뷰 11111 11111 버튼</button>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	// 혜림님 버튼 아이디에 ex) 
	// <button type="button" class="takeout_btn" data-takeoutnum="${tmp.takeout_num}" data-id="${tmp.b_id}"> 이런 식으로 만드시고 클릭할 때마다  
	// $(.takeout_btn).click(function(){
	//	let takeNum=this.attr("data-takeoutnum"); <- 이런식으로 번호 자바스크립트에서 얻어오실 수 있습니다. 이걸 아래의 url에 연결해서 사용하시면 됩니다.
	//	let bId=this.attr("data-id");
	//window.open("${pageContext.request.contextPath}/users/g_mypage/review_takeout_form.do?takeout_num="+takeNum+"&b_id="+bId, "리뷰 작성", "width=520px,height=751px");
	//})
	$("#btn").click(function(){
		window.open("${pageContext.request.contextPath}/users/g_mypage/review_reservation_form.do?reservation_num=161&b_id=1111111111", "리뷰 작성", "width=520px,height=751px");
		
	});

	function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}
	
	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
</script>

</body>
</html>