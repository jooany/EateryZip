<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록 페이지</title>
<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');

/* 공통 */
*{
    font-family: 'Gothic A1', sans-serif;
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
.navbar{
	margin:0 auto;
	
}
.inner{
	width:1000px;
	margin:0 auto;
}
#container{
	margin-top:40px!important;
	margin-bottom:50px!important;
}
body{
	background-color:rgba(0,0,0,.04)!important;
}

.select{
}
/* 카테고리명 */
.sections{
	
	border-radius:2px;
}
.wrap_section{
	width:570px;
	margin:0 auto;
	padding:10px 0;
	margin-bottom:30px!important;
	background-color:white;
	border:1px solid rgba(0,0,0,.1);
	
}
.section_header{
	margin:0 10px;
	border-bottom:1px solid rgba(0,0,0,.2);
	display:flex;
	justify-content:space-between;
	align-items:center;
	padding-bottom:15px;
	padding-top:5px;
}
.section_header .select{
	border:none;
	font-size:22px;
	font-weight:600;
	background-color:rgba(0,0,0,0);
}
.section_header .select>option{
	font-size:18px;
}
.section_header a{
	display:box;
	padding:0!important;
	height:22px!important;
}

.wrap_menu{
	margin-right:5px;
	margin-top:5px;
	margin-bottom:5px;
}
/* 개별 menu form */
.menu{
	height:70px;
	display:flex;
	justify-content:flex-end;
	align-items:center;
	margin-right:10px;
}
.wrap_menu_name > input{
	width:170px;
	height:40px;
	background-color:rgba(0,0,0,0);
	border:none;
	font-size:13px;
	font-weight:600;
	margin-right:40px;
}
.wrap_menu_name > input::placeholder{
	font-size:13px;
	font-weight:600;
	color:black;
}
.wrap_img_n_price{
	width:250px;
	height:60px;
	display:flex;
	justify-content:space-between;
	align-items:center;
	background-color:white;
	border:1px solid rgb(204, 204, 204);
	border-radius:4px;
	margin-right:10px;
	box-sizing:border-box;
	
}
.wrap_img_n_price .menu_img_btn{
	margin-left:6px;
	width:60px;
	height:50px;
	box-sizing:border-box;
}
.wrap_img_n_price .menu_img_wrap{
	width:50px;
	height:50px;
	line-height:50px;
}
.wrap_img_n_price .menu_img{
	width:50px;
	height:50px;
}
.fa-image{
	font-size:50px;
	color:rgba(0,0,0,.3);
}
.wrap_img_n_price .wrap_price{
	display:flex;
	align-items:center;
	background-color:rgba(0,0,0,0);
}
.wrap_img_n_price .wrap_price>input{
	border:none;
	width:150px;
}
.wrap_img_n_price .wrap_price>span{
	padding-right:10px;
	color:rgba(0,0,0,.5);
}
#insertMenuBtn,#deleteMenuBtn,#updateMenuBtn{
	font-size:13px;
}
.addMenuFormBtn{
	display:flex!important;
	align-items:center;
	width:538px;
	height:40px;
	background-color:rgb(243, 156, 18);
	padding-left:10px;
	margin-left:15px;
	margin-bottom:5px;
	color:white!important;
	font-size:14px;
}

.add_section_btn{
	margin-top:60px;
	width:576px;
	height:70px;
	background-color:white;
	display:flex;
	justify-content:center;
	align-items:center;
	color:black;
	border:1px solid rgba(0,0,0,.15);
}
.btn_color{
	color:rgb(253, 83, 0);
}
.btn_color:hover{
	text-decoration:underline;
}
#deleteMenuBtn:hover{
	text-decoration:underline!important;
}
.select:hover{
	background-color:rgba(0,0,0,.05);
}
.menu_name:hover{
	background-color:rgba(0,0,0,.05);
}
.addMenuFormBtn:hover{
	background-color:rgb(224, 116, 0);
}
#addSectionBtn:hover{
	border:1px solid black;
}
.wrap_section:hover{
	border:1px solid black;
}


