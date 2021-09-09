<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문예약 insert폼</title>
<style>
	.reservation{
		width: 700px;
		margin: 0 auto;
		height: 700px
	}
	textarea{
		width: 100%;
        height: 100px;
	}
	#container{
		margin-top:50px!important;
		width:700px;
		margin:0 auto;
	}
	.reservation{
		width:1100px;
		margin:0 auto;
	}
	#title{
		margin-bottom: 30px;
		font-size:22px;
		font-weight: bold;
	}
	#info{
		width:700px;
		border-bottom: 1px solid darkgray;
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
		border-bottom: 1px solid darkgray;
	}	
	#info_2{
		margin-top: 15px;
		border-bottom: 1px solid darkgray;
	}
	#memo{
		margin-top: 15px;
		margin-bottom: 15px;
	}
</style>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
</head>
<body>
<div>
	<div class="reservation" id="container">
		<h2 id="title">  <i class="fas fa-angle-right"></i> 예약 페이지</h2>
		<div>
			<p id="info">
				<span id="store_name">${param.b_store_name }</span>
				<br />
				<span id="store_addr">${param.b_store_addr }</span>
			</p>
			<form action="${pageContext.request.contextPath }/eatery/reservation_insert.do" method="post" id="reservation_insert" onsubmit="return confirm('예약 하시겠습니까? (취소는 1일 전까지 취소 가능)');">
				<input type="hidden" name="b_id" id="b_id" value="${param.b_id }"/>
				<input type="hidden" name="reservation_date" id="reservation_date"  value="${param.datepicker }"/>
				<input type="hidden" name="reservation_time" id="reservation_time"  value="${param.reservation_time }"/>
				<input type="hidden" name="reservation_people" id="reservation_people" value="${param.person }"/>
				<input type="hidden" name="reservation_name" id="reservation_name" value="${param.name }"/>
				<input type="hidden" name="reservation_phone" id="reservation_phone" value="${param.phone }"/>
				<input type="hidden" name="b_store_name" id="b_store_name" value="${param.b_store_name }"/>
				<input type="hidden" name="b_store_addr" id="b_store_addr" value="${param.b_store_addr }"/>
				<div id="info_1">
					<p>날짜 <i class="far fa-calendar-alt" style="font-size:18px;"></i><span>${param.datepicker }</span></p>
					<p>시간 <span><i class="far fa-clock" style="font-size:18px;"></i>${param.reservation_time }</span></p>
					<p>인원 <span><i class="far fa-user" style="font-size:18px;"></i> <strong>${param.person }명</strong></span></p>	
				</div>
				<div id="info_2">
					<p>예약자    <span>${param.name }</span></p> 
					<p>전화번호 <span>${param.phone }</span></p>
				</div>
				<div>
					<label for="memo" id="memo">요청사항</label>
					<br />
					<textarea name="reservation_memo" id="reservation_memo" placeholder="요청사항 입력 하세요..."></textarea>
				</div>
				<p>※ 예약 취소는 1일 전까지 가능 합니다</p>
				<div>
					<button type="submit">예약하기</button>
					<button type="reset" onclick="location.href='javascript:history.back();'">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	//예약 한번 더 확인 하는 alert 띄우는 함수
	function showConfirm() {
		var rtn;
		rtn=confirm("예약 하시겠습니까? 취소는 1일 전까지 취소 가능");
		
			if (rtn){
				document.getElementById('reservation_insert').submit();
			}else{
				return false;
			}
	};
</script>
</body>
</html>