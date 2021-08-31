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

	   <form action="${pageContext.request.contextPath}/users/" method="post" >
	   
		  <img src="${pageContext.request.contextPath}/resources/images/main.PNG"
		  class="mx-auto d-block mb-2" alt="" />
		  
		  <div class="mb-3 text-center" >
		  	<h3>사업자 비밀번호 찾기</h3>
		  </div>
	      <div class="mb-3">
	         <input class="form-control" type="text" name="b_id" id="b_id" placeholder="회원가입 시 사업자번호를 입력해주세요."/>
	      </div>
	      <div class="mt-3">
	         <input class="form-control" type="password" name="b_phone" id="b_phone" placeholder="회원가입 시 핸드폰번호를 입력해주세요"/>
	      </div>
	      <div class="mt-3 mb-3" style="text-align:center;">
	      	<button type="submit" class="btn" style="width:450px;">확인</button>
	      </div>
	      <div class="search_wrap">
		    <div class="search_wrap_child" >
		      <a href="${pageContext.request.contextPath}/users/b_login_form.do" class="link">로그인</a>
		    </div>
		    <span>|</span>
		    <div class="search_wrap_child">
		      <a href="${pageContext.request.contextPath}/users/b_find_id_form.do" class="link">사업자번호 찾기</a>
		    </div>
		     <span>|</span>
		    <div class="search_wrap_child">
		      <a href="${pageContext.request.contextPath}/users/select_signup_form.do" class="link">회원 가입</a>
		    </div>
  		  </div>
  		  <div class="mt-3" style="text-align:center;">
	      	<a href="${pageContext.request.contextPath}/users/g_find_id_form.do">일반회원 비밀번호 찾기시 여기를 눌러주세요.</a>
	      </div>	
	   </form>
</div>
</body>
</html>