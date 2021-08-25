<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/store/store_insertform.jsp</title>
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
		<form action="store_insert.do" method="post">
			<legend>가게등록</legend>
			<!-- 사업자 번호 입력란 수정 x -->
			<div>
				<label for="Bid" class="form-label">사업자 번호</label>
				<input type="text" name="Bid" class="form-control" value="${b_id }" disabled>
			</div>
			<!-- 상호명 입력란 -->
			<div class="box mb-3">
				<label for="Bname" class="form-label">상호명</label>
				<input class="form-control" type="text" name="Bname" placeholder="상호명을 입력하세요." required>
			</div>
			<!-- 주소 입력 (민재님 주소 api설정되시면 복사해서 옮겨놓기) -->
			<div class="box mb-3">
				<label for="BStore_Address" class="form-label">주소</label>
				<input class="form-control" type="text" name="BStore_Address" placeholder="주소를 입력하세요." required>
			</div>
			<div>
				<button id="resetBtn" class="btn btn-light" type="reset">취소</button>
				<button id="saveBtn" class="btn btn-primary" type="submit" onclick="submit()">저장</button>
			</div>
		</form>
	</div>
</body>
</html>