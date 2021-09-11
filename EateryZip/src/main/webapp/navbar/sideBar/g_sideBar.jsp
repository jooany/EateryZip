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
	<p class="position"><a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage.do">마이페이지</a></p>
	<p class="position"><a href="${pageContext.request.contextPath}/users/g_mypage/g_mypage_updateform.do">개인정보 수정</a></p>
	<p class="position"><a href="${pageContext.request.contextPath}/users/g_mypage/reserve_List.do">예약내역</a></p>
	<p class="position"><a href="${pageContext.request.contextPath}/users/g_mypage/takeout_list.do">포장내역</a></p>
	<p class="position"><a href="${pageContext.request.contextPath}/users/g_mypage/scrap_List.do">스크랩내역</a></p>
	<p class="position"><a href="javascript:gdeleteConfirm()">회원탈퇴</a></p>
</div>

<script>
function gdeleteConfirm(){
	const isDelete=confirm("${g_id} 님 탈퇴 하시겠습니까?");
	if(isDelete){
		fetch("${pageContext.request.contextPath}/users/g_mypage/ajax_g_delete.do")
		.then(function(response){
		 	return response.json();
		})
		.then(function(data){
			 console.log(data);
			 if(data.isSuccess){
				alert(data.g_id+"님 회원탈퇴 처리 되었습니다.");
				location.href="${pageContext.request.contextPath}/home.do";
			 }
		}); 
	}
}
</script>


