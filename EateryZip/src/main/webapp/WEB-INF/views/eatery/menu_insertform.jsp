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
.inner{
	width:1100px;
	margin:0 auto;
}
</style>
</head>
<body>
	<div id="container" class="inner">
		<form id="wrapSection">
			
			<!-- section 별 input 그룹 -->
			<div class="section_1">
				<select name="" id="">
					<option value="main">메인 메뉴</option>
					<option value="set">세트</option>
					<option value="side">사이드</option>
					<option value="dessert">디저트</option>
					<option value="beverage">음료</option>
				</select>
				<div class="wrap_menu">
					<div class="menu_1_1">
						<div class="wrap_menu_name">
							<span>메뉴 1</span>
							<button id="editMenuName">
								<i class="fas fa-pen"></i>
							</button>
							<input type="text" />
							<button id="completeMenuName">
								<i class="fas fa-check"></i>
							</button>
						</div>
						
						<div class="wrap_img_n_price">
							<a class="menu_img_btn" data-sectionNum="1" data-menuNum="1" href="#">
								<div id="menuImgWrap_1_1">
									<i class="far fa-image"></i>
								</div>
							</a>
							
							<input id="price" name="price" type="text" />
							<span>원</span>
						</div>
						<button id="addMenuBtn">
							<i class="fas fa-plus"></i>
						</button>
					</div>
					
				</div>
			</div>
			<div class="section_2">
				<select name="" id="">
					<option value="main">메인 메뉴</option>
					<option value="set">세트</option>
					<option value="side">사이드</option>
					<option value="dessert">디저트</option>
					<option value="beverage">음료</option>
				</select>
				<div class="wrap_menu">
					<div class="menu_2_2">
						<div class="wrap_menu_name">
							<span>메뉴 1</span>
							<button id="editMenuName">
								<i class="fas fa-pen"></i>
							</button>
							<input type="text" />
							<button id="completeMenuName">
								<i class="fas fa-check"></i>
							</button>
						</div>
						
						<div class="wrap_img_n_price">
							<a class="menu_img_btn" data-sectionNum="2" data-menuNum="1" href="#">
								<div id="menuImgWrap_2_1">
									<i class="far fa-image"></i>
								</div>
							</a>
							
							<input id="price" name="price" type="text" />
							<span>원</span>
						</div>
						<button id="addMenuBtn">
							<i class="fas fa-plus"></i>
						</button>
					</div>
					
				</div>
			</div>
		</form>
		

		
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
			 let inputMenuImagePath=`<input type="hidden" name="menuimg_`+thisSection+`_`+thisMenu+`">`;
			 $("#wrapSection").append(inputMenuImagePath);
			 document.querySelector("input[name=menuimg_"+thisSection+"_"+thisMenu+"]").value=data.imagePath;
			 console.log(inputMenuImagePath);
		});
	});
</script>
</body>
</html>