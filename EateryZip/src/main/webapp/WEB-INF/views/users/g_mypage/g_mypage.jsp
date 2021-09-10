<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<script src="https://kit.fontawesome.com/eda0c6c5f7.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<style>
	#g_profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	.btn {
	    background-color: #FD5300;
	    border-color: #FD5300;
	    color: #FFF; 
	    text-align:center;
	 }
	 	@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
	   /* 공통 */
   *{
    font-family: 'Gothic A1', sans-serif;
    }
	body{
		background-color: #efefef
	}
</style>
</head>
<body>
<div class="container">
	<a href="${pageContext.request.contextPath}/home.do">(임시)메인페이지가기</a>
	<h1>가입 정보 입니다.</h1>
	<div id="container">
		<div class="left_content">
			<ul class="left_menu">
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage_updateform.do">개인정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/reserve_List.do">예약내역</a></li>
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/takeout_list.do">포장내역</a></li>
				<li><a href="${pageContext.request.contextPath}/users/g_mypage/scrap_List.do">스크랩</a></li>
				<li><a href="javascript:deleteConfirm()">회원탈퇴</a></li>
			</ul>
		</div>
		<h1>${GUserDto.g_profile }</h1>
		<div class="right_content">
		<input type="hidden" name="g_profile" value="${ empty dto.g_profile ? '' : dto.g_profile }"/>
			<table>
				<tr>
					<th>아이디</th>
					<td>${g_id }</td>
				</tr>
				<tr>
					<th>프로필 이미지</th>
					<td>
						<c:choose>
						<c:when test="${empty dto.g_profile }">
							<i id="g_profileImage" class="far fa-user fa-3x"></i>
						</c:when>
						<c:otherwise>
							<img id="g_profileImage" src="${pageContext.request.contextPath}${dto.g_profile}"/>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><a href="javascript:" data-bs-toggle="modal" data-bs-target="#changePwdModal">수정하기</a></td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.g_name }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${dto.g_address }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.g_email }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${dto.g_phone }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${dto.g_regdate }</td>
				</tr>
			</table>
		</div>
	</div>
	<a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage_updateform.do">개인정보 수정</a>
</div>

<!-- 패스워드 변경에 대한 Modal -->
   <div class="modal fade" id="changePwdModal" tabindex="-1" aria-labelledby="changePwdModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
                 <h5 class="modal-title" id="changePwdModalLabel">Password Change</h5>
                 
             </div>
              <div class="modal-body">
                 <form action="${pageContext.request.contextPath}/users/g_mypage/ajax_g_change_pwd.do" method="post" id="changePwdForm">
                    <div class="form-group">
                       <label class="form-label" for="g_pwd">현재 비밀번호</label>
                       <input class="form-control" type="password" name="g_pwd" id="g_pwd"/>
                       <small class="form-text text-muted" >현재 비밀번호를 입력해주세요.</small>
	              	   <div class="invalid-feedback">현재 비밀번호와 다릅니다.</div>
                    </div>
                    <br />
                    <div class="form-group">
                       <label class="form-label" for="g_newPwd">변경 비밀번호</label>
                       <input class="form-control" type="password" name="g_newPwd" id="g_newPwd"/>
		              <small class="form-text text-muted" >5글자~10글자 이내로 입력하세요.</small>
		              <div class="invalid-feedback">형식에 맞지 않는 비밀번호입니다.</div>
                    </div>
                    <br />
                    <div class="form-group">
                       <label class="form-label" for="g_newPwd2">변경 비밀번호 확인</label>
                       <input class="form-control" type="password" name="g_newPwd2" id="g_newPwd2"/>
                       <small class="form-text text-muted" >비밀번호를 다시 한번 입력해주세요.</small>
	                   <div class="invalid-feedback">새로운 비밀번호와 일치하지 않습니다.</div>
                    </div>
                 </form>
              </div>
              <div class="modal-footer">
                 <button id="resetBtn" type="button" class="btn" data-bs-dismiss="modal">Close</button>
                 <button id="changePwdBtn" type="reset" class="btn">변경하기</button>
             </div>
           </div>
        </div>
   </div>  

