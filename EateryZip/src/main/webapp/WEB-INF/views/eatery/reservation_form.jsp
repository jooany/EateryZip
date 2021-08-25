<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/eatery/reservation_form.jsp</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<style>
    .container{
	width: 500px;
	margin: 0 auto;
}
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
    width: 270px;
    height: 250px;
}

.tab-content.current{
	display: inherit;
}
</style>
<body>
<div>
    <div class="container">

        <ul class="tabs">
            <li class="tab-link current" data-tab="tab-1">예약</li>
            <li class="tab-link" data-tab="tab-2">포장</li>
        </ul>
    
        <div id="tab-1" class="tab-content current">
            <form>
                <div>
                    <label for="datepicker">날짜</label>
                    <input class="calendar" type="text" name="datepicker" id="datepicker" placeholder="날짜 입력"/>   
                </div>
                <div>
                    <label for="timeKindU">시간</label>
                    <select id="timeKindU" name="timeKindU" onchange="timeKindChange(this)">
                        <option value="A">오전/오후 선택</option>
                        <option value="AM">AM</option>
                        <option value="PM">PM</option>
                    </select>
                    <select id="timeKindD" name="timeKindD">
                        <option>선택해주세요.</option>
                    </select>
                </div>
                <div>
                    <label for="personAdd">인원</label>
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
                <span><strong>예약자 정보</strong></span>
                <div>
                    <label for="name">이름</label>
                    <input type="text" name="name" id="name" placeholder="이름 입력">
                </div>  
                <div>
                    <label for="phone">전화번호</label>
                    <input type="text" name="phone" id="phone" placeholder="번호 입력">
                </div>    
                <button type="submit">예약</button>
            </form>  
        </div>
        <div id="tab-2" class="tab-content">
            <form action="">
            	<input type="hidden" id="b_id" name="b_id" value=""/>
            	<button type="submit">포장</button>
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
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
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

    // 시간 설정
    function timeKindChange(e) {
        let a = ["선택해주세요"];
        let am = ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00"];
        let pm = ["17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00"];
        let target = document.getElementById("timeKindD");

        if(e.value == "A"){
             d = a;
        }else if(e.value == "AM"){
             d = am;
        }else if(e.value == "PM"){
             d = pm;
        };

        target.options.length = 0;

        for (x in d) {
            let opt = document.createElement("option");
            opt.value = d[x];
            opt.innerHTML = d[x];
            target.appendChild(opt);
        }    
	};
    
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
</script>
</body>
</html>