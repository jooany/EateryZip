<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장 예약 폼</title>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
#container{
	margin-top:50px!important;
	width:700px;
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
.time label{
	cursor:pointer;
}
.time .hide{
	display:none;
}
textarea{
	width: 100%;
    height: 100px;
}
</style>
</head>
<body>
<div id="container">
	<h2 id="title"> <i class="fas fa-angle-right"></i> 결제 페이지</h2>
	<div id="info">
		<span id="store_name">${param.b_store_name }</span>
		<br />
		<span id="store_addr">${param.b_store_addr }</span>
	</div>
	<form id="takeout_insert" name="takeout_insert" action="${pageContext.request.contextPath }/eatery/takeout_info_insert.do" method="post" onsubmit="return confirm('결제 하시겠습니까?');">
		<input type="hidden" name="b_id" value="${param.b_id }"/>
		<input type="hidden" name="takeout_time" id="takeout_time"/>	
		<input type="hidden" name="takeout_menu_num"  id="takeout_menu_num" value="${param.takeout_menu_num }"/>
		<c:forTokens  var="cs" items="${choice }" delims="[ ,]">
	    		<input type="hidden" name="menu_choice" value="<c:out value="${cs}"/>"></input>
		</c:forTokens>
		<div>
        	<label for="datepicker">날짜</label>
            <i class="far fa-calendar-alt"></i> <input class="calendar" type="text" name="takeout_date" id="datepicker" placeholder="날짜 입력"/>   
            <!-- <p><small>※포장은 당일 예약만 가능</small></p> -->
        </div>
        <div class="time">
        	시간 <label for="time"><i class="far fa-clock"></i>  <span id="time_choice">시간을 입력해 주세요.. <i class="fas fa-angle-down"></i></span></label>   
            <div class="hide">
            	<span >AM</span>
                <br />
                <script>
	                let a="10:00";
	                let b=a.split(":");
	                let hour=parseInt(b[0]);
	                console.log(hour);
	                let min=parseInt(b[1]);
	                console.log(b[1]);
	                if(min==30){
	                   min=1;
	                }else{
	                   min=0;
	                }
	                console.log(min);
	                hour = hour *2;
	                let f = hour+min;
	                console.log(f);
	                      
	               for(let i=f; i<26; i++){
	                  let hour="";
	                  let min=":00";
	                  if((Math.ceil(i/2))<13){
	                     hour = (Math.floor(i/2));
	                  }else{
	                     hour = (Math.floor(i/2));
	                  }
	                  hour = (Math.floor(i/2));
	                  if(hour<10){
	                     hour = "0"+hour;
	                  }
	                  if(i%2 != 0){
	                     min=":30";
	                  }
	                  document.write('<button id="row_" type="button" class="timeSelect" value = "AM ' + hour + min +'">'
	                     + hour
	                     + min
	                     + '</button>');
	               }
          		</script>
              	<br />
              	<span>PM</span>
              	<br />
                <script>
					for(let i=2; i<17; i++){ 
					   let hour="";
					   let min=":00";
					   if((Math.ceil(i/2))<13){
					      hour = (Math.floor(i/2));
					   }else{
					      hour = (Math.floor(i/2));
					   }
					   hour = (Math.floor(i/2));
					   if(hour<10){
					      hour = "0"+hour;
					   }
					   if(i%2 != 0){
					      min=":30";
					   }
					   document.write('<button id="row_" type="button" class="timeSelect" value = "PM ' + hour + min +'">'
					      + hour
					      + min
					      + '</button>');
					}
                </script>
            </div>	
        </div>
        <span><strong>예약자 정보</strong></span>
        <div>
            <label for="name">이름</label>
            <input type="text" name="takeout_name" id="takeout_name" placeholder="이름 입력">
        </div>  
        <div>
            <label for="phone">전화번호</label>
            <input type="text" name="takeout_phone" id="takeout_phone" placeholder="번호 입력">
        </div>    
        <div>
			<label for="memo" id="memo">요청사항</label>
			<br />
			<textarea name="takeout_memo" id="takeout_memo" placeholder="요청사항 입력 하세요..."></textarea>
		</div>
		<div>
			<table>
				<thead>
					<th>메뉴</th>
					<th>수량</th>
					<th>가격</th>
				</thead>
				<tbody>
					<c:forTokens var="as" items="${info }" delims="[ ,]">
						<tr>
		    				<c:forTokens var="bs" items="${as }" delims="/">
		    					<td><c:out value="${bs}"/></td>
		    				</c:forTokens>
	    				</tr>
					</c:forTokens>
				</tbody>
			</table>
		</div>
		<div>
			<c:set var = "total" value = "0" />
			<c:forTokens var="result" items="${price}" delims="[ ,]">     
				<c:set var= "total" value="${total + result}"/>
			</c:forTokens>
			<c:out value="${total}원"/>
			<input type="hidden" name="takeout_price" id="takeout_price" value="${total }"/>
		</div>
		<button type="submit">결제하기</button>		
	</form>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	// 달력
	$(function() {
	   //input을 datepicker로 선언
	   $("#datepicker").datepicker({
	       dateFormat: 'yy-mm-dd(DD)' //달력 날짜 형태
	       ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	       ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	       ,changeYear: true //option값 년 선택 가능
	       ,changeMonth: true //option값  월 선택 가능                
	       ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	       ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	       ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	       ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	       ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	       ,minDate: "-0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	       ,maxDate: "-0D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	     });                        
  
   		//초기값을 오늘 날짜로 설정해줘야 합니다.
   		$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});
	
	
	// html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".time>label").click(function(){
            var submenu = $(this).next("div");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    }); 
    
    
     // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        //시간 버튼 누르면 값 바뀌는 함수
        $('.timeSelect').click(function(){
    		var id_check = $(this).attr("id"); //버튼의 id를 가져온 후
    		var id_value = $(this).val(); // 가져온 아이디의  value 값을 넣어준다.
    		console.log(id_check)
    		console.log(id_value)
    		
    		//var timevalue = $(id_check).val(); 
        	$("#time_choice").text(id_value); //span에 읽어온 id의 value 값을 넣어준다.
        	$("#takeout_time").val(id_value)//span은 폼전송이 어려움으로 input type hidden에 value값 전달
		});
    }); 
    
	// 동적 생성 버튼에 id 값 부여
    $("[id~=row_]").each(function(index) { // row_로 시작하는 id값을 가진 모든 것들을
        var idx = index + 1; // 1을 더해준다.
        $(this).attr('id', 'row_'+idx);
    });
	
   
	//예약 한번 더 확인 하는 alert 띄우는 함수
	function showConfirm() {
		var rtn;
		rtn=confirm("결제 하시겠습니까?");
		
			if (rtn){
				document.getElementById('takeout_insert').submit();
			}else{
				return false;
			}
	};


	
</script>
</body>
</html>






