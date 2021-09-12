<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩내역</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
   @import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
   /* 공통 */
   *{
    font-family: 'Gothic A1', sans-serif;
    margin-top:0;
    }
   body{
      background-color:rgba(0,0,0,.04)!important;
   }
   a{
      text-decoration: none;
   }
   button{
         border:none;
         background-color:rgba(0,0,0,0);
      }
   .inner{
      width:1000px;
      height: 700px;
      margin:0 auto;
      display:flex;
      justify-content: space-between;
      margin-top: 40px;
   }
/*-------------------------------------------------------------------------*/
/*------------------------------right_content start------------------------------*/

   #right_content{
      width: 750px;
      height: fit-content;
      background-color: white;
      padding: 10px 40px;
   }
   
   table{
      border-bottom:1px solid rgba(0,0,0,.1);
      margin:0 auto;
      text-align: center;
      vertical-align:middle!important;
   }

/*-----------------------table 숫자 생성------------------------------*/
   tbody>tr {
     counter-increment: a;
   }
   tbody>tr>td:first-child:before {
     content: counter(a) " ";
   }
/*-----------------------table 숫자 생성------------------------------*/

/*------------------------------ right_content end ------------------------------*/



/*------------------------------paging start------------------------------*/
   .page-ui a{
      text-decoration: none;
      color: #000;
   }
   
   .page-ui a:hover{
      background-color: rgba(253,83,0);
      color: white;
   }
   
   .page-ui a.active{
      color: white;
      font-weight: bold;
      background-color: rgba(253,83,0);
   }
   .page-ui ul{
      list-style-type: none;
      padding: 0;
   }
   
   .page-ui ul > li{
      float: left;
      padding: 5px;
   }

/*------------------------------paging end------------------------------*/
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
   
   
</style>
</head>
<body>
<jsp:include page="/navbar/header/navbar.jsp"></jsp:include>

<div id="container" class="inner" style="display:flex; justify-content:space-between;">
   <jsp:include page="/navbar/sideBar/g_sideBar.jsp"></jsp:include>
   <div id="right_content">
      <h4>스크랩내역</h4>
      <table class="table">
         <thead>
            <tr>
               <th scope="col">No.</th>
               <th scope="col">상호명</th>
               <th scope="col">업종</th>
               <th scope="col">소개글</th>
               <th scope="col">스크랩</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="tmp" items="${list }">
               <tr>
                  <td></td>
                  <td>
                     <a href="${pageContext.request.contextPath}/eatery/detail.do?b_id=${tmp.b_id}">${tmp.b_name }</a>
                  </td>
                  <td>${tmp.b_kind }</td>
                  <td>${tmp.intro }</td>
                  <td>
                     <button type="button" id="scrapRight" data-bid="${tmp.b_id }" data-isScrap="true">
                        <i class="fas fa-bookmark"></i>
                     </button>
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <nav class="page-ui clearfix">
         <ul class="pagination justify-content-center">
            <c:if test="${startPageNum ne 1 }">
               <li class="page-item">
                  <a class="page-link" href="scrap_List.do?pageNum=${startPageNum-1 }">Prev</a>
               </li>
            </c:if>
            <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
               <li class="page-item">
                  <c:choose>
                     <c:when test="${pageNum eq i }">
                        <a  class="page-link active" href="scrap_List.do?pageNum=${i }">${i }</a>
                     </c:when>
                     <c:otherwise>
                        <a class="page-link" href="scrap_List.do?pageNum=${i }">${i }</a>
                     </c:otherwise>
                  </c:choose>
               </li>
            </c:forEach>
            <c:if test="${endPageNum lt totalPageCount }">
               <li class="page-item">
                  <a class="page-link" href="scrap_List.do?pageNum=${endPageNum+1 }">Next</a>
               </li>
            </c:if>
         </ul>
      </nav>
   </div>
</div>
<jsp:include page="/navbar/footer/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//스크랩 버튼 
function scrapDo(sel){
   let scrapBtns=document.querySelectorAll(sel);
   console.log(scrapBtns);
   
   for(let i=0;i<scrapBtns.length;i++){
         
      scrapBtns[i].addEventListener("click",function(){
         
      
         let isScrap=$(this).attr("data-isscrap");
         let b_id=$(this).attr("data-bid");
         console.log(isScrap+"나와라야"+b_id);
         let btn=$(this);
         if(isScrap){ //추천했다면
            ajaxPromise("private/ajax_good_delete.do", "get", "b_id="+b_id)
            .then(function(response){
               return response.json();
            })
            .then(function(data){
               if(data.isNotScrap){//유저가 테이블에 삭제되었다면
                                       
                  btn.html(`<i class="far fa-bookmark"></i>`);
               }
            });   
         }//ajax if 함수 끝            
      });
   };
};
scrapDo("#scrapRight");
</script>
</body>
</html>