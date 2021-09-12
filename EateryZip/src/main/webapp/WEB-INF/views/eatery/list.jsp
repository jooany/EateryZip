<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/eatery/list.jsp</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<jsp:include page="/navbar/header/navbar_list.jsp"></jsp:include>


<style>
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
	*{
         margin: 0;
         padding: 0;
         font-family: 'Gothic A1', sans-serif;
	}
	html{
          margin: 0;
	} 
	body{
          line-height: 1.6
	}
	section{
          display: flex;
          float: left;
          flex-wrap: wrap;
          margin:40px 10px;
      }
      a{
         color:black!important;
         text-decoration:none!important;
      }
      img,svg{
         vertical-align:baseline!important;
      }
   
      button{
         border:none;
         background-color:rgba(0,0,0,0);
      }
      .wrap1{
      	margin-left: 15px;
      }
      .food{
         margin-bottom: 10px;
      }
      
      #navbar{
      	border-bottom:1px solid rgba(0,0,0,.1)!important;
      }
      #container_nav{
		width: 1400px!important;
	  }
      
      /*h2{
      	font-size: 30px;
      	font-weight: bold;
      	color: rgb(255, 255, 255);
      }*/
      .main_middle{
		
	  }
      .main_title{
      	/*background-color: rgb(253, 83, 0);*/
      	
      }
      .main_title>h1{
      	font-size: 25px;
      	font-weight: bold;
      	
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
        border: 1px solid #cecece;
        color: #222;
      }
      .tab-content{
        display: none;
      }
      .tab-content.current{
        display: inherit;
      }
      
	/*----------2.Headings & Buttons----------*/	
	h3 {
	   font-size:1.2em;
	   font-weight:600;
	   text-transform:capitalize;
	   margin:0 0 10px 0;
	   padding:0;
	   color:#555555;
	}
	.btn-styled {
	   background-color:transparent;
	   border:#666666 1.9px solid;
	   color:#666666;
	   font-size:0.85em;
	   border-radius:30px;
	   padding:5px 13px 4px 13px;
	   margin:10px 0 10px 0;
	}
	.btn-styled:hover, .btn-styled:active  {
	   background-color:#ededed;
	   border-color:#ededed;
	   color:#555555;
	}
	.btn-styled:focus {
	   outline:0 !important;
	}
	/*----------3.Cards----------*/
	.card {
	   position: relative;
	   margin:20px 0px;
	   background-color: #fff;
	   transition: box-shadow .25s;
	   border-radius: 2px;
	   box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
	   padding:0;
	   width:730px;
	   flex-direction:row!important;
	   height:220px;
	}
	.card .card-image img {
	  display: block;
	  border-radius: 2px 2px 0 0;
	  position: relative;
	  left: 0;
	  right: 0;
	  top: 0;
	  bottom: 0;
	  width: 100%;
	}
	.cimg{
		display: flex;
		margin: 15px;
		align-items:center;
	}
	.card .card-content {
	  width: 460px;
	  border-radius: 0 0 2px 2px;
	  height:180px;
	  padding:2px;
	}
	
	.card .card-content p {
	  margin:0;
	  font-size:1rem;
	  color: #555555;
	}
	/*----3.a.Horizontal----*/
	.card.horizontal {
	   display: -webkit-flex;
	   display: -ms-flexbox;
	   display: flex;
	}
	.card.horizontal.small .card-image,
	 .card.horizontal.medium .card-image,
	  .card.horizontal.large .card-image {
	   height: 100%;
	   max-height: none;
	   overflow: visible;
	}
	.card.horizontal .card-image img {
	   width:150px;
	   height:150px;
	   margin-right:20px;
	}
	.card.horizontal .card-stacked {
	   position: relative;
	}
	.card_parent{
		display:flex;
		align-items:center;
		margin-left:10px;
	}
	.card.horizontal .card-stacked .card-content {
	   -webkit-flex-grow: 1;
	    -ms-flex-positive: 1;
	   flex-grow: 1;
	}
	.card .card-image {
	  position: relative;
	}
	.card_intro{
		border-bottom: 1px solid #e4e8eb;
		width:460px;
		height:60px;
		font-size:14px!important;
		padding:0.5px;
	}
      /* 지도api */
    .main_right{
          width: 320px;
          height: 550px;
          background-color: #cecece;
         
    }
    footer{
    	clear: both;
    	padding: 15px;
    	text-align: center;
    	color: rgb(255, 255, 255);
    	background-color: rgb(33, 33, 33);
    }
    .container{
		border-bottom:none!important;
		width:1410px;
		margin:0 auto;
	}
	.list_search_wrap{
		display:flex;
		border:1px solid rgba(0,0,0,.2);
		border-radius:50px;
		width:220px;
		height:30px;
	}
	.list_search_wrap>input{
		border:none;
		margin-left:15px;
		width:170px;
		
	}
	.list_search_wrap>input::placeholder{
		margin-left:30px;
		font-size:13px;
	}
	.list_search_btn{
		color:rgba(0,0,0,.3);
		width:28px;
		height:28px;
		line-height:16px;
	}
	#container{
		width:1410px;
		margin:0 auto;
		display:flex;
	}
	.filter_box{
		margin:30px 10px;
	}
	legend{
		font-size:16px;
		font-weight:600;
		margin-top:20px;
	}
	.ch{
		margin-right:5px;
	}
	.one_kind{
		display:flex;
		align-items:center;
		width:110px;
		height:35px;
		font-size:15px;
	}
	.one_kind input{
		margin-right:5px;
	}
	.one_kind img{
		width:28px;
		height:28px;
		margin-right:5px;
	}
	.s_r{
		margin-right:5px;
	}
	#scrapLeft{
		width:460px;
	}
	#scrapLeft h3 span:nth-child(1){
		color:black;
		font-size:18px;
	}
	#scrapLeft h3 span:nth-child(2){
		font-size:13px;
		font-weight:500;
	}
	.key_wrap{
		width:460px;
		height:30px;
		display:flex;
	}
	.key_wrap div{
		font-size:13px;
		border-radius:4px;
		background-color:rgba(0,0,0,.05);
		/*border : 1px solid rgb(253, 83, 0);*/
		color:black;
		padding:0 10px;
		margin-right:4px;
		line-height:25px;
		height:24px;
	}
	.ex_wrap{
		display:flex;
		flex-wrap:wrap;
		width:460px;
		height:50px;
		margin-bottom:20px;
		margin-top:15px!important;
	}
	.ex_wrap>span{
		height:22px;
		margin-right:4px;
		display:flex;
		align-items:center;
	}
	.ex_wrap>span>span{
		font-size:14px;
	}
	.ex_wrap svg{
		margin-right:4px;
	}
	/*버튼*/
	#pagination{
		width:750px;
		margin-top:60px;
		display:flex;
		justify-content:center;
		list-style:none;
		padding-left:0!important;
	}
	#pagination li{
		border-radius:4px;
		margin:0 4px;
	}
	#pagination li a{
		border-radius:4px;
		padding:10px 15px;
		background-color:rgb(234, 231, 231);
	}
	.active{
		background-color:rgb(253, 83, 0)!important;
		color:white!important;
	}
	#scrapRight{
		height:25px;
		margin-top:17px;
	}
	#scrapRight>i{
		font-size:25px;
		margin-bottom:10px;
		color:rgba(0,0,0,.2);
	}
	#scrapRight>.fas{
		color:rgb(253, 83, 0);
	}
	.s_img{
	overflow: hidden;
    width: 180px;
    height: 180px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
</style>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e12e99f90ddd040d29c835f01fcaa837"></script>
<body>
 <div id="containerWrap">
	   <div id="container">
	    <section class="inner filter_box">
	       <div class="main_left">
	   		<form action="${pageContext.request.contextPath}/eatery/list.do" method="get" id="inputForm" style="margin:0 30px;">
		       	<div style="border-bottom:1px solid rgba(0,0,0,.05); padding-bottom:20px; display:flex; justify-content:center;">
		           <div class="list_search_wrap">
		               <input type="text" class="keyword" placeholder="" name="keyword" value="${ not empty keyword ? keyword :''}">
		           
		           <button class="list_search_btn" type="submit"><i class="fas fa-search"></i></button>
		           </div>
		        </div>
	        
				<fieldset style="border-bottom:1px solid rgba(0,0,0,.1);">
		        	<legend>편의사항</legend>
		            <div class="form-group mb-3" style="font-size:15px;">
		   				<c:set var="searchExKey" value="${ex_keyword }" />
						<input class="ch" id="ch1" type="checkbox" name="ex_keyword" value="루프탑" ${fn:contains(searchExKey,'루프탑') ? 'checked': ''}/> 루프탑
						<br />
						<input class="ch" id="ch2" type="checkbox" name="ex_keyword" value="주차" ${fn:contains(searchExKey,'주차') ? 'checked': ''}/> 주차
						<br />
						<input class="ch" id="ch3" type="checkbox" name="ex_keyword" value="무선인터넷" ${fn:contains(searchExKey,'무선인터넷') ? 'checked': ''}/> 무선인터넷
						<br />
						<input class="ch" id="ch4" type="checkbox" name="ex_keyword" value="단체석" ${fn:contains(searchExKey,'단체석') ? 'checked': ''}/> 단체석
						<br />
						<input class="ch" id="ch5" type="checkbox" name="ex_keyword" value="키즈존" ${fn:contains(searchExKey,'키즈존') ? 'checked': ''}/> 키즈존
						<br />
						<input class="ch" id="ch6" type="checkbox" name="ex_keyword" value="노키즈존" ${fn:contains(searchExKey,'노키즈존') ? 'checked': ''}/> 노키즈존
						<br />
						<input class="ch" id="ch7" type="checkbox" name="ex_keyword" value="반려동물동반가능" ${fn:contains(searchExKey,'반려동물동반가능') ? 'checked': ''}/> 반려동물동반가능
						<br />
						<input class="ch" id="ch8" type="checkbox" name="ex_keyword" value="프라이빗" ${fn:contains(searchExKey,'프라이빗') ? 'checked': ''}/> 프라이빗
						<br />
						<input class="ch" id="ch9" type="checkbox" name="ex_keyword" value="흡연실" ${fn:contains(searchExKey,'흡연실') ? 'checked': ''}/> 흡연실
		            </div>
				</fieldset>
		
		      	<!-- 업종 -->
		      	<fieldset style="border-bottom:1px solid rgba(0,0,0,.1); padding-bottom:20px;">
			      	<legend>업종</legend>
				      	<div style="display:flex; flex-wrap:wrap; width:220px;">
				         <span class="one_kind">
					         <input type="radio" id="b_kind" name="b_kind" value="한식" ${b_kind eq '한식' ? 'checked' : ''}>
					         <img src="${pageContext.request.contextPath}/resources/images/bibimbap.png"><span>한식</span>
				         </span>
				         <span class="one_kind">
					         <input type="radio" name="b_kind" value="일식" ${b_kind eq '일식' ? 'checked' : ''}>
					         <img src="${pageContext.request.contextPath}/resources/images/sushi.png"><span>일식</span>
				         </span>
				         <br />
				         <span class="one_kind">
					         <input type="radio" name="b_kind" value="중식" ${b_kind eq '중식' ? 'checked' : ''}>
					         <img src="${pageContext.request.contextPath}/resources/images/xiao-long-bao.png"><span>중식</span>
				         </span>   
				         <span class="one_kind">
					         <input type="radio" name="b_kind" value="양식" ${b_kind eq '양식' ? 'checked' : ''}>
					         <img src="${pageContext.request.contextPath}/resources/images/steak.png"><span>양식</span>
				         </span>
				         <br />
				        
				          <span class="one_kind">
					          <input type="radio" name="b_kind" value="브런치" ${b_kind eq '브런치' ? 'checked' : ''}>
					          <img src="${pageContext.request.contextPath}/resources/images/pancake.png"><span>브런치</span>
				          </span>   
				          <span class="one_kind">
					          <input type="radio" name="b_kind" value="Bar" ${b_kind eq 'Bar' ? 'checked' : ''}>
					          <img src="${pageContext.request.contextPath}/resources/images/cocktail.png"><span>Bar</span>
				          </span>
				          <br />
				          <span class="one_kind">
					          <input type="radio" name="b_kind" value="cafe" ${b_kind eq 'cafe' ? 'checked' : ''}>
					          <img src="${pageContext.request.contextPath}/resources/images/coffee-cup.png"><span>카페</span>
				          </span>
				       	</div>
				 </fieldset>	
		         <div style="font-size:15px;">
		        	
			       	<legend>서비스</legend>
			       	<div style="display:flex; align-items:center;">
			    		<input class="s_r" type="radio" name="service" value="" ${service eq '' ? 'checked' : ''} /><p style="display:box; width:40px;height:24px; line-height:26px; margin:0;">전체</p>
			            <input class="s_r" type="radio" name="service" value="reserve" ${service eq 'reserve' ? 'checked' : ''} ><p style="display:box; width:40px;height:24px; line-height:26px; margin:0;">예약</p>
			            <input class="s_r" type="radio" name="service" value="takeout" ${service eq 'takeout' ? 'checked' : ''}><p style="display:box; width:40px;height:24px; line-height:26px; margin:0;">포장</p>
		            </div>
		        </div>
			       	
		       	</form>
	    	</div>
	    </section>
	
	    <section>
	      <div class="main_middle">
	            <div class="main_title">
	                <h1>추천 맛집</h1>
	                <div>
	                   <!-- 인기순, 리뷰순 -->
	                   <!-- <form action="list.jsp" method="get"> 
	                     <label for="condition"></label>
	                     <select name="condition" id="condition">
	                        <option value="popular" ${condition eq 'popular' ? 'selected' : '' }>인기순</option>
	                        <option value="recommend" ${condition eq 'recommend' ? 'selected' : '' }>추천순</option>
	                        <option value="recent" ${condition eq 'recent' ? 'selected' : '' }>최신순</option>
	                     </select>
	                  </form> -->   
	                </div>
	             </div>
	             
	            <!-- 음식점 리스트 * 6 -->
	            <div id="tab-1" class="card_wrapper tab-content current">         
				   <c:forEach var="tmp" items="${list }">
					    <div class="didRow">
					      <div class="card_wrapper">
						        <div class="card" style="display:flex;">
						          <div class="card-image cimg" style="width:180px;">
						            <a class="link_link" href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${tmp.b_id}">
						            <c:choose>
						            	<c:when test="${not empty tmp.b_img_f}">
						            		<div class="s_img" style="background-image:url('${pageContext.request.contextPath}${tmp.b_img_f }');"></div>
						            	</c:when>
						            	<c:otherwise>
						            		<div class="s_img" style="background-color:rgba(0,0,0,.1);"></div>
						            	</c:otherwise>
						            </c:choose>
						            </a>
						          </div>
							          <div class="card-stacked card_parent">
							           <a class="link_link" href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${tmp.b_id}">
							            <div class="card-content">
							            	<div id="scrapLeft">
								               <h3>
								                  <span>${tmp.b_name }</span>
								                  <span>| ${tmp.b_kind }</span>
								               </h3>
								               <!-- 키워드 리뷰 3개 -->
								               <div class="key_wrap" data-r1="${tmp.r1 }r1" data-r2="${tmp.r2 }r2"  data-r3="${tmp.r3 }r3"  data-r4="${tmp.r4 }r4"  data-r5="${tmp.r5 }r5"  data-r6="${tmp.r6 }r6"  data-r7="${tmp.r7 }r7" data-r8="${tmp.r8 }r8" data-r9="${tmp.r9 }r9" data-r10="${tmp.r10 }r10" data-r11="${tmp.r11 }r11">
													<!--  <div>뷰가 좋아요</div>
													<div>가성비가 좋아요</div>
													<div>인테리어가 멋져요</div>-->
								               </div>
								             </div>
								         
							                 <p class="card_intro">${tmp.intro }</p>
							                 <!-- 편의사항 3개 -->
							                 <div class="ex_wrap" data-ex="${tmp.ex_keyword }"></div>
							             </div>
							              </a>
							           </div>
							           <c:choose>
											<c:when test="${tmp.isScrap eq 0}">
												<button type="button" id="scrapRight" data-bid="${tmp.b_id }" data-isScrap="">
													<i class="far fa-bookmark"></i>
												</button>
											</c:when>
											<c:otherwise>
												<button type="button" id="scrapRight" data-bid="${tmp.b_id }" data-isScrap="true">
													<i class="fas fa-bookmark"></i>
												</button>
											</c:otherwise>
										</c:choose>
							           
						        </div>
						        <!-- card.end -->
						      
					      </div>
					   </div>
				   </c:forEach>
				</div>
				
				 <div class="page-ui clearfix"> <!-- 페이징처리 부분 -->
			      <ul id="pagination">
			         <c:if test="${startPageNum ne 1 }">
			            <li>
			               <a href="list.do?pageNum=${startPageNum-1 }&keyword=${encodedK}&ex_keyword=${encodedEx}&b_kind=${encodedB}&service=${encodedS}">Prev</a>
			            </li>
			         </c:if>
			         <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			            <li>
			               <c:choose>
			                  <c:when test="${pageNum eq i }">
			                     <a  class="active" href="list.do?pageNum=${i}&keyword=${encodedK}&ex_keyword=${encodedEx}&b_kind=${encodedB}&service=${encodedS}">${i }</a>
			                  </c:when>
			                  <c:otherwise>
			                     <a href="list.do?pageNum=${i}&keyword=${encodedK}&ex_keyword=${encodedEx}&b_kind=${encodedB}&service=${encodedS}">${i }</a>
			                  </c:otherwise>
			               </c:choose>
			            </li>
			         </c:forEach>
			         <c:if test="${endPageNum lt totalPageCount }">
			            <li>
			               <a href="list.do?pageNum=${endPageNum+1 }&keyword=${encodedK}&ex_keyword=${encodedEx}&b_kind=${encodedB}&service=${encodedS}">Next</a>
			            </li>
			         </c:if>
			      </ul>
			   </div>
				
	         </div>
	    </section>
	    
	    <section>
	    	<div id="List_map" style="width:320px; height:530px;"></div>
	    </section>
	</div>
</div>
<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	let g_id = '<c:out value="${g_id}"/>';
	//편의사항 키워드 넣기
	function exSplit(sel){
		let exWraps=document.querySelectorAll(sel);
		for(let i=0;i<exWraps.length;i++){
			let exBtn=$(exWraps[i]);
			let keys=exBtn.attr("data-ex");
			let arr2=[];
			arr2=keys.split(",");
			
			
			for(let j=0;j<arr2.length;j++){
				exBtn.append(`<span><svg style="width:15px;height:15px;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" viewBox="0 0 32 32" fill="rgb(253, 83, 0)" data-svg-content="true"><g><path d="M 13.788,25.588c 0.040,0.032, 0.064,0.076, 0.106,0.106c 0.060,0.040, 0.128,0.048, 0.192,0.076 c 0.076,0.036, 0.15,0.070, 0.23,0.092c 0.078,0.020, 0.154,0.030, 0.234,0.036c 0.114,0.012, 0.224,0.012, 0.336-0.004 c 0.046-0.008, 0.090-0.020, 0.136-0.032c 0.138-0.034, 0.266-0.088, 0.392-0.164c 0.022-0.014, 0.040-0.030, 0.062-0.044 c 0.082-0.056, 0.17-0.098, 0.24-0.174c 0.050-0.054, 0.072-0.124, 0.112-0.184c 0.002-0.002, 0.006-0.004, 0.006-0.006l 11.918-19.102 c 0.424-0.646, 0.242-1.514-0.406-1.938s-1.514-0.242-1.938,0.406l-11.008,17.642L 8.312,16.376C 7.744,15.85, 6.86,15.884, 6.334,16.452 C 5.81,17.020, 5.844,17.906, 6.412,18.43l 7.324,7.126C 13.75,25.57, 13.77,25.574, 13.788,25.588z"></path></g></svg><span>`+arr2[j]+`</span></span>`);
			}
		}
		
	}
	exSplit(".ex_wrap");
	
      
	//리스트 키워드 나열 
	function keywordSplit(sel){
		let keyWraps=document.querySelectorAll(sel);
	
		for(let i=0;i<keyWraps.length;i++){	
			//배열 선언
			let r1=$(keyWraps[i]).attr("data-r1");
			let r2=$(keyWraps[i]).attr("data-r2");
			let r3=$(keyWraps[i]).attr("data-r3");
			let r4=$(keyWraps[i]).attr("data-r4");
			let r5=$(keyWraps[i]).attr("data-r5");
			let r6=$(keyWraps[i]).attr("data-r6");
			let r7=$(keyWraps[i]).attr("data-r7");
			let r8=$(keyWraps[i]).attr("data-r8");
			let r9=$(keyWraps[i]).attr("data-r9");
			let r10=$(keyWraps[i]).attr("data-r10");
			let r11=$(keyWraps[i]).attr("data-r11");
			
			let keyBtn=$(keyWraps[i]);
			
			let keyarr=[r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11];
			//내림차순
			keyarr.sort();
			console.log(keyarr);
			
			for(let j=keyarr.length-1;j>=8;j--){
				
				let arr1=[];
				arr1=keyarr[j].split("r");
				console.log("정리된거"+arr1[1]);
				let keyNum=arr1[1];
				
				if(arr1[0]!=0){ // 선택된 리뷰 키워드가 없지 않을 때만 동작
					if(keyNum==1){
						keyBtn.append(`<div>가성비가 좋아요</div>`);
					}else if(keyNum==2){
						keyBtn.append(`<div>포장이 꼼꼼해요</div>`);
					}else if(keyNum==3){
						keyBtn.append(`<div>디저트가 맛있어요</div>`);
					}else if(keyNum==4){
						keyBtn.append(`<div>친절해요</div>`);
					}else if(keyNum==5){
						keyBtn.append(`<div>특별한 메뉴가 있어요</div>`);
					}else if(keyNum==6){
						keyBtn.append(`<div>커피가 맛있어요 </div>`);
					}else if(keyNum==7){
						keyBtn.append(`<div>음료가 맛있어요</div>`);
					}else if(keyNum==8){
						keyBtn.append(`<div>대화하기 좋아요</div>`);
					}else if(keyNum==9){
						keyBtn.append(`<div>인테리어가 멋져요</div>`);
					}else if(keyNum==10){
						keyBtn.append(`<div>사진이 잘 나와요</div>`);
					}else{
						keyBtn.append(`<div>뷰가 좋아요</div>`);
					}
				}
			}
	
			
		};
	}
	keywordSplit(".key_wrap");
   
	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('ex_keyword');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}


   //편의사항 키워드
   let exarr=[];
   let exarr2=[];
   let nowex=''
   
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
   
	//스크랩 버튼 
	
	function scrapDo(sel){
		let scrapBtns=document.querySelectorAll(sel);
		console.log(scrapBtns);
		
		for(let i=0;i<scrapBtns.length;i++){
			
			scrapBtns[i].addEventListener("click",function(){
				let isScrap=$(this).attr("data-isscrap");
				let b_id=$(this).attr("data-bid");
				let btn=$(this);
				
				if(!g_id){
					alert("로그인이 필요합니다.");
				}else{
				
					if(!isScrap){ //추천안했다면
						ajaxPromise("private/ajax_good_insert.do", "get", "b_id="+b_id)
						.then(function(response){
							return response.json();
						})
						.then(function(data){
							if(data.isDoScrap){//유저가 테이블에 추가되었다면 
								btn.removeAttr("data-isscrap");
								btn.attr('data-isscrap','true');
								btn.html(`<i class="fas fa-bookmark"></i>`);
							}		
						});	
					}else{ //추천했다면
						ajaxPromise("private/ajax_good_delete.do", "get", "b_id="+b_id)
						.then(function(response){
							return response.json();
						})
						.then(function(data){
							if(data.isNotScrap){//유저가 테이블에 삭제되었다면
								btn.removeAttr("data-isscrap");
								btn.attr('data-isscrap','');	
								btn.html(`<i class="far fa-bookmark"></i>`);
							}
						});	
					}//ajax if 함수 끝
				}//로그인 확인 함수 끝 
					
			});
		};
		
	}
	scrapDo("#scrapRight");
	
	let list ='<c:out value="${list}"/>';
	console.log(list);
	console.log(list.length);
	
	//지도
	let keyword = '<c:out value="${keyword}"/>';
	let ex_keyword = '<c:out value="${ex_keyword}"/>';
	let service = '<c:out value="${service}"/>';
	let b_kind = '<c:out value="${b_kind}"/>';
	let pageNum = '<c:out value="${pageNum}"/>';
	console.log(keyword);
	console.log(ex_keyword);
	console.log(service);
	console.log(b_kind);
	
	
	ajaxPromise("ajax_map.do","get",
			"pageNum="+pageNum+"&keyword="+keyword+"&ex_keyword="+ex_keyword+"&b_kind="+b_kind+"&service="+service)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				
				var mapContainer = document.getElementById('List_map'), // 지도를 표시할 div  
				mapOption = { 
				     center: new kakao.maps.LatLng(
				    		 		36.4453, 128.0453
				    		 ), // 지도의 중심좌표
				     level: 13// 지도의 확대 레벨
				};
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				var positions = [];
				
				for(var i=0; i<data.length; i++){
					var position = new Object();
					position.content = '<div>'+data[i].b_name+'</div>';
					position.latlng = new kakao.maps.LatLng(data[i].lattitude, data[i].longitude);
					positions.push(position);
				}
				console.log(positions);
				
				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				
				for (var i = 0; i < positions.length; i ++) {
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        image : markerImage // 마커 이미지 
				    });
				    
				    //인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
				    	content : positions[i].content
					});
				    
					 kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					 kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				}
							    
			
				// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
				function makeOverListener(map, marker, infowindow) {
				    return function() {
				        infowindow.open(map, marker);
				    };
				}

				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };
				}
			});
	
</script>
</body>
</html>