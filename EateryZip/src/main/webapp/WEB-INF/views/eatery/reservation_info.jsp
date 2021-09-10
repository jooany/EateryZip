<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
</head>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
	/* 공통 */
	*{
	    font-family: 'Gothic A1', sans-serif;
	}
	a{
		color: white;
		text-decoration:none!important;
	}
	img,svg{
		vertical-align:baseline!important;
	}
	button{
		border:none;
		background-color:rgba(0,0,0,0);
	}
	#container{
		margin-top:50px!important;
		width:700px;
		margin:0 auto;
		height: 600px
	}
	#title{
		margin-bottom: 30px;
		font-size:22px;
		font-weight: bold;
	}
	#info{
		width:700px;
		border-bottom: 1px solid rgb(224, 224, 224);
	}
	#store_name{
		color: #fd5300;
	    font-weight: bold;
	    font-size: 20px;
	}
	#store_addr{
		font-size: 14px;
	    color: #708090;
	}
	#info_1{
		border-bottom: 1px solid rgb(224, 224, 224);
	}	
	#info_2{
		margin-top: 15px;
		border-bottom: 1px solid rgb(224, 224, 224);
	}
	#info_3{
		margin-top: 15px;
	}
	#subBtn{
		width: 300px;
	    height: 40px;
	    text-align: center;
	    display: table-cell;
	    vertical-align: middle;
	    background-color: #fd5300;
	    position: relative;
	    left: 200px;
	    top:20px;
	    border: 1px solid rgb(224, 224, 224);
	    border-radius: 4px;
	}
</style>
<body>
<div id="container">
	<h2 id="title"> <i class="fas fa-angle-right"></i> 예약 정보 확인 페이지</h2>
	<div>
		<p id="info">
			<span id="store_name">${dto.b_store_name}</span>
			<br />
			<span id="store_addr">${dto.b_store_addr}</span>
		</p>
		<div id="info_1">
			<p style="padding-top: 10px;">날짜 <i class="far fa-calendar-alt" style="font-size:18px; margin-left:15px; "></i><span style="font-weight:bold; margin-left:15px; "><span>${dto.reservation_date}</span></p>
			<p style="padding-top: 10px;">시간 <i class="far fa-clock" style="font-size:18px; margin-left:15px;"></i><span style="font-weight:bold; margin-left:15px; ">${dto.reservation_time}</span></p>
			<p style="padding-top: 10px;">인원 <i class="far fa-user" style="font-size:18px; margin-left:15px;"></i><span style="font-weight:bold; margin-left:15px; ">${dto.reservation_people}</span></p>
		</div>
		<div id="info_2">
			<p style="padding-top: 10px;">예약자 <span style="margin-left: 31px; font-weight: bold;">${dto.reservation_name}</span></p>
			<p style="padding-top: 10px;">전화번호 <span style="margin-left: 16px; font-weight: bold;">${dto.reservation_phone}</span></p>
		</div>
		<div id="info_3">
			<p style="padding-top: 10px;">요청사항</p>
			<p style="width:99%; height:auto; padding-top: 10px;">${dto.reservation_memo }</p>
		</div>
		<br />
		<p style="font-size:12px;">※ 예약 취소는 1일 전까지 가능 합니다</p>
		<a href="${pageContext.request.contextPath }/eatery/detail.do?b_id=${dto.b_id}">
			<div id="subBtn">
				확인
			</div>
		</a>
	</div>
</div>
</body>
</html>