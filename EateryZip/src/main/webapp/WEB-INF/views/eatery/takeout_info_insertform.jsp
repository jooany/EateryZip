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
   width:700px;
   margin:0 auto;
   height:900px;
}
#title{
   margin-bottom: 30px;
   font-size:22px;
   font-weight: bold;
}
#info{
   width:700px;
   border-bottom: 1px solid rgb(224, 224, 224);
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
   width: 99%;
    height: 100px;
    margin-top:10px;
    border: 1px solid rgb(224, 224, 224);
}
textarea::placeholder{padding:5px;}
#datepicker{
   margin-left: 10px;
    font-size: 16px;
    border: 1px;
}
#time_choice{
   margin-left: 7px;
    font-size: 16px;
}
/* 시간 버튼 */
.timeSelect{
   background-color: rgba(253, 83, 0, 0.2);
      color: black;
    border-radius: 1px;
    margin: 1px;
    width: 47px;
    height: 25px;
    font-size: 12px;
    border: 1px solid rgba(253, 83, 0, 0.27);
}
#am{
   font-size: 14px;
    margin-left: 3px;
}
#pm{
   font-size: 14px;
    margin-left: 3px;
}
.timeSelect:hover{
   color:black;
   background-color:rgb(224, 224, 224);
   border: 1px solid black;
}
#takeout_name{
   font-size: 14px;
    margin-left: 42px;
    border: 1px;
    border-bottom: 1px solid rgb(224, 224, 224);
}
#takeout_phone{
   font-size: 14px;
    margin-left: 12px;
    border: 1px;
    border-bottom: 1px solid rgb(224, 224, 224);
}
/* 주문 내역 */
 table {
    width: 100%;
    border: 1px solid rgb(224, 224, 224);
    border-collapse: collapse;
    border-radius: 4px;
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
   	width: 220px;
    height: 40px;
    background-color: #fd5300;
    position: relative;
    left: 195px;
    color: white;
    border: 1px solid rgb(224, 224, 224);
    border-radius: 4px;
}
#resBtn{
   	width: 220px;
    height: 40px;
    background-color: white;
    color:rgba(0,0,0,.7);
    border: 1px solid rgba(0,0,0,.5);
    border-radius: 4px;
    position: relative;
    left: 65px;
}
#subBtn:hover{
   background-color: white;
   color: #fd5300;
} 
#resBtn:hover{
   background-color: rgba(0,0,0,.5);
   color: white;
}
#info_4{
   border: 0.5px solid rgb(224, 224, 224);
   border-radius: 4px;
}
#total{
	position: relative;
	left: 545px;
	bottom: -8px;
	font-size:13px; 
	font-weight:bold;
   }
