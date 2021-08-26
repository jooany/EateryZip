<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/eatery/list.jsp</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	html{
	    margin: 0;
	} 
	body{
	    line-height: 1.6
	}
	section{
		margin: 30px;
	    display: flex;
	    float: left;
	    flex-wrap: wrap;
	    margin-right: 30px;
	}
	#food{
	   	margin-bottom: 10px;
	}
    /* 전체, 예약, 방문포장 */
 	.tab_container{
     	width: 500px;
      	margin: 0 auto;
	}
 	ul.tabs{
 		margin: 0px;
   		padding: 0px;
   		list-style: none;
	}
    ul.tabs li{
       	background: none;
       	color: #222;
       	display: inline-block;
      	padding: 10px 15px;
      	cursor: pointer;
	}
    ul.tabs li.current{
        background: #ededed;
        color: #222;
	}
	.tab-content{
     	display: none;
      	background: #ededed;
        padding: 15px;
	}
	.tab-content.current{
        display: inherit;
        width: 700px;
        height: 250px;
	}
	.ex_tag{
		display: inline-flex;
		align-items: baseline;
	}
	/* 지도api */
 	.main_right{
    	width: 320px;
     	height: 550px;
      	background-color: #cecece;
      	
   	}
	/* 모바일(~576px) */
	@media screen and (max-width: 576px) {

	}