</style>
</head>
<body>
	<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>

	<div id="container" class="inner" style="display:flex; justify-content:space-between;">
	 	 <jsp:include page="/navbar/sideBar/sideBar.jsp"></jsp:include>
	    <div id="mypageContent">
			<div class="sections">
		        <c:choose>
		            <c:when test="${sectionCount ne 0}">
		                <!-- 저장된 카테고리 개수만큼 섹션을 생성함. -->
		                <c:forEach var="tmp2" items="${sectionNumList }">
		                    <div class="wrap_section" id="wrapSection${tmp2 }" data-section="${tmp2 }">
		                    	<!-- select 태그를 한번만 나타나게 하기 위해서 변수를 설정해줌. -->
		                    	<c:set var="selectOnlyOne" value="0" />
		                        <c:forEach var="tmp" items="${list }">
		                            <c:if test="${tmp2 eq tmp.section_num and selectOnlyOne eq 0}">
		                            	<c:set var="selectOnlyOne" value="1" />
		                                <div class="section_header">
		                                    <select name="section_name_main" class="select select${tmp2}" onchange="changeSectionName(${tmp2},this.value)">
		                                        <option value="main" ${tmp.section_name eq 'main' ? 'selected' : ''}>메인 메뉴</option>
		                                        <option value="set" ${tmp.section_name eq 'set' ? 'selected' : ''}>세트</option>
		                                        <option value="side" ${tmp.section_name eq 'side' ? 'selected' : ''}>사이드</option>
		                                        <option value="dessert" ${tmp.section_name eq 'dessert' ? 'selected' : ''}>디저트</option>
		                                        <option value="beverage" ${tmp.section_name eq 'beverage' ? 'selected' : ''}>음료</option>
		                                    </select>
		                                    <a id="deleteSectionBtn" href="javascript:deleteSectionConfirm(${tmp2 })">
		                                        <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
		                                              <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
		                                        </svg>
		                                    </a>
		                                </div>
		                                <div class="wrap_menu" id="wrapMenu${tmp2}">
		                            </c:if>
		                            <!-- 모든 메뉴 list 중에서 i번째 섹션에 저장된 메뉴 정보를 가져옴. -->
		                                <c:if test="${tmp.section_num eq tmp2 }">
		                                	<div id="wrapForm${tmp.menu_num }">
		                                    <form id="menuForm" class="menu" action="${pageContext.request.contextPath}/users/b_mypage/menu_update.do" method="post" data-menuNum="${tmp.menu_num }">
		                                        
		                                        <!--  <input type="hidden" name="section_num" value="${tmp.section_num }" />
		                                        <input type="hidden" name="section_name" value="${tmp.section_name }"> -->
		                                        <input type="hidden" name="menu_image" value="${tmp.menu_image}" id="inputImg${tmp.menu_num}"/>
		                                        <input type="hidden" name="menu_num" value="${tmp.menu_num}" id="inputNum${tmp.menu_num }"/>
		                                        <input type="hidden" name="b_id" value="${b_id}" />		
		    
		                                        <div class="wrap_menu_name">
		                                            <input type="text" id="inputMenuName${tmp.menu_num}" class="menu_name" name="menu_name" placeholder="메뉴명 입력..." value="${tmp.menu_name }"/>
		                                        </div>
		                                        <div class="wrap_img_n_price">
		                                            <a class="menu_img_btn" data-menuNum="${tmp.menu_num}" href="javascript:;">
		                                                <div id="imgNum${tmp.menu_num}" class="menu_img_wrap">
		                                                    <c:choose>
		                                                        <c:when test="${empty tmp.menu_image }">
		                                                            <i class="far fa-image"></i>
		                                                        </c:when>
		                                                        <c:otherwise>
		                                                            <img class="menu_img" src="${pageContext.request.contextPath}${tmp.menu_image}"/>
		                                                        </c:otherwise>
		                                                    </c:choose>
		                                                </div>
		                                            </a>							
		                                            <div class="wrap_price">
		                                                <input id="price inputPrice${tmp.menu_num}" name="menu_price" type="text" value="${tmp.menu_price }" style="text-align:right;" />
		                                                <span>원</span>
		                                            </div>
		                                        </div>
		                                        <!--  <button id="insertMenuBtn">등록</button>-->
		                                        <!-- <a href="${pageContext.request.contextPath}/users/b_mypage/menu_update.do?menu_num=${tmp.menu_num }">수정</a>-->
		                                        <button type="submit" class="btn_color" style="font-size:13px;">수정</button>
		                                        <a href="javascript:deleteConfirm(${tmp.menu_num },${tmp.section_num })" id="deleteMenuBtn">삭제</a>
		                                    </form>
		                                    </div>	
		                               </c:if>
		                  			  </c:forEach>  
		                       		</div>
		                       		<!-- wrap_menu.end -->
		                    
		        
		                        <a id="addMenuFormBtn" data-sectionNum="${tmp2 }" class="addMenuFormBtn" href="javascript:;" >
		                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
		                              <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
		                            </svg>
		                            <span>메뉴 추가</span>
		                        </a>
		                    </div>
		                    <!-- section_wrap.end -->
		                </c:forEach>
		                <c:set var="isData" value="1" />
		            </c:when>
		            <c:otherwise>
		            <!-- 섹션 폼 추가 sections에 기본 append 하기 -->
		                <c:set var="isData" value="0" />
		            </c:otherwise>
		        </c:choose>
	    	</div>
			<!-- sections.end -->
		
			<button id="addSectionBtn" class="add_section_btn">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
				  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
				</svg>
			</button>
		</div>	
		<form action="${pageContext.request.contextPath}/users/b_mypage/ajax_menu_img_upload.do" method="post" id="imageForm" enctype="multipart/form-data" class="visually-hidden">
					<input type="file" name="image" id="image" 
						accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
		</form>

	</div>
	<!-- container.end -->
	<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>

	// 이미지 선택 후, 이미지를 보이게 하기 위한 현재 클릭한 메뉴 번호를 저장하고 클래스 연결을 위한 변수
	let thisMenu;
	// 임시 메뉴 번호를 부여하기 위한 변수
	let preMenuNum=${menuMaxNum};
	// 카테고리 번호를 부여하기 위한 변수
	let preSectionNum=${sectionMaxNum};
	// 페이지 로딩시, 데이터가 유무 확인 변수 - 데이터가 있으면 1, 데이터가 없으면 0
	let isData = '<c:out value="${isData}"/>';
	
	//데이터가 없으면 기본 폼 구조 로딩
	if(isData=="0"){
		preMenuNum++;
		preSectionNum++;
		
		$(".sections").append(`<div class="wrap_section" id="wrapSection`+preSectionNum+`" data-section="`+preSectionNum+`">
				<div class="section_header">
				<select name="section_name_main" class="select" onchange="changeSectionName(`+preSectionNum+`,this.value)">
					<option value="main" selected>메인 메뉴</option>
					<option value="set">세트</option>
					<option value="side">사이드</option>
					<option value="dessert">디저트</option>
					<option value="beverage">음료</option>
				</select>
				<a id="deleteSectionBtn" href="javascript:deleteSectionConfirm(`+preSectionNum+`)">
					<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg>
				</a>
			</div>
			<div class="wrap_menu">
				<div id="wrapForm`+preMenuNum+`">
                <form id="menuFormJS`+preMenuNum+`" class="menu" action="${pageContext.request.contextPath}/users/b_mypage/menu_insert.do" method="post" data-menuNum="js`+preMenuNum+`">
                	<input type="hidden" name="menu_num" value="`+preMenuNum+`" />
                	<input type="hidden" name="section_name" id="inputSectionName`+preSectionNum+`" value="main" /> 
                    <input type="hidden" name="section_num" id="inputSectionNumJS`+preSectionNum+`" value="`+preSectionNum+`" />
                    <input type="hidden" name="menu_image" id="inputImgjs`+preMenuNum+`"/>
                    <input type="hidden" name="b_id" value="${b_id}"/>
                    <div class="wrap_menu_name">
                        <input type="text" id="inputMenuName" class="menu_name" name="menu_name" placeholder="메뉴명 입력..."/>
                    </div>
                    <div class="wrap_img_n_price">
                        <a class="menu_img_btn menu_img_btn`+preMenuNum+`" data-menuNum="js`+preMenuNum+`" href="javascript:;">
                            <div id="imgNumjs`+preMenuNum+`" class="menu_img_wrap">
								<i class="far fa-image"></i>
                            </div>
                        </a>							
                        <div class="wrap_price">
                            <input id="price" name="menu_price" type="text" style="text-align:right;" />
                            <span>원</span>
                        </div>
                    </div>
                    <button type="submit" class="btn_color" style="font-size:13px;" id="insertMenuBtn insertMenuBtn`+preMenuNum+`" data-menuNum="js`+preMenuNum+`">등록</button>
                    <a href="javascript:;" onclick="deleteConfirm(`+preMenuNum+`,`+preSectionNum+`)" id="deleteMenuBtn">삭제</a>
                </form> 
                </div>
			</div>   
			<a id="addMenuFormBtn`+preSectionNum+`" href="javascript:;" data-sectionNum="`+preSectionNum+`" class="addMenuFormBtn">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
					<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
				</svg>
				<span>메뉴 추가</span>
			</a>
		</div>`);		
		
		//이벤트 리스너 추가 
		
		insertMenuListener("#menuFormJS"+preMenuNum);
		addMenuFormListener("#addMenuFormBtn"+preSectionNum);
		
	}

	
	//섹션 추가
	$(".add_section_btn").click(function(){
	
		preMenuNum++;
		preSectionNum++;
		
		$(".sections").append(`<div class="wrap_section" id="wrapSection`+preSectionNum+`" data-section="`+preSectionNum+`">
				<div class="section_header">
				<select name="section_name_main" class="select" onchange="changeSectionName(`+preSectionNum+`,this.value)">
					<option value="main" selected>메인 메뉴</option>
					<option value="set">세트</option>
					<option value="side">사이드</option>
					<option value="dessert">디저트</option>
					<option value="beverage">음료</option>
				</select>
				<a id="deleteSectionBtn" href="javascript:deleteSectionConfirm(`+preSectionNum+`)">
					<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg>
				</a>
			</div>
			<div class="wrap_menu">
				<div id="wrapForm`+preMenuNum+`">
                <form id="menuFormJS`+preMenuNum+`" class="menu" action="${pageContext.request.contextPath}/users/b_mypage/menu_insert.do" method="post" data-menuNum="js`+preMenuNum+`">
                	<input type="hidden" name="menu_num" value="`+preMenuNum+`" />
                	<input type="hidden" name="section_name" id="inputSectionName`+preSectionNum+`" value="main" /> 
                    <input type="hidden" name="section_num" id="inputSectionNumJS`+preSectionNum+`" value="`+preSectionNum+`" />
                    <input type="hidden" name="menu_image" id="inputImgjs`+preMenuNum+`"/>
                    <input type="hidden" name="b_id" value="${b_id}"/>
                    <div class="wrap_menu_name">
                        <input type="text" id="inputMenuName" class="menu_name" name="menu_name" placeholder="메뉴명 입력..."/>
                    </div>
                    <div class="wrap_img_n_price">
                        <a class="menu_img_btn menu_img_btn`+preMenuNum+`" data-menuNum="js`+preMenuNum+`" href="javascript:;">
                            <div id="imgNumjs`+preMenuNum+`" class="menu_img_wrap">
								<i class="far fa-image"></i>
                            </div>
                        </a>							
                        <div class="wrap_price">
                            <input id="price" name="menu_price" type="text" style="text-align:right;" />
                            <span>원</span>
                        </div>
                    </div>
                    <button type="submit" class="btn_color" style="font-size:13px;" id="insertMenuBtn insertMenuBtn`+preMenuNum+`" data-menuNum="js`+preMenuNum+`">등록</button>
                    <a href="javascript:;" onclick="deleteConfirm(`+preMenuNum+`,`+preSectionNum+`)" id="deleteMenuBtn">삭제</a>
                </form> 
                </div>
			</div>   
			<a id="addMenuFormBtn`+preSectionNum+`" href="javascript:;" data-sectionNum="`+preSectionNum+`" class="addMenuFormBtn">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
					<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
				</svg>
				<span>메뉴 추가</span>
			</a>
		</div>`);		
		
		//이벤트 리스너 추가 
		clickImgEventListener($(".menu_img_btn"+preMenuNum));
		insertMenuListener("#menuFormJS"+preMenuNum);
		addMenuFormListener("#addMenuFormBtn"+preSectionNum);
		
	});
	
	//메뉴 폼 추가
	//동적 메뉴 추가 폼 : 카테고리번호, 카테고리명, 이미지 경로(ajax), 메뉴명, 가격 저장 (섹션-카테고리명 변경)
	function addMenuFormListener(sel){
		let addMenuFormBtns=document.querySelectorAll(sel);
		
		for(let i=0;i<addMenuFormBtns.length;i++){
			addMenuFormBtns[i].addEventListener("click",function(){
				
				preMenuNum++;
				
				//클릭한 버튼에 해당하는 form 요소 선택 
				let addMenuForm=$(this).prev();
				//클릭한 버튼에서 카테고리번호 가져오기
				let thisSecNum=$(this).attr("data-sectionNum");
				//클릭한 카테고리명 가져오기 
				let thisSecName=$(".select"+thisSecNum+" option:selected").val();
				
				
				addMenuForm.append(`<div id="wrapForm`+preMenuNum+`"><form id="menuFormJS`+preMenuNum+`" class="menu" action="${pageContext.request.contextPath}/users/b_mypage/menu_insert.do" method="post" data-menuNum="js`+preMenuNum+`">
						<input type="hidden" name="menu_num" value="`+preMenuNum+`" />
						<input type="hidden" name="section_name" id="inputSectionName`+thisSecNum+`" value="main"> 
                        <input type="hidden" name="section_num" id="inputSectionNumJS`+thisSecNum+`" value="`+thisSecNum+`" />
                        <input type="hidden" name="menu_image" id="inputImgjs`+preMenuNum+`"/>
                        <input type="hidden" name="b_id" value="${b_id}"/>
                        <div class="wrap_menu_name">
                            <input type="text" id="inputMenuName" class="menu_name" name="menu_name" placeholder="메뉴명 입력..."/>
                        </div>
                        <div class="wrap_img_n_price">
                            <a class="menu_img_btn menu_img_btn`+preMenuNum+`" data-menuNum="js`+preMenuNum+`" href="javascript:;">
                                <div id="imgNumjs`+preMenuNum+`" class="menu_img_wrap">
									<i class="far fa-image"></i>
                                </div>
                            </a>							
                            <div class="wrap_price">
                                <input id="price" name="menu_price" type="text" style="text-align:right;" />
                                <span>원</span>
                            </div>
                        </div>
                        <button type="submit" class="btn_color" style="font-size:13px;" id="insertMenuBtn insertMenuBtn`+preMenuNum+`" data-menuNum="js`+preMenuNum+`">등록</button>
                        <a href="javascript:;" onclick="deleteConfirm(`+preMenuNum+`,`+thisSecNum+`)" id="deleteMenuBtn">삭제</a>
                    </form></div>`);
				
				clickImgEventListener($(".menu_img_btn"+preMenuNum));
				insertMenuListener("#menuFormJS"+preMenuNum);
				
				
				
				console.log(preMenuNum);
			});
		};
	};
	addMenuFormListener("#addMenuFormBtn");
	
	//카테고리 변경시, 1. 해당 카테고리에 저장된 db에 모든 카테고리 이름을 변경하고
    //            2. 클라이언트서버에선 <input section_name> 요소 있는지 확인 후, 있으면 요소들 전부의 value 값으로 select한 카테고리명을 저장
	function changeSectionName(sectionNum,selectedName){
		//location.href="${pageContext.request.contextPath}/users/b_mypage/update_section_name.do?section_num="+num+"&section_name="+selectedName;
		ajaxPromise("update_section_name.do", "get", "section_num="+sectionNum+"&section_name="+selectedName)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			if(data.isSuccess){
				
				$("#inputSectionName"+sectionNum).val(selectedName);
			}
		});
	}
    
    let isOnlyNum;
    

	//메뉴 db 등록하기 
    function insertMenuListener(sel){
		let menuForm=document.querySelector(sel);

    	menuForm.addEventListener("submit",function(e){
    		let form=this;
    		let form2=$(this);
    		
    		e.preventDefault();
    		
    		let nameNull=form2.children(".wrap_menu_name").children("#inputMenuName").val();
    		let priceNull=form2.children(".wrap_img_n_price").children(".wrap_price").children("input").val();
    		
    		let regex= /^[0-9]/g;
    		if(!regex.test(priceNull)){
    			isOnlyNum='';
    		}else{
    			isOnlyNum=true;
    		}
    		
    		if(nameNull&&priceNull&&isOnlyNum){
        	
	        	ajaxFormPromise(form)
	    		.then(function(response){
	    			return response.json();
	    		})
	    		.then(function(data){
					alert("등록되었습니다.");
	    			let cPath = '<c:out value="${pageContext.request.contextPath}"/>';
	    			let menuImg = data.menuImg;
	    			//alert(`${menuImg}`);
	    			//데이터 추가된 수정 폼 추가 
	    			console.log("menuImg : "+menuImg);
	    			form2.parent().append(`<form id="menuForm`+data.menuNum+`" class="menu" action="${pageContext.request.contextPath}/users/b_mypage/menu_update.do" method="post" data-menuNum="`+data.menuNum+`">  
	                        <input type="hidden" name="menu_image" ${menuImg ne ''? 'value="`+data.menuImg+`"' : '""'} id="inputImg`+data.menuNum+`"/>
	                        <input type="hidden" name="menu_num" value="`+data.menuNum+`" />
	                        <input type="hidden" name="b_id" value="${b_id}"/>
	                        <div class="wrap_menu_name">
	                            <input type="text" id="inputMenuName`+data.menuNum+`" class="menu_name" name="menu_name" placeholder="메뉴명 입력..." value="`+data.menuName+`"/>
	                        </div>
	                        <div class="wrap_img_n_price">
	                            <a class="menu_img_btn" id="menuImgBtn`+data.menuNum+`" data-menuNum="`+data.menuNum+`" href="javascript:;">
	                                <div id="imgNum`+data.menuNum+`" class="menu_img_wrap">
	                                \${menuImg == '' ? '<i class="far fa-image"></i>' : '<img class="menu_img" src="'+cPath+menuImg+'"/>'}
	                                </div>
	                            </a>							
	                            <div class="wrap_price">
	                                <input id="price inputPrice`+data.menuNum+`" name="menu_price" type="text" value="`+data.menuPrice+`" style="text-align:right;" />
	                                <span>원</span>
	                            </div>
	                        </div>
	                        <button type="submit" class="btn_color" style="font-size:13px;">수정</button>
	                        <a href="javascript:deleteConfirm(`+data.menuNum+`,`+data.sectionNum+`)" id="deleteMenuBtn">삭제</a>
	                    </form>`);
	    			
	    			//기존 등록 폼 제거
	    			form2.remove();
	
	    			//필요한 이벤트 리스너 추가
	    			updateMenuListener("#menuForm"+data.menuNum);
	    			clickImgEventListener($("#menuImgBtn"+data.menuNum));
	    		});
        	
    	}else if(!isOnlyNum){
    		alert("가격은 숫자로만 입력하세요!");
    	}else{
    		alert("공백 없이 입력하세요!");
    	};
    		
    });
  };
	
	//메뉴 수정 이벤트 리스너
	function updateMenuListener(sel){
		
		let menuForms=document.querySelectorAll(sel);
		
		for(let i=0;i<menuForms.length;i++){
			menuForms[i].addEventListener("submit",function(e){
				
				const form = this;
				const form2=$(this);
				e.preventDefault();
				
				let nameNull=form2.children(".wrap_menu_name").children(".menu_name").val();
	    		let priceNull=form2.children(".wrap_img_n_price").children(".wrap_price").children("input").val();
	    		
	    		let regex= /^[0-9]/g;
	    		if(!regex.test(priceNull)){
	    			isOnlyNum='';
	    		}else{
	    			isOnlyNum=true;
	    		}
	    		
				let menuNum=$(this).attr("data-menuNum");
				
				if(nameNull&&priceNull&&isOnlyNum){
					ajaxFormPromise(form)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						alert("수정되었습니다.");
						$("#inputImg"+menuNum).val(data.menuImg);
						$("#inputMenuName"+menuNum).val(data.menuName);
						$("#inputPrice"+menuNum).val(data.menuPrice);
						$("#inputNum"+menuNum).val(data.menuNum);
					});
				}else if(!isOnlyNum){
		    		alert("가격은 숫자로만 입력하세요!");
		    	}else{
		    		alert("공백 없이 입력하세요!");
		    	};
				
			});//submit 이벤트 끝
		}//for문끝
	}
	//메뉴 수정 이벤트 리스너 실행
	updateMenuListener("#menuForm");
	
	//메뉴 삭제
	function deleteConfirm(menu_num,section_num){
		
		const isDelete=confirm("해당 메뉴를 삭제하시겠습니까?");
		
		if(isDelete){
			ajaxPromise("delete_menu.do", "get", "menu_num="+menu_num+"&section_num="+section_num)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log($("#wrapForm"+menu_num));
				$("#wrapForm"+menu_num).remove();	
				
			});
			
		}
		
	}
	
	//추가한 메뉴에서도 메뉴 이미지 경로 ajax 요청하기 위한 이벤트 리스너
	function clickImgEventListener(sel){
		sel.click(function(){
			thisMenu=$(this).attr("data-menuNum");
			// input type="file" 을 강제 클릭 시킨다. 
			$("#image").trigger("click");	
		});
	};
	
	//메뉴 이미지 링크를 클릭하면 
	$(".menu_img_btn").click(function(){
		thisMenu=$(this).attr("data-menuNum");
		// input type="file" 을 강제 클릭 시킨다. 
		$("#image").trigger("click");	
	});
	
	//메뉴 이미지 선택 시, 기존의 선택 파일에서 변화가 생길 때
	$("#image").change(function(){
			
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			//해당 이미지 경로를 가진 이미지 요소를 생성하여 innrHTML에 넣어주고
			//이미지 경로를 전송하는 input의 value 값에 이미지 경로를 넣어준다.
			let img=`<img class="menu_img" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;

			if(data.imagePath !=''){
				$("#imgNum"+thisMenu).html(img);
			}
			$("#inputImg"+thisMenu).val(data.imagePath);
		});
	}); //#image.change.end
		
	//섹션 삭제
	function deleteSectionConfirm(num){
		const isDelete=confirm("해당 카테고리를 삭제하시겠습니까?\n*모든 메뉴가 삭제됩니다.");

		if(isDelete){
			ajaxPromise("delete_section.do", "get", "section_num="+num)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				if(data.isSuccess){
					$("#wrapSection"+num).remove();
					
				}
			});
		}
	}
	
	//비동기 처리 나중에 하기 
	//같은 이미지 선택 시, 경고 메시지 띄우기
	//if(!isChange){
	//	alert("같은 이미지는 넣을 수 없습니다.");
	//}			
	


	
</script>
</body>
</html>