</style>
</head>
<body>
<div id="container">
   <h2 id="title"> <i class="fas fa-angle-right"></i> 포장 주문 페이지</h2>
   <div id="info">
      <span id="store_name">${param.b_store_name }</span>
      <br />
      <span id="store_addr">${param.b_store_addr }</span>
   </div>
   <form id="takeout_insert" name="takeout_insert" action="${pageContext.request.contextPath }/eatery/takeout_info_insert.do" method="post" onsubmit="return confirm('포장 주문 하시겠습니까?');">
      <input type="hidden" name="b_id" value="${param.b_id }"/>
      <input type="hidden" name="takeout_time" id="takeout_time"/>   
      <input type="hidden" name="takeout_menu_num"  id="takeout_menu_num" value="${param.takeout_menu_num}"/>
      <c:forTokens var="cs" items="${choice}" delims="[,]">
             <input type="hidden" name="menu_choice" value="<c:out value="${cs}"/>"></input>
      </c:forTokens>
      <div style="margin-top:15px; border-bottom:1px solid rgb(224, 224, 224)">
         <div style="margin-bottom:10px;">
              <label for="datepicker">날짜</label>
               <i class="far fa-calendar-alt" style="font-size:18px; margin-left:10px;"></i><input class="calendar" type="text" name="takeout_date" id="datepicker" placeholder="날짜 입력"/>   
           </div>
             <div class="time" style="margin-bottom:10px;">
           시간 <label for="time"><i class="far fa-clock" style="font-size:18px; margin-left:10px;"></i>  <span id="time_choice">시간을 입력해 주세요.. <i class="fas fa-angle-down"></i></span></label>   
               <div class="hide">
                  <span id="am">AM</span>
                   <br />
                   <script>
                      let a="${param.b_open}";
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
                      let c="${param.b_close}";
                       let d=c.split(":");
                        let hour2=parseInt(d[0]);
                        console.log(hour2);
                        let min2 = parseInt(d[1]);
                        console.log(d[1]);
                        if(min2==30){
                           min2=1;
                        }else{
                           min2=0;
                        }
                        hour2 = hour2*2-24;
                        let g=hour2+min2;
                        console.log(g); 
                  for(let i=2; i<g; i++){ 
                     let hour="";
                     let min=":00";
                     if((Math.ceil(i/2))<13){
                        hour = (Math.floor(i/2));
                     }else{
                        hour = (Math.floor(i/2));
                     }
                     hour = (Math.floor(i/2));
                     if(hour<12){
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
      </div>
      
        <p style="font-size:14px; font-weight:bold;">예약자 정보</p>
        <div style="border-bottom:1px solid rgb(224, 224, 224)">
           <div style="margin-bottom:10px;">
               <label for="name">이름</label>
               <input type="text" name="takeout_name" id="takeout_name" placeholder="이름 입력">
           </div>  
           <div style="margin-bottom:10px;">
               <label for="phone">전화번호</label>
               <input type="text" name="takeout_phone" id="takeout_phone" placeholder="번호 입력">
           </div> 
        </div> 
        <div style="margin-top:15px;">
         <label for="memo" id="memo" style="font-size:14px; font-weight:bold; padding-left:5px;">요청사항</label>
         <br />
         <textarea name="takeout_memo" id="takeout_memo" placeholder="요청사항 입력 하세요..."></textarea>
      </div>
      <p style="font-size:14px; font-weight:bold; padding-left:5px;">주문 내역</p>
      <div id="info_4">
         <table>
            <thead>
               <th style="text-align: center; width: 300px;">메뉴</th>
               <th style="text-align: center; width: 250px;">수량</th>
               <th style="text-align: center; width: 250px;">가격</th>
            </thead>
            <tbody>
               <c:forTokens var="as" items="${info}" delims="[,]">
                  <tr>
                      <c:forTokens var="bs" items="${as}" delims="/">
                         <td><c:out value="${bs}"/></td>
                      </c:forTokens>
                   </tr>
               </c:forTokens>
            </tbody>
         </table>
         <div>
            <c:set var = "total" value = "0" />
            <c:forTokens var="result" items="${price}" delims="[ ,]">     
               <c:set var= "total" value="${total + result}"/>
            </c:forTokens>
            <p id="total">총 <span style="margin-left:10px;"><c:out value="${total}원"/></span></p>
            <input type="hidden" name="takeout_price" id="takeout_price" value="${total }"/>
         </div>
      </div>
      
      <p style="font-size:12px; padding-top: 10px;">※ 포장 예약시 취소 불가능</p>
      <div style="padding-top: 10px;">
         <button id="resBtn" type="reset" onclick="location.href='javascript:history.back();'">취소</button>
         <button id="subBtn" type="submit">주문하기</button>
      </div>   
   </form>
</div>
<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
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
      rtn=confirm("포장 주문 하시겠습니까?");
      
         if (rtn){
            document.getElementById('takeout_insert').submit();
         }else{
            return false;
         }
   };
	//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	document.querySelector("#takeout_insert")
		.addEventListener("submit", function(e){
			//textarea 이외에 입력한 내용을 여기서 검증하고 
			const time=document.querySelector("#takeout_time").value;
			//만일 폼 제출을 막고 싶으면  
			//e.preventDefault();
			//을 수행하게 해서 폼 제출을 막아준다.
			if(time.length < 1){
				alert("시간을 입력해 주세요");
				e.preventDefault();
			}
			
		});
	//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	document.querySelector("#takeout_insert")
		.addEventListener("submit", function(e){
			const phone=document.querySelector("#takeout_phone").value;
			//만일 폼 제출을 막고 싶으면  
			//e.preventDefault();
			//을 수행하게 해서 폼 제출을 막아준다.
			if(phone.length < 1){
				alert("전화번호를 입력해 주세요");
				e.preventDefault();
			}
			
		});
	//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	document.querySelector("#takeout_insert")
		.addEventListener("submit", function(e){
			const name=document.querySelector("#takeout_name").value;
			//만일 폼 제출을 막고 싶으면  
			//e.preventDefault();
			//을 수행하게 해서 폼 제출을 막아준다.
			if(name.length < 1){
				alert("이름을 입력해 주세요");
				e.preventDefault();
			}
			
		});

   
</script>
</body>
</html>
