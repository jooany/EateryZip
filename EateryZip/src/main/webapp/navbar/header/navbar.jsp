<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	}
	
	/* ------------------------------- 고정 --------------------------------------*/
   .container{
      width: 1100px!important;
      border-bottom: 1px solid #999;
      display:flex;
      justify-content: space-between;
      background: white;
      align-items: center;
   }

   .wrap_logo img {
       width : 120px;
       height : 100px;
       
   }
   .logo{
		width : 120px;
		height : 100px;
   }
   
   .dropbtn {
       border-radius: 50%;
       background-color: rgba(0,0,0,0.5);
       color: white;
       padding: 16px;
       font-size: 16px;
       border: none;
   }
   
   .content_profile {
       position: relative;
       margin-right: 50px;
       margin-top: 10px;
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
   
   .loginproflie:hover .dropdown-content {
      display: block;
   }
   
   .loginproflie:hover .dropbtn {
      background-color: rgba(253,83,0);
   }
   
   .g_login_css {
      align-items: center;
      
   }
   
   .g_login_css a{
      display: inline-block;
      width: 80px;
      height: 30px;
   }
   
</style>
<header>
	<div class="container">
		<div class="content_logo">
			<c:choose>
				<c:when test="session.g_id">
					<a class="wrap_logo" href="${pageContext.request.contextPath}/">
						<img src="${pageContext.request.contextPath}/navbar/images/logo.png" alt="맛집로고">
					</a>
				</c:when>
				<c:otherwise>
					<img class="logo" src="${pageContext.request.contextPath}/navbar/images/logo.png" alt="맛집로고">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="content_profile" id="content_profile">
		   <c:choose>
		      <c:when test="${not empty sessionScope.g_id}">
		         <span class="navbar-text me-2">
		            <c:if test="${empty g_profile }">
		               <div class="loginproflie">
		                  <button class="dropbtn"><i id="g_profileImage" class="far fa-user fa-2x"></i></button>
		                  <div class="dropdown-content">
		                     <a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a>
		                     <a href="#">스크랩내역</a>
		                     <a href="${pageContext.request.contextPath}/users/g_mypage/takeout_list.do">포장내역</a>
		                     <a href="${pageContext.request.contextPath}/users/g_mypage/reserve_List.do">예약내역</a>
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
		                     <a href="${pageContext.request.contextPath}/users/g_mypage/takeout_list.do">포장내역</a>
		                     <a href="${pageContext.request.contextPath}/users/g_mypage/reserve_List.do">예약내역</a>
		                     <a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
		                  </div>
		               </div>
		            </c:if>
		         </span>
		      </c:when>
		      <c:when test="${not empty sessionScope.b_id}">
		         <span class="navbar-text me-2">
		               <div class="loginproflie">
		                  <button class="dropbtn"><i id="b_profileImage" class="far fa-building fa-2x"></i></button>
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
		         <div class="g_login_css">
		            <a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/users/g_login_form.do">로그인</a>   
		            <a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/users/select_signup_form.do">회원가입</a>
		         </div>
		      </c:otherwise>
		   </c:choose>
		</div>
	</div>
</header>