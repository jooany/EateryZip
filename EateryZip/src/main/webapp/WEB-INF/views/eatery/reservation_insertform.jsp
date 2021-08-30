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
	}
	textarea{
		width: 80%;
        height: 100px;
	}
</style>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
</head>
<body>
<div>
	<div class="reservation">
		<h2> > 예약 페이지</h2>
		<div>
			<h3>${param.b_store_name } <p><small>${param.b_store_addr } </small></p></h3>
			<h4><small>${param.b_store_addr }</small></h4>
			<form action="reservation_insert.do" method="post" id="reservation_insert" onsubmit="return confirm('예약 하시겠습니까? (취소는 1일 전까지 취소 가능)');">
				<input type="hidden" name="b_id" id="b_id" value="${param.b_id }"/>
				<input type="hidden" name="reservation_date" id="reservation_date"  value="${param.datepicker }"/>
				<input type="hidden" name="reservation_time" id="reservation_time"  value="${param.reservation_time }"/>
				<input type="hidden" name="reservation_people" id="reservation_people" value="${param.person }"/>
				<input type="hidden" name="reservation_name" id="reservation_name" value="${param.name }"/>
				<input type="hidden" name="reservation_phone" id="reservation_phone" value="${param.phone }"/>
				<input type="hidden" name="b_store_name" id="b_store_name" value="${param.b_store_name }"/>
				<input type="hidden" name="b_store_addr" id="b_store_addr" value="${param.b_store_addr }"/>
				<div>
					<p>날짜 <span>${param.datepicker }</span>${dto.reservation_num }</p>
					<p>시간 <sapn>${param.reservation_time }</sapn></p>
					<p>인원 <span>${param.person }</span></p>	
				</div>
				<div>
					<p>예약자    <span>${param.name }</span></p> 
					<p>전화번호 <span>${param.phone }</span></p>
				</div>
				<div>
					<label for="memo">요청사항</label>
					<br />
					<textarea name="reservation_memo" id="reservation_memo" placeholder="요청사항 입력 하세요..."></textarea>
				</div>
				<button type="submit">예약하기</button>
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