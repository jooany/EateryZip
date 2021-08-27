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
/* 공통 */
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
	width:1100px;
	margin:0 auto;
}
#container{
	margin-top:50px!important;
	width:576px;
	margin:0 auto;
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
	background-color:rgba(0,0,0,.05);
	
}
.section_header{
	margin:0 10px;
	border-bottom:1px solid rgba(0,0,0,.5);
	display:flex;
	justify-content:space-between;
	padding-bottom:6px;
}
.section_header .select{
	border:none;
	font-size:24px;
	font-weight:600;
	background-color:rgba(0,0,0,0);
}
.section_header .select>option{
	font-size:18px;
}
.section_header button{
	padding:0!important;
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
	font-size:16px;
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
.wrap_img_n_price .fa-image{
	font-size:50px;
	color:rgba(0,0,0,.3);
}
.wrap_img_n_price .wrap_price{
	display:flex;
	align-items:center;
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
#addMenuFormBtn{
	display:flex!important;
	align-items:center;
	width:550px;
	height:40px;
	background-color:rgb(224, 224, 224);
	padding-left:10px;
	margin-left:10px;
}

.add_section_btn{
	margin-top:50px;
	width:576px;
	height:55px;
	background-color:rgba(0,0,0,.05);
	display:flex;
	justify-content:center;
	align-items:center;
}

</style>
</head>
<body>
	<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>
	<div id="container" class="inner">	
		<div class="sections">
	        <c:choose>
	            <c:when test="${sectionCount ne 0}">
	                <!-- 저장된 카테고리 개수만큼 섹션을 생성함. -->
	                <c:forEach var="i" begin="1" end="${sectionCount }">
	                    <div class="wrap_section" data-section="${i }">
	                    	<!-- select 태그를 한번만 나타나게 하기 위해서 변수를 설정해줌. -->
	                    	<c:set var="selectOnlyOne" value="0" />
	                        <c:forEach var="tmp" items="${list }">
	                            <c:if test="${i eq tmp.section_num and selectOnlyOne eq 0}">
	                            	<c:set var="selectOnlyOne" value="1" />
	                                <div class="section_header">
	                                    <select name="section_name_main" class="select" onchange="changeSectionName(${i},this.value)">
	                                        <option value="main" ${tmp.section_name eq 'main' ? 'selected' : ''}>메인 메뉴</option>
	                                        <option value="set" ${tmp.section_name eq 'set' ? 'selected' : ''}>세트</option>
	                                        <option value="side" ${tmp.section_name eq 'side' ? 'selected' : ''}>사이드</option>
	                                        <option value="dessert" ${tmp.section_name eq 'dessert' ? 'selected' : ''}>디저트</option>
	                                        <option value="beverage" ${tmp.section_name eq 'beverage' ? 'selected' : ''}>음료</option>
	                                    </select>
	                                    <button id="deleteSectionBtn">
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
	                                              <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
	                                        </svg>
	                                    </button>
	                                </div>
	                                <div class="wrap_menu">
	                            </c:if>
	                            <!-- 모든 메뉴 list 중에서 i번째 섹션에 저장된 메뉴 정보를 가져옴. -->
	                                <c:if test="${tmp.section_num eq i }">
	                                    <form id="menuForm" class="menu" action="${pageContext.request.contextPath}/users/b_mypage/menu_update.do" method="post" data-menuNum="${tmp.menu_num }">
	                                        
	                                        <!--  <input type="hidden" name="section_num" value="${tmp.section_num }" />
	                                        <input type="hidden" name="section_name" value="${tmp.section_name }"> -->
	                                        <input type="hidden" name="menu_image" value="${tmp.menu_image}" id="inputImg${tmp.menu_num}"/>
	                                        <input type="hidden" name="menu_num" value="${tmp.menu_num}" />		
	    
	                                        <div class="wrap_menu_name">
	                                            <input type="text" id="inputMenuName${tmp.menu_num}" class="menu_name" name="menu_name" placeholder="메뉴 1" value="${tmp.menu_name }"/>
	                                        </div>
	                                        <div class="wrap_img_n_price">
	                                            <a class="menu_img_btn" data-menuNum="${tmp.menu_num}" href="#">
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
	                                        <button type="submit">수정</button>
	                                        <a href="javascript:deleteConfirm(${tmp.menu_num })" id="deleteMenuBtn">삭제</a>
	                                    </form>	
	                                </c:if>
	                       		</c:forEach>  
	                       	</div>
	                    
	        
	                        <a id="addMenuFormBtn" href="#">
	                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
	                              <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	                            </svg>
	                            <span>메뉴 추가</span>
	                        </a>
	                    </div>
	                    <!-- section_wrap.end -->
	                </c:forEach>
	                
	            </c:when>
	            <c:otherwise>
	                <h1>${sectionCount }</h1>
	            </c:otherwise>
	        </c:choose>
    	</div>
		<!-- sections.end -->
		
		<button id="addSectionBtn" class="add_section_btn">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
			  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
		</button>
		

		
		<form action="${pageContext.request.contextPath}/users/b_mypage/ajax_menu_img_upload.do" method="post" id="imageForm" enctype="multipart/form-data">
					<input type="file" name="image" id="image" 
						accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
		</form>

	</div>
	<!-- container.end -->
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>

	

	
	//카테고리 영역 번호 & 메뉴 번호 & 총 메뉴 개수
	let sectionNum=1;
	let menuNum=1;
	let menuCount=1;
	
	// 이미지 선택 후, 이미지를 보이게 하기 위한 현재 클릭한 메뉴 번호를 저장하고 클래스 연결을 위한 변수
	let thisMenu;
	
	// 동적으로 추가한 메뉴 폼에 임시 메뉴 번호를 부여하기 위한 변수
	let sMenuNum;
	
	//카테고리명을 변경하면 b_id와 section_num을 파라미터로 하여  해당 section_num의 section_name 값을 update 한 후, redirect 하기 위해
	//section_num과 section_name을 url 파라미터로 넘겨줌.
	function changeSectionName(num,selectedName){
		location.href="${pageContext.request.contextPath}/users/b_mypage/update_section_name.do?section_num="+num+"&section_name="+selectedName;
	}
	
	//메뉴 수정
	function updateMenuListener(sel){
		
		let menuForms=document.querySelectorAll(sel);
		
		for(let i=0;i<menuForms.length;i++){
			menuForms[i].addEventListener("submit",function(e){
				
				const form = this;
				
				e.preventDefault();
				
				let menuNum=this.dataset.menuNum;
				
				ajaxFormPromise(form)
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					console.log(data);
					document.querySelector("#inputImg"+menuNum).value=data.menuImg;
					document.querySelector("#inputMenuName"+menuNum).value=data.menuName;
					document.querySelector("#inputPrice"+menuNum).value=data.menuPrice;
				});
				
			});//submit 이벤트 끝
		}//for문끝
	}
	//메뉴 수정 이벤트 리스너 실행
	updateMenuListener("#menuForm");
	
	//메뉴 삭제
	function deleteConfirm(num){
		const isDelete=confirm("해당 메뉴를 삭제하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/b_mypage/delete_menu.do?menu_num="+num;
		}
	}
	
	
	//메뉴 이미지 링크를 클릭하면 
	$(".menu_img_btn").click(function(){
		thisMenu=$(this).attr("data-menuNum");
		alert(thisMenu);
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
			$("#imgNum"+thisMenu).html(img);
			$("#inputImg"+thisMenu).val(data.imagePath);
		});
	}); //#image.change.end
		
	
	//비동기 처리 나중에 하기 
	//같은 이미지 선택 시, 경고 메시지 띄우기
	//if(!isChange){
	//	alert("같은 이미지는 넣을 수 없습니다.");
	//}			
	


	
</script>
</body>
</html>