<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	<nav class="navbar navbar-light bg-light navbar-expand-lg">
		<div class="container-fluid">
		    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
		      	<img src="${pageContext.request.contextPath}/navbar/images/logo.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
		      	MatZip
		    </a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
		    	data-bs-target="#navbarNav">
   				<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNav">
      			<ul class="navbar-nav me-auto">
      				<li class="nav-item">
	          			<a class="nav-link" href="#">우와우와우왕</a>
	        		</li>
      			</ul>
      			
      			<c:choose>
      				<c:when test="${not empty g_id}">
      				   <span class="navbar-text me-2">
      					<a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage.jsp">${g_id }</a> 로그인중...
      				</span>
      				<a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
      				</c:when>
      				<c:when test="${not empty b_id}">
      				    <span class="navbar-text me-2">
      					<a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.jsp">${b_id }</a> 로그인중...
      				</span>
      				<a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
      				</c:when>
      				<c:otherwise>
	      				<a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/users/g_login_form.do">로그인</a>	
	      				<a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/users/select_signup_form.do">회원가입</a>
      				</c:otherwise>
      			</c:choose>
      			
    		</div>
		</div>
		<div>
			<form class="form-inline my-2 my-md-0">
				<input class="form-control" type="hidden" placeholder="Search">
			</form>
		</div>
	</nav>
	
	
	
	
	
	
	
	
	
	
	