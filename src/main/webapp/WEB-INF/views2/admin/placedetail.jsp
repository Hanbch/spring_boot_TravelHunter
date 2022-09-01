<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="bootStrap.jsp" %>



<body>

<h2 class="text-dark text-center">유저세부정보 페이지입니다.</h2>

<div class="container-fluid">
  <div class="row">

    <div class="col-md-2">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
    <div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">목록</h3>
      </div> 
    <!-- 사이드바 메뉴목록1 -->
        <ul class="list-group">
          <li class="list-group-item list-group-item-action"><a href="main">메인화면</a></li>
          <li class="list-group-item list-group-item-action"><a href="memlist">유저관리</a></li>
          <li class="list-group-item list-group-item-action"><a href="placelist">캠핑장관리</a></li>
          <li class="list-group-item list-group-item-action"><a href="reservationlist">예약관리</a></li>
          <li class="list-group-item list-group-item-action"><a href="#">Null</a></li>
        </ul>
        </div>     
      </div> 

    <div class="col-md-10 my-5">
      <div class="row">
      	<div class="col-md-2">
      	<h3>${place.pname} 의 세부정보</h3>
      	</div>
      	<div class=col-md-8>

      	  <table class="table m-2">
	  		<tr>
             <th class="table-dark col-md-3">ID</th><td>${place.num}</td> 
            </tr>
            <tr>
             <th class="table-dark">캠핑장명</th> <td>${place.pname}</td> 
            </tr>
            <tr>
             <th class="table-dark">소유자ID</th><td>${place.member_id}</td>
            </tr>
            <Tr>
             <th class="table-dark">전화번호</th><td>${place.pphone}</td>
            </tr>
            <tr>
             <th class="table-dark">위치</th><td>${place.location}</td> 
            </tr>
      	  </table>
      	  
      	</div>
      	
      	      
      </div>
      <h3>방 목록</h3>
      	<table class="table table-striped mb-5">
        <thead>
        <tr class="table-dark">
            <th class="col-1">방번호</th>
            <th class="col-1">숙박료</th>
            <th class="col-1">수용인원</th>
            <th class="col-6">정보</th>
            <th class="col-1">삭제</th>
        </tr>
		  <c:forEach items="${roomList}" var="room">
		  <tr>			
	 		<td>${room.num}</td>
			<td>${room.price}</td> 
			<td>${room.capacity}</td>
			<td>${room.rinfo}</td>
			<td>
				<form method="post" action="deleteRoom" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
      	   		  <input type="hidden" name="id" value="${place.num}">
      	   		  <input type="hidden" name="room" value="${room.num}">
      	  		  <input type="submit" value="방삭제">
      	  		</form>
			</td>
		  </tr>
		 </c:forEach> 
      </table>
      <form method="post" action="deleteRoom" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
      	 <input type="hidden" name="id" value="${place.num}">
      	 <input class ="float-right  mt-5" type="submit" value="캠핑장삭제">
      </form>
    </div>
    
   </div>
    
    
</div>

</body> 
<%@include file ="../include/footer.jsp" %>