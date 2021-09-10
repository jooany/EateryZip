<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/store/store_insertform.jsp</title>
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
		background-color: #efefef
	}
	
	.inner{
		width:1000px;
		height: 1800px;
		margin:0 auto;
	}
	
	#b_img_f{
		width: 300px;
		height: 200px;
	}
	#storeimageForm{
		display: none;
	}
/*-----------------------------------------------------------------------*/
/*-------------------------------css설정----------------------------------*/

	#container{
		margin-top: 40px;
		display:flex;
		justify-content: space-between;
		align-items: flex-start;
	}
	.content_form {
		width: 700px;
		background-color: white;
	}
	
	input, select, img{
		margin-bottom: 10px;
	}

/*------------------------------ start ------------------------------*/	
	
	img{
		margin-left: 150px;
	}
	
/*------------------------------  end  ------------------------------*/	

/*------------------------------ Ekeyword start ------------------------------*/	
	
	.Ekeyword{
		border: 1px solid rgba(0,0,0,.1);
		background-color: white;
		margin-left: 15px;
    	margin-bottom: 15px;
	}
	
	.Sdate{
		border: 1px solid rgba(0,0,0,.1);
		background-color: white;
		margin-left: 30px;
	}
	
/*------------------------------ Ekeyword  end  ------------------------------*/	
	
/*------------------------------send Btn start------------------------------*/	
	#resetBtn{
		background-color: #fff;
		border: 1px solid #ccc;
		margin-left: 100px;
		margin-top: 50px;
		width: 120px;
	}
	#resetBtn:hover{
		background-color:#ccc;
		color: #fff;
	}
	#saveBtn{
		background-color: rgba(253,83,0);
		border: 1px solid rgba(253,83,0);
		width: 100px;
		margin-top: 50px;
		margin-left: 135px;
		margin-right: 100px;
	}
	#saveBtn:hover{
		background-color:rgba(230,77,0,1);
		color: #fff;
	}
/*------------------------------send Btn end------------------------------*/

