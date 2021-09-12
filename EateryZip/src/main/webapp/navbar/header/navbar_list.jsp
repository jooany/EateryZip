<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" 
   href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	#navbar{
		width:100%;
		padding:15px 0;
	}
	#container_nav{
		width: 1125px;
		display:flex;
		justify-content: space-between;
		align-items: center;
		margin:0 auto;
	}
	.content_logo{
		margin-left:40px;
		margin-right:30px;
	}
	.wrap_logo img {
		margin-top: 5px;
	}
	.dropbtn {
		border-radius: 50%;
		background-color:rgba(0,0,0,.2);
		color: white;
		padding: 16px;
		font-size: 16px;
		width : 45px;
		height: 45px;
		background-size: cover;
		margin: auto;
	}
	
	#g_profileImage{
		font-size:20px;
		margin-top:-4px;
		margin-left:-2px;
	}
	
	#testForm{
		display: flex;
		
		border:1px solid rgba(0,0,0,.15);
		border-right:none;
		border-radius:4px;
		
	}
	.search_wrap{
		
	}
	.content_search input {
		width: 300px;
		height: 40px;
		border:none;
		background-color:rgba(0,0,0,0);
	}
	#searchBtn{
		background-color: rgba(253,83,0);
		color: white;
		width: 40px;
		height: 40px;
		border-radius: 0px 4px 4px 0px;
	}
	
	.content_profile {
		position: relative;
		margin-right:10px;
		display: flex;
		box-sizing:border-box;
	}
	
	.dropdown-content {
		display:none;
		position: absolute;
		background-color: #ededed;
		min-width: 160px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.5);
		z-index: 9999;
		margin-left:-90px;
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
	
	.loginproflie:hover .dropbtn i:nth-child(2){
		color:rgba(0,0,0,.6)!important;
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
		border: 1px solid rgba(0,0,0,.15);
	}
	.g_login_css .btnS{
		background-color: rgba(253,83,0);
		color: white!important;
	}
	
	.g_login_css a{
		display: inline-block;
		font-size: 16px;
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
	/*주연*/

   
</style>
<nav id="navbar">
   <div id="container_nav">
   	 <div style="display:flex; align-items:center;">
      <div class="content_logo">
          <a class="wrap_logo" href="${pageContext.request.contextPath}/">
               <img src="${pageContext.request.contextPath}/navbar/images/logo1.PNG" alt="로고" height="45px">
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
      <div class="content_profile" id="content_profile" style="margin-right:30px;">               
         <c:choose>
            <c:when test="${not empty sessionScope.g_id}">
               <span class="navbar-text">
                  <c:if test="${empty g_profile }">
                     <div class="loginproflie">
                        <button class="dropbtn" style="display:flex;"><i id="g_profileImage" class="far fa-user"></i> <i class="fas fa-caret-down" style="margin-left:25px;color:rgba(0,0,0,.2);"></i></button>
                        <div class="dropdown-content">
                           <a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a>
							<a href="${pageContext.request.contextPath}/users/g_mypage/scrap_List.do">스크랩내역</a>
							<a href="${pageContext.request.contextPath}/users/g_mypage/takeout_list.do">포장내역</a>
							<a href="${pageContext.request.contextPath}/users/g_mypage/reserve_List.do">예약내역</a>
							<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
                        </div>
                     </div>
                  </c:if>
                  <c:if test="${not empty g_profile }">
                     
                     <div class="loginproflie">
                        <button class="dropbtn" style="display:flex; padding:0;"><img style="border-radius:50%;" id="myprofile" height="45px;" src="${pageContext.request.contextPath}${sessionScope.g_profile}" />
                        	<i class="fas fa-caret-down" style="margin-left:10px;margin-top:15px;color:rgba(0,0,0,.2);"></i>
                        </button>
                        <div class="dropdown-content">
							<a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a>
							<a href="${pageContext.request.contextPath}/users/g_mypage/scrap_List.do">스크랩내역</a>
							<a href="${pageContext.request.contextPath}/users/g_mypage/takeout_list.do">포장내역</a>
							<a href="${pageContext.request.contextPath}/users/g_mypage/reserve_List.do">예약내역</a>
							<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
                        </div>
                     </div>
                  </c:if>
               </span>
            </c:when>
            <c:when test="${not empty sessionScope.b_id}">
               <span class="navbar-text">
                  <a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage.do">${sessionScope.b_id }</a> 로그인중...
               </span>
            <a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
            </c:when>
            <c:otherwise>
               <div class="g_login_css d-grid gap-2 d-md-flex justify-content-md-end">
                  <a class="btnF btn-lg" href="${pageContext.request.contextPath}/users/g_login_form.do">로그인</a>   
                  <a class="btnS btn-lg" href="${pageContext.request.contextPath}/users/select_signup_form.do">회원가입</a>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
   </div>
</nav>