<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	function deleteConfirm(){
	    const isDelete=confirm("${g_id} 님 탈퇴 하시겠습니까?");
	    if(isDelete){
	  	 fetch("${pageContext.request.contextPath}/users/g_mypage/ajax_g_delete.do")
	  	 .then(function(response){
	  		 return response.json();
	  	 })
	  	 .then(function(data){
	  		 console.log(data);
	  		 if(data.isSuccess){
	  			alert(data.g_id+"님 회원탈퇴 처리 되었습니다.");
	  			location.href="${pageContext.request.contextPath}/home.do";
	  		 }
	  	 }); 
	    }
	 }
	
	   let isPwdValid = false;
	   let isNewPwdValid = false;
	   let isNewPwdValid2 = false;
	   
	   //현재 비밀번호 유효성 검사
	   document.querySelector("#g_pwd").addEventListener("input",function(){
		   document.querySelector("#g_pwd").classList.remove("is-valid");
		   document.querySelector("#g_pwd").classList.remove("is-invalid");
		   
		   const inputPwd=document.querySelector("#g_pwd").value;
		   
		      ajaxPromise("${pageContext.request.contextPath}/users/g_mypage/g_checkpwd.do"
		    		  ,"get","inputPwd="+inputPwd)
		       .then(function(response){
		    	   return response.json();
		       })
		       .then(function(data){
		    	   console.log(data);
		    	   if(!data.isExist){
		    		   isPwdValid=false;
		    		   document.querySelector("#g_pwd").classList.add("is-invalid");
		    	   }else{
		    		   isPwdValid=true;
		               document.querySelector("#g_pwd").classList.add("is-valid");
		    	   }
		       });
	   });
		   
		   //새로운 비밀번호 확인하는 함수 
		   function newcheckPwd(){
			  document.querySelector("#g_newPwd").classList.remove("is-valid");
			  document.querySelector("#g_newPwd").classList.remove("is-invalid");
			  document.querySelector("#g_newPwd2").classList.remove("is-valid");
			  document.querySelector("#g_newPwd2").classList.remove("is-invalid");
			   
		      const newpwd=document.querySelector("#g_newPwd").value;
		      const newpwd2=document.querySelector("#g_newPwd2").value;
		      
		      // 최소5글자 최대 10글자인지를 검증할 정규표현식
		      const reg_pwd=/^.{5,10}$/;
		      if(!reg_pwd.test(newpwd)){
		    	 isNewPwdValid = false;
		         document.querySelector("#g_newPwd").classList.add("is-invalid");
		         return; //함수를 여기서 종료
		      }else{
		    	  isNewPwdValid = true;
		          document.querySelector("#g_newPwd").classList.add("is-valid");
		      }
		      
		      if(newpwd != newpwd2){//비밀번호와 비밀번호 확인란이 다르면    
		    	     isNewPwdValid2 = false;
			         document.querySelector("#g_newPwd2").classList.add("is-invalid");
			         return;
			      }else{
			    	 isNewPwdValid2 = true;
					 document.querySelector("#g_newPwd2").classList.add("is-valid");
			      }
		   }
		   
		   //새 비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
		   document.querySelector("#g_newPwd").addEventListener("input", newcheckPwd);
		   document.querySelector("#g_newPwd2").addEventListener("input", newcheckPwd);
		   
	   
	   //비밀번호 변경 버튼을 눌렀을때 호출되는 함수 등록 
	   
	   document.querySelector("#changePwdBtn").addEventListener("click", function(e){
	      
		  let isFormValid = isPwdValid && isNewPwdValid && isNewPwdValid2;

	      if(!isFormValid){
	    	  e.preventDefault();
	      }else{
	    	  let changePwdForm=document.querySelector("#changePwdForm");
	    	   // gura_util.js 에 있는 함수를 이용해서 ajax 전송한다. 
	    	   ajaxFormPromise(changePwdForm)
	    	   .then(function(response){
	    	      return response.json();
	    	   })
	    	   .then(function(data){
	    	 	  console.log(data);
	    	      if(data.isResult){
	    	         alert(data.g_id+" 님 비밀번호 변경에 성공하셨습니다. 로그인 화면으로 이동합니다.");
	    	         location.href="${pageContext.request.contextPath}/users/g_login_form.do";
	    	      }else{
	    	    	 alert(data.g_id+" 님 비밀번호 변경에 실패했습니다.");
	    	    	 location.href="${pageContext.request.contextPath}/g_mypage/g_mypage.do";
	    	      }
	    	   });
	      }
	   });
	   
	   
	 //ajax 제출할 폼의 참조값 얻어오기
	  
	   document.querySelector("#resetBtn").addEventListener("click",function(){
		   document.querySelector("#g_pwd").classList.remove("is-valid");
		   document.querySelector("#g_pwd").classList.remove("is-invalid");
		   document.querySelector("#g_newPwd").classList.remove("is-valid");
		   document.querySelector("#g_newPwd").classList.remove("is-invalid");
		   document.querySelector("#g_newPwd2").classList.remove("is-valid");
		   document.querySelector("#g_newPwd2").classList.remove("is-invalid");
		   document.querySelector("#g_pwd").value="";
		   document.querySelector("#g_newPwd").value="";
		   document.querySelector("#g_newPwd2").value="";
	   });
</script>


</body>
</html>