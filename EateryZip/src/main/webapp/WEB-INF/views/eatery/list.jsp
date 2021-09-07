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
        margin: 40px;
          display: flex;
          float: left;
          flex-wrap: wrap;
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
      h2{
      	font-size: 30px;
      	font-weight: bold;
      	color: rgb(255, 255, 255);
      }
      .main_title{
      	padding: 15px;
      	background-color: rgb(253, 83, 0);
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
        border: 1px solid #cecece;
        padding: 15px;
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
	   margin:2% 5px 2% 5px;
	   background-color: #fff;
	   transition: box-shadow .25s;
	   border-radius: 2px;
	   box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
	   padding:0;
	   min-width:660px;
	   max-width:700px;
	   flex-direction:row!important;
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
	  padding: 10px;
	  width: 480px;
	  border-radius: 0 0 2px 2px;
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
	   -webkit-flex-direction: column;
	    -ms-flex-direction: column;
	    flex-direction: column;
	   -webkit-flex: 1;
	    -ms-flex: 1;
	    flex: 1;
	   position: relative;
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
	}
	h3 span {
		font-size: 15px;
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
</style>
</head>
<body>
    <section>
       <div class="main_left">
  
        <!-- 편의사항 선택 -->
		<fieldset>
        	<legend>편의사항</legend>
            <div class="form-group mb-3 wrap1" id="ex_keyword">
				<input type='checkbox' name='ex_keyword' value='루프탑' onclick='checkSelectAll()'/> 루프탑
				<br />
				<input type='checkbox' name='ex_keyword' value='주차' onclick='checkSelectAll()'/> 주차
				<br />
				<input type='checkbox' name='ex_keyword' value='무선인터넷' onclick='checkSelectAll()'/> 무선인터넷
				<br />
				<input type='checkbox' name='ex_keyword' value='단체석' onclick='checkSelectAll()'/> 단체석
				<br />
				<input type='checkbox' name='ex_keyword' value='남/녀 화장실 구분' onclick='checkSelectAll()'/> 남/녀 화장실 구분
				<br />
				<input type='checkbox' name='ex_keyword' value='키즈존' onclick='checkSelectAll()'/> 키즈존
				<br />
				<input type='checkbox' name='ex_keyword' value='노키즈존' onclick='checkSelectAll()'/> 노키즈존
				<br />
				<input type='checkbox' name='ex_keyword' value='반려동물동반가능' onclick='checkSelectAll()'/> 반려동물동반가능
				<br />
				<input type='checkbox' name='ex_keyword' value='프라이빗' onclick='checkSelectAll()'/> 프라이빗
				<br />
				<input type='checkbox' name='ex_keyword' value='흡연실' onclick='checkSelectAll()'/> 흡연실
            </div>
		</fieldset>

      	<!-- 업종 -->
      	<h4>업종</h4>
	      	<div class="wrap1">
	         <button type="button" id="kFood" class="food btn btn-outline-dark">
	            <img src="${pageContext.request.contextPath}/resources/images/bibimbap.png"> 한식
	         </button>
	         <button type="button" id="jFood" class="food btn btn-outline-dark">
	            <img src="${pageContext.request.contextPath}/resources/images/sushi.png"> 일식
	         </button>
	         <br />
	         <button type="button" id="cFood" class="food btn btn-outline-dark">
	            <img src="${pageContext.request.contextPath}/resources/images/xiao-long-bao.png"> 중식
	         </button>
	         <button type="button" id="wFood" class="food btn btn-outline-dark">
	            <img src="${pageContext.request.contextPath}/resources/images/steak.png"> 양식
	         </button>
	         <br />
	         <button type="button" id="brunch" class="food btn btn-outline-dark">
	            <img src="${pageContext.request.contextPath}/resources/images/pancake.png"> 브런치
	         </button>
	         <button type="button" id="bar" class="food btn btn-outline-dark">
	            <img src="${pageContext.request.contextPath}/resources/images/cocktail.png"> Bar
	         </button>
	         <br />
	         <button type="button" id="cafe" class="food btn btn-outline-dark">
	            <img src="${pageContext.request.contextPath}/resources/images/coffee-cup.png"> 카페
	         </button>
	       	</div>
    	</div>
    </section>

    <section>
      <div class="main_middle">
            <div class="main_title">
                <h2>추천 맛집</h2>
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

             <ul class="tabs">
                <li class="tab-link current" data-tab="tab-1">전체</li>
                <li class="tab-link" data-tab="tab-2">예약</li>
                <li class="tab-link" data-tab="tab-3">방문포장</li>
             </ul>
         
            <!-- 음식점 리스트 * 6 -->
            <div id="tab-1" class="card_wrapper tab-content current">         
			   <c:forEach var="tmp" items="${list }">
			    <div class="didRow">
			      <div class="card_wrapper">
			        <div class="card" style="display:flex;">
			          <div class="card-image cimg" style="width:150px;">
			            <img src="${tmp.b_img_f }" width="150" height="150">
			          </div>
			          <div class="card-stacked">
			            <div class="card-content">
			               <h3>
			                  <a href="${pageContext.request.contextPath}/eatery/detail.do">${tmp.b_name }</a>
			                  <span>| ${tmp.b_kind }</span>
			               </h3>
			               <!-- 리뷰 3개 -->
			               <c:forEach begin="1" end="3">
			                  <p>reviews * 3</p>
			               </c:forEach>
			               <p class="card_intro">${tmp.intro }</p>
			               <!-- 편의사항 3개 -->
			               <c:forEach begin="1" end="3">
			                  <p>${tmp.ex_keyword }</p>
			               </c:forEach>
			             </div>
			           </div>
			         </div>
			      </div>
			   </div>
			   </c:forEach>
			</div>
            
            <div id="tab-2" class="tab-content">
            	<c:forEach var="tmp" items="${list }">
			    <div class="didRow">
			      <div class="card_wrapper">
			        <div class="card" style="display:flex;">
			          <div class="card-image cimg" style="width:150px;">
			            <img src="${tmp.b_img_f }" width="150" height="150">
			          </div>
			          <div class="card-stacked">
			            <div class="card-content">
			               <h3>
			                  <a href="${pageContext.request.contextPath}/eatery/detail.do">${tmp.b_name }</a>
			                  <span>| ${tmp.b_kind }</span>
			               </h3>
			               <!-- 리뷰 3개 -->
			               <c:forEach begin="1" end="3">
			                  <p>reviews * 3</p>
			               </c:forEach>
			               <p class="card_intro">${tmp.intro }</p>
			               <!-- 편의사항 3개 -->
			               <c:forEach begin="1" end="3">
			                  <p>${tmp.ex_keyword }</p>
			               </c:forEach>
			             </div>
			           </div>
			         </div>
			      </div>
			   </div>
			   </c:forEach>
            </div>
            
            <div id="tab-3" class="tab-content">
                <c:forEach var="tmp" items="${list }">
			    <div class="didRow">
			      <div class="card_wrapper">
			        <div class="card" style="display:flex;">
			          <div class="card-image cimg" style="width:150px;">
			            <img src="${tmp.b_img_f }" width="150" height="150">
			          </div>
			          <div class="card-stacked">
			            <div class="card-content">
			               <h3>
			                  <a href="${pageContext.request.contextPath}/eatery/detail.do">${tmp.b_name }</a>
			                  <span>| ${tmp.b_kind }</span>
			               </h3>
			               <!-- 리뷰 3개 -->
			               <c:forEach begin="1" end="3">
			                  <p>reviews * 3</p>
			               </c:forEach>
			               <p class="card_intro">${tmp.intro }</p>
			               <!-- 편의사항 3개 -->
			               <c:forEach begin="1" end="3">
			                  <p>${tmp.ex_keyword }</p>
			               </c:forEach>
			             </div>
			           </div>
			         </div>
			      </div>
			   </div>
			   </c:forEach>
            </div>
       </div>
    </section>

    <section>
       <div class="main_right">
          
       </div>
    </section>

	<footer>
		<div>
			<p>사업자등록번호 : 111-11-11111 / 대표자 : 정주연/ 강민재/ 윤혜림/ 김나현/ 유형우</p> 
			<p> 주소 : 서울특별시 강남구 테헤란로 124 삼원타워 5 COPYRIGHT 2021 © MAT ZIP ALL RIGHTS RESERVED.</p>
		</div>
	</footer>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
      
   //편의사항   
	//function checkSelectAll()  {
	  // 전체 체크박스
	//  const checkboxes 
	//    = document.querySelectorAll('input[name="ex_keyword"]');
	  // 선택된 체크박스
	//  const checked 
	//    = document.querySelectorAll('input[name="ex_keyword"]:checked');
	  
	//  if(checkboxes.length === checked.length)  {
	//    selectAll.checked = true;
	//  }else {
	//    selectAll.checked = false;
	//  }
	
	//}
	
	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('ex_keyword');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}

   //업종
   //function btnClickEventListener(){
	//   for(let i=0; i<7; i++){
	//	   $("#ex_keyword").children.eq(i).click(function({
	//		   let ex_key=("#ex_keyword").children().eq(i);
	//	   })
	//   }
 //  }
   
   //리뷰키워드
   let reviewArr=[];
   let reviewArr2=[];
   let nowReview='<c:out value="${dto2.keyword_review}"/>'
   console.log(nowReview);
   
   if(nowReview){
	   reviewArr2=nowReview.split(",");
   }
   console.log(reviewArr2);
   for(let i=0; i<7;i++){
	   let keyBtn=$("keywordBtns").children().eq(i);
	   
	   for(let item of reviewArr2){
		   if(keyBtn.text()==item){
			   $("#keywords").children().eq(i).prop("checked", true);
		   }
	   }
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

</script>
</body>
</html>