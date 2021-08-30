<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	.btn-primary {
	    background-color: #FD5300;
	    border-color: #FD5300;
	    color: #FFF; }
</style>
</head>
<body>
<div class="container w-50">
	<img src="${pageContext.request.contextPath}/resources/images/main.PNG"
   	class="mx-auto d-block mt-3 mb-3" alt="" />
 
   <form action="b_signup.do" method="post" id="myForm">
   	  <input type="hidden" name="grade" value="business" />
   	  
	  <div class="mb-2">
		   <label for="b_id" class="col-form-label mb-1">사업자번호</label>
		   <input class="form-control" type="text" name="b_id" id="b_id" placeholder="사업자 번호(숫자8자리)를 입력해주세요."/>
		   <div class="invalid-feedback">등록되지 않은 사업자 번호입니다.</div>
	  </div> 
	    
      <div class="mb-2">
         <label class="col-form-label mb-1" for="b_pwd">비밀번호</label>
         <input class="form-control" type="password" name="b_pwd" id="b_pwd" placeholder="5글자~10글자 이내로 입력해주세요."/>
         <div class="invalid-feedback">형식에 맞지 않는 비밀번호입니다.</div>
      </div>
      
      <div class="mb-2">
         <label class="col-form-label mb-1" for="b_pwd2">비밀번호 확인</label>
         <input class="form-control" type="password" name="b_pwd2" id="b_pwd2" placeholder="비밀번호를 재입력해주세요."/>
         <div class="invalid-feedback">비밀번호를 재입력 해주세요.</div>
      </div>
      
      <div class="mb-2">
         <label class="col-form-label mb-1" for="b_name">이름</label>
         <input class="form-control" type="text" name="b_name" id="b_name" placeholder="이름을 입력해주세요."/>
         <div class="invalid-feedback">이름을 입력해주세요.</div>
      </div>
      
      <!-- 주소API 적용 시 변경 -->
      <div class="mb-2">
         <label class="col-form-label mb-1" for="b_address">(초안)주소[주소API체크중]</label>
         <input class="form-control" type="text" name="b_address" id="b_address" placeholder="주소를 입력해주세요."/>
      </div>
      
      <!-- 이메일 폼 형식 변경 가능 -->
      <div class="mb-2">
         <label class="col-form-label mb-1" for="b_email">(초안)이메일[select형변경가능]</label>
         <input class="form-control" type="text" name="b_email" id="b_email" placeholder="이메일을 입력해주세요.(@ 포함)"/>
      </div> 
      
      <div class="mb-2">
         <label class="col-form-label mb-1" for="b_phone">연락처</label>
         <input class="form-control" type="text" name="b_phone" id="b_phone" placeholder=" - 없이 연락처를 입력해주세요."/>
         <div class="invalid-feedback">연락처 형식에 맞지 않습니다.</div>
      </div>
      
      <div class="mt-4 mb-5" style="text-align:center;">
      <a href="${pageContext.request.contextPath}/home.do" type="button" class="btn btn-primary">취소</a>
      <button type="submit" class="btn btn-primary">가입</button>
      </div>
      
   </form>
</div>

<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
   //아이디, 비밀번호, 이메일의 유효성 여부를 관리한 변수 만들고 초기값 대입
   let isIdValid=false;
   let isPwdValid=false;
   let isEmailValid=false;
   let isNameValid=false;
   let isPhoneValid=false;

   //아이디를 입력했을때(input) 실행할 함수 등록 
   document.querySelector("#b_id").addEventListener("input", function(){
      //일단 is-invalid is-valid 클래스를 제거한다.
      document.querySelector("#b_id").classList.remove("is-valid");
      document.querySelector("#b_id").classList.remove("is-invalid");
      
      //1. 입력한 아이디 value 값 읽어오기  
      let inputId=this.value;
      //입력한 아이디를 검증할 정규 표현식
      const reg_id=/^[0-9].{7}$/;
	      //만일 입력한 아이디가 정규표현식과 매칭되지 않는다면
	      if(!reg_id.test(inputId)){
	         isIdValid=false; //아이디가 매칭되지 않는다고 표시하고 
	         // is-invalid 클래스를 추가한다. 
	         document.querySelector("#b_id").classList.add("is-invalid");
	         return; //함수를 여기서 끝낸다 (ajax 전송 되지 않도록)
	      }
      
      //2. util 에 있는 함수를 이용해서 ajax 요청하기
      ajaxPromise("${pageContext.request.contextPath}/users/b_checkid.do", "get", "inputId="+inputId)
      .then(function(response){
         return response.json();
      })
      .then(function(data){
         console.log(data);
         //data 는 {isExist:true} or {isExist:false} 형태의 object 이다.
         if(data.isExist){//만일 존재한다면
            //사용할수 없는 아이디라는 피드백을 보이게 한다. 
            isIdValid=false;
            // is-invalid 클래스를 추가한다. 
            document.querySelector("#b_id").classList.add("is-invalid");
         }else{
            isIdValid=true;
            document.querySelector("#b_id").classList.add("is-valid");
         }
      });
   });
   
   //비밀 번호 형식을 확인하는 함수 
   function checkPwd(){
	  document.querySelector("#b_pwd").classList.remove("is-valid");
	  document.querySelector("#b_pwd").classList.remove("is-invalid");
	  document.querySelector("#b_pwd2").classList.remove("is-valid");
	  document.querySelector("#b_pwd2").classList.remove("is-invalid");
	   
      const pwd=document.querySelector("#b_pwd").value;
      const pwd2=document.querySelector("#b_pwd2").value;
      
      // 최소5글자 최대 10글자인지를 검증할 정규표현식
      const reg_pwd=/^.{5,10}$/;
      if(!reg_pwd.test(pwd)){
         isPwdValid=false;
         document.querySelector("#b_pwd").classList.add("is-invalid");
         return; //함수를 여기서 종료
      }else{
    	  isPwdValid=true;
          document.querySelector("#b_pwd").classList.add("is-valid");
      }
      
      if(pwd != pwd2){//비밀번호와 비밀번호 확인란이 다르면      
	         isPwdValid=false;
	         document.querySelector("#b_pwd2").classList.add("is-invalid");
	         return;
	      }else{
	         isPwdValid=true;
	         document.querySelector("#b_pwd2").classList.add("is-valid");
	      }
   }
   
   //비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
   document.querySelector("#b_pwd").addEventListener("input", checkPwd);
   document.querySelector("#b_pwd2").addEventListener("input", checkPwd);
   
   //이름을 입력했을 때 실행할 함수 등록
   document.querySelector("#b_name").addEventListener("input",function(){
	  document.querySelector("#b_name").classList.remove("is-valid");
	  document.querySelector("#b_name").classList.remove("is-invalid");
	  
	  let inputName=this.value;
	  const reg_name=/^.{2,8}$/;
	  if(!reg_name.test(inputName)){
		  isNameValid=false;
		  document.querySelector("#b_name").classList.add("is-invalid");
		  return;
	  }else{
		  isNameValid=true;
		  document.querySelector("#b_name").classList.add("is-valid");
	  }
   });
   
   //이메일을 입력했을때 실행할 함수 등록
   document.querySelector("#b_email").addEventListener("input",function(){
	   document.querySelector("#b_email").classList.remove("is-valid");
	   document.querySelector("#b_email").classList.remove("is-invalid");

      const inputEmail=this.value;
      const reg_email=/@/;
      if(reg_email.test(inputEmail)){
         isEmailValid=true;
  	     document.querySelector("#b_email").classList.add("is-valid");
      }else{
         isEmailValid=false;
         document.querySelector("#b_email").classList.add("is-invalid");
      }
   });
   
   document.querySelector("#b_phone").addEventListener("input",function(){
	   document.querySelector("#b_phone").classList.remove("is-valid");
	   document.querySelector("#b_phone").classList.remove("is-invalid");
	   
	   const inputPhone=this.value;
	   const reg_phone=/^[0-9].{9,10}$/;
	   	if(!reg_phone.test(inputPhone)){
	   		isPhoneValid=false;
	   		document.querySelector("#b_phone").classList.add("is-invalid");
	   	}else{
	   		isPhoneValid=true;
	   		document.querySelector("#b_phone").classList.add("is-valid");
	   	}
   });
   
   
   //폼에 submit 이벤트가 발생했을때 실행할 함수 등록
   document.querySelector("#myForm").addEventListener("submit", function(e){
      /*
         입력한 아이디, 비밀번호, 이메일의 유효성 여부를 확인해서 하나라도 유효 하지 않으면
         e.preventDefault(); 
         가 수행 되도록 해서 폼의 제출을 막아야 한다. 
      */
      //폼 전체의 유효성 여부 알아내기 
      let isFormValid = isIdValid && isPwdValid && isEmailValid && isNameValid && isPhoneValid;
      if(!isFormValid){//폼이 유효하지 않으면
         //폼 전송 막기 
         e.preventDefault();
      }   
   });
</script>
</body>
</html>




