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
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
/* 공통 */
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
	width:1100px;
	margin:0 auto;
}
.wrap_image{
	width: 120px;
	height: 100px;
    object-fit: cover;
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


#menu-info{
	text-align: left;
}
.wrap_section{
	clear: left;
} 
#menu_select{
	float: left;
}
/* 주문 내역 */
 table {
    width: 100%;
    height: auto;
   	border-bottom: 1px solid rgb(224, 224, 224);  
    border-collapse: collapse;
    /* border-radius: 4px; */
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
		width: 100px;
	    height: 30px;
	    background-color: #fd5300;
	    position: relative;
	   	left: 75px;
	    color: white;
    	border: 1px solid rgb(224, 224, 224);
    	border-radius: 4px;
    	top:10px;
	}
	#resBtn{
		width: 100px;
	    height: 30px;
	    background-color: white;
	    color:rgba(0,0,0,.7);
	    border: 1px solid rgba(0,0,0,.5);
	    border-radius: 4px;
	    position: relative;
	   	left: 25px; 
	    top:10px;
	}
	/* #subBtn:hover{
		background-color: white;
		color: #fd5300;
	} 
	#resBtn:hover{
		background-color: rgba(0,0,0,.5);
		color: white;
	} */
	.minus_btn{
		border:1px solid rgb(224, 224, 224);
		border-radius:10px;
		color:black;
		background-color:white;	
	}
	.plus_btn{
		border:1px solid rgb(224, 224, 224);
		border-radius:10px;
		color:black;
		background-color:white;
	}
	/* .minus_btn:hover{
		color:#fd5300;
		background-color:white;
	}
	.plus_btn:hover{
		color:#fd5300;
		background-color:white;
	} */
	.menu_btn{
		border:1px solid #fd5300;
		border-radius:4px;
		color:white;
		background-color:#fd5300;
	}
	.menu_btn:hover{
		color:#fd5300;
		background-color:white;
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
	<div style="width:600px;">
		<c:forEach var="tmp2" items="${sectionNumList }" varStatus="statusOuter">
			<div class="wrap_section" id="wrapSection${tmp2 }" data-section="${tmp2 }">
				<c:set var="selectOnlyOne" value="0" />
				<c:forEach var="tmp" items="${list }" varStatus="status">
					<c:if test="${tmp2 eq tmp.section_num and selectOnlyOne eq 0 }">
						<c:set var="selectOnlyOne" value="1" />
						<h2>${tmp.section_name }</h2>
					</c:if>
					<c:if test="${tmp2 eq tmp.section_num }">
						<div id="menu_select" style="margin-right:30px;">
							<img class="wrap_image" src="${pageContext.request.contextPath }${tmp.menu_image }"/>
							<p id="menu-info">
								<span id="menu_name${statusOuter.index}${status.index }" style="font-size:14px; font-weight:bold;">${tmp.menu_name }</span>
								<br />
								<span id="menu_price${statusOuter.index}${status.index}" style="font-size:14px; font-weight:bold; color:#fd5300;">${tmp.menu_price}원</span>
								<br />
               					<button class="minus_btn" type="button" onclick="minus('${statusOuter.index}${status.index }')">-</button>
               					<span class="count" data-num="${tmp.menu_seq_num }" id="amount${statusOuter.index}${status.index }">1</span>
               					<button class="plus_btn" type="button" onclick="plus('${statusOuter.index}${status.index }')">+</button>  
								<button type="button" class="menu_btn" onclick="addToCart('${statusOuter.index}${status.index}')">추가</button>	
							</p>	
						</div>	
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
	<div id="menu_kind" style="position: fixed; right: 300px; top:280px; width:auto; height:auto; border:1px solid rgb(224, 224, 224); border-radius:4px;">
		<form id="add_menu" name="add_menu" method="post" action="${pageContext.request.contextPath }/eatery/takeout_info_insertform.do" onsubmit="return confirm('주문 하시겠습니까?');">
			<input type="hidden" name="b_store_name" id="b_store_name" value="${param.b_store_name }"/>
			<input type="hidden" name="b_store_addr" id="b_store_addr" value="${param.b_store_addr }"/>
			<input type="hidden" name="b_id" id="b_id" value="${param.b_id }"/>
			<input type="hidden" name="b_open" id="b_open" value="${param.b_open }"/>
			<input type="hidden" name="b_close" id="b_close" value="${param.b_close }"/>
			<div >
				<table>
					<thead>
						<th>메뉴</th>
						<th>수량</th>
						<th>가격</th>
						<th>취소</th>
					</thead>
					<tbody id="m_choice">
						
						
					</tbody>
				</table>	
			</div>
			<div style="width:300px; height:50px;">
				<button id="resBtn" type="reset" onclick="location.href='javascript:history.back();'">취소</button>
				<button id="subBtn" type="submit">결제하기</button>
			</div>
		</form>
		
	</div>
</div>	


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>  

	let preTakeOutNum=${takeOutMaxNum};
	preTakeOutNum ++;
	
	$("<input/>")
	.attr("type","hidden")
	.attr("name","takeout_menu_num")
	.val(preTakeOutNum)
	.appendTo("#add_menu");
	
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
		var num=$("#amount"+index).attr("data-num");//메뉴의 seq_num
		var a=$("#basket"+num).attr("data-num");
		var amount=$("#amount"+index).text();//수량
		var name=$("#menu_name"+index).text();//메뉴 이름
		var price=$("#menu_price"+index).text();//메뉴 가격
		var priceSplit=price.split('원');
		console.log(num+"하이"+a+amount);
		$("#amount"+index).text(1);//수량을 기본 값 1 로 돌려주는 
		if(num == a){
					
		}else{
			for (var i in priceSplit){
				alert(num+" 번 상품 "+amount+" 개가 담겼습니다."+amount*priceSplit[0]+" 가격입니다.");
				//DB에 저장 하려는 정보
				$("<input/>")
				.attr("type","hidden")
				.attr("name","menu_choice")
				.attr("id", "menu_choice"+num)
				.val(num+"/"+amount+"/"+preTakeOutNum+"/"+name)
				.appendTo("#add_menu");
				
				//장바구니 정보
				$("<input/>")
				.attr("type","hidden")
				.attr("name","menu_info")
				.attr("id", "menu_info"+num)
				.val(name+"/"+amount+"/"+amount*priceSplit[0])
				.appendTo("#add_menu");
				
				//가격 
				$("<input/>")
				.attr("type","hidden")
				.attr("name","menu_price")
				.attr("id", "menu_price"+num)
				.val(amount*priceSplit[0])
				.appendTo("#add_menu");
				
				$("<tr/>").appendTo("#m_choice"); 
				
				$("<td/>")
				.attr("name", "basket")
				.attr("class", "basket")
				.attr("id", "basket1"+num)
				.attr("data-num", num)
				.val(name)
				.text(name)
				.appendTo("#m_choice");
				$("<td/>")
				.attr("name", "basket")
				.attr("id", "basket2"+num)
				.attr("data-num", num)
				.text(amount)
				.appendTo("#m_choice");
				$("<td/>")
				.attr("name", "basket")
				.attr("id", "basket3"+num)
				.attr("data-num", num) 
				.text(amount*priceSplit[0])
				.appendTo("#m_choice");
				$("<td/>")
				.attr("name", "basket")
				.attr("id", "basket4"+num)
				.attr("data-num", num) 
				.text("X")
				.appendTo("#m_choice");
				return ;
			}	
		};
	};
	
	//예약 한번 더 확인 하는 alert 띄우는 함수
	function showConfirm() {
		var rtn;
		rtn=confirm("주문 하시겠습니까?");
		
			if (rtn){
				document.getElementById('add_menu').submit();
			}else{
				return false;
			}
	};
	//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	document.querySelector("#add_menu")
		.addEventListener("submit", function(e){
			//textarea 이외에 입력한 내용을 여기서 검증하고 
			const menu=document.querySelector("#m_choice").getElementsByTagName('tr');
			//만일 폼 제출을 막고 싶으면  
			//e.preventDefault();
			//을 수행하게 해서 폼 제출을 막아준다.
			if(menu.length < 1){
				alert("메뉴를 선택해 주세요");
				e.preventDefault();
			}
			
		}); 

</script>
</body>
</html>








