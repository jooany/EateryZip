<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
*{
    font-family: 'Gothic A1', sans-serif;
}
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
#container{
	margin-top:50px!important;
	width:700px;
	margin:0 auto;
	height:800px;
}
#title{
	margin-bottom: 30px;
	font-size:22px;
	font-weight: bold;
}
#contentName{
	width:700px;
	border-bottom: 1px solid rgb(224, 224, 224);
}
#storeName{
	color: #fd5300;
    font-weight: bold;
    font-size: 20px;
}
#storeAddr{
	font-size: 14px;
    color: #708090;
}
/* 주문 내역 */
table {
   width: 100%;
   	border: 1px solid rgb(224, 224, 224);
   	border-collapse: collapse;
   	border-radius: 4px;
 	border-style: hidden;
 	box-shadow: 0 0 0 1px rgb(224, 224, 224);  
 }
 th{
  	border-bottom: 1px solid rgb(224, 224, 224);
   	padding: 10px;
 }
 td{
 	padding: 10px;
 	text-align: center;
 	font-size:14px;
 }
 /* 버튼 */
 #subBtn{
	width: 300px;
    height: 40px;
    text-align: center;
    display: table-cell;
    vertical-align: middle;
    background-color: #fd5300;
    color:white;
    position: relative;
    left: 200px;
    top:20px;
    border: 1px solid rgb(224, 224, 224);
    border-radius: 4px;
}
#total{
	position: relative;
   	left: 438px;
   	font-size:13px; 
   	font-weight:bold;
}
#contentName{
	border-bottom: 1px solid rgb(224, 224, 224);
}	
#contentDate{
	margin-top: 15px;
	border-bottom: 1px solid rgb(224, 224, 224);
}
#contentInfo{
	margin-top: 15px;
	margin-bottom: 15px;
	border-bottom: 1px solid rgb(224, 224, 224);
}
#contentTable{
	border: 0.5px solid rgb(224, 224, 224);
   	border-radius: 4px;
}
</style>
<body>
<div id="container">
	<h2 id="title"> <i class="fas fa-angle-right"></i>포장 예약 정보 확인 페이지</h2>
	<div id="contentName">
		<span id="storeName">${dto2.b_name}</span>
		<br />
		<span id="storeAddr">${dto2.b_Store_Address }</span>
	</div>
	<div id="contentDate">
		<p style="padding-top: 10px;">날짜 <i class="far fa-calendar-alt" style="font-size:18px; margin-left:15px; "></i><span style="font-weight:bold; margin-left:15px; "><span>${dto.takeout_date}</span></p>
		<p style="padding-top: 10px;">시간 <i class="far fa-clock" style="font-size:18px; margin-left:15px;"></i><span style="font-weight:bold; margin-left:15px; ">${dto.takeout_time}</span></p>
	</div>
	<div id="contentInfo">
		<p style="padding-top: 10px;">예약자 <span style="margin-left: 31px; font-weight: bold;">${dto.takeout_name}</span></p>
		<p style="padding-top: 10px; padding-bottom:10px;">전화번호 <span style="margin-left: 16px; font-weight: bold;">${dto.takeout_phone}</span></p>
	</div>
	<p style="padding-top: 10px; font-weight:bold;">주문 메뉴</p>
	<div id="contentTable">
		<table>
			<thead>
				<th>메뉴</th>
				<th>수량</th>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.menu_name}</td>
						<td>${tmp.menu_count }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<p id="total">총 결제 금액 <span style="margin-left:10px;">${dto.takeout_price }원</span></p>
		</div>
	</div>
	<div id="contentMemo">
		<p style="padding-top: 10px; font-weight:bold;"">요청사항</p>
		<p style="width:99%; height:auto; padding-top: 10px;">${dto.takeout_memo }</p>
	</div>
	<br />
	<p style="font-size:12px;">※ 예약 취소는 1일 전까지 가능 합니다</p>
	<a href="${pageContext.request.contextPath }/eatery/detail.do?b_id=${dto.b_id}">
		<div id="subBtn">
			확인
		</div>
	</a>
</div>
</html>