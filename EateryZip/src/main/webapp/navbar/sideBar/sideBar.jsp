<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
/*------------------------------side nav start------------------------------*/

   #left_content {
      background-color: #fff;
      min-width: 200px;
      list-style:none;
      border: 1px solid rgba(0,0,0,.1);
      height: fit-content;
   }
   
   #left_content a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
   }
   
   #left_content a:hover {
      background-color: rgba(253,83,0);
      color : white;
   }

/*------------------------------side nav end------------------------------*/
</style>


<div id="left_content">
      <p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage.do">마이페이지</a></p>
      <p class="position"><a href="${pageContext.request.contextPath}/store/store_insertform.do">가게정보등록</a></p>
      <p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/menu_insertform.do">메뉴등록</a></p>
      <p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/b_mypage_updateform.do">개인정보수정</a></p>
      <p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/b_takeout_list.do">포장주문내역</a></p>
      <p class="position"><a href="${pageContext.request.contextPath}/users/b_mypage/b_reservation_list.do">예약내역</a></p>
      <p class="position"><a href="javascript:bdeleteConfirm()">회원탈퇴</a></p>
</div>

<script>
function bdeleteConfirm(){
	const isDelete=confirm("${b_id} 님 탈퇴 하시겠습니까?");
	if(isDelete){
		fetch("${pageContext.request.contextPath}/users/b_mypage/ajax_b_delete.do")
		.then(function(response){
		 return response.json();
		})
		.then(function(data){
			 console.log(data);
			 if(data.isSuccess){
				alert(data.b_id+"님 회원탈퇴 처리 되었습니다.");
				location.href="${pageContext.request.contextPath}/home.do";
			 }
		});
	}
}
</script>