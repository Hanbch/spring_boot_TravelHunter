<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<style>
ul.tabs {
	float: left;
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	width: 120px;
	line-height: 50px;
	margin-bottom: 1px;
	text-align: center;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

.tab-link a{display:block}

ul.tabs li.current {
	background: #e0e0e0;
	color: #222;
}

.tab-content {
	width: 1000px;
	padding:30px;
	display: none;
	background: #e0e0e0;
	margin-left: 160px;
}

.tab-content.current {
	display: inherit;
}

ul.product li {
	text-align: center;
	width: 300px;
	display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.product li.current {
	background: #e0e0e0;
	color: #222;
}

.product-content {
	display: none;
}

.product-content.current {
	display: inherit;
}
</style>


<section style="padding: 200px 0; width:1200px; margin:0 auto;">
   <ul class="tabs">
      <li class="tab-link" data-tab="tab-1">내정보</li>
      <li class="tab-link current" data-tab="tab-2">예약내역</li>
      <li class="tab-link" data-tab="tab-3">내기록</li>
      <li class="tab-link" data-tab="tab-4">회원탈퇴</li>
   </ul>
   
   <div id="tab-2" class="tab-content current">
      <ul class="product">
         <li class="product-link current" data-tab="product-1">예약완료</li>
         <li class="product-link" data-tab="product-2">취소내역</li>
         <li class="product-link" data-tab="product-3">이용완료</li>
      </ul>
      <div id="product-1" class="product-content current">
         <h1>예약완료내용</h1>
         <ul>
            <c:forEach items="${rsvList}" var="rsvList">
               <li style="padding 20px; background-color:#fff;margin-bottom:20px;">
                  <form action="/mypage/rsvdelete?num=${rsvList.num}" method="POST">
	                  예약번호:${rsvList.num}<br>
	                  <input type="hidden" name="num" id="num" value="${rsvList.num}"/>
	                  예약자 이름:${rsvList.cname}<br>
	                  예약자 전화번호:${rsvList.cphone}<br>
	                  예약장소:${rsvList.pname}(${rsvList.place_num})<br>
	                  방:${rsvList.rname}(${rsvList.room_num})<br>
	                  가격:${rsvList.price}원<br>
	                  체크인:${rsvList.startdate}<br>
	                  체크아웃:${rsvList.enddate}<br>
	                  
                 	 <button type="" onclick="cancelPay()">환불하기</button>
                  </form>
               </li>
            </c:forEach>
            
         </ul>
      </div>
      <div id="product-2" class="product-content">취소내역내용</div>
      <div id="product-3" class="product-content">이용완료내용</div>
   </div>
   




</section>
<%@include file="../include/footer.jsp"%>

<script>
   $(document).ready(function() {

      $('ul.tabs li').click(function() {//선택자를 통해 tabs 메뉴를 클릭 이벤트를 지정해줍니다.
         var tab_id = $(this).attr('data-tab');

         $('ul.tabs li').removeClass('current');//선택 되있던 탭의 current css를 제거하고 
         $('.tab-content').removeClass('current');

         $(this).addClass('current');////선택된 탭에 current class를 삽입해줍니다.
         $("#" + tab_id).addClass('current');
      })

 

      $('ul.product li').click(function() {
         var tab_id = $(this).attr('data-tab');

         $('ul.product li').removeClass('current');
         $('.product-content').removeClass('current');

         $(this).addClass('current');
         $("#" + tab_id).addClass('current');
      })

   });


</script>