</style>
</head>
<body>
    <section>
    	<div class="main_left">

            <!-- 편의사항 선택 -->
            <fieldset>
				<legend>편의사항</legend>
				<div class="form-group mb-3" id="ex_keyword">
					<input type="checkbox" class="check-input" id="check-outlined" value="루프탑" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-outlined" >루프탑</label>
					<br />
					<input type="checkbox" class="check-input" id="check-2-outlined" value="주차" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-2-outlined">주차</label>
                    <br />
					<input type="checkbox" class="check-input" id="check-3-outlined" value="무선인터넷" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-3-outlined">무선인터넷</label>
                    <br />
					<input type="checkbox" class="check-input" id="check-4-outlined" value="단체석" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-4-outlined" >단체석</label>
                    <br />
					<input type="checkbox" class="check-input" id="check-5-outlined" value="남/녀 화장실 구분" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-5-outlined">남/녀 화장실 구분</label>
					<br />
					<input type="checkbox" class="check-input" id="check-6-outlined" value="키즈존" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-6-outlined" >키즈존</label>
					<br />
					<input type="checkbox" class="check-input" id="check-7-outlined" value="노키즈존" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-7-outlined">노키즈존</label>
                    <br />
					<input type="checkbox" class="check-input" id="check-8-outlined" value="반려동물동반가능" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-8-outlined" >반려동물동반가능</label>
                    <br />
					<input type="checkbox" class="check-input" id="check-9-outlined" value="프라이빗" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-9-outlined" >프라이빗</label>
                    <br />
					<input type="checkbox" class="check-input" id="check-10-outlined" value="흡연실" name="ex_keyword" autocomplete="off">
					<label class="check-label" for="check-10-outlined">흡연실</label>
				</div>
			</fieldset>

            <!-- 업종 선택 -->
            <fieldset>
				<legend>업종</legend>
				<div id="b-kind">
                    <button id="food" class="btn btn-outline-dark btn-sm" aria-disabled="false" aria-pressed="false" type="button">>
                        <img src="images/bibimbap.png"> 한식
                    </button>
                    <button id="food" class="btn btn-outline-dark btn-sm" aria-disabled="false" aria-pressed="false" type="button">>
                        <img src="images/sushi.png"> 일식
                    </button>
                    <br />
                    <button id="food" class="btn btn-outline-dark btn-sm" aria-disabled="false" aria-pressed="false" type="button">>
                        <img src="images/xiao-long-bao.png"> 중식
                    </button>
                    <button id="food" class="btn btn-outline-dark btn-sm" aria-disabled="false" aria-pressed="false" type="button">>
                        <img src="images/steak.png"> 양식
                    </button>
                    <br />
                    <button id="food" class="btn btn-outline-dark btn-sm" aria-disabled="false" aria-pressed="false" type="button">>
                        <img src="images/pancake.png"> 브런치
                    </button>
                    <button id="food" class="btn btn-outline-dark btn-sm" aria-disabled="false" aria-pressed="false" type="button">>
                        <img src="images/cocktail.png"> Bar
                    </button>
                    <br />
                    <button id="food" class="btn btn-outline-dark btn-sm" aria-disabled="false" aria-pressed="false" type="button">>
                        <img src="images/coffee-cup.png"> 카페
                    </button>
                </div>
            </fieldset>
    	</div>
    </section>

    <section>
    	<div class="main_middle">
    		<div class="title">
    			<h2>추천 맛집</h2>
                <div>
    				<form action="list.jsp" method="get"> 
						<label for="condition"></label>
						<select name="condition" id="condition">
							<option value="popularity" ${condition eq 'popularity' ? 'selected' : '' }>인기순</option>
							<option value="reviews" ${condition eq 'reviews' ? 'selected' : '' }>리뷰순</option>
						</select>
					</form>	
    			</div>
    		</div>

    		<ul class="tabs">
                <li class="tab-link current" data-tab="tab-1">전체</li>
                <li class="tab-link" data-tab="tab-2">예약</li>
                <li class="tab-link" data-tab="tab-3">방문포장</li>
            </ul>

			<!-- 음식점 리스트 * 6 -->
			<div id="tab-1" class="tab-content current">
                <div class="card2-75">
                	<img src="${pageContext.request.contextPath}${dto.b_img_f }" class="rounded float-start" width="150" height="150">
                	<div>
	                    <h5 class="card-title">${list.b_name }</h5>
	                    <div>	                    
	                    	<p><span>${list.b_kind }</span></p>
	                    </div>
                    </div>
                	<ol class="list-group">
                		<li class="list-group list-group-numbered">
                			<div class="ms-2 me-auto">
                				<div class="fw-bold">리뷰 키워드</div>
                			</div>
                			<div class="ms-2 me-auto">
                				<div class="fw-bold">리뷰 키워드</div>
                			</div>
                			<div class="ms-2 me-auto">
                				<div class="fw-bold">리뷰 키워드</div>
                			</div>
                		</li>
                	</ol>
                	<div class="intro_box">
                		<p class="card-text">${dto.intro }</p>
                	</div>
                	<div>
                		<div class="ex_tag">
                			<div>
                				<span>
                					<i class="fas fa-check"></i>
                				</span>
                			</div>
                			<span>${dto.ex_keyword }</span>
                		</div>
                		<div class="ex_tag">
                			<div>
                				<span>
                					<i class="fas fa-check"></i>
                				</span>
                			</div>
                			<span>${dto.ex_keyword }</span>
                		</div>
                		<div class="ex_tag">
                			<div>
                				<span>
                					<i class="fas fa-check"></i>
                				</span>
                			</div>
                			<span>${dto.ex_keyword }</span>
                		</div>
                	</div>
                </div>
            </div>
            
            <div id="tab-2" class="tab-content">
                <div class="card2-75">
                	<img src="${pageContext.request.contextPath}${dto.b_img_f }" class="rounded float-start" width="150" height="150">
                	<div>
	                    <h5 class="card-title">${list.b_name }</h5>
	                    <div>	                    
	                    	<p><span>${list.b_kind }</span></p>
	                    </div>
                    </div>
                	<ol class="list-group">
                		<li class="list-group list-group-numbered">
                			<div class="ms-2 me-auto">
                				<div class="fw-bold">리뷰 키워드</div>
                			</div>
                			<div class="ms-2 me-auto">
                				<div class="fw-bold">리뷰 키워드</div>
                			</div>
                			<div class="ms-2 me-auto">
                				<div class="fw-bold">리뷰 키워드</div>
                			</div>
                		</li>
                	</ol>
                	<div class="intro_box">
                		<p class="card-text">${dto.intro }</p>
                	</div>
                	<div>
                		<div class="ex_tag">
                			<div>
                				<span>
                					<i class="fas fa-check"></i>
                				</span>
                			</div>
                			<span>${dto.ex_keyword }</span>
                		</div>
                		<div class="ex_tag">
                			<div>
                				<span>
                					<i class="fas fa-check"></i>
                				</span>
                			</div>
                			<span>${dto.ex_keyword }</span>
                		</div>
                		<div class="ex_tag">
                			<div>
                				<span>
                					<i class="fas fa-check"></i>
                				</span>
                			</div>
                			<span>${dto.ex_keyword }</span>
                		</div>
                	</div>
                </div>
            </div>
            
            <div id="tab-3" class="tab-content">
                <div class="card2-75">
                	<img src="${pageContext.request.contextPath}${dto.b_img_f }" class="rounded float-start" width="150" height="150">
                	<div>
	                    <h5 class="card-title">${list.b_name }</h5>
	                    <div>	                    
	                    	<p><span>${list.b_kind }</span></p>
	                    </div>
                    </div>
                	<ol class="list-group">
                		<li class="list-group list-group-numbered">
                			<div class="ms-2 me-auto">
                				<div class="fw-bold">리뷰 키워드</div>
                			</div>
                			<div class="ms-2 me-auto">
                				<div class="fw-bold">리뷰 키워드</div>
                			</div>
                			<div class="ms-2 me-auto">
                				<div class="fw-bold">리뷰 키워드</div>
                			</div>
                		</li>
                	</ol>
                	<div class="intro_box">
                		<p class="card-text">${dto.intro }</p>
                	</div>
                	<div>
                		<div class="ex_tag">
                			<div>
                				<span>
                					<i class="fas fa-check"></i>
                				</span>
                			</div>
                			<span>${dto.ex_keyword }</span>
                		</div>
                		<div class="ex_tag">
                			<div>
                				<span>
                					<i class="fas fa-check"></i>
                				</span>
                			</div>
                			<span>${dto.ex_keyword }</span>
                		</div>
                		<div class="ex_tag">
                			<div>
                				<span>
                					<i class="fas fa-check"></i>
                				</span>
                			</div>
                			<span>${dto.ex_keyword }</span>
                		</div>
                	</div>
                </div>
            </div>
            <!-- 로딩 -->
            <div id="ajax-loading"><img src=""></div>
    	</div>
    </section>

    <section>
    	<div class="main_right">
    		api
    	</div>
    </section>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/spin.js/2.3.2/spin.js"></script>
<script>
    //전체, 예약, 방문포장
	$(document).ready(function(){
    
        $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');
    
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
    
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');
        })
    });
    
    //스크롤시 로딩
    $("#ajax-loading").ajaxStart(function() {
		$(this).show();
	})
	.ajaxStop(function() {
		$(this).delay(10).hide(1); 
	});    
</script>
</body>
</html>