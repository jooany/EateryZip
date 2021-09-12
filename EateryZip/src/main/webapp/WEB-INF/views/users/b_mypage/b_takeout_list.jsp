<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장내역</title>
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
		background-color:rgba(0,0,0,.04)!important;
	}
	a{
		text-decoration: none;
	}
	.inner{
		width:1000px;
		height: 700px;
		margin:0 auto;
		display:flex;
		justify-content: space-between;
		margin-top: 40px;
	}
/*-------------------------------------------------------------------------*/

/*------------------------------right_content start------------------------------*/

	#right_content{
		width: 700px;
		height: fit-content;
		background-color: white;
		padding: 10px 50px;
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

	.takeout_btn{
		background-color: #efefef;
		color: black;
		border: 1px solid #efefef;
		box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.3);
	}
	.takeout_btn:hover{
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
<jsp:include page="/navbar/sideBar/b_sideBar.jsp"></jsp:include>
	<div id="right_content">
		<h3>포장내역</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">픽업일</th>
					<th scope="col">픽업시간</th>
					<th scope="col">성함</th>
					<th scope="col">가격</th>
					<th scope="col">자세히보기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td></td>
						<td>${tmp.takeout_date }</td>
						<td>${tmp.takeout_time }</td>
						<td>${tmp.takeout_name }</td>
						<td>${tmp.takeout_price }</td>
						<td>
							<button type="button" class="takeout_btn" data-takeoutnum="${tmp.takeout_num}" data-id="${tmp.b_id}">포장내역보기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav class="page-ui clearfix">
			<ul class="pagination justify-content-center">
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="b_takeout_list.do?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageNum eq i }">
								<a  class="page-link active" href="b_takeout_list.do?pageNum=${i }">${i }</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="b_takeout_list.do?pageNum=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="b_takeout_list.do?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
</div>	
	
	<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(".takeout_btn").click(function(){
			let takeNum=$(this).attr("data-takeoutnum");
			let bId=$(this).attr("data-id");
		window.open("${pageContext.request.contextPath}/eatery/takeout_info.do?takeout_num="+takeNum+"&b_id="+bId, "포장내역보기", "width=800px,height=750px");
		});
		
	</script>
</body>
</html>