<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="bootStrap.jsp" %>


<body>

<h2 class="text-dark text-center">유저관리 페이지입니다.</h2>

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

    <div class="col-md-10">
     
    <form action="memlist" method="get">
      <input type="submit" value="검색" class="float-right my-3 mx-2">
      <input type="text" name="id" class="float-right my-3">
    </form>
     
      <table class="table">
        <tr class="table-dark">
            <th>ID</th>
            <th>이름</th>
            <th>닉네임</th>
            <th>자세히</th>
        </tr>
		  <c:forEach items="${memberList}" var="data">
		  <tr>			
	 		<td>${data.id}</td>
			<td>${data.mname}</td> 
			<td>${data.nick_name}</td>
			<td><button type="button" onclick="location.href='memdetail?id=${data.id}'">자세히</button></td>
		  </tr>
		 </c:forEach> 
      </table>
    </div>
  </div>
</div>
    


</body> 
<%@include file ="../include/footer.jsp" %>