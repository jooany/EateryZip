<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/store/store_insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="https://kit.fontawesome.com/eda0c6c5f7.js" crossorigin="anonymous"></script>

<style type="text/css">
	#container{
		width: 80%;
		margin:0 10% ;
	}
	#b_img_f{
		width: 300px;
		height: 200px;
	}
	#storeimageForm{
		display: none;
	}
</style>
</head>
<body>
	<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
	<div id="container">
		
		<!-- 사업자번호 -->
		<input type="hidden" name="b_id" id="b_id" class="form-control" value="${b_id }">
		<label for="b_id" class="form-label">사업자번호</label>
		<input type="text" name="b_id" id="b_id" class="form-control" value="${b_id }" disabled />
		
<!-- dto가 있으면 아래 내역이 보이게 -->
		<c:choose>
			<c:when test="${not empty dto }">
			<form action="${pageContext.request.contextPath}/store/store_update.do" method="post" id="StoreForm">
				<input type="hidden" name="b_img_f" value="${ empty dto.b_img_f ? '' : dto.b_img_f }"/>
				<%-- 상호명 입력란 --%> 	 		
				<div class="wrap_name">
					<label for="b_name" class="form-label">상호명</label>
					<div class="box mb-3">
					          <input class="form-control" type="text" name="b_name" id="b_name" value="${dto.b_name}">
					</div>
		        </div> 
		        <%-- 주소 입력 (민재님 주소 api설정되시면 복사해서 옮겨놓기) --%>
				<div class="wrap_address">
					<label for="b_Store_Address" class="form-label">주소</label>
					<div class="box mb-3">
						<input class="form-control" type="text" name="b_Store_Address" id="b_Store_Address" value="${dto.b_Store_Address}">
					</div>
				</div>
				<%-- 업종 선택 --%>
				<div class="wrap_kind">
					<label for="b_kind" class="form-label">업종</label>
					<div class="box mb-3">
						<select class="form-select" name="b_kind" id="b_kind">
							<option value="한식" ${dto.b_kind eq '한식' ? 'selected' : ''}>한식</option>
							<option value="일식" ${dto.b_kind eq '일식' ? 'selected' : ''}>일식</option>
							<option value="중식" ${dto.b_kind eq '중식' ? 'selected' : ''}>중식</option>
							<option value="양식" ${dto.b_kind eq '양식' ? 'selected' : ''}>양식</option>
							<option value="브런치" ${dto.b_kind eq '브런치' ? 'selected' : ''}>브런치</option>
							<option value="카페" ${dto.b_kind eq '카페' ? 'selected' : ''}>카페</option>
							<option value="Bar" ${dto.b_kind eq 'Bar' ? 'selected' : ''}>Bar</option>
						</select>
					</div>
				</div>
				<%-- 가게 소개글 --%>
				<div class="wrap_intro">
					<label for="intro" class="form-label">소개글</label>
					<div id="intro_Help" class="form-text">30자이내</div>
						<div class="box mb-3">
							<input class="form-control" type="text" name="intro" id="intro" value="${dto.intro}">
						</div>
				</div>
				<c:forEach var="imgTmp" items="${imgList }">
					
				</c:forEach>
				<%--가게 연락처 숫자만 추출하려면 정규표현식 사용 /\d/ /[0-9]/--%>
				<div class="wrap_phone">
					<label for="b_Store_phone" class="form-label">연락처</label>
					<input class="form-control" type="text" name="b_Store_phone" id="b_Store_phone" value="${dto.b_Store_phone }">
				</div>
				<%-- 가게 영업시간 (영업일 / 오픈시간 / 클로즈시간 / 휴일 )--%>
				<div class="wrap_opneClose">
					<%-- 영업일 선택하기 --%>
					<div class="b_Store_date">
						<fieldset>
							<legend>영업일</legend>
							<div class="form-group mb-3" id="b_Store_date" style="width:547px;">
								<input type="checkbox" class="btn-check" id="btn-check-outlined_d" name="b_Store_date" value="월" ${dto.b_Store_date eq '월' ? 'checked' : '' }>
								<label class="btn btn-outline-primary" for="btn-check-outlined_d" >월</label>
								
								<input type="checkbox" class="btn-check" id="btn-check-2-outlined_d" name="b_Store_date" value="화" ${dto.b_Store_date eq '화' ? 'checked' : '' }>
								<label class="btn btn-outline-primary" for="btn-check-2-outlined_d">화</label>
			
								<input type="checkbox" class="btn-check" id="btn-check-3-outlined_d" name="b_Store_date" value="수" ${dto.b_Store_date eq '수' ? 'checked' : '' }>
								<label class="btn btn-outline-primary" for="btn-check-3-outlined_d">수</label>
			
								<input type="checkbox" class="btn-check" id="btn-check-4-outlined_d" name="b_Store_date" value="목" ${dto.b_Store_date eq '목' ? 'checked' : '' }>
								<label class="btn btn-outline-primary" for="btn-check-4-outlined_d" >목</label>
			
								<input type="checkbox" class="btn-check" id="btn-check-5-outlined_d" name="b_Store_date"  value="금" ${dto.b_Store_date eq '금' ? 'checked' : '' }>
								<label class="btn btn-outline-primary" for="btn-check-5-outlined_d">금</label>
								
								<input type="checkbox" class="btn-check" id="btn-check-6-outlined_d" name="b_Store_date" value="토" ${dto.b_Store_date eq '토' ? 'checked' : '' }>
								<label class="btn btn-outline-primary" for="btn-check-6-outlined_d" >토</label>
								
								<input type="checkbox" class="btn-check" id="btn-check-7-outlined_d" name="b_Store_date" value="일" ${dto.b_Store_date eq '일' ? 'checked' : '' }>
								<label class="btn btn-outline-primary" for="btn-check-7-outlined_d">일</label>
							</div>
						</fieldset>
					</div>
					<%-- 스크립트 내부에서의 value값을 가져오기 --%>
					<%-- 오픈시간 --%>
					<div>
						<label for="b_open" class="form-label">Open</label>
						<input type="time" id="b_open" name="b_open" min="06:00" max="23:00" step="1800"  value="${dto.b_open }">
					</div>
					<%-- 마감시간 --%>
					<div>
						<label for="b_close" class="form-label">Close</label>
						<input type="time" id="b_close" name="b_close" min="07:00" max="23:00" step="1800" value="${dto.b_close }">
					</div>
				</div>
				<%-- 공지사항 필수아님 --%>
				<div class="wrap_notice">
					<label for="notice" class="form-label">공지사항</label>
					<div id="b_notice_Help" class="form-text">50자이내</div>
					<input class="form-control" type="text" id="notice" name="notice" value="${dto.notice}" placeholder="안녕하세요">
				</div>
				<%-- 서비스 선택하기 하나라도 선택이 되어있다면 required X 선택안되어있다면 required --%>
				<div class="wrap_service">
					<fieldset>
						<legend>서비스</legend>
						<div class="checkbox-group required mb-3" id="service">
							
							<input class="required" type="checkbox" name="service" id="reserve" value="reserve" ${dto.service eq 'reserve' ? 'checked' : '' } >
							<label class="form-check-label" for="reserve">예약</label>
							<input class="required" type="checkbox"  name="service" id="takeout" value="takeout" ${dto.service eq 'takeout' ? 'checked' : '' }>
							<label class="form-check-label" for="takeout">포장</label>
						
						</div>
					</fieldset>
				</div>
				<%-- 편의사항 키워드 1개이상 10개이하 data에 넣기 선택안되어있다면 required --%>
				<div class="wrap_keyword">
					<fieldset>
						<legend>편의사항 / 기타</legend>
						<div class="form-group mb-3" id="ex_keyword">
							<input type="checkbox" class="btn-check" id="btn-check-outlined" name="ex_keyword" autocomplete="off" value="루프탑" ${dto.ex_keyword eq '루프탑' ? 'checked' : '' }>
							<label class="btn btn-outline-primary mb-3" for="btn-check-outlined" >루프탑</label>
							
							<input type="checkbox" class="btn-check" id="btn-check-2-outlined" name="ex_keyword" autocomplete="off" value="주차" ${dto.ex_keyword eq '주차' ? 'checked' : '' }>
							<label class="btn btn-outline-primary mb-3" for="btn-check-2-outlined">주차</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-3-outlined" name="ex_keyword" autocomplete="off" value="무선인터넷" ${dto.ex_keyword eq '무선인터넷' ? 'checked' : '' }>
							<label class="btn btn-outline-primary mb-3" for="btn-check-3-outlined">무선인터넷</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-4-outlined" name="ex_keyword" autocomplete="off" value="단체석" ${dto.ex_keyword eq '단체석' ? 'checked' : '' }>
							<label class="btn btn-outline-primary mb-3" for="btn-check-4-outlined" >단체석</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-5-outlined" name="ex_keyword" autocomplete="off" value="남/녀 화장실 구분" ${dto.ex_keyword eq '남/녀 화장실 구분' ? 'checked' : '' }>
							<label class="btn btn-outline-primary mb-3" for="btn-check-5-outlined">남/녀 화장실 구분</label>
							<br />
							<input type="checkbox" class="btn-check" id="btn-check-6-outlined" name="ex_keyword" autocomplete="off" value="키즈존" ${dto.ex_keyword eq '키즈존' ? 'checked' : '' }>
							<label class="btn btn-outline-primary" for="btn-check-6-outlined" >키즈존</label>
							
							<input type="checkbox" class="btn-check" id="btn-check-7-outlined" name="ex_keyword" autocomplete="off" value="노키즈존" ${dto.ex_keyword eq '노키즈존' ? 'checked' : '' }>
							<label class="btn btn-outline-primary" for="btn-check-7-outlined">노키즈존</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-8-outlined" name="ex_keyword" autocomplete="off" value="반려동물동반가능" ${dto.ex_keyword eq '반려동물동반가능' ? 'checked' : '' }>
							<label class="btn btn-outline-primary" for="btn-check-8-outlined" >반려동물동반가능</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-9-outlined" name="ex_keyword" autocomplete="off" value="프라이빗" ${dto.ex_keyword eq '프라이빗' ? 'checked' : '' }>
							<label class="btn btn-outline-primary" for="btn-check-9-outlined" >프라이빗</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-10-outlined" name="ex_keyword" autocomplete="off" value="흡연실" ${dto.ex_keyword eq '흡연실' ? 'checked' : '' }>
							<label class="btn btn-outline-primary" for="btn-check-10-outlined">흡연실</label>
						</div>
					</fieldset>
					
				</div>
				<%-- checkKeyword입력 --%>
				<div class="checkKeyword">
					<input type="text" class="form-control" id="checkKeyword" name="checkKeyword" value="${dto.checkKeyword }" />
				</div>
				<button id="resetBtn" class="btn btn-light" type="reset">취소</button>
				<button id="saveBtn" class="btn btn-primary" type="submit" onclick="submit()">수정하기</button>
			</form>
			
			</c:when>
