<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="listR" items="${reviewList }">
		<div class="review">
			<div class="review_header">
				<div class="profile_wrap">
				<c:choose>
					<c:when test="${empty listR.profile }">
						<i class="fas fa-user-circle" style="font-size:40px;"></i>
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}${listR.profile }" alt="${listR.writer }" class="profile" style="width:50px; height:50px;"/>
					</c:otherwise>
				</c:choose>
				</div>
				<div class="writer_info">
					<p>${listR.writer }</p>
					<p>${listR.regdate } | ${listR.review_kind eq 'reserve'?'예약':'포장'}</p>
				</div>
			</div>
			<p class="review_content">${listR.review_content }</p>
			<c:if test="${not empty listR.review_image }">
				<div class="review_img" style="background-image:url('${pageContext.request.contextPath}${listR.review_image}');"></div>
			</c:if>
			<div class="review_key_wrap" data-num="${listR.review_num }" data-key="${listR.keyword_review}">
			</div>
			<div class="good_wrap">
				<button type="button" class="goodBtn" data-num="${listR.review_num }" data-isGoodNum="${listR.is_user_good }" data-goodCount="${listR.good_count }">
					<c:choose>
						<c:when test="${listR.is_user_good eq 0 }">
							<i class="far fa-thumbs-up"></i>
						</c:when>
						<c:otherwise>
							<i class="fas fa-thumbs-up" style="color:rgb(253, 83, 0);"></i>
						</c:otherwise>
					</c:choose>
				</button>
				<span> ${listR.good_count }</span>
				<span> 명이 추천했어요!</span>
			</div>
		</div>
		</c:forEach>
		<div class="page-ui clearfix">
			<ul id="pagination">
				<c:if test="${startPageNum ne 1 }">
					<li>
						<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${b_id}&array=${array }&only=${only }&pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li>
						<c:choose>
							<c:when test="${pageNum eq i }">
								<a class="active pageBtn" href="javascript:;" data-array="${array }" data-only="${only }" data-pageNum="${i }">${i }</a>
							</c:when>
							<c:otherwise>
								<a class="pageBtn" href="javascript:;" data-array="${array }" data-only="${only }" data-pageNum="${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li>
						<a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${b_id}&array=${array }&only=${only }&pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<div style="clear:both;"></div>