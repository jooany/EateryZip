<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장 리뷰 작성</title>
<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
	/* 공통 */
	a{
		color:black!important;
		text-decoration:none!important;
	}
	img,svg{
		vertical-align:baseline!important;
	}
	
	button{
		border:none;
		background-color:rgba(0,0,0,0);
	}
	.navbar{
		margin:0 auto;
		
	}
	.inner{
		width:1100px;
		margin:0 auto;
	}
	#container{
		margin-top:50px!important;
		width:576px;
		margin:0 auto;
		background-color:gray;
	}

	/* 리뷰폼 */
	#reviewForm{
		width:576px;
		height:860px;
	}
</style>
</head>
<body>
	<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
	
	<div id="container" class="inner">
		<div id="reviewForm">
			<div id="reviewHeader">
				<p>리뷰 쓰기</p>
				<button type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
	                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
	                </svg>
				</button>
			</div>
		</div>
	</div>
	
	
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		console.log(${map});
	</script>
</body>
</html>