<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/eatery/takeout_insertform.jsp</title>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
.wrap_image{
	width: 120px;
	height: 100px;
    object-fit: cover;
}

#container{
	margin-top:50px!important;
	width:1100px;
	margin:0 auto;
}
#title{
	margin-bottom: 30px;
	font-size:22px;
	font-weight: bold;
}
#info{
	width:600px;
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
#menu-info{
	text-align: left;
}
.wrap_section{
	clear: left;
} 
#menu_choice{
	float: left;
}
</style>
</head>
<body>

<div id="container">
	<h2 id="title"> <i class="fas fa-angle-right"></i> 메뉴 선택 페이지</h2>
	<div id="info">
		<span id="store_name">${param.b_store_name }</span>
		<br />
		<span id="store_addr">${param.b_store_addr }</span>
	</div>
	<div>
		<c:forEach var="tmp2" items="${sectionNumList }">
			<div class="wrap_section" id="wrapSection${tmp2 }" data-section="${tmp2 }">
				<c:set var="selectOnlyOne" value="0" />
				<c:forEach var="tmp" items="${list }">
					<c:if test="${tmp2 eq tmp.section_num and selectOnlyOne eq 0 }">
						<c:set var="selectOnlyOne" value="1" />
						<h2>${tmp.section_name }</h2>
					</c:if>
					<c:if test="${tmp2 eq tmp.section_num }">
						<div id="menu_choice">
							<img class="wrap_image" src="${pageContext.request.contextPath }${tmp.menu_image }"/>
							<p id="menu-info">
								<span>${tmp.menu_name }</span>
								<br />
								<span>${tmp.menu_price }원</span>
								<br />
								<select id="menu_count_">
									<option value="1">1개</option>
	                         		<option value="2">2개</option>
	                         		<option value="3">3개</option>
	                         		<option value="4">4개</option>
	                         		<option value="5">5개</option>
	                         		<option value="6">6개</option>
	                         		<option value="7">7개</option>
	                         		<option value="8">8개</option>
								</select>
								<button type="button" id="row_" class="menuBtn" value="${tmp.menu_seq_num }">주문</button>	
							</p>	
						</div>	
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
</div>	
<div id="add_menu">
	<form id="add_menu" name="add_menu" action="takeout_info_insertform.do">

	</form>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

	//동적 생성 버튼에 id 값 부여
	$("[id~=row_]").each(function(index) { // row_로 시작하는 id값을 가진 모든 것들을
	    var idx = index + 1; // 1을 더해준다.
	    $(this).attr('id', 'row_'+idx);
	});
	//동적 생성 버튼에 id 값 부여
	$("[id~=menu_count_]").each(function(index) { // row_로 시작하는 id값을 가진 모든 것들을
	    var idx = index + 1; // 1을 더해준다.
	    $(this).attr('id', 'menu_count_'+idx);
	});


	$(document).ready(function(){
		$(".menuBtn").click(function(){
			var id_check = $(this).attr("id");
			var menu_num = $(this).val();
			$("#add_menu").append(`<form>
				<input type="hidden" value="`+menu_num+`/">
				<p>
					<span id="menu_name"></span>
					<span id="menu_count"></span>
				</p>
			</form>`
			);	
		});
	});
</script>
</body>
</html>








