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
		<form class="content row g-3" name="insertForm" id="insertForm" action="${pageContext.request.contextPath}/store/store_insert.do" enctype="multipart/form-data" method="post">
			<legend>가게등록</legend>
			<!-- 사업자 번호 입력란 수정 x -->
			<input type="hidden" name="b_id" id="b_id" class="form-control" value="b_id">
			<div class="wrap mb-3">
				<label for="b_id" class="form-label">사업자 번호</label>
				<input type="text" name="b_id" id="b_id" class="form-control" disabled>
			</div>
			<!-- 상호명 입력란 -->
			<div class="box mb-3">
				<label for="b_name" class="form-label">상호명</label>
				<input class="form-control" type="text" name="b_name" id="b_name" placeholder="상호명을 입력하세요." required>
			</div>
			<!-- 주소 입력 (민재님 주소 api설정되시면 복사해서 옮겨놓기) -->
			<div class="box mb-3">
				<label for="b_Store_Address" class="form-label">주소</label>
				<input class="form-control" type="text" name="b_Store_Address" id="b_Store_Address" placeholder="주소를 입력하세요." required>
			</div>
			<div>
				<button id="resetBtn" class="btn btn-light" type="reset">취소</button>
				<button id="saveBtn" class="btn btn-primary" type="submit" onclick="submit()">저장</button>
			</div>
		</form>
	</div>
<!-- 
<script src="${pageContext.request.contextPath}/resources/js.gura_util.js"></script>
 -->
<!--
<script>
-->	
<!--	
	//폼에 submit 이벤트가 발생했을때 실행할 함수 등록
	document.querySelector("#saveBtn").addEventListener("submit", function(e){
		const info = document.insertForm.b_name.value;
		if(info==""){
			document.insertForm.b_name.focuse();
			return
		}
	});
-->	
<!--	
	//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	document.querySelector("#insertForm").addEventListener("submit", function(e){
	    // 사용하기 쉽도록 변수를 선언하여 담아주고,
	    //const b_id = document.querySelector("b_id").value;
	    const b_name = document.querySelector("b_name").value;
	    const b_Store_Address = document.querySelector("b_Store_Address").value;
	    const b_kind = document.querySelector("b_kind").value;
	    const intro = document.querySelector("intro").value;
	    const b_img_f = document.querySelector("b_img_f").value;
	    const b_Store_phone = document.querySelector("b_Store_phone").value;
	    const b_Store_date = document.querySelector("b_Store_date").value;
	    const b_open = document.querySelector("b_open").value;
	    const b_close = document.querySelector("b_close").value;
	    const b_holiday = document.querySelector("b_holiday").value;
	    const notice = document.querySelector("notice").value;
	    //const service = document.querySelector("service").value;
	    const service = new Array();
	    service = service.join("/");
	    //const ex_keyword = document.querySelector("ex_keyword").value;
	    const ex_keyword = new Array();
	    ex_keyword = ex_keyword.join("/");

		if(b_name == null || b_name == ""){
			document.querySelector("b_name").focus();
			e.preventDefault();
		}
		if(b_Store_Address == null || b_Store_Address == ""){
			document.querySelector("b_Store_Address").focus();
			e.preventDefault();
		}
		if(b_kind == null || b_kind == ""){
			document.querySelector("b_kind").focus();
			e.preventDefault();
		}
		if(b_img_f == null || b_img_f == ""){
			document.querySelector("b_img_f").focus();
			e.preventDefault();
		}
		if(b_Store_phone == null || b_Store_phone == ""){
			document.querySelector("b_Store_phone").focus();
			e.preventDefault();
		}
		if(b_Store_date == null || b_Store_date == ""){
			document.querySelector("b_Store_date").focus();
			e.preventDefault();
		}
		if(b_open == null || b_open == ""){
			document.querySelector("b_open").focus();
			e.preventDefault();
		}
		if(b_close == null || b_close == ""){
			document.querySelector("b_close").focus();
			e.preventDefault();
		}
		if(notice == null || notice == ""){
			document.querySelector("notice").focus();
			e.preventDefault();
		}
//		if(service == null || service == ""){
//			document.querySelector("service").focus();		
//			e.preventDefault();
//		}
//		if(ex_keyword == null || ex_keyword == ""){
//			document.querySelector("ex_keyword").focus();
//			e.preventDefault();
//		}

-->		
<!--    
	    $("input:checkbox[name=checkParam]:checked").each(function(){
	    	arrayParam.push($(this).val());

	    });
   
-->
<!-- 
</script>
-->	
</body>
</html>