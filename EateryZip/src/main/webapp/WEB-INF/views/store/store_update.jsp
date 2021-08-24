<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/store/store_updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style type="text/css">
	#container{
		width: 80%;
		margin:0 10% ;
	}
</style>
</head>
<body>
	<div id="container">
		<form class="content row g-3" id="insertForm" action="${pageContext.request.contextPath}/store/store_info.do" enctype="multipart/form-data" method="post">
			<legend>가게등록</legend>
			<!-- 사업자 번호 입력란 수정 x -->
			<div class="wrap mb-3">
				<label for="b_id" class="form-label">사업자 번호</label>
				<input type="hidden" name="b_id" id="b_id" class="form-control" value="${b_id }" disabled>
			</div>
			<!-- 상호명 입력란 -->
			<div class="box mb-3">
				<label for="b_name" class="form-label">상호명</label>
				<input class="form-control" type="text" name="b_name" id="b_name" value="${b_name }" placeholder="상호명을 입력하세요." required>
			</div>
			<!-- 주소 입력 (민재님 주소 api설정되시면 복사해서 옮겨놓기) -->
			<div class="box mb-3">
				<label for="b_Store_Address" class="form-label">주소</label>
				<input class="form-control" type="text" name="b_Store_Address" id="b_Store_Address" value="${b_Store_Address }" placeholder="주소를 입력하세요." required>
			</div>
			<!-- 업종 선택 -->
			<div class="box mb-3">
				<label for="b_kind" class="form-label">업종</label>
				<select class="form-select" name="b_kind" id="b_kind" required>
					<option value="">업종을 선택하세요.</option>
					<option value="한식">한식</option>
					<option value="일식" >일식</option>
					<option value="중식" >중식</option>
					<option value="양식" >양식</option>
					<option value="브런치" >브런치</option>
					<option value="카페" >카페</option>
					<option value="Bar" >Bar</option>
				</select>
			</div>
			<!-- 가게 소개글 -->
			<div class="mb-3">
				<label for="intro" class="form-label">소개글</label>
				<div id="intro_Help" class="form-text">30자이내</div>
				<input class="form-control" type="text" name="intro" id="intro" placeholder="가게소개글 작성해주세요." required>
			</div>
			<!--대표이미지 3개를 넣으려면 고민-->
			
			<div id="img" class="image-container mb-3">
				<label class="form-label" for="b_img_f">대표이미지</label>
				<!-- <img class="mb-3" id="b_img_f" src="https://dummyimage.com/100x100/fff/000.jpg&text=+Attachments"/> -->
				<input class="form-control form-control-sm" style="display: block;" type="file" name="b_img_f" id="b_img_f" type="file" accept=".jpg, .jpeg, .png, .JPG, .JPEG" required>
			</div>
			<a id="B_img_f_link" href="javascript:">
				<c:choose>
					<c:when test="${empty dto.b_img_f }">
						<i class="far fa-image"></i>
					</c:when>
					<c:otherwise>
						<img id="b_img_f" src="${pageContext.request.contextPath}${dto.b_img_f }" />
					</c:otherwise>
				</c:choose>
			</a>
			<!--가게 연락처 숫자만 추출하려면 정규표현식 사용 /\d/ /[0-9]/-->
			<div class="mb-3">
				<label for="b_Store_phone" class="form-label">연락처</label>
				<div id="b_Store_phone" class="form-text">'-' 기호를 제외하고 입력해주세요.</div>
				<input class="form-control" type="text" name="b_Store_phone" id="b_Store_phone" placeholder="0211111111" required>
			</div>
			<!-- 가게 영업시간 (영업일 / 오픈시간 / 클로즈시간 / 휴일 )-->
			<div class="form-group mb-3">
				<label for="b_Store_date" class="form-label">영업시간</label>
				<select class="form-select" name="b_Store_date" id="b_Store_date" required>
					<option value="">영업일을 선택하세요.</option>
					<option value="매일" >매일</option>
					<option value="주말" >주말</option>
					<option value="평일" >평일</option>
				</select>
				<label for="b_open" class="form-label">Open</label>
				<select name="b_open" id="b_open" name="b_open" class="form-select" required>
					<option value="">오픈시간을 선택하세요.</option>
					<script>
						for(let i = 0; i<48; i++){
							let hour="";
							let min=":00";
							if((Math.ceil(i/2))<13){
								hour = (Math.floor(i/2));
							}else{
								hour = (Math.floor(i/2));
							}
							if(hour<10){
								hour = "0"+hour;
							}
							if(i%2 != 0){
								min=":30";
							}
							document.write('<option value = ' + hour + min +'>'
								+ hour
								+ min
								+ '</option>');
						}
					</script>
				</select>
				<label for="b_close" class="form-label">Close</label>
				<select name="b_close" id="b_close" name="b_close" class="form-select" required>
					<option value="">마감시간을 선택하세요.</option>
					<script>
						for(let i = 0; i<48; i++){
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
							document.write('<option value = ' + hour + min +'>'
								+ hour
								+ min
								+ '</option>');
						}
					</script>
				</select>
				<label for="b_holiday" class="form-label">휴무일</label>
				<select class="form-select" name="b_holiday" id="b_holiday" >
					<option value="">휴일</option>
					<option value="월요일">월요일</option>
					<option value="화요일">화요일</option>
					<option value="수요일">수요일</option>
					<option value="목요일">목요일</option>
					<option value="금요일">금요일</option>
					<option value="토요일">토요일</option>
					<option value="일요일">일요일</option>
				</select>
			</div>
			<!-- 공지사항 필수아님 -->
			<div class="mb-3">
				<label for="notice" class="form-label">공지사항</label>
				<div id="b_notice_Help" class="form-text">50자이내</div>
				<input class="form-control" type="text" id="notice" name="notice" placeholder="안녕하세요">
			</div>
			<!-- 서비스 선택하기 하나라도 선택이 되어있다면 required X 선택안되어있다면 required -->
			<fieldset>
				<legend>서비스</legend>
				<div class="checkbox-group required mb-3" id="service">
					<div class="form-check">
						<input class="required" type="checkbox" value="예약" name="service" id="reserve">
						<label class="form-check-label" for="reserve">예약</label>
						<input class="required" type="checkbox" value="포장" name="service" id="takeout">
						<label class="form-check-label" for="takeout">포장</label>
					</div>
				</div>
			</fieldset>
			
			<!-- 편의사항 키워드 1개이상 10개이하 data에 넣기 선택안되어있다면 required -->
			<fieldset>
				<legend>편의사항 / 기타</legend>
				<div class="form-group mb-3" id="ex_keyword">
					<input type="checkbox" class="btn-check" id="btn-check-outlined" value="루프탑" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary mb-3" for="btn-check-outlined" >루프탑</label>
					
					<input type="checkbox" class="btn-check" id="btn-check-2-outlined" value="주차" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary mb-3" for="btn-check-2-outlined">주차</label>

					<input type="checkbox" class="btn-check" id="btn-check-3-outlined" value="무선인터넷" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary mb-3" for="btn-check-3-outlined">무선인터넷</label>

					<input type="checkbox" class="btn-check" id="btn-check-4-outlined" value="단체석" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary mb-3" for="btn-check-4-outlined" >단체석</label>

					<input type="checkbox" class="btn-check" id="btn-check-5-outlined" value="남/녀 화장실 구분" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary mb-3" for="btn-check-5-outlined">남/녀 화장실 구분</label>
					<br />
					<input type="checkbox" class="btn-check" id="btn-check-6-outlined" value="키즈존" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check-6-outlined" >키즈존</label>
					
					<input type="checkbox" class="btn-check" id="btn-check-7-outlined" value="노키즈존" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check-7-outlined">노키즈존</label>

					<input type="checkbox" class="btn-check" id="btn-check-8-outlined" value="반려동물동반가능" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check-8-outlined" >반려동물동반가능</label>

					<input type="checkbox" class="btn-check" id="btn-check-9-outlined" value="프라이빗" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check-9-outlined" >프라이빗</label>

					<input type="checkbox" class="btn-check" id="btn-check-10-outlined" value="흡연실" name="ex_keyword" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check-10-outlined">흡연실</label>
				</div>
			</fieldset>
			<div>
				<button id="resetBtn" class="btn btn-light" type="reset">취소</button>
				<button id="saveBtn" class="btn btn-primary" type="submit" onclick="submit()">저장</button>
			</div>
		</form>
	</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//프로필 이미지 링크를 클릭하면 
	document.querySelector("#B_img_f_link").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			let img=`<img id="profileImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			document.querySelector("#profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			document.querySelector("input[name=profile]").value=data.imagePath;
		});
	});
</script>
</body>
</html>