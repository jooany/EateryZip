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
	background-color:rgba(0,0,0,.05);
	border-radius:2px;
}
.wrap_section{
	width:550px;
	margin:0 auto;
	padding:10px 0;
}
.section_header{
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
}
/* menu 한 영역 */
.menu{
	height:75px;
	display:flex;
	justify-content:flex-end;
	align-items:center;
	margin:5px 0;
}
.wrap_menu_name > input{
	width:170px;
	height:40px;
	background-color:rgba(0,0,0,0);
	border:none;
	font-size:13px;
	font-weight:600;
	margin-right:33px;
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
			<div class="wrap_section" data-section="1">
				<div class="section_header">
					<select name="section_name" class="select">
						<option value="" disabled selected hidden>분류 1</option>
						<option value="main">메인 메뉴</option>
						<option value="set">세트</option>
						<option value="side">사이드</option>
						<option value="dessert">디저트</option>
						<option value="beverage">음료</option>
					</select>
					<button id="deleteSectionBtn">
						<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
						</svg>
					</button>
				</div>
				<div class="wrap_menu">
					 
					<form id="menuForm" class="menu" action="${pageContext.request.contextPath}/eatery/private/menu_insert.do" method="post">
						<div class="wrap_menu_name">
							<input type="text" class="menu_name" name="menu_name" placeholder="메뉴 1" />
						</div>
						<div class="wrap_img_n_price">
							<a class="menu_img_btn" data-sectionNum="1" data-menuNum="1" href="#">
								<div id="menuImgWrap_1_1" class="menu_img_wrap">
									<i class="far fa-image"></i>
								</div>
							</a>							
							<div class="wrap_price">
								<input id="price" name="menu_price" type="text" style="text-align:right;" />
								<span>원</span>
							</div>
						</div>
						<button id="insertMenuBtn">등록</button>
						<button id="deleteMenuBtn">삭제</button>
					</form>
							
				</div>
				
				<a id="addMenuFormBtn" href="#">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
					  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
					</svg>
					<span>메뉴 추가</span>
				</a>
			</div>
			<!-- section_wrap.end -->
		</div>
		<!-- sections.end -->
		
		<button id="addSectionBtn" class="add_section_btn">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
			  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
		</button>
		

		
		<form action="${pageContext.request.contextPath}/eatery/ajax_menu_img_upload.do" method="post" id="imageForm" enctype="multipart/form-data">
					<input type="file" name="image" id="image" 
						accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
		</form>

	</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	//카테고리 영역 번호 & 메뉴 번호 & 총 메뉴 개수
	let sectionNum=1;
	let menuNum=1;
	let menuCount=1;
	
	let thisSection;
	let thisMenu;
	
	
	//프로필 이미지 링크를 클릭하면 
	$(".menu_img_btn").click(function(){
		thisSection=$(this).attr("data-sectionNum");
		thisMenu=$(this).attr("data-menuNum");
		alert(thisSection+"_"+thisMenu);
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			let img=`<img class="menu_img" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			document.querySelector("#menuImgWrap_"+thisSection+"_"+thisMenu).innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			 //let inputMenuImagePath=`<input type="hidden" name="menuimg_`+thisSection+`_`+thisMenu+`">`;
			 let inputMenuImagePath=`<input type="hidden" name="menu_image">`;
			 $("#menuForm").append(inputMenuImagePath);
			 document.querySelector("input[name=menu_image]").value=data.imagePath;
			 console.log(inputMenuImagePath);
		});
	});
</script>
</body>
</html>