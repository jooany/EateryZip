<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장 리뷰 내역</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/users/g_mypage/review_takeout_form.do?takeout_num=5&b_id=1111111111">qweqwe 1111111111음식점의 포장리뷰작성</a>
	<a href="${pageContext.request.contextPath}/users/g_mypage/review_takeout_form.do?takeout_num=6&b_id=123123">qweqwe 123123음식점의 포장리뷰작성</a>
	
	<a href="${pageContext.request.contextPath}/users/g_mypage/review_takeout_form.do?takeout_num=25&b_id=1111111111">qweqwe1 1111111111음식점의 포장리뷰작성</a>
	
	
	<button type="button" id="btn">11111 11111 버튼</button>
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
		window.open("${pageContext.request.contextPath}/users/g_mypage/review_takeout_form.do?takeout_num=5&b_id=1111111111", "리뷰 작성", "width=520px,height=751px");
		
	});
</script>

</body>
</html>