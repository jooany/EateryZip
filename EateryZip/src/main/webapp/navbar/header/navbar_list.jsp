<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" 
   href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	.container{
		width: 1100px!important;
		border-bottom: 1px solid #999;
		display:flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.wrap_logo img {
		width : 120px;
		height : 80px;
		margin-top: 10px;
	}
	.dropbtn {
		border-radius: 50%;
		background-color:#ededed;
		color: white;
		padding: 16px;
		font-size: 16px;
		border: none;
		width : 45px;
		height: 45px;
		background-size: cover;
		margin: auto;
	}
	
	#g_profileImage{
		font-size:20px;
		margin-left:-2px;
		margin-top:-2px;
	}
	
	#testForm{
		display: flex;
		margin-top: 10px;
	}
	.content_search input {
		width: 400px;
		height: 45px;
		
	}
	#searchBtn{
		background-color: rgba(253,83,0);
		color: white;
		width: 45px;
		height: 45px;
		border-radius: 0px 10px 10px 0px;
	}
	
	.content_profile {
		position: relative;
		margin-right: 10px;
		margin-top: 10px;
		display: flex;
		box-sizing:border-box;
	}
	
	.dropdown-content {
		display: none;
		position: absolute;
		background-color: #ededed;
		min-width: 160px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.5);
		z-index: 9999;
	}
	
	.dropdown-content a {
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
	}
	
	.dropdown-content a:hover {
		background-color: rgba(253,83,0);
		color : white!important;
	}
	
	.loginproflie:hover .dropdown-content {
		display: block;
	}
	
	.loginproflie:hover .dropbtn {
		background-color: rgba(253,83,0);
	}
	
	.g_login_css {
		align-items: center;
		height: 40px;
		margin-left: 50px;
	}
	
	.g_login_css .btn {
		width: 100px;
		height: 40px;
	  
	}
	
	.g_login_css .btnF{
		border: 1px solid #ededed;
	}
	.g_login_css .btnS{
		background-color: rgba(253,83,0);
		color: white!important;
	}
	
	.g_login_css a{
		display: inline-block;
		font-size: 16px;
		margin: auto;
	}
	.g_login_css a:hover{
		color:white!important;
	}
	
	.g_login_css .btnF:hover{
		border: 1px solid #ededed;
		background-color: #ededed;
	}
	
	.g_login_css .btnS:hover{
		background-color: rgba(253,83,0,0.7);
	}
   
</style>
<nav id="navbar">
   <div class="container">
   	 <div style="display:flex; align-items:center;">
      <div class="content_logo">
          <a class="wrap_logo" href="${pageContext.request.contextPath}/">
               <img src="${pageContext.request.contextPath}/navbar/images/logo.png" alt="">
          </a>
       </div>
       <div class="content_search">
           <form id="testForm" action="${pageContext.request.contextPath}/eatery/list.do?keyword=" class="search_wrap search_wrapper"> <!-- 가게리스트로 연결 -->
               <div class="search_wrap">
                   <input type="text" class="keyword" placeholder="  통합검색" name="keyword">
               </div>
               <button type="submit" id="searchBtn">
                   <i class="fas fa-search"></i>
               </button>
           </form>
       </div>
      </div>
      <div class="content_profile" id="content_profile">               
         <c:choose>
            <c:when test="${not empty g_id}">
               <span class="navbar-text me-2">
                  <c:if test="${empty g_profile }">
                     <div class="loginproflie">
                        <button class="dropbtn"><i id="g_profileImage" class="far fa-user"></i></button>
                        <div class="dropdown-content">
                           <a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a>
                           <a href="#">스크랩내역</a>
                           <a href="#">포장내역</a>
                           <a href="#">예약내역</a>
                           <a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
                        </div>
                     </div>
                  </c:if>
                  <c:if test="${not empty g_profile }">
                     <a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do"><img id="g_profileImage" src="${pageContext.request.contextPath}${dto.g_profile}" /></a>
                     <div class="loginproflie">
                        <button class="dropbtn"><img src="${pageContext.request.contextPath}${dto.g_profile}" /></button>
                        <div class="dropdown-content">
                           <a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a>
                           <a href="#">스크랩내역</a>
                           <a href="#">포장내역</a>
                           <a href="#">예약내역</a>
                           <a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
                        </div>
                     </div>
                  </c:if>
               </span>
            </c:when>
            <c:when test="${not empty sessionScope.b_id}">
               <span class="navbar-text me-2">
                  <a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage.do">${sessionScope.b_id }</a> 로그인중...
               </span>
            <a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
            </c:when>
            <c:otherwise>
               <div class="g_login_css d-grid gap-2 d-md-flex justify-content-md-end">
                  <a class="btnF btn-lg me-2" href="${pageContext.request.contextPath}/users/g_login_form.do">로그인</a>   
                  <a class="btnS btn-lg me-2" href="${pageContext.request.contextPath}/users/select_signup_form.do">회원가입</a>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
   </div>
</nav>