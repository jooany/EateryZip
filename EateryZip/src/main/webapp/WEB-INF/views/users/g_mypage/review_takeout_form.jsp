<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장 리뷰 작성</title>
<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&display=swap');
	/* 공통 */
	*{
	 font-family: 'Gothic A1', sans-serif;
	 }
	p{
		margin:0!important;
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
		padding:0!important;
	}
	body{
		background-color:gray!important;
	}

	.navbar{
		margin:0 auto;
		
	}
	.inner{
		width:1100px;
		margin:0 auto;
	}
	.display_flex{
		display:flex;
		justify-content:center;
	}
	.wrap_inner{
		width:460px!important;
		margin:0 auto;
	}
	#container{
		background-color:white;
		width:520px;
		margin:0 auto;
	}

	/* 리뷰폼 */
	#reviewFormWrap{
		width:520px;
		height:750px;
	}
	#reviewHeader{
		display:flex;
		justify-content:space-between;
		align-items;
		height:70px;
		line-height:70px;
		font-size:20px;
		font-weight:600;
	}
	/* 포장 내역 */
	#takeoutInfoWrap{
		border-top:1px solid rgba(0,0,0,.1);
		border-bottom:1px solid rgba(0,0,0,.1);
	}
	#takeoutInfo{
		margin-top:15px;
		margin-bottom:15px;
	}
	#takeoutInfo #nameNPrice{
		display:flex;
		justify-content:space-between;
	}
	#takeoutInfo>p{
		font-size:14px;
	}
	#takeoutInfo #nameNPrice #storeName{
		color:rgb(243, 156, 18);
		font-weight:600;
		font-size:18px;
	}
	#takeoutInfo #nameNPrice #price{
		font-size:15px;
		line-height:27px;
	}
	/*리뷰 폼*/
	#reviewForm{
		margin-top:25px;
		margin-bottom:15px;
	}
	#quest{
		font-size:17px;
		font-weight:600;
	}
	#justThree{
		color:rgb(253, 83, 0);
		font-size:12px;
	}
	/* 키워드 */
	#keywordBtns{
		margin-top:15px;
		margin-bottom:20px;
		display:flex;
		flex-wrap:wrap;
		justify-content:center;
		align-items:center;
	}
	#keywordBtns>button{
		font-size:13px;
		padding:2px 10px!important;
		border-radius:50px;
		margin:4px;
		border:1px solid rgba(0,0,0,.3);
	}
	#textareaWrap{
		display:flex;
		justify-content:flex-end;
		flex-wrap:wrap;
	}
	#textareaWrap textarea{
		padding:8px;
		width:460px;
		height:230px;
		resize: none;
		font-size:15px;
		border:1px solid rgba(0,0,0,.2)!important;
	}
	#textareaWrap textarea::placeholder{
		padding:5px;
		font-size:15px;
	}
	#textareaWrap #counter{
		margin-top:5px;
	}
	
	/*이미지*/
	#imageForm{
		height:80px;
		display:flex;
		align-items:center;
		border:1px solid rgba(0,0,0,.2);
		border-radius:4px;
		font-size:14px;
		margin-top:10px;
		margin-bottom:20px;
	}
	#fileBtn{
		padding:0 10px!important;
		height:80px;
		background-color:rgba(0,0,0,.05);
	}
	.reviewImg{
		width:60px;
		height:60px;
	}
	#imageWrap{
		display:flex;
		justify-content:space-between;
		margin-left:10px;
	}
	#deleteImgBtn{
		width:23px;
		height:23px!important;
	}
	#submitBtn{
		width:460px;
		border-radius:4px;
		background-color:rgb(253, 83, 0);
		padding:5px!important;
		color:white;
	}
	#submitBtn:hover{
		background-color:rgb(218, 78, 9);
	}

