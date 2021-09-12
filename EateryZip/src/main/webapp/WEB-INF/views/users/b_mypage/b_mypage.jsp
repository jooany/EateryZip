<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://kit.fontawesome.com/eda0c6c5f7.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
   /* 공통 */
   *{
    font-family: 'Gothic A1', sans-serif;
    margin-top:0;
    }
	body{
		background-color:rgba(0,0,0,.04)!important;
	}
	
	.inner{
		width:1000px;
		height: 700px;
		margin:0 auto;
		display:flex;
		justify-content: space-between;
		margin-top: 40px;
	}
/*-------------------------------------------------------------------------*/
	.btn {
	    background-color: #FD5300;
	    border-color: #FD5300;
	    color: #FFF; 
	    text-align:center;
	 }
/*-------------------민재님이 설정해주신 비번수정 modal css 만지지 마시오----------------------------------*/
/*------------------------------right_content start------------------------------*/

	#right_content{
		width: 700px;
		height: fit-content;
		background-color: white;
		padding: 20px 0px 20px 40px;
	}
	
	table{
	    width: 600px;
		margin:0 auto;
		text-align: left;
	}
	#right_content tr{
		border-bottom: 1px solid #efefef;
    	margin-bottom: 20px;
    	line-height: 36px;
	}
	th{
		width: 100px;
		line-height: 50px;
	}
	td {
	    padding-left: 50px;
	}

</style>

</head>
<body>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>

	<div id="container" class="inner" style="display:flex; justify-content:space-between;">
	<jsp:include page="/navbar/sideBar/b_sideBar.jsp"></jsp:include>
	<div id="right_content">
		<table>
			<tr>
				<th>사업자번호</th>
				<td>${b_id }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><a href="javascript:" data-bs-toggle="modal" data-bs-target="#changePwdModal">수정하기</a></td>
			</tr>
			<tr>
				<th>대표자</th>
				<td>${dto.b_name }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${dto.b_address }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${dto.b_email } ${dto.b_email2 }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${dto.b_phone }</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${dto.b_regdate }</td>
			</tr>
		</table>
	</div>
	<!-- 안내사항 <div class="introduce">회원탈퇴는 담당자에게 문의 부탁드립니다. 02-333-3333</div> -->
</div>

<!-- 패스워드 변경에 대한 Modal -->
   <div class="modal fade" id="changePwdModal" tabindex="-1" aria-labelledby="changePwdModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
                 <h5 class="modal-title" id="changePwdModalLabel">Password Change</h5>
                 
             </div>
              <div class="modal-body">
                 <form action="${pageContext.request.contextPath}/users/b_mypage/ajax_b_change_pwd.do" method="post" id="changePwdForm">
                    <div class="form-group">
                       <label class="form-label" for="b_pwd">현재 비밀번호</label>
                       <input class="form-control" type="password" name="b_pwd" id="b_pwd"/>
                       <small class="form-text text-muted" >현재 비밀번호를 입력해주세요.</small>
	              	   <div class="invalid-feedback">현재 비밀번호와 다릅니다.</div>
                    </div>
                    <br />
                    <div class="form-group">
                       <label class="form-label" for="b_newPwd">변경 비밀번호</label>
                       <input class="form-control" type="password" name="b_newPwd" id="b_newPwd"/>
		              <small class="form-text text-muted" >5글자~10글자 이내로 입력하세요.</small>
		              <div class="invalid-feedback">형식에 맞지 않는 비밀번호입니다.</div>
                    </div>
                    <br />
                    <div class="form-group">
                       <label class="form-label" for="b_newPwd2">변경 비밀번호 확인</label>
                       <input class="form-control" type="password" name="b_newPwd2" id="b_newPwd2"/>
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

	
	
	let isPwdValid = false;
	let isNewPwdValid = false;
	let isNewPwdValid2 = false;
	
	//현재 비밀번호 유효성 검사
	document.querySelector("#b_pwd").addEventListener("input",function(){
		   document.querySelector("#b_pwd").classList.remove("is-valid");
		   document.querySelector("#b_pwd").classList.remove("is-invalid");
		   
		   const inputPwd=document.querySelector("#b_pwd").value;
		   
		      ajaxPromise("${pageContext.request.contextPath}/users/b_mypage/b_checkpwd.do"
		    		  ,"get","inputPwd="+inputPwd)
		       .then(function(response){
		    	   return response.json();
		       })
		       .then(function(data){
		    	   console.log(data);
		    	   if(!data.isExist){
		    		   isPwdValid=false;
		    		   document.querySelector("#b_pwd").classList.add("is-invalid");
		    	   }else{
		    		   isPwdValid=true;
		               document.querySelector("#b_pwd").classList.add("is-valid");
		    	   }
		       });
	});
		   
		   //새로운 비밀번호 확인하는 함수 
		   function newcheckPwd(){
			  document.querySelector("#b_newPwd").classList.remove("is-valid");
			  document.querySelector("#b_newPwd").classList.remove("is-invalid");
			  document.querySelector("#b_newPwd2").classList.remove("is-valid");
			  document.querySelector("#b_newPwd2").classList.remove("is-invalid");
			   
		      const newpwd=document.querySelector("#b_newPwd").value;
		      const newpwd2=document.querySelector("#b_newPwd2").value;
		      
		      // 최소5글자 최대 10글자인지를 검증할 정규표현식
		      const reg_pwd=/^.{5,10}$/;
		      if(!reg_pwd.test(newpwd)){
		    	 isNewPwdValid = false;
		         document.querySelector("#b_newPwd").classList.add("is-invalid");
		         return; //함수를 여기서 종료
		      }else{
		    	  isNewPwdValid = true;
		          document.querySelector("#b_newPwd").classList.add("is-valid");
		      }
		      
		      if(newpwd != newpwd2){//비밀번호와 비밀번호 확인란이 다르면    
		    	     isNewPwdValid2 = false;
			         document.querySelector("#b_newPwd2").classList.add("is-invalid");
			         return;
			      }else{
			    	 isNewPwdValid2 = true;
					 document.querySelector("#b_newPwd2").classList.add("is-valid");
			      }
		   }
		   
		   //새 비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
		   document.querySelector("#b_newPwd").addEventListener("input", newcheckPwd);
		   document.querySelector("#b_newPwd2").addEventListener("input", newcheckPwd);
		   
	
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
	 	         alert("수정에 성공하셨습니다. 로그인 화면으로 이동합니다.");
	 	         location.href="${pageContext.request.contextPath}/users/b_login_form.do";
	 	      }else{
	 	    	 alert("수정 실패");
	 	    	 location.href="${pageContext.request.contextPath}/home.do";
	 	      }
	 	   });
	   }
	});
	
	
	//ajax 제출할 폼의 참조값 얻어오기
	
	document.querySelector("#resetBtn").addEventListener("click",function(){
		   document.querySelector("#b_pwd").classList.remove("is-valid");
		   document.querySelector("#b_pwd").classList.remove("is-invalid");
		   document.querySelector("#b_newPwd").classList.remove("is-valid");
		   document.querySelector("#b_newPwd").classList.remove("is-invalid");
		   document.querySelector("#b_newPwd2").classList.remove("is-valid");
		   document.querySelector("#b_newPwd2").classList.remove("is-invalid");
		   document.querySelector("#b_pwd").value="";
		   document.querySelector("#b_newPwd").value="";
		   document.querySelector("#b_newPwd2").value="";
	});
</script>
</body>
<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
</html>