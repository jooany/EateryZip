<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" 
   href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
	/* ------------------------------- 고정 --------------------------------------*/
   *{
    font-family: 'Gothic A1', sans-serif;
    }
	
	header{
		position: sticky;
 		top: 0;
 		z-index: 99999;
 		box-shadow:0 1px 6px 0 rgb(32 33 36 / 28%);
	}
	
	/* ------------------------------- 고정 --------------------------------------*/

   .container_nav{
      display:flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 0;
   }
   .logo{
	
   }
   
   .dropbtn {
       border-radius: 50%;
       background-color: rgba(0,0,0,.2);
       color: white;
       padding: 16px;
       font-size: 16px;
       border: none;
       width : 45px;
	   height: 45px;
	   background-size: cover;
		margin: auto;
   }
   
   .content_profile {
       position: relative;
       /*margin-right: 50px;*/
       margin-left : 200px;
       display: flex;
       box-sizing:border-box;
   }
   
   .dropdown-content {
       display: none;
       position: absolute;
       background-color: #f1f1f1;
       min-width: 160px;
       box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.5);
       z-index: 1;
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
      color : white;
   }
   
   .loginprofile:hover .dropdown-content {
      display: block;
   }
   
   .loginprofile:hover .dropbtn {
      
   }
   .loginprofile:hover .dropbtn i:nth-child(2){
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
		font-size:15px;
	  
	}
   .g_login_css .btnF{
		border: 1px solid rgba(0,0,0,.15);
	}
	.g_login_css .btnS{
		background-color: rgba(253,83,0);
		color: white!important;
	}
   .g_login_css {
      align-items: center;
      
   }
   
   .g_login_css a{
      display: inline-block;
      width: 80px;
      height: 30px;
   }
   
   .g_login_css .btnF:hover{
		border: 1px solid #ededed;
		background-color: #ededed;
	}
	
	.g_login_css .btnS:hover{
		background-color: rgba(253,83,0,0.7);
	}
   
</style>

<header style="width:100%;background-color:white;">
	<div class="container_nav" style="width:1000px; margin:0 auto;">
		<div class="content_logo">
			<c:choose>
				<c:when test="${not empty sessionScope.g_id}">
					<a class="logo" href="${pageContext.request.contextPath}/">
						<img src="${pageContext.request.contextPath}/navbar/images/logo1.PNG" alt="맛집로고" height="45px" style="margin:0!important;">
					</a>
				</c:when>
				<c:otherwise>
					<img class="logo" src="${pageContext.request.contextPath}/navbar/images/logo1.PNG" alt="맛집로고" height="45px" style="margin:0!important;">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="content_profile" id="content_profile">
		   <c:choose>
		      <c:when test="${not empty sessionScope.g_id}">

		         <span class="navbar-text">
		            <c:if test="${empty g_profile }">
		               <div class="loginprofile">
		                  <button class="dropbtn" style="display:flex;"><i id="g_profileImage" class="far fa-user"></i><i class="fas fa-caret-down" style="margin-left:25px;color:rgba(0,0,0,.2);"></i></button>
		                  <div class="dropdown-content">
		                     <a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a>
		                     <a href="#">스크랩내역</a>
		                     <a href="${pageContext.request.contextPath}/users/g_mypage/takeout_list.do">포장내역</a>
		                     <a href="${pageContext.request.contextPath}/users/g_mypage/reserve_List.do">예약내역</a>
		                     <a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
		                  </div>
		               </div>
		            </c:if>
		            <c:if test="${not empty sessionScope.g_profile }">
		               
		               <div class="loginprofile">
		                  <button class="dropbtn" style="margin-right:30px; display:flex; padding:0;"><img style="border-radius:50%;" id="myprofile" height="45px;" src="${pageContext.request.contextPath}${sessionScope.g_profile}" />
		                  	<i class="fas fa-caret-down" style="margin-left:10px;margin-top:15px;color:rgba(0,0,0,.2);"></i>
		                  </button>
		                  <div class="dropdown-content">
		                     <a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a>
		                     <a href="#">스크랩내역</a>
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
		               <div class="loginprofile">
		                  <button class="dropbtn" style="display:flex;"><i id="b_profileImage" class="far fa-building"></i><i class="fas fa-caret-down" style="margin-left:25px;color:rgba(0,0,0,.2);"></i></button>
		                  <div class="dropdown-content">
		                     <a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage.do">마이페이지</a>
		                     <a href="${pageContext.request.contextPath}/store/store_insertform.do">가게정보등록</a>
		                     <a href="${pageContext.request.contextPath}/users/b_mypage/menu_insertform.do">메뉴등록</a>
		                     <a href="${pageContext.request.contextPath}/users/b_mypage/b_takeout_list.do">포장내역</a>
		                     <a href="${pageContext.request.contextPath}/users/b_mypage/b_reservation_List.do">예약내역</a>
		                     <a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
		                  </div>
		               </div>
		         </span>
		      </c:when>
		      <c:otherwise>
		         <div class="g_login_css d-grid gap-2 d-md-flex justify-content-md-end">
                  <a class="btn btnF btn-lg" href="${pageContext.request.contextPath}/users/g_login_form.do">로그인</a>   
                  <a class="btn btnS btn-lg" href="${pageContext.request.contextPath}/users/select_signup_form.do">회원가입</a>
               </div>
		      </c:otherwise>
		   </c:choose>
		</div>
	</div>
</header>