<%-- dto에 전송된 saveStore가 없으면 아래 내역이 보이게 --%>
			<c:otherwise>
				<form action="${pageContext.request.contextPath}/store/store_insert.do" method="post" id="StoreForm">
				<%-- 상호명 입력란 --%>
				<div class="wrap_name">
					<label for="b_name" class="form-label">상호명</label>
					<div class="box mb-3">
						<input class="form-control" type="text" name="b_name" id="b_name">
					</div>
		        </div> 
		        <%-- 주소 입력 (민재님 주소 api설정되시면 복사해서 옮겨놓기) --%>
				<div class="wrap_address">
					<label for="b_Store_Address" class="form-label">주소</label>
					<div class="box mb-3">
						<input class="form-control" type="text" name="b_Store_Address" id="b_Store_Address">
					</div>
				</div>
				<%-- 업종 선택 --%>
				<div class="wrap_kind">
					<label for="b_kind" class="form-label">업종</label>
					<div class="box mb-3">
						<select class="form-select" name="b_kind" id="b_kind">
							<option value="한식">한식</option>
							<option value="일식">일식</option>
							<option value="중식">중식</option>
							<option value="양식">양식</option>
							<option value="브런치">브런치</option>
							<option value="카페">카페</option>
							<option value="Bar">Bar</option>
						</select>
					</div>
				</div>
				<%-- 가게 소개글 --%>
				<div class="wrap_intro">
					<label for="intro" class="form-label">소개글</label>
					<div id="intro_Help" class="form-text">30자이내</div>
					<div class="box mb-3">
						<input class="form-control" type="text" name="intro" id="intro">
						<div class="invalid-feedback">30자 초과입니다.</div>
					</div>
				</div>
				<%-- 가게 대표이미지 --%>
				<div class="wrap_img">
					<label class="form-label" for="b_img_f">대표이미지</label>
					<button id="addItemBtn" type="button">+</button>
						<table id="example" border="1px">
						        <tr>
						            <th>옵션명</th>
						            <th>항목명</th>
						            
						        </tr>
						        <tr class="item1">
						            <td><input type="file" name="store_img" /></td>
						            <td><button class="delBtn" type="button">삭제</button></td>
						        </tr>
						        
						</table>
				</div>
				<%--가게 연락처 숫자만 추출하려면 정규표현식 사용 /\d/ /[0-9]/--%>
				<div class="wrap_phone">
					<label for="b_Store_phone" class="form-label">연락처</label>
					<input class="form-control" type="text" name="b_Store_phone" id="b_Store_phone">
					<div class="invalid-feedback">연락처를 넣어주세요.</div>
				</div>
				<%-- 가게 영업시간 (영업일 / 오픈시간 / 클로즈시간 / 휴일 )--%>
				<div class="wrap_opneClose">
					<%-- 영업일 선택하기 --%>
					<div class="b_Store_date">
						<fieldset>
							<legend>영업일</legend>
							<div class="form-group mb-3" id="b_Store_date" style="width:547px;">
								<input type="checkbox" class="btn-check" id="btn-check-outlined_d" name="b_Store_date" value="월">
								<label class="btn btn-outline-primary" for="btn-check-outlined_d" >월</label>
								
								<input type="checkbox" class="btn-check" id="btn-check-2-outlined_d" name="b_Store_date" value="화">
								<label class="btn btn-outline-primary" for="btn-check-2-outlined_d">화</label>
			
								<input type="checkbox" class="btn-check" id="btn-check-3-outlined_d" name="b_Store_date" value="수">
								<label class="btn btn-outline-primary" for="btn-check-3-outlined_d">수</label>
			
								<input type="checkbox" class="btn-check" id="btn-check-4-outlined_d" name="b_Store_date" value="목">
								<label class="btn btn-outline-primary" for="btn-check-4-outlined_d" >목</label>
			
								<input type="checkbox" class="btn-check" id="btn-check-5-outlined_d" name="b_Store_date"  value="금">
								<label class="btn btn-outline-primary" for="btn-check-5-outlined_d">금</label>
								
								<input type="checkbox" class="btn-check" id="btn-check-6-outlined_d" name="b_Store_date" value="토">
								<label class="btn btn-outline-primary" for="btn-check-6-outlined_d" >토</label>
								
								<input type="checkbox" class="btn-check" id="btn-check-7-outlined_d" name="b_Store_date" value="일">
								<label class="btn btn-outline-primary" for="btn-check-7-outlined_d">일</label>
							</div>
						</fieldset>
					</div>
					<%-- 스크립트 내부에서의 value값을 가져오기 --%>
					<%-- 오픈시간 --%>
					<div>
						<label for="b_open" class="form-label">Open</label>
						<input type="time" id="b_open" name="b_open" min="06:00" max="23:00" step="1800" >
						<div class="invalid-feedback">00분과 30분 중에 선택해주세요</div>
					</div>
					<%-- 마감시간 --%>
					<div>
						<label for="b_close" class="form-label">Close</label>
						<input type="time" id="b_close" name="b_close" min="07:00" max="23:00" step="1800">
						<div class="invalid-feedback">00분과 30분 중에 선택해주세요</div>
					</div>
				</div>
				<%-- 공지사항 필수아님 --%>
				<div class="wrap_notice">
					<label for="notice" class="form-label">공지사항</label>
					<div id="b_notice_Help" class="form-text">50자이내</div>
					<input class="form-control" type="text" id="notice" name="notice" placeholder="안녕하세요">
					
				</div>
				<%-- 서비스 선택하기 하나라도 선택이 되어있다면 required X 선택안되어있다면 required --%>
				<div class="wrap_service">
					<fieldset>
						<legend>서비스</legend>
						<div class="checkbox-group required mb-3" id="service">
							<input class="required" type="checkbox" name="service" id="reserve" value="reserve">
							<label class="form-check-label" for="reserve">예약</label>
							<input class="required" type="checkbox"  name="service" id="takeout" value="takeout">
							<label class="form-check-label" for="takeout">포장</label>
						</div>
					</fieldset>
				</div>
				<%-- 편의사항 키워드 1개이상 10개이하 data에 넣기 선택안되어있다면 required --%>
				<div class="wrap_keyword">
					<fieldset>
						<legend>편의사항 / 기타</legend>
						<div class="form-group mb-3" id="ex_keyword" style="width:547px;">
							<input type="checkbox" class="btn-check" id="btn-check-outlined" name="ex_keyword" value="루프탑">
							<label class="btn btn-outline-primary mb-3" for="btn-check-outlined" >루프탑</label>
							
							<input type="checkbox" class="btn-check" id="btn-check-2-outlined" name="ex_keyword" value="주차">
							<label class="btn btn-outline-primary mb-3" for="btn-check-2-outlined">주차</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-3-outlined" name="ex_keyword" value="무선인터넷">
							<label class="btn btn-outline-primary mb-3" for="btn-check-3-outlined">무선인터넷</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-4-outlined" name="ex_keyword" value="단체석">
							<label class="btn btn-outline-primary mb-3" for="btn-check-4-outlined" >단체석</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-5-outlined" name="ex_keyword"  value="남/녀 화장실 구분">
							<label class="btn btn-outline-primary mb-3" for="btn-check-5-outlined">남/녀 화장실 구분</label>
							
							<input type="checkbox" class="btn-check" id="btn-check-6-outlined" name="ex_keyword" value="키즈존">
							<label class="btn btn-outline-primary" for="btn-check-6-outlined" >키즈존</label>
							
							<input type="checkbox" class="btn-check" id="btn-check-7-outlined" name="ex_keyword" value="노키즈존">
							<label class="btn btn-outline-primary" for="btn-check-7-outlined">노키즈존</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-8-outlined" name="ex_keyword" value="반려동물동반가능">
							<label class="btn btn-outline-primary" for="btn-check-8-outlined" >반려동물동반가능</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-9-outlined" name="ex_keyword" value="프라이빗">
							<label class="btn btn-outline-primary" for="btn-check-9-outlined" >프라이빗</label>
		
							<input type="checkbox" class="btn-check" id="btn-check-10-outlined" name="ex_keyword" autocomplete="off" value="흡연실">
							<label class="btn btn-outline-primary" for="btn-check-10-outlined">흡연실</label>
						</div>
					</fieldset>
				</div>
				<%-- checkKeyword입력 --%>
				<div class="checkKeyword">
					<input type="text" class="form-control" id="checkKeyword" name="checkKeyword" />
				</div>
				<button id="resetBtn" class="btn btn-light" type="reset">취소</button>
				<button id="saveBtn" class="btn btn-primary" type="submit" onclick="submit()">저장하기</button>
			</form>
			
			
			
			</c:otherwise>
		</c:choose>
		<form action="${pageContext.request.contextPath}/store/ajax_store_img_upload.do" method="post" id="storeimageForm" enctype="multipart/form-data">
			<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		//프로필 이미지 링크를 클릭하면 
		//document.querySelector("#store_imglink").addEventListener("click", function(){
			// input type="file" 을 강제 클릭 시킨다. 
		//	document.querySelector("#image").click();
	//	});
		//이미지를 선택했을때 실행할 함수 등록 
		//document.querySelector("#image").addEventListener("change", function(){
			
		//	let form=document.querySelector("#storeimageForm");
			
			// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
	//		ajaxFormPromise(form)
	//		.then(function(response){
	//			return response.json();
	//		})
	//		.then(function(data){
				// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
	//			console.log(data);
	//			let img=`<img id="b_img_f" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
	//			document.querySelector("#store_imglink").innerHTML=img;
				// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
	//			document.querySelector("input[name=b_img_f]").value=data.imagePath;
	//		});
	//	});
		
		// 영업일 체크박스
		let keyarr2=[];
		let nowKey2='<c:out value="${dto.b_Store_date}"/>'
		console.log(nowKey2);
		
		if(nowKey2){
			keyarr2=nowKey2.split(",");
		}
		console.log(keyarr2);
		for(let i=0;i<13;i++){
			let keyBtn2=$("#b_Store_date").children().eq(i);
			for(let item of keyarr2){
				if(keyBtn2.text()==item){
					console.log(keyBtn2.text());
					$("#b_Store_date").children().eq(i).prop("checked",true);
					keyBtn2.css({"background-color":"blue",
						"color":"white"});
				}
			}
		}
		
		// 서비스 체크박스
		let keyarr1=[];
		let nowKey1='<c:out value="${dto.service}"/>'
		console.log(nowKey1);
		
		if(nowKey1){
			keyarr1=nowKey1.split(",");
		}
		console.log(keyarr1);
		for(let i=0;i<4;i++){
			let keyBtn1=$("#service").children().eq(i);

			for(let item of keyarr1){
				let prevWord;
				if(keyBtn1.text()=="예약"){
					prevWord="reserve";
				}else{
					prevWord="takeout"
				}
				if(prevWord==item){

					$("#service").children().eq(i).prop("checked",true);
				}
			}
		}
		
		// 키워드 체크박스
		let keyarr=[];
		let nowKey='<c:out value="${dto.ex_keyword}"/>'
		console.log(nowKey);
		
		if(nowKey){
			keyarr=nowKey.split(",");
		}
		console.log(keyarr);
		for(let i=0;i<20;i++){
			let keyBtn=$("#ex_keyword").children().eq(i);
			for(let item of keyarr){
				if(keyBtn.text()==item){
					console.log(keyBtn.text());
					$("#ex_keyword").children().eq(i).prop("checked",true);
					keyBtn.css({"background-color":"blue",
						"color":"white"});
				}
			}
		}
		
		
		// 이미지 추가 및 삭제
		$(document).ready(function(){
            // 옵션추가 버튼 클릭시
            $("#addItemBtn").click(function(){
                // item 의 최대번호 구하기
                var lastItemNo = $("#example tr:last").attr("class").replace("item", "");
 
                var newitem = $("#example tr:eq(1)").clone();
                newitem.removeClass();
                newitem.find("td:eq(0)").attr("rowspan", "1");
                newitem.addClass("item"+(parseInt(lastItemNo)+1));
 
                $("#example").append(newitem);
            });

            // 삭제버튼 클릭시
            $(".delBtn").live("click", function(){
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
                 
                // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
                if( clickedRow.find("td:eq(0)").attr("rowspan") ){
                    if( clickedRow.next().hasClass(cls) ){
                        clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
                    }
                }
 
                clickedRow.remove();
 
                // rowspan 조정
                resizeRowspan(cls);
            });
 
            // cls : rowspan 을 조정할 class ex) item1, item2, ...
            function resizeRowspan(cls){
                var rowspan = $("."+cls).length;
                $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
            }
        });
		
	</script>
</body>
</html>




