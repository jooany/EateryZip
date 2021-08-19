<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게등록</title>
</head>
<body>
	<div id="container">
		<form action="">
			<!--<fieldset disabled>-->
				<legend>가게등록</legend>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">사업자 번호</label>
					<input type="text" id="disabledTextInput" class="form-control" placeholder="111-11-11111">
				</div>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">상호명</label>
					<input class="form-control" type="text" placeholder="Default input">
				</div>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">주소</label>
					<input class="form-control" type="text" placeholder="Default input">
				</div>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">업종</label>
					<select class="form-select" aria-label="Default select example">
						<option selected>업종을 선택하세요.</option>
						<option value="1">한식</option>
						<option value="2">일식</option>
						<option value="3">중식</option>
						<option value="4">양식</option>
						<option value="5">브런치</option>
						<option value="6">카페</option>
						<option value="7">Bar</option>
					</select>
				</div>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">소개글</label>
					<input class="form-control" type="text" placeholder="안녕하세요">
				</div>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">대표이미지</label>
					<img src="https://cdn.dominos.co.kr/admin/upload/goods/20200311_5MGKbxlW.jpg" alt="슈퍼디럭스 피자" style="width: 100px; height: 100px;" />
				</div>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">연락처</label>
					<input class="form-control" type="text" placeholder="02-1111-1111">
				</div>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">영업시간</label>
					<input class="form-control" type="text" placeholder="안녕하세요">
				</div>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">영업시간</label>
					<select class="form-select" aria-label="Default select example">
						<option selected>영업시간</option>
						<option value="1">매일</option>
						<option value="2">주말</option>
						<option value="3">평일</option>
					</select>
					<label for="disabledTextInput" class="form-label">Open</label>
					<select name="OpenTime" id="OpenTime" class="form-control">
						<script>
							for(let i = 0; i<49; i++){
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
					<label for="disabledTextInput" class="form-label">Close</label>
					<select name="CloseTime" id="CloseTime" class="form-control">
						<script>
							for(let i = 0; i<49; i++){
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
					<select class="form-select" aria-label="Default select example">
						<option selected>휴일</option>
						<option value="1">월요일</option>
						<option value="2">화요일</option>
						<option value="3">수요일</option>
						<option value="4">목요일</option>
						<option value="5">금요일</option>
						<option value="6">토요일</option>
						<option value="7">일요일</option>
					</select>
				</div>
				<div class="mb-3">
					<label for="disabledTextInput" class="form-label">공지사항</label>
					<input class="form-control" type="text" placeholder="50자이내">
				</div>
				<div>
					<label for="disabledTextInput" class="form-label">서비스</label>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label" for="flexCheckDefault">
						예약
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
						<label class="form-check-label" for="flexCheckChecked">
						방문포장
						</label>
					</div>
				</div>
				<div>
					<label for="disabledTextInput" class="form-label">편의사항 / 기타</label>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						루프탑
						</label>
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						주차
						</label>
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						무선인터넷
						</label>
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						단체석
						</label>
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						남/녀 화장실 구분
						</label>
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						키즈존
						</label>
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						노키즈존
						</label>
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						반려동물동반
						</label>
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						프라이빗
						</label>
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked">
						흡연실
						</label>
					</div>
				</div>
			<!--</fieldset>-->
			<button type="reset">취소</button>
			<button type="submit">확인</button>
		</form>		
	</div>
</body>
</html>