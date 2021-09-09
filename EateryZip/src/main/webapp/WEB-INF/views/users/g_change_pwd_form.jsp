<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	.container{
	  width: 100%;
	  height: 100vh;
	  display: -webkit-box;
	  display: -ms-flexbox;
	  display: flex;
	  -webkit-box-align: center;
	  -ms-flex-align: center;
	  align-items: center;
	  -webkit-box-pack: center;
	  -ms-flex-pack: center;
	  justify-content: center;
	  
	}
		.btn {
	    background-color: #FD5300;
	    border-color: #FD5300;
	    color: #FFF; 
	    text-align:center;
	 }
	.link{
	   color:black!important;
	}
	form{
		
		width:450px;
	}
	#g_id{
		width:450px;
	}
	#g_pwd{
		width:450px;
	}
	.search_wrap{
		margin-top:20px;
		display:flex;
		justify-content:center;
	}
	.search_wrap span{
		color:rgba(0,0,0,.7);
	}
	.search_wrap .search_wrap_child{
		text-align:center;
	}
	.search_wrap .search_wrap_child .link{
		text-decoration:none!important;
		margin:0 7px;
	}
	.border_right{
		border-right:1px solid black;
	}
	.border_left{
		border-left:1px solid black;
	}
</style>
</head>
<body>
<div class="container">

	   <form action="${pageContext.request.contextPath}/users/ajax_g_change_pwd.do" method="post" id="changePwdForm" >
	   
		  <img src="${pageContext.request.contextPath}/resources/images/main.PNG"
		  class="mx-auto d-block mb-2" alt="" />
		  
		  <div class="mb-3 text-center" >
		  	<h3>아이디 비밀번호 바꾸기</h3>
		  </div>
		  <input type="hidden" name="g_id" value="${param.g_id}" />
	      <div class="mb-3">
	         <input class="form-control" type="password" name="g_newPwd" id="g_newPwd" placeholder="새로운 비밀번호를 입력해주세요."/>
	         <small class="form-text text-muted" >5글자~10글자 이내로 입력하세요.</small>
		      <div class="invalid-feedback">형식에 맞지 않는 비밀번호입니다.</div>
	      </div>
	      <div class="mt-3">
	         <input class="form-control" type="password" id="g_newPwd2" placeholder="새로운 비밀번호를 한번 더 입력해주세요."/>
	         <small class="form-text text-muted" >동일한 비밀번호를 다시 한번 입력해주세요.</small>
	         <div class="invalid-feedback">새로운 비밀번호와 일치하지 않습니다.</div>
	      </div>
	      <div class="mt-3 mb-3" style="text-align:center;">
	      	<button id="changeBtn" type="button" class="btn" style="width:350px;">비밀번호 변경</button>
	      </div>
	   </form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	let isNewPwdValid = false;
	let isNewPwdValid2 = false;

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
	   
   
	   document.querySelector("#changeBtn").addEventListener("click", function(e){
		      
			  let isFormValid = isNewPwdValid && isNewPwdValid2;
			  console.log(isNewPwdValid);
			  console.log(isNewPwdValid2);

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
		    	    	  swal({
		    				  title: "비밀번호 변경 성공!",
		    				  text: "로그인 페이지로 이동합니다.",
		    				  icon: "success",
		    				  button: "이동하기"
		    			  })
		    			  .then((logingForm)=>{
		    				 if(logingForm){
		    					 location.href="${pageContext.request.contextPath}/users/g_login_form.do";
		    				 } 
		    			  });  
		    	      }
		    	   });
		      }
		   });
</script>
</body>
</html>