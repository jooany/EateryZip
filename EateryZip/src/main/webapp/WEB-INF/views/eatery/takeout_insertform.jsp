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
#menu_select{
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
		<c:forEach var="tmp2" items="${sectionNumList }" varStatus="statusOuter">
			<div class="wrap_section" id="wrapSection${tmp2 }" data-section="${tmp2 }">
				<c:set var="selectOnlyOne" value="0" />
				<c:forEach var="tmp" items="${list }" varStatus="status">
					<c:if test="${tmp2 eq tmp.section_num and selectOnlyOne eq 0 }">
						<c:set var="selectOnlyOne" value="1" />
						<h2>${tmp.section_name }</h2>
					</c:if>
					<c:if test="${tmp2 eq tmp.section_num }">
						<div id="menu_select">
							<img class="wrap_image" src="${pageContext.request.contextPath }${tmp.menu_image }"/>
							<p id="menu-info">
								<span id="menu_name${statusOuter.index}${status.index }">${tmp.menu_name }</span>
								<br />
								<span id="menu_price${statusOuter.index}${status.index}">${tmp.menu_price}원</span>
								<br />
               					<button type="button" onclick="minus('${statusOuter.index}${status.index }')">-</button>
               					<span class="count" data-num="${tmp.menu_seq_num }" id="amount${statusOuter.index}${status.index }">1</span>
               					<button type="button" onclick="plus('${statusOuter.index}${status.index }')">+</button>  
								<button type="button" class="menuBtn" onclick="addToCart('${statusOuter.index}${status.index}')">추가</button>	
							</p>	
						</div>	
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
</div>	
<div>
	<form id="add_menu" name="add_menu" action="takeout_info_insertform.do">
		<input type="hidden" name="b_store_name" id="b_store_name" value="${param.b_store_name }"/>
		<input type="hidden" name="b_store_addr" id="b_store_addr" value="${param.b_store_addr }"/>
		<input type="hidden" name="b_id" id="b_id" value="${param.b_id }"/>
	</form>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>  

	let preTakeOutNum=${takeOutMaxNum};

	// 인원 체크
	
	 function plus(index){
	 	var currentCount=parseInt($("#amount"+index).text());
	 	currentCount++;
	 	$("#amount"+index).text(currentCount);
	 	
	 };
	 function minus(index){
		 var currentCount=parseInt($("#amount"+index).text());
		 currentCount--;
		 $("#amount"+index).text(currentCount);
	 };
	
	function addToCart(index){
		var num=$("#amount"+index).attr("data-num");
		var amount=$("#amount"+index).text();
		var name=$("#menu_name"+index).text();
		var price=$("#menu_price"+index).text();
		var priceSplit=price.split('원');
		for (var i in priceSplit){
			
			alert(num+" 번 상품 "+amount+" 개가 담겼습니다."+priceSplit[0]+" 가격입니다.");
			
			$("<input/>")
			.attr("type","hidden")
			.attr("name","menu_choice")
			.val(num+"/"+amount)
			.appendTo("#add_menu");
			
			$("<input/>")
			.attr("type","hidden")
			.attr("name","menu_price")
			.val(amount*priceSplit[0])
			.appendTo("#add_menu");
			
			
			$("<p/>")
			.attr("name", "basket")
			.text(name+amount+amount*priceSplit[0])
			.appendTo("#add_menu");
			return;
		}
		
		

	}

	/* //동적 생성 버튼에 id 값 부여
	$("[id~=row_]").each(function(index) { // row_로 시작하는 id값을 가진 모든 것들을
	    var idx = index + 1; // 1을 더해준다.
	    $(this).attr('id', 'row_'+idx);
	});
	 */
	
	/* $(document).ready(function(){
		$(".menuBtn").click(function(){
			var id_check = $(this).attr("id");
			var menu_num = $(this).val();
			
			$("#add_menu").append(`
				<input type="hidden" value="`+menu_num+`/`+amount+`">`
			);	
		});
	}); */
</script>
</body>
</html>








