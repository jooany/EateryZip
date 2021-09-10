<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
   /* 공통 */
   *{
    font-family: 'Gothic A1', sans-serif;
    }
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
	   <c:choose>
	   		<c:when test="${not empty cookie.savedb_Id}">
	   			<form action="${pageContext.request.contextPath}/users/ajax_b_login.do" method="post" id="loginForm" >
	   				
				  <img src="${pageContext.request.contextPath}/resources/images/main.PNG"
				  class="mx-auto d-block mb-4" alt="" />
					   
			      <div class="mb-3">
			         <input class="form-control" type="text" name="b_id" id="b_id" value="${cookie.savedb_Id.value}" placeholder="사업자번호 입력"/>
			      </div>
			      <div class="mt-3">
			         <input class="form-control" type="password" name="b_pwd" id="b_pwd" value="${cookie.savedb_Pwd.value}" placeholder="비밀번호 입력"/>
			      </div>
			      <div class="checkbox mb-3 mt-3" style="text-align:center;">
		              <label>
		                 <input type="checkbox" name="isSave" value="yes" checked> 사업자 로그인 정보 저장

		              </label>
		          </div>
			      <div class="mt-3 mb-3" style="text-align:center;">
			      	<button id="loginBtn" type="button" class="btn" style="width:450px;">로그인</button>
			      </div>
			      <div class="search_wrap">
				    <div class="search_wrap_child" >
				      <a href="${pageContext.request.contextPath}/users/b_find_id_form.do" class="link">사업자번호 찾기</a>
				    </div>
				    <span>|</span>
				    <div class="search_wrap_child">
				      <a href="${pageContext.request.contextPath}/users/b_find_pwd_form.do" class="link">비밀번호 찾기</a>
				    </div>
				     <span>|</span>
				    <div class="search_wrap_child">
				      <a href="${pageContext.request.contextPath}/users/select_signup_form.do" class="link">회원 가입</a>
				    </div>
		  		  </div>
			      <div class="mt-3" style="text-align:center;">
			      	<a href="${pageContext.request.contextPath}/users/g_login_form.do">일반회원 로그인시 여기를 눌러주세요.</a>
			      </div>	
			   </form>
	   		
	   		</c:when>
	   		<c:otherwise>
	   			<form action="${pageContext.request.contextPath}/users/ajax_b_login.do" method="post" id="loginForm" >
	   			  
				  <img src="${pageContext.request.contextPath}/resources/images/main.PNG"
				  class="mx-auto d-block mb-4" alt="" />
					   
			      <div class="mb-3">
			         <input class="form-control" type="text" name="b_id" id="b_id" placeholder="사업자번호 입력"/>
			      </div>
			      <div class="mt-3">
			         <input class="form-control" type="password" name="b_pwd" id="b_pwd" placeholder="비밀번호 입력"/>
			      </div>
			      <div id="checkbox" class="checkbox mb-3 mt-3" style="text-align:center;">
		              <label>
		                 <input type="checkbox" name="isSave" value="yes"> 사업자 로그인 정보 저장
		              </label>
		          </div>
			      <div class="mt-3 mb-3" style="text-align:center;">
			      	<button id="loginBtn" type="button" class="btn" style="width:450px;">로그인</button>
			      </div>
			      <div class="search_wrap">
				    <div class="search_wrap_child" >
				      <a href="${pageContext.request.contextPath}/users/b_find_id_form.do" class="link">사업자번호 찾기</a>
				    </div>
				    <span>|</span>
				    <div class="search_wrap_child">
				      <a href="${pageContext.request.contextPath}/users/b_find_pwd_form.do" class="link">비밀번호 찾기</a>
				    </div>
				     <span>|</span>
				    <div class="search_wrap_child">
				      <a href="${pageContext.request.contextPath}/users/select_signup_form.do" class="link">회원 가입</a>
				    </div>
		  		  </div>
			      <div class="mt-3" style="text-align:center;">
			      	<a href="${pageContext.request.contextPath}/users/g_login_form.do">일반회원 로그인시 여기를 눌러주세요.</a>
			      </div>	
			   </form>
	   		</c:otherwise>
	   </c:choose>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	document.querySelector("#loginBtn").addEventListener("click",function(){
		let loginForm = document.querySelector("#loginForm");
		ajaxFormPromise(loginForm)
		.then(function(response){
			return response.json();
		})
		.then(function(login){
			console.log(login);
				if(login.isLogin){
					  swal({
	    				  title: "로그인 성공!",
	    				  icon: "success",
	    				  button: "이동하기"
	    			  })
	    			  .then((logingForm)=>{
	    				 if(logingForm){
	    					 location.href="${pageContext.request.contextPath}/users/b_mypage/b_mypage.do";
	    				 } 
				  });    
			  }else{
				  swal({  title: "검색 실패!",
					  text: "일치한 정보가 없습니다.",
					  icon: "error", 
					  buttons: ["재로그인", "아이디찾기"],
			  })
			  .then((logingForm)=>{
				 if(logingForm){
					 location.href="${pageContext.request.contextPath}/users/b_find_id_form.do";
				 }else{
					 location.href="${pageContext.request.contextPath}/users/b_login_form.do";
				 } 
			  }); 
			  }
		});
	})

</script>
</body>
</html>