</style>
</head>
<body>
	<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
	<div id="container" class="inner">
		<jsp:include page="/navbar/sideBar/sideBar.jsp"></jsp:include>
		
		<div class="content_form">	
		<!-- 사업자번호 -->
			<div>
				<input type="hidden" name="b_id" id="b_id" class="form-control" value="${b_id }">
				<h4>사업자번호</h4>
				<input type="text" name="b_id" id="b_id" class="form-control mb-3" value="${b_id }" disabled />
			</div>
			<!-- dto가 있으면 아래 내역이 보이게 -->
			<c:choose>
				<c:when test="${not empty dto }">
				<form action="${pageContext.request.contextPath}/store/store_update.do" method="post" id="StoreForm">
					<input type="hidden" name="store_img" value="${ empty imgTmp.store_img ? '' : imgTmp.store_img }"/>
					<%-- 상호명 입력란 --%> 	 		
					<div class="wrap_name">
						<fieldset>
							<legend>상호명</legend>
							<input class="form-control" type="text" name="b_name" id="b_name" value="${dto.b_name}">
						</fieldset>
			        </div> 
			        <%-- 주소 입력 (민재님 주소 api설정되시면 복사해서 옮겨놓기) --%>
					<div class="wrap_address">
						<fieldset>
							<legend>주소</legend>
							<input class="form-control" type="text" name="b_Store_Address" id="b_Store_Address" value="${dto.b_Store_Address}">
						</fieldset>
					</div>
					<%-- 업종 선택 --%>
					<div class="wrap_kind">
						<fieldset>
							<legend>업종 선택</legend>
							<select class="form-select" name="b_kind" id="b_kind">
								<option value="한식" ${dto.b_kind eq '한식' ? 'selected' : ''}>한식</option>
								<option value="일식" ${dto.b_kind eq '일식' ? 'selected' : ''}>일식</option>
								<option value="중식" ${dto.b_kind eq '중식' ? 'selected' : ''}>중식</option>
								<option value="양식" ${dto.b_kind eq '양식' ? 'selected' : ''}>양식</option>
								<option value="브런치" ${dto.b_kind eq '브런치' ? 'selected' : ''}>브런치</option>
								<option value="카페" ${dto.b_kind eq '카페' ? 'selected' : ''}>카페</option>
								<option value="Bar" ${dto.b_kind eq 'Bar' ? 'selected' : ''}>Bar</option>
							</select>
						</fieldset>
					</div>
					<%-- 가게 소개글 --%>
					<div class="wrap_intro">
						<fieldset>
							<legend>소개글</legend>
							<div id="intro_Help" class="form-text">30자이내</div>
							<input class="form-control" type="text" name="intro" id="intro" value="${dto.intro}">
						</fieldset>
					</div>
					<%-- 가게 대표이미지 --%>
					<div class="wrap_img">
						<fieldset>
							<legend>대표이미지</legend>
							<a id="store_imglink" href="javascript: ;">
								<c:choose>
									<c:when test="${empty dto.b_img_f }">
										<i id="b_img_f" class="far fa-image"></i>
									</c:when>
									<c:otherwise>
										<img id="b_img_f" class="b_img_f" src="${pageContext.request.contextPath}${dto.b_img_f}"/>
									</c:otherwise>
								</c:choose>
							</a>
						</fieldset>
					</div>
					
					<%--가게 연락처 숫자만 추출하려면 정규표현식 사용 /\d/ /[0-9]/--%>
					<div class="wrap_phone">
						<fieldset>
							<legend>연락처</legend>
							<div id="intro_Help" class="form-text">"-" 포함하여 작성해주세요.</div>
							<input class="form-control" type="text" name="b_Store_phone" id="b_Store_phone" value="${dto.b_Store_phone }">
						</fieldset>
					</div>
					<%-- 가게 영업시간 (영업일 / 오픈시간 / 클로즈시간 / 휴일 )--%>
					<div class="wrap_opneClose">
						<%-- 영업일 선택하기 --%>
						<div class="b_Store_date">
							<fieldset>
								<legend>영업일</legend>
								<div id="intro_Help" class="form-text">수정시 꼭 다시 체크 부탁드립니다.</div>
								<div class="form-group mb-3" id="b_Store_date">
									<c:set var = "testStrd" value = "${dto.b_Store_date }"/>
									<input type="checkbox" class="btn-check excheck" id=""SdateBtn1"" name="b_Store_date" value="월" ${fn:contains(testStrd,'월') ? 'checked data-ischeck=true' : '' }>
									<label class="Sdate btn" for="SdateBtn1">월</label>
									
									<input type="checkbox" class="btn-check excheck" id="SdateBtn2" name="b_Store_date" value="화" ${fn:contains(testStrd,'화') ? 'checked data-ischeck=true' : '' }>
									<label class="Sdate btn" for="SdateBtn2">화</label>
				
									<input type="checkbox" class="btn-check excheck" id="SdateBtn3" name="b_Store_date" value="수" ${fn:contains(testStrd,'수') ? 'checked data-ischeck=true' : '' }>
									<label class="Sdate btn" for="SdateBtn3">수</label>
				
									<input type="checkbox" class="btn-check excheck" id="SdateBtn4" name="b_Store_date" value="목" ${fn:contains(testStrd,'목') ? 'checked data-ischeck=true' : '' }>
									<label class="Sdate btn" for="SdateBtn4">목</label>
				
									<input type="checkbox" class="btn-check excheck" id="SdateBtn5" name="b_Store_date"  value="금" ${fn:contains(testStrd,'금') ? 'checked data-ischeck=true' : '' }>
									<label class="Sdate btn" for="SdateBtn5">금</label>
									
									<input type="checkbox" class="btn-check excheck" id="SdateBtn6" name="b_Store_date" value="토" ${fn:contains(testStrd,'토') ? 'checked data-ischeck=true' : '' }>
									<label class="Sdate btn" for="SdateBtn6">토</label>
									
									<input type="checkbox" class="btn-check excheck" id="SdateBtn7" name="b_Store_date" value="일" ${fn:contains(testStrd,'일') ? 'checked data-ischeck=true' : '' }>
									<label class="Sdate btn" for="SdateBtn7">일</label>
								</div>
							</fieldset>
						</div>
						
						<%-- 스크립트 내부에서의 value값을 가져오기 --%>
						<%-- 영업시간 --%>
						<div>
							<div id="intro_Help" class="form-text">30분단위로 선택해주세요</div>
							<label for="b_open" class="form-label">Open</label>
							<input type="time" id="b_open" name="b_open" min="06:00" max="23:00" step="1800"  value="${dto.b_open }">

							<label for="b_close" class="form-label">Close</label>
							<input type="time" id="b_close" name="b_close" min="07:00" max="23:00" step="1800" value="${dto.b_close }">
						</div>
					</div>
					<%-- 공지사항 필수아님 --%>
					<div class="wrap_notice">
						<fieldset>
							<legend>공지사항</legend>
							<div id="b_notice_Help" class="form-text">50자이내</div>
							<input class="form-control" type="text" id="notice" name="notice" value="${dto.notice}" placeholder="안녕하세요">
						</fieldset>
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
							<div id="intro_Help" class="form-text">수정시 꼭 다시 체크 부탁드립니다.</div>
							<div class="form-group mb-3" id="ex_keyword">
								<c:set var = "testStr" value = "${dto.ex_keyword }"/>
								<input type="checkbox" class="btn-check excheck" id="keywordBtn" name="ex_keyword" autocomplete="off" value="루프탑" ${fn:contains(testStr,'루프탑') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn" >루프탑</label>
								
								<input type="checkbox" class="btn-check excheck" id="keywordBtn2" name="ex_keyword" autocomplete="off" value="주차" ${fn:contains(testStr,'주차') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn2">주차</label>
			
								<input type="checkbox" class="btn-check excheck" id="keywordBtn3" name="ex_keyword" autocomplete="off" value="무선인터넷" ${fn:contains(testStr,'무선인터넷') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn3">무선인터넷</label>
			
								<input type="checkbox" class="btn-check excheck" id="keywordBtn4" name="ex_keyword" autocomplete="off" value="단체석" ${fn:contains(testStr,'단체석') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn4" >단체석</label>
			
								<input type="checkbox" class="btn-check excheck" id="keywordBtn5" name="ex_keyword" autocomplete="off" value="남녀 화장실 구분" ${fn:contains(testStr,'남녀 화장실 구분') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn5">남녀 화장실 구분</label>
								<br />
								<input type="checkbox" class="btn-check excheck" id="keywordBtn6" name="ex_keyword" autocomplete="off" value="키즈존" ${fn:contains(testStr,'키즈존') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn6" >키즈존</label>
								
								<input type="checkbox" class="btn-check excheck" id="keywordBtn7" name="ex_keyword" autocomplete="off" value="노키즈존" ${fn:contains(testStr,'노키즈존') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn7">노키즈존</label>
			
								<input type="checkbox" class="btn-check excheck" id="keywordBtn8" name="ex_keyword" autocomplete="off" value="반려동물동반가능" ${fn:contains(testStr,'반려동물동반가능') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn8" >반려동물동반가능</label>
										
								<input type="checkbox" class="btn-check excheck" id="keywordBtn9" name="ex_keyword" autocomplete="off" value="프라이빗" ${fn:contains(testStr,'프라이빗') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn9" >프라이빗</label>
			
								<input type="checkbox" class="btn-check excheck" id="keywordBtn10" name="ex_keyword" autocomplete="off" value="흡연실" ${fn:contains(testStr,'흡연실') ? 'checked data-ischeck=true' : '' }>
								<label class="Ekeyword btn" for="keywordBtn10">흡연실</label>
							</div>
						</fieldset>
						
					</div>
					<%-- checkKeyword입력 --%>
					<div class="checkKeyword">
						<fieldset>
							<legend>검색키워드</legend>
							<input type="text" class="form-control mb-3" id="checkKeyword" name="checkKeyword" value="${dto.checkKeyword }" />
						</fieldset>
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
							<a id="store_imglink" href="javascript: ;">
								<c:choose>
									<c:when test="${empty dto.b_img_f }">
										<i id="b_img_f" class="far fa-image"></i>
										<div class="invalid-feedback">이미지를 넣어주세요.</div>
									</c:when>
									<c:otherwise>
										<img id="b_img_f" class="b_img_f" src="${pageContext.request.contextPath}${dto.b_img_f}"/>
									</c:otherwise>
								</c:choose>
							</a>
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
										<label class="btn btn-outline-secondary" for="btn-check-outlined_d" >월</label>
										
										<input type="checkbox" class="btn-check" id="btn-check-2-outlined_d" name="b_Store_date" value="화">
										<label class="btn btn-outline-secondary" for="btn-check-2-outlined_d">화</label>
					
										<input type="checkbox" class="btn-check" id="btn-check-3-outlined_d" name="b_Store_date" value="수">
										<label class="btn btn-outline-secondary" for="btn-check-3-outlined_d">수</label>
					
										<input type="checkbox" class="btn-check" id="btn-check-4-outlined_d" name="b_Store_date" value="목">
										<label class="btn btn-outline-secondary" for="btn-check-4-outlined_d" >목</label>
					
										<input type="checkbox" class="btn-check" id="btn-check-5-outlined_d" name="b_Store_date"  value="금">
										<label class="btn btn-outline-secondary" for="btn-check-5-outlined_d">금</label>
										
										<input type="checkbox" class="btn-check" id="btn-check-6-outlined_d" name="b_Store_date" value="토">
										<label class="btn btn-outline-secondary" for="btn-check-6-outlined_d" >토</label>
										
										<input type="checkbox" class="btn-check" id="btn-check-7-outlined_d" name="b_Store_date" value="일">
										<label class="btn btn-outline-secondary" for="btn-check-7-outlined_d">일</label>
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
									<input type="checkbox" class="btn-check" id="keywordBtn" autocomplete="off" name="ex_keyword" value="루프탑">
									<label class="Ekeyword" for="keywordBtn" >루프탑</label>
									
									<input type="checkbox" class="btn-check" id="keywordBtn2" autocomplete="off" name="ex_keyword" value="주차">
									<label class="Ekeyword" for="keywordBtn2">주차</label>
				
									<input type="checkbox" class="btn-check" id="keywordBtn3" autocomplete="off" name="ex_keyword" value="무선인터넷">
									<label class="Ekeyword" for="keywordBtn3">무선인터넷</label>
				
									<input type="checkbox" class="btn-check" id="keywordBtn4" autocomplete="off" name="ex_keyword" value="단체석">
									<label class="Ekeyword" for="keywordBtn4" >단체석</label>
				
									<input type="checkbox" class="btn-check" id="keywordBtn5" autocomplete="off" name="ex_keyword"  value="남녀 화장실 구분">
									<label class="Ekeyword" for="keywordBtn5">남녀 화장실 구분</label>
									
									<input type="checkbox" class="btn-check" id="keywordBtn6" autocomplete="off" name="ex_keyword" value="키즈존">
									<label class="Ekeyword" for="keywordBtn6" >키즈존</label>
									
									<input type="checkbox" class="btn-check" id="keywordBtn7" autocomplete="off" name="ex_keyword" value="노키즈존">
									<label class="Ekeyword" for="keywordBtn7">노키즈존</label>
				
									<input type="checkbox" class="btn-check" id="keywordBtn8" autocomplete="off" name="ex_keyword" value="반려동물동반가능">
									<label class="Ekeyword" for="keywordBtn8" >반려동물동반가능</label>
				
									<input type="checkbox" class="btn-check" id="keywordBtn9" autocomplete="off" name="ex_keyword" value="프라이빗">
									<label class="Ekeyword" for="keywordBtn9" >프라이빗</label>
				
									<input type="checkbox" class="btn-check" id="keywordBtn10" autocomplete="off" name="ex_keyword" value="흡연실">
									<label class="Ekeyword" for="keywordBtn10">흡연실</label>
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
	</div>
	<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
	<script>
		//프로필 이미지 링크를 클릭하면 
		document.querySelector("#store_imglink").addEventListener("click", function(){
			 //input type="file" 을 강제 클릭 시킨다. 
			document.querySelector("#image").click();
		});
		//이미지를 선택했을때 실행할 함수 등록 
		document.querySelector("#image").addEventListener("change", function(){
			
			let form=document.querySelector("#storeimageForm");
			
			// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
			ajaxFormPromise(form)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
				console.log(data);
				let img=`<img id="b_img_f" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
				document.querySelector("#store_imglink").innerHTML=img;
				// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
				document.querySelector("input[name=b_img_f]").value=data.imagePath;
			});
		});
		
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
					keyBtn2.css({"background-color":"rgba(253,83,0)",
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
		
		let dchecks=document.querySelectorAll(".dcheck");
		
		for(let d=0;d<dchecks.length;d++){
			let dbtn=$(dchecks[d]);
			
			dbtn.click(function(){
				
				let ischeck=$(this).attr("data-ischeck");
				
				if(ischeck){ //체크 되어 있다면 
					$(this).next().css({"background-color":"white","color":"black"});
					$(this).removeAttr("data-ischeck");
					$(this).attr('data-ischeck','');
				}else{
					$(this).next().css({"background-color":"rgba(253,83,0)",
						"color":"white"});
					$(this).removeAttr("data-ischeck");
					$(this).attr('data-ischeck','true');
				}
				
			});
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
					keyBtn.css({"background-color":"rgba(253,83,0)",
						"color":"white"});
				}
			}
		};
		
		let exchecks=document.querySelectorAll(".excheck");
		
		for(let k=0;k<exchecks.length;k++){
			let exbtn=$(exchecks[k]);
			
			exbtn.click(function(){
				
				let ischeck=$(this).attr("data-ischeck");
				
				if(ischeck){ //체크 되어 있다면 
					$(this).next().css({"background-color":"white","color":"black"});
					$(this).removeAttr("data-ischeck");
					$(this).attr('data-ischeck','');
				}else{
					$(this).next().css({"background-color":"rgba(253,83,0)",
						"color":"white"});
					$(this).removeAttr("data-ischeck");
					$(this).attr('data-ischeck','true');
				}
				
			});
		}
		

	</script>
</body>
</html>




