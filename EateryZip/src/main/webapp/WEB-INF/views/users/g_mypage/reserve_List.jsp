<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
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
		height: 750px;
		margin:0 auto;
		display:flex;
		justify-content: space-between;
		margin-top: 40px;
		margin-bottom:40px;
	}
/*-------------------------------------------------------------------------*/

/*------------------------------right_content start------------------------------*/

	#right_content{
		width: 750px;
		height: fit-content;
		background-color: white;
		padding: 10px 40px;
	}
	
	table{
		border-bottom:1px solid rgba(0,0,0,.1);
		margin:0 auto;
		text-align: center;
	}

/*-----------------------table 숫자 생성------------------------------*/
	tbody>tr {
	  counter-increment: a;
	}
	tbody>tr>td:first-child:before {
	  content: counter(a) " ";
	}
/*-----------------------table 숫자 생성------------------------------*/

/*------------------------------ right_content end ------------------------------*/

/*--------------------------------- takeout list detail --------------------------*/

	.reservation_btn{
		background-color: #efefef;
		color: black;
		border: 1px solid #efefef;
		box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.3);
	}
	.reservation_btn:hover{
		background-color: #ccc;
		color: white;
		font-weight: bold;
	}
	.reservation_btn2{
		background-color: #efefef;
		color: black;
		border: 1px solid #efefef;
		box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.3);
	}
	.reservation_btn2:hover{
		background-color: #ccc;
		color: white;
		font-weight: bold;
	}
	

/*--------------------------------- takeout list detail --------------------------*/


/*------------------------------paging start------------------------------*/
	.page-ui a{
		text-decoration: none;
		color: #000;
	}
	
	.page-ui a:hover{
		background-color: rgba(253,83,0);
		color: white;
	}
	
	.page-ui a.active{
		color: white;
		font-weight: bold;
		background-color: rgba(253,83,0);
	}
	.page-ui ul{
		list-style-type: none;
		padding: 0;
	}
	
	.page-ui ul > li{
		float: left;
		padding: 5px;
	}

/*------------------------------paging end------------------------------*/

	
	
</style>
</head>
<body>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>

<div id="container" class="inner" style="display:flex; justify-content:space-between;">
	<jsp:include page="/navbar/sideBar/g_sideBar.jsp"></jsp:include>
	<div id="right_content">
		<h3>예약내역</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">예약일</th>
					<th scope="col">예약자</th>
					<th scope="col">상호명</th>
					<th scope="col">내역</th>
					<th scope="col">리뷰</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td></td>
						<td>${tmp.reservation_date } ${tmp.reservation_time }</td>
						<td>${tmp.reservation_name }</td>
						<td>
							<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${tmp.b_id}">${tmp.b_store_name }</a>
						</td>
						<td>
							<button type="button" class="reservation_btn2" data-reservationnum2="${tmp.reservation_num}" data-id2="${tmp.b_id}">예약</br>내역</button>
						</td>
						<td>
							<c:choose>
								<c:when  test="${tmp.did_it == 0 }">
									<button type="button" class="reservation_btn" data-reservationnum="${tmp.reservation_num}" data-id="${tmp.b_id}">리뷰</br>작성</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="reservation_btn" data-reservationnum="${tmp.reservation_num}" data-id="${tmp.b_id}">리뷰</br>수정</button>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav class="page-ui clearfix">
			<ul class="pagination justify-content-center">
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="takeout_list.do?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageNum eq i }">
								<a  class="page-link active" href="takeout_list.do?pageNum=${i }">${i }</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="takeout_list.do?pageNum=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="takeout_list.do?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
</div>
<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(".reservation_btn").click(function(){
		let reservNum=$(this).attr("data-reservationnum");
		let bId=$(this).attr("data-id");
	window.open("${pageContext.request.contextPath}/users/g_mypage/review_reservation_form.do?reservation_num="+reservNum+"&b_id="+bId, "리뷰 작성", "width=520px,height=751px");
	});
	$(".reservation_btn2").click(function(){
		let reservNum2=$(this).attr("data-reservationnum2");
		let bId2=$(this).attr("data-id2");
	window.open("${pageContext.request.contextPath}/eatery/reservation_info.do?reservation_num="+reservNum2+"&b_id="+bId2, "포장내역보기", "width=800px,height=750px");
	});
</script>
</body>
</html>