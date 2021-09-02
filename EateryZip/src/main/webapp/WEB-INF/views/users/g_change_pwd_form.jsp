<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비즈니스회원 로그인</title>
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

	   <form action="${pageContext.request.contextPath}/users/g_change_pwd.do" method="post" id="pwdChangeForm" >
	   
		  <img src="${pageContext.request.contextPath}/resources/images/main.PNG"
		  class="mx-auto d-block mb-2" alt="" />
		  
		  <div class="mb-3 text-center" >
		  	<h3>사업자 비밀번호 바꾸기</h3>
		  </div>
		  <input type="hidden" name="g_id" value="${g_id}" />
	      <div class="mb-3">
	         <input class="form-control" type="text" name="g_newPwd" id="g_newPwd" placeholder="새로운 비밀번호를 입력해주세요."/>
	      </div>
	      <div class="mt-3">
	         <input class="form-control" type="password" name="g_newPwd2" id="g_newPwd2" placeholder="새로운 비밀번호를 한번 더 입력해주세요."/>
	      </div>
	      <div class="mt-3 mb-3" style="text-align:center;">
	      	<button type="submit" class="btn" style="width:450px;">확인</button>
	      </div>
	   </form>
</div>
<script>
   //폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
   document.querySelector("#pwdChange").addEventListener("submit", function(e){
      let pwd1=document.querySelector("#g_newPwd").value;
      let pwd2=document.querySelector("#g_newPwd2").value;
      //새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
      if(pwd1 != pwd2){
         alert("비밀번호를 확인 하세요!");
         e.preventDefault();//폼 전송 막기 
      }
   });
</script>
</body>
</html>