</style>
</head>
<body>
	<div id="container" class="inner">
		<div id="reviewFormWrap">
			<div id="reviewHeader" class="wrap_inner">
				${empty dto2 ? '<p>리뷰 쓰기</p>' :'<p>리뷰 수정하기</p>' }
				<button id="closeBtn" style="font-size:20px; font-weight:100">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<div id="takeoutInfoWrap">
				<div id="takeoutInfo" class="wrap_inner">
			
					<p>${dto1.takeout_date }  ${dto1.takeout_time }</p>
					<div id="nameNPrice">
						<p id="storeName">${dto1.b_name }</p>
						<p id="price">총 ${dto1.takeout_price }원</p>
					</div>
				</div>
			</div>
			<form id="reviewForm" class="wrap_inner" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/users/g_mypage/${empty dto2 ? 'review_insert.do':'review_update.do'}?takeout_num=${dto1.takeout_num}&b_id=${dto1.b_id}">
				<input type="hidden" name="b_id" value="${dto1.b_id }" />
				<input type="hidden" name="writer" value="${dto1.g_id}"/>
				<input type="hidden" name="review_image" id="inputImg" value="${dto2.review_image }"/>
				<input type="hidden" name="keyword_review" id="inputKeyword" />
				<input type="hidden" name="review_kind" id="inputKind" value="takeout" />
				<input type="hidden" name="takeout_num" value="${dto1.takeout_num }" />
			
				<p id="keywordInfo">
					<span id="quest">어떤 점이 좋았나요?</span>
					<span id="justThree">*최대 3개</span>
				</p>
				<div id="keywordBtns">
					<button type="button" class="keyBtn">가성비가 좋아요</button>
					<button type="button" class="keyBtn">포장이 꼼꼼해요</button>
					<button type="button" class="keyBtn">디저트가 맛있어요</button>
					<button type="button" class="keyBtn">친절해요</button>
					<button type="button" class="keyBtn">특별한 메뉴가 있어요</button>
					<button type="button" class="keyBtn">커피가 맛있어요</button>
					<button type="button" class="keyBtn">음료가 맛있어요</button>
				</div>
				<div id="textareaWrap">
					<textarea class="DOC_TEXT" type="text" name="review_content" placeholder="후기를 작성해주세요.">${dto2.review_content }</textarea>
					
					<span id="counter">${empty dto2.review_content ? '0<span style="color:rgba(0,0,0,.5);"> / 200</span>' : ''}</span>
				</div>
				</form>
				<form id="imageForm" class="wrap_inner" action="${pageContext.request.contextPath}/users/g_mypage/ajax_menu_img_upload.do" method="post" enctype="multipart/form-data">
	
						<div id="fileWrap">
							<button id="fileBtn" type="button">
								${empty dto2.review_image ? '사진 선택' : '사진 변경'}
							</button>
						</div>
						<div id="preImg">
							<div id="imageWrap">
								<c:if test="${not empty dto2.review_image}">
									<img src="${pageContext.request.contextPath}${dto2.review_image }" alt="리뷰이미지" class="reviewImg" />
									<button type="button" id="deleteImgBtn">
										<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
			                   				 <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
			                			</svg>
									</button>
								</c:if>
							</div>
						</div>
						<!-- 아래 숨기기 -->
						<input type="file" class="visually-hidden" name="image" id="image"
							accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
				</form>
				
				<div class="wrap_inner">
					<button type="submit" class="submitBtn wrap_inner" id="submitBtn" form="reviewForm">${empty dto2 ? '리뷰 등록하기':'리뷰 수정하기'}</button>
					<button type="submit" class="visually-hidden" id="submitBtn2" form="reviewForm"></button>
				</div>
		</div>
	</div>

	<div id="keywords">
		<input class="keywordCheckbox visually-hidden" type="checkbox" name="keyword" value="가성비가 좋아요"/>
		<input class="keywordCheckbox visually-hidden" type="checkbox" name="keyword" value="포장이 꼼꼼해요"/>
		<input class="keywordCheckbox visually-hidden" type="checkbox" name="keyword" value="디저트가 맛있어요"/>
		<input class="keywordCheckbox visually-hidden" type="checkbox" name="keyword" value="친절해요"/>
		<input class="keywordCheckbox visually-hidden" type="checkbox" name="keyword" value="특별한 메뉴가 있어요"/>
		<input class="keywordCheckbox visually-hidden" type="checkbox" name="keyword" value="커피가 맛있어요"/>
		<input class="keywordCheckbox visually-hidden" type="checkbox" name="keyword" value="음료가 맛있어요"/>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	let keyarr=[];
	let keyarr2=[];
	let nowKey='<c:out value="${dto2.keyword_review}"/>'
	console.log(nowKey);
	
	if(nowKey){
		keyarr2=nowKey.split(",");
	}
	console.log(keyarr2);
	// 키워드 for문 돌려서 해당하는 키워드 있으면 i번째 키워드 버튼 클릭하게 하기 -> i번째 체크박스 체크하게 하기 
	for(let i=0;i<7;i++){
		let keyBtn=$("#keywordBtns").children().eq(i);
		
		for(let item of keyarr2){
			if(keyBtn.text()==item){
				$("#keywords").children().eq(i).prop("checked",true);
				keyBtn.css({"background-color":"black",
							"color":"white"});
			}
		}
	}
	$("#fileBtn").click(function(){
		$("#image").trigger("click");
	});
	
	//메뉴 이미지 선택 시, 기존의 선택 파일에서 변화가 생길 때
	$("#image").change(function(){
			
		let form=document.querySelector("#imageForm");

		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			//해당 이미지 경로를 가진 이미지 요소를 생성하여 innrHTML에 넣어주고
			//이미지 경로를 전송하는 input의 value 값에 이미지 경로를 넣어준다.
			let img=`<img class="reviewImg" src="${pageContext.request.contextPath}\${data.imagePath}"/>
						<button type="button" id="deleteImgBtn">
						<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
		       				 <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
		    			</svg>
					</button>`;

			if(data.imagePath !=''){
				$("#imageWrap").html(img);
				deleteImg();
				$("#fileBtn").html('사진 변경');
			}
			$("#inputImg").val(data.imagePath);
		});
	}); //#image.change.end
	
	function deleteImg(){
		$("#deleteImgBtn").click(function(){
			$("#imageWrap").html('');
			$("#inputImg").val('');
			$("#fileBtn").html('사진 선택');
		});
	}
	deleteImg();
	
	
	function checkCount(){
		let isUpToThree=0;
		for(let i=0;i<7;i++){
			let isCheck=$("#keywords").children().eq(i).is(":checked");
			if(isCheck){
				isUpToThree++;
			}
		}
		return isUpToThree;
	}
	function btnClickEventListner(){
		for(let i=0;i<7;i++){
			$("#keywordBtns").children().eq(i).click(function(){
				let keyBtn=$("#keywordBtns").children().eq(i);
				let isCheck=$("#keywords").children().eq(i).is(":checked");
				//총 체크된 박스 개수가
				let isUpToThree=checkCount();
				// 3개 미만일 때만 체크될 수 있게 하기
				if(isCheck){
					$("#keywords").children().eq(i).prop("checked",false);
					keyBtn.css({"background-color":"white",
						"color":"black"});
				}else{
					if(isUpToThree<3){
						$("#keywords").children().eq(i).prop("checked",true);
						keyBtn.css({"background-color":"black",
							"color":"white"});
					}else{
						alert("키워드는 3개 이하로만 선택할 수 있습니다.");
					};
				};
			});
		};
	};
	btnClickEventListner();

	//폼 제출 시, 키워드 리뷰 배열로 저장 후 제출
	$("#submitBtn").click(function(e){
		//일단 제출 안되게 한 다음,
		e.preventDefault();
		
		let isFinish=false;
		
		if(!isFinish){
			for(let i=0;i<7;i++){
				let isCheck=$("#keywords").children().eq(i).is(":checked");
				let keyBtn=$("#keywordBtns").children().eq(i);
				if(isCheck){
					keyarr.push(keyBtn.text());
					$("#inputKeyword").val(keyarr);
					console.log("push");
				}
				if(i==6){
					isFinish=true;
					console.log(2);
				}
			};
		}
		
		if(isFinish){
			console.log(3);
			$("#reviewForm").trigger("submit");
		}
		console.log(keyarr);		
	});
	
	var content2=$('.DOC_TEXT').val();
	$('#counter').html(content2.length+`<span style="color:rgba(0,0,0,.5);"> / 200</span>`);
	//서류사항 textarea 체크
	$('.DOC_TEXT').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html(content.length+`<span style="color:rgba(0,0,0,.5);"> / 200</span>`);    //글자수 실시간 카운팅

	    if (content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#counter').html("200 / 200");
	    }
	});
	
	$("#closeBtn").click(function(){
		window.close();  
	});
	

	
	

		
	</script>
</body>
</html>