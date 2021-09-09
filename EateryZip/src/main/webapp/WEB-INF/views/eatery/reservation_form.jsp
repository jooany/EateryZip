<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/eatery/reservation_form.jsp</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
</head>
<style>
/* 공통 */
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
	width: 250px;
	margin: 0 auto;
	border: 0.5px solid darkgray;
	height: auto!important;
}
/* 방문예약 / 포장예약 tab css */
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	border-bottom: 2px solid;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	margin-left: 15px;
	font-weight: bold;
	font-size: 14px
}

ul.tabs li.current{
	background: #white;
	color: #222;
	margin-left: 15px;
	border-bottom: 2px solid #fd5300;
}

.tab-content{
	display: none;
	background: #white;
	padding: 15px;
    width: 250px;
    
}
.tab-content.current{
	display: inherit;
}
/* 시간 버튼  */
.r_time label{
	cursor:pointer;
	}
.r_time .hide{
	display:none;
	}
/* 내부 css */
.r_date{
	margin-bottom: 5px;
}
#datepicker{
	margin-left:12px;
	font-size: 14px;
}
.r_time{
	margin-bottom: 5px;
}
#choice{
	margin-left: 8px;
	font-size: 14px;
}
.r_person{
	margin-bottom:5px;	
}
#person{
	margin-left:10px;
	font-size:14px;
}
#r_info{
	font-size:14px;
	margin-bottom: 3px;
}
.r_name{
	margin-bottom:5px;
}
.r_name label{
	font-size: 14px;
}
#name{
	width:150px;
	margin-left: 28px;
	font-size: 14px;
}
.r_phone{
	margin-bottom:8px;
}
.r_phone label{
	font-size: 14px;
}
#phone{
	width:150px;
	font-size: 14px;
}
#rBtn{
	width:200px;
	/* display: block;
	margin:auto; */
	background-color: #fd5300;
    border: 1px solid;
    color: white;
    font-size: 14px;
    height: 33px;
    border-radius: 3px;
}
.rBtn{
	text-align:center;
}
#tBtn{
	width:200px;
	display: block;
	margin:auto;
	background-color: #fd5300;
    border: 1px solid;
    color: white;
    font-size: 14px;
    height: 33px;
    border-radius: 3px;
}
.timeSelect{
	background-color: #fd5300;
    color: white;
    font-size: 14px;
    border: 1px;
    border-radius: 3px;
    margin: 1px;
}
#am{
	font-size: 14px;
    margin-left: 3px;
}
#pm{
	font-size: 14px;
    margin-left: 3px;
}
</style>
<body>
<div>
    <div id="container">
        <ul class="tabs">
            <li class="tab-link current" data-tab="tab-1">예약</li>
            <li class="tab-link" data-tab="tab-2">포장</li>
        </ul>
    
        <div id="tab-1" class="tab-content current">
            <form action="${pageContext.request.contextPath}/eatery/reservation_insertform.do" method="post" id="reservation_form" onsubmit="return confirm('예약 하시겠습니까?');">
            	<input type="hidden" id="b_id" name="b_id" value="1111111"/>
            	<input type="hidden" id="reservation_time" name="reservation_time"/>
            	<input type="hidden" id="b_store_name" name="b_store_name" value="팬케이크 스토리"/>
            	<input type="hidden" id="b_store_addr" name="b_store_addr" value="서울특별시 강남구 언주로 33"/>
                <div class="r_date">
                    <label for="datepicker"><i class="far fa-calendar-alt" style="font-size:20px;"></i></label>
                    <input class="calendar" type="text" name="datepicker" id="datepicker" placeholder="날짜 입력" />   
                </div>
                
                <div class="r_time">
                	<label for="time"><i class="far fa-clock" style="font-size:20px;"></i>  <span id="choice">시간을 입력해 주세요.. <i class="fas fa-angle-down"></i></span></label>
                
                	<div class="hide">
                		<span id="am">AM</span>
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
	               		<span id="pm">PM</span>
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
							   document.write('<button id="row_" type="button" class="timeSelect" value = "PM  ' + hour + min +'">'
							      + hour
							      + min
							      + '</button>');
							}
	                  	</script>
                	</div>
                	
                </div>
                <div class="r_person">
                    <label for="personAdd"><i class="far fa-user" style="font-size:20px;"></i></label>
                    <select name="person" id="person">
                         <option value="1">1</option>
                         <option value="2">2</option>
                         <option value="3">3</option>
                         <option value="4">4</option>
                         <option value="5">5</option>
                         <option value="6">6</option>
                         <option value="7">7</option>
                         <option value="8">8</option>
                      </select>
                </div>
                <span id="r_info"><strong>예약자 정보</strong></span>
                <div class="r_name">
                    <label for="name">이름</label>
                    <input type="text" name="name" id="name" placeholder="이름 입력">
                </div>  
                <div class="r_phone">
                    <label for="phone">전화번호</label>
                    <input type="text" name="phone" id="phone" placeholder="번호 입력">
                </div>    
                <div class="rBtn">
                	 <button id="rBtn" type="submit">예약</button>
                </div>
            </form>  
        </div>
        <div id="tab-2" class="tab-content">
            <form action="${pageContext.request.contextPath}/eatery/takeout_insertform.do" method="post">
               <input type="hidden" id="b_id" name="b_id" value="12345678"/>
               <input type="hidden" id="b_store_name" name="b_store_name" value="팬케이크 스토리"/>
            	<input type="hidden" id="b_store_addr" name="b_store_addr" value="서울특별시 강남구 언주로 33"/>
               <button id="tBtn" type="submit">포장</button>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   	// 달력
   	var holidays = {
           	"0101":{type:0, title:"신정", year:""},
           	"0301":{type:0, title:"삼일절", year:""},
           	"0505":{type:0, title:"어린이날", year:""},
           	"0606":{type:0, title:"현충일", year:""},
           	"0815":{type:0, title:"광복절", year:""},
           	"1003":{type:0, title:"개천절", year:""},
           	"1009":{type:0, title:"한글날", year:""},
           	"1225":{type:0, title:"크리스마스", year:""},
   
           	"0211":{type:0, title:"설날", year:"2021"},
           	"0212":{type:0, title:"설날", year:"2021"},
           	"0213":{type:0, title:"설날", year:"2021"},
           	"0920":{type:0, title:"추석", year:"2021"},
           	"0921":{type:0, title:"추석", year:"2021"},
           	"0922":{type:0, title:"추석", year:"2021"},
           	"1004":{type:0, title:"대체공휴일", year:"2021"},
           	"1011":{type:0, title:"대체공휴일", year:"2021"},
           	"0519":{type:0, title:"석가탄신일", year:"2021"}
       	};

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
           ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
             ,beforeShowDay: function(day) {
                  var result;
                  // 포맷에 대해선 다음 참조(http://docs.jquery.com/UI/Datepicker/formatDate)
                  var holiday = holidays[$.datepicker.formatDate("mmdd",day )];
                  var thisYear = $.datepicker.formatDate("yy", day);

                  // exist holiday?
                  if (holiday) {
                  if(thisYear == holiday.year || holiday.year == "") {
                      result =  [false, "date-holiday", holiday.title];
                  }
                  }

                  if(!result) {
                  switch (day.getDay()) {
                      case 0: // is sunday?
                      result = [true, "date-sunday"];
                      break;
                      case 6: // is saturday?
                      result = [true, "date-saturday"];
                      break;
                      default:
                      result = [true, ""];
                      break;
                  }
                  }

                  return result;
               }
         });                        
      
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   	});


    
     //예약,포장 버튼 바꾸는 함수
    $(document).ready(function(){
    
        $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');
    
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
    
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');
        })
    });
	
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".r_time>label").click(function(){
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
        	$("#choice").text(id_value); //span에 읽어온 id의 value 값을 넣어준다.
        	$("#reservation_time").val(id_value)//span은 폼전송이 어려움으로 input type hidden에 value값 전달
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
    	
    	rtn=confirm("예약 하시겠습니까?");
    	
 		if (rtn){
 			document.getElementById('reservation_form').submit();
  		}else{
  			return false;
  		}
 	};
</script>
</body